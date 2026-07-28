create database corr_db;
use corr_db;

create table employee_c (
    id int,
    name varchar(20),
    salary int
);

insert into employee_c
values
(1, 'a', 100),
(2, 'b', 250),
(3, 'c', 400),
(4, 'd', 380);

-- highest salary kya hai
select max(salary) from employee_c;

select * from employee_c where salary=400;

select min(salary) from employee_c;
select * from employee_c where salary = 100;

-- want to make this condition dynamic 
-- Nested Query / Outer Query / Sub Query

select * from employee_c where salary = ( select min(salary) from employee_c );

-- Sub query with max salary 

select * from employee_c where salary = ( select max(salary) from employee_c );
 
insert into employee_c
values
(5, 'aman', 250);


select * from employee_c;

select salary from employee_c where salary = ( select salary from employee_c where name = 'b' );


select id, name
from employee_c
where salary > (
    select avg(salary)
    from employee_c
);

use world;
select * from city;
-- get the name of city where that the district of the city is same for the city abu dhabi
select name , district from city where district = (select name from city where name = 'abu dhabi');

-- get all columns from city table where the population is the max
select * from city where population = (select max(population) from city);

-- get the district and the name of the city where the country code is same for city herat
select district , name from city where countrycode = (select countrycode from city where name = 'herat');

-- get the district city , population for all the countries where name is Amsterdam sort the data by the population
select district , name , population from city where name = (select name from city where name = 'Amsterdam')order by population;

