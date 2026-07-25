-- numeric function

use world;
-- important function  round, mod
-- round function => Is a function which round off the value nearest 10,100,1000 ....

select 34.58, round(76.342,2);

select round(34.857,1), truncate(34.857,1), mod(3,5);
select floor( 34.999999 ); -- floor functon output ko 34 bna dega integer value hi deta h humesha

select ceil(34.000000001); --- y uske next integer pr le jata h or floor priviou integer pr 

-- scalar function
select name from country;
select distinct(name) from country;

-- count function

select count(continent), count(distinct(continent)) from country; -- count function count kr k deta h or distinct duplictes or repeat read nhi krta 

-- country name
select count(name), count(distinct(name)) from country; -- they both give same, its a two method of count

--- Example of sum or avg function

select count(population), sum(population), avg(population) from country;

select count(continent), max(continent) from country;

select population, count(population) from country;

select avg(population), avg(replace(population, 0, '')) from country;

select avg( replace(population, 1,4)) from country;

-- order by clause : used to sort data

select name, continent, region, population from country
order by population, name;

select name, continent, region, population from country
order by region, population desc;

-- having clause => jb aggreagte function ko filter krna ho toh having use krte h , jha aggregate function use hota wha where use nhi krte having clause use krte h 

select continent, count(name) from country group by continent having count(name)>10;

select continent, count(name) from country where continent like 'A%'
group by continent having count(name)>10;

select continent, count(*) from country group by continent 
having count(*)>30;

select indepyear, count(name) from country group by indepyear
having count(name)>10;


select city.name, city.countrycode from city
join country
where city.countrycode = country.code
and city.name = 'Amsterdam';

select c.name, c.population from city as c;

select c.name, c.population,
cn.name, cn.population from city as c
join country as cn
where c.countrycode = cn.code; 

select * from city;

select * from country;

-- cross join / cartesian join 
select c.id, c.name, c.countrycode, city.code, city.name from city as c cross join country as city;

use world;
select name, indepyear, indepyear+100, ifnull(indepyear,0) from country;

select name, indepyear, lifeexpectancy, coalesce(indepyear, lifeexpectancy, name) from country; 

-- conditional statement

select name, population, indepyear, if( indepyear > 1947,  'After India', if( indepyear>1920, ' Just before india', 'Before India')) from country; -- if bracket me phele condition likho ske baad true h to message first me false h to second message print hoga
 
 -- case statment syntax
 
-- select col, col2
	--  case 
		-- 	When	condition	then	-----
		--     when	condition2	then	-----
	-- end case
	-- from table
    
-- Example 

select name, population, indepyear,
	 case 
		 	When indepyear >1947	then	'After 1947'
			When indepyear >=1919	then	'Only After 1919'
            else 'else condition'
	 end as result
from country;

select continent, count(*),
case 
	When count(*)>25 then 'Large Scale Continent'
    When count(*)>15 then 'Avg Scale continent'
else 'Small Scale continent'
end as result
from country group by continent;


-- Sub Query : A query within a query is known as Sb query
