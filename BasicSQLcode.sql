show databases;
use world;
select * from world;

describe country;
-- data access 
select population from country;

select name, continent from country;
select continent, name, continent from country;

select name, continent, population, population+500 from country;

select name as country_name, population, population+500 as newpopulation from country;

select continent from country;
select * from country;

-- select => coloumn ko access krna ho tb use krte h 
-- you can write a query (logic) in any case fromate
-- you can give a column name using 'as' keyword

select * from country where population = '156483000';
select name, continent, population from country where name = 'india';
select * from country where continent = 'Europe' and indepyear>1900; -- dono conditions true hoti tb 'and' keyword ka use krte h 
select * from country where continent = 'Europe' or indepyear>1900; -- ek condtions true honi chaiye

select name as country_name, code as country_code, surfacearea from country where surfaceArea>1900;
select name as country_name, code as country_code, region from country where region = 'southern europe';
select name as country_name, code as country_code, region, continent from country where region = 'central africa' and continent = 'africa';
select name as country_name, continent, population, region from country where continent = 'africa' or 'asia';
select name, region, population, population + (population*10/100) as new_population from country where indepyear > 1950;


-- 'in' operator

select * from city where population in(129170, 117196);

-- ' like ' operator

select * from city where name like '%ba%'; -- '%' keyword mtkb kitne bhi charactor ho skte h 

-- "_" operator

select * from city where name like 'T__'; -- ' _ ' mtlb only one charccte rya agr khi 2 '__' h to wha fix 2 charactor

select * from city where name like '%e%';
select * from city where name like '%_b_';
select * from city where name like '_A%R_';
select * from city where name like '%AA%';
select name from country where name like '_%E_E%_';

-- function ---

-- string, number, dates
use world;
select name, continent, concat(continent, 'have' ,name, 'country') from country; -- y space nhi de rha bich me
select name, continent, concat_ws(' ', continent, 'have' ,name, 'country') from country; -- concat_ws(' ') iss trh se y keyword or sace dene se y bich me space de dega 

-- substr function
select name, upper(name), substr(name,2) from country; -- extract string character
select name, upper(name), substr(name,2,4) from country; -- substr(name,2,4) isme output second charcter se start hokr 4th charactor tk data deta h
-- example

select name, substr(name, -4) from country where name = 'colombia';
 
-- length function

select length('');

select name, replace(name, 'a','@') from country; -- y replce krega a ko @ se

-- trim function

select trim('   he      llo       '); -- y by  default staring spae or ending space ko hta deta h lekin bich wali space ko nhi 

-- lpad = left pad function  and one similar function is rpad = right pad

select name,lpad(name, 6, '@') from country; --- y ek fix number of charcter kr deta h by adding the gven charcter agr string length choti hoti h toh

-- YYYY-MM-DD <==     DD/MM/YYYY (WE CAN CONVERT)
select current_date(), current_time(), current_timestamp(), now();

select now(); --- provide current time and date

--- question is kisi employyee ne aj agr join kiya office to 6 mhine baad kya date hogi 
-- quetion solve krne k liye hum adddate() ka use krenge 

select now(), adddate(now() ,2); -- isne 2 din add kr diye current date me
-- for add month
select now(), adddate( now() , interval 1 month), adddate( now() , interval 1 year); -- saal month interval se add krte h current time me 

-- year() or month()

select now(), year( now() ), month( now());

-- extract function use hota h miniute year or sb niklne k liye ya extract krne k liye

select now(), extract( month from now()), extract( minute from now());

-- no. of week days niklne k liye weekday()
select now(), weekday( now() );

select now(), date_format( now(), 'year is %Y month is %M , weekday is %W');

-- important function substr, char_length, trim, replace
-- date function me adddate with interval, year, month, extract, date_formate, now()

