use newdb;

create table test18(id int, name varchar(20) );

insert into test18 values(1,'a'), (2,'b'), (3,'c'),(4,'d'),(5,'e'),(6,'f'), (7, 'd'), (8,'d');

truncate test18;

explain select * from test18 where id = 3;


-- Btree data sturcture
-- primary key

select * from test18;

alter table test18 add primary key(id);
desc test18;  


explain select * from test18 where name = 'd';

create index name_index on test18(name);
show indexes from test18;
select * from test18;

create table test19(id int,age int, name varchar(20));

insert into test19 values(1,22,"Dhruv"), (1,21,"Khusi"),(1,22,"Piyush"),(1,22,"Moni"),(1,22,"Ram");

select * from test19;

create index name_index_age on test19(name, age);
show indexes from test19;
explain select * from test19 where name = '21';




