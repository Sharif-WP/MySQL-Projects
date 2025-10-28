-- complex database design with multiple relationships
-- advanced join operations
-- aggregate functions for business intelligence
-- store procedures for complex operations
-- data integrity with proper constraints
-- real world business logic implementation

-- core tables
create table customers(
customer_id int auto_increment primary key,
first_name varchar(50) not null,
last_name varchar(50) not null,
phone varchar(15),
email varchar(100),
join_date date default(current_date)
);

create table employees (
employee_id int auto_increment primary key,
first_name varchar(50) not null,
last_name varchar(50) not null,
position enum('chef', 'waiter', 'Manager', 'Cashier'),
hire_date date,
salary decimal(10,2),
is_active boolean default true
);

create table menu_categories(
category_id int auto_increment primary key,
name varchar(50) not null unique,
description text
);

create table menu_items (
item_id int auto_increment primary key,
name varchar(100) not null,
description text,
price decimal(8,2) not null,
category_id int,
is_available boolean default true,
cost_price decimal (8,2),   -- for profit calculations
foreign key (category_id) references menu_categories(catogory_id)
);

-- operational tables
create table orders(
order_id int auto_increment primary key,
customer_id int,
employee_id int,  -- waiter who took the order
order_date datetime default current_timestamp,
status enum('pending','preparing', 'ready', 'served', 'paid') default 'pending',
total_amount decimal(10,2) default 0,
table_number int,
notes text,
foreign key (customer_id) references customers(customer_id),
foreign key (employee_id) references employees(employee_id)
);

create table order_items(
order_item_id int auto_increment primary key,
order_id int,
item_id int,
quantity int not null default 1,
unit_price decimal(8,2) not null, -- price at time of order
special_instructions text,
foreign key (order_id) references orders(order_id) on delete cascade,
foreign key (item_id) references menu_items(item_id)  
);

create table payments(
payment_id int auto_increment primary key,
order_id int,
amount decimal(10,2) not null,
payment_method enum('cash', 'card', 'digital') not null,
payment_date datetime default current_timestamp,
tip_amount decimal(8,2) default 0,
foreign key (order_id) references orders(order_id)
);

-- inventory management (bonus)
create table ingredients (
ingredient_id int auto_increment primary key,
name varchar(100) not null unique,
unit varchar(20) not null, -- kg, litre, piece
current_stock decimal (8,2) default 0,
min_stock_level decimal(8,2) default 0,
cost_per_unit decimal (6,2)
);

create table menu_item_ingredients(
menu_item_id int,
ingredients_id int,
quantity_required decimal(6,2) not null,
primary key (menu_item_id, ingredient_id),
foreign key(menu_item_id) references menu_items(item_id),
foreign key (ingredient_id) references ingredients(ingredient_id)
);

-- sample of complex queries/ daily sales report
select 
     date(order_date) as sale_date,
     count(*) as total_orders,
     sum(total_amount) as daily_revenue,
     avg(total_amount) as avg_order_value,
     sum(oi.quantity)as items_sold
from orders o
join order_items oi on o.order_id = oi.order_id
where date(order_date) = curdate()
group by date(order_date);

-- most popular menu items
select 
    mi.name,
    mi.category_id,
    sum(oi.quantity) as total_sold,
    sum(oi.quantity * oi.unit_price) as revenue_generated
from menu_items mi
join order_items oi on mi.item_id = oi.item_id
join orders o on oi.order_id = o.order_id
where o.order_date >= date_sub(curdate(), interval 30 day)
group by mi.item_id, mi.name
order by total_sold desc
limit 10;

-- customer order history with loyalty analysis 
select 
   c.customer_id,
   concat(c.first_name, '', c.last_name) as customer_name,
   count(o.order_id) as total_orders,
   sum(o.total_amount) as lifetime_value,
   avg(o.total_amount) as avg_order_value,
   datediff(curdate(), max(o.order_date)) as days_since_last_order
from customers c
left join orders o on c.customer_id = o.customer_id
group by c.customer_id, customer_name
having total_orders >0
order by lifetime_value desc;

-- inventory alert for low stock
select
    i.name,
    i.current_stock,
    i.min_stock_level,
    i.unit,
    (i.current_stock - i.min_stock_level) as remaining_buffer
from ingredients i
where i.current_stock <= i.min_stock_level * 1.2 -- alert when close to minimum
order by remaining_buffer asc;

-- 5.Employee performance report
select 
   e.compare_id,
   concat(e.first_name, '', e.last_name) as employee_name,
   e.position,
   count(o.order_id) as orders_handled,
   sum(o.total_amount) as total_sales,
   avg(o.total_amount) as avg_sale_per_order,
   sum(p.tip_amount) as total_tips_earned
from employees e
left join orders o on e.employee_id = o.employee_id
left join payments p on o.order_id = p.order_id
where e.is_active = true
    and o.order_date >= date_sub(curdate(), interval 30 day)
group by e.employee_id, employee_name, e.position
order by total_sales desc;

-- Advanced features to implement
-- stored procedure for placing orders
DELIMITER //
create procedure placeNewOrder(
in p_customer_id int,
in p_employee_id int,
in p_table_number int,
in p_order_items json   -- json format:
)
begin 
   declare v_order_id int;
   declare v_total_amount decimal(10,2) default 0;
   declare i int default 0;
   declare v_item_count int;
   
   start transaction;
   
   -- create order
   insert into orders (customer_id, employee_id, table_number)
   values(p_customer_id, p_employee_id, p_table_number);
   
   set v_order_id = last_insert_id();
   
   -- parse json and insert order items
   set v_item_count = JSON_LENGTH(p_order_items);
   
   WHILE i < v_item_count DO
        insert into order_items (order_id, item_id, quantity, unit_price)
        select
           v_order_id,
           JSON_EXTRACT(p_order_items, CONCAT('$[', i, '].item_id')),
           JSON_EXTRACT(p_order_items, CONCAT('$[', i, '].quantity')),
           (select price from menu_items where item_id = JSON_EXTRACT(p_order_items, CONCAT('$[',i, '].item_id')));
		set i = i+1;
	END WHILE;
    
    -- calculate total
    select sum(quantity * unit_price) into v_total_amount
    from order_items where order_id = v_order_id;
    
    -- update order total
    update orders set total_amount = v_total_amount where order_id = v_order_id;
    
    commit;
    
    select v_order_id as new_order_id, v_total_amount as order_total;
  END //
DELIMITER ; 

-- view for kitchen display
create view kitchen_orders as 
select 
   o.order_id,
   o.table_number,
   o.order_date,
   mi.name as item_name,
   oi.quantity,
   oi.special_instructions,
   timestampdiff(minute, o.order_date, now()) as minutes_waiting
from orders o
join order_items oi on o.order_id = oi.order_id
join menu_items mi on oi.item_id = mi.item_id
where o.status in ('pending', 'preparing')
order by o.order_date asc, o.table_number;
    
   
   
