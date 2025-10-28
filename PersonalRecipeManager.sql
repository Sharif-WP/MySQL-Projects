create database recipeManager;
use recipeManager;

-- Database design and normalization
-- Basic CRUD operations
-- Simple JOIN queries
-- Database Integrity constraits

-- recipes table
create table recipes (
recipe_id int auto_increment primary key,
name varchar(100) not null,
description text,
preparation_time int,
difficulty enum('Easy', 'Medium', 'Hard') default 'easy',
date_created timestamp default current_timestamp
);

-- ingrediates table
create table ingredients(
ingredient_id int auto_increment primary key,
name varchar(50) unique not null
);

-- recipe ingredients (junction table)
create table recipe_ingredients(
recipe_id int,
ingredient_id int,
quantity varchar(20),
primary key (recipe_id, ingredient_id),
foreign key (recipe_id) references recipes(recipe_id) on delete cascade,
foreign key (ingredient_id) references ingredients(ingredient_id) on delete cascade
); 

-- add a new recipe
insert into recipes(name, description, preparation_time, difficulty)
values('Chocolate chip cookies', 'Classic Homemade cookies' , '45', 'Easy');

-- find recipes by ingredient
select r.name
from recipes r
join recipe_ingredients ri on r.recipe_id = ri.recipe_id
join ingredients i on ri.ingredient_id = i.ingredient_id
where i.name = 'chocolate';

-- get all ingredients for a recipe
select i.name, ri.quantity
from ingredients i
join recipe_ingredients ri on i.ingredient_id = ri.ingredient_id
where ri.recipe_id = 1;


