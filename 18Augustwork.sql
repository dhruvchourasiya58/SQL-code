-- datascience connection

create database TCLdb;

use TCLdb;

create table TCLdb.test( id int, name varchar(20));

insert into TCLdb.test values(18,'abhinav');


select @@autocommit; -- by default autocommit is 1 means file will be automaticaly saved

start transaction;

insert into TCLdb.test values(19,'yash');

select * from TCLdb.test; -- <<== Two rows shows here

commit; -- till before commit only shows one row in another TCL connection but after commit command saved the chnages and 
-- now shows both row in another TCL connection also 

start transaction;
insert into TCLdb.test values(55,'japan');
insert into TCLdb.test values(21,'north korea');

rollback;

select * from TCLdb.test;

SET SQL_SAFE_UPDATEs = 0;
start transaction;
insert into TCLdb.test values(71,'korea');
delete from TCLdb.test;
select * from TCLdb.test;
rollback; -- use to undo or going to revert back



