-- CTE stands for common table expression

use viewdb2;
-- CTAS statement --> it creates table as select statement
create table city_12 as select * from world.city;

with abc as ( select * from city_12
where countrycode ='AFG' and name like '%a%')



select * from city_12;  -- country code

select * from world.country; -- code

-- normal way
select c.name, c.countrycode, c.district, c.population, cn.code, cn.name, cn.continent , cn.population
from city_12 as c
join world.country as cn 
on c.countrycode = cn.code
where cn.continent = 'Asia' and cn.population > 400000;

-- Through CTE

select name, district , max(population) as highest_population
from city_12
group by name 
having max(population);

-- with co-related

SELECT name, district, population
FROM city_12 c
WHERE population = (
    SELECT MAX(population)
    FROM city_12
    WHERE district = c.district
);

-- without co- related
with district_max as ( select district, max(population) as d_population
from city_12 
group by district)
select * from district_max as dm join city_12 as c
on c.district = dm.district and c.population = dm.d_population;

with cte as (
select max(population) from city_12
where population < ( select max(population) from city_12) )
, cte2 as (
select max(population) from city_12 where population < ( select * from cte ) )

 select * from city_12 where population = (select * from cte2 );
