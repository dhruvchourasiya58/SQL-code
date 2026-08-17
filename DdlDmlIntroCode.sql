create database moviesdb;

use moviesdb;
-- create is ddl
create table deepika( 
	filmName varchar(30), 
    amount int, 
    director varchar(20)
);

describe deepika;

-- insert is --> DML 
insert into deepika values( 'leela', 45000000, 'sanjay leela bansali' );

select * from deepika; -- select is DQL

-- DDL ALTER

alter table moviesdb.deepika add column name varchar(20); -- added a column
alter table moviesdb.deepika drop column director; -- dropped a specific column

select * from deepika;

alter table moviesdb.deepika modify column filmName varchar(30) NOT NULL; -- not null on a table column

alter table moviesdb.deepika rename column filmname to film; -- change name

alter table moviesdb.deepika rename to deepu; -- table rename

-- Truncate -- DDL


truncate moviesdb.deepu; -- truncate firstly drop whole table and recreate table again, table structure will be same as before but the data of the table will be remove

-- DDL  statement

-- create
-- alter
-- truncate
-- Drop 
-- rename also the part of DDL

alter table moviesdb.deepu add column director varchar(20);
insert into deepu values('Bajirao mastani', 555000000, 'sanjay leela bansali') , 
('Bajirao mastani', 555000000, 'sanjay leela bansali' ),
('Bajirao mastani', 555000000, 'sanjay leela bansali');

alter table moviesdb.deepu drop column director;

SET SQL_SAFE_UPDATEs = 0;

insert into deepu values('padmavati' , 12345678, 'sanjay leela bansali');

update moviesdb.deepu set film = 'leela' where amount = 12345678; -- agar ek condition pr nhi krenge to saari rows update ho jaaygi

-- delete statement DML h or truncate DDL kyuki delete statement structure se work nhi krta h 
-- delete k sath condition lg skti h pr truncate k sath nhi lg skti 

delete from deepu where film = 'Bajirao mastani';


select * from deepu;
