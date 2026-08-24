create database viewdb2;

use viewdb2;

create table employee( id int , name varchar(20), salary int);

insert into employee values(1, 'aman', 100000), (2, 'manu', 200000);

-- create is used to create view object

-- object data structure

create view emp_view as select id, name from employee; -- simple view

select * from emp_view;

select salary from emp_view; -- will give error


-- row new insert 

insert into employee values(3,'abhi', 300000);

select * from emp_view; -- base table change view also get new data

-- insert into view directly

insert into emp_view values(4,'raj'); -- view insert as column describe according to the column make in view

select * from emp_view; -- data inserted directly in the view and also it inserted into employee table as well

select * from employee;

-- there are two type of views 
		-- materalised view
        -- non - materalised view
-- category of view :-
	-- updatable view
    -- non- updatable view
        
create view epm_view_sum as select sum(salary) from employee; -- simple view
select * from emp_view;

insert into emp_view_sum values(80000); -- view is not insertable


USE viewdb2;

CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO department VALUES 
(101, 'IT'),
(102, 'HR');


ALTER TABLE employee ADD COLUMN dept_id INT;

INSERT INTO employee (id, name, salary, dept_id) VALUES 
(5, 'karan', 400000, 101),
(6, 'rohit', 500000, 102);


CREATE VIEW emp_dept_joined_view AS
SELECT 
    e.id AS emp_id,
    e.name AS emp_name,
    e.salary,
    d.dept_name
FROM employee e
JOIN department d 
  ON e.dept_id = d.dept_id;

SELECT * FROM emp_dept_joined_view;