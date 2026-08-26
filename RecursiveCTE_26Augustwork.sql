-- set operation :- used to combine rows from multiple query

select * from world.city limit 3;

use newdb;

create table city3 as select id,name, population from world.city limit 3;

create table city2 as select id,name, population from world.city limit 2;

select * from city3
union all
select * from city2;


select * from city3
intersect
select * from city2;


select * from city3
except
select * from city2;


-- recurssive cte

select 10
union 
select 10+1
union 
select 10+2;


with recursive cte as ( select 10 as num
union 
select num+1 from cte
where num<14 )
select * from cte;

-- interview important question : hiararchy level

create table employees (
	emp_id int,
    emp_name varchar(100),
    manager_id int
);


insert into employees (emp_id, emp_name, manager_id) values
	(1, 'john', NULL),
    (2, 'alice', 1),
    (3, 'Bob', 1),
    (4, 'David' , 2),
    (5, 'sarah' , 2),
    (6, 'Mike' , 3),
    (7, 'Tom', 4 );

-- question of showing heirarchy by '->'


with recursive tempcte as 
( select *, emp_name as hirerachy from employees where manager_id is null 

union

select e.emp_id, e.emp_name, e.manager_id, concat(e.emp_name, '->', tempcte.hirerachy) as hirerachy 
from employees as e join tempcte
on e.manager_id = tempcte.emp_id)
select * from tempcte;


-- question of showing heirarchy level by level

with recursive tempcte as 
( select *, 1 as level from employees where manager_id is null 

union

select e.emp_id, e.emp_name, e.manager_id, level+1 as level 
from employees as e join tempcte
on e.manager_id = tempcte.emp_id)
select * from tempcte;








