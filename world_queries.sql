use world;

-- 1. Using COUNT, get the number of cities in the USA.
select count(*) as usa_cities from city where CountryCode = 'USA';

-- 2. Find out the population and life expectancy for people in Argentina.
select LifeExpectancy from country where Name='Argentina';

-- 3. Using IS NOT NULL, ORDER BY, and LIMIT, which country has the highest life expectancy
select Name, LifeExpectancy from country
order by LifeExpectancy desc
limit 1;

-- 4. Using JOIN ... ON, find the capital city of Spain.
select city.Name from city 
join country on city.ID = country.Capital
where country.Name = 'Spain';

-- 5. Using JOIN ... ON, list all the languages spoken in the Southeast Asia region.
select Language from countrylanguage
join country on countrylanguage.CountryCode = country.Code
where country.Region = 'Southeast Asia';

-- 6. Using a single query, list 25 cities around the world that start with the letter F.
select Name from city where Name like 'F%' limit 25;

-- 7. Using COUNT and JOIN ... ON, get the number of cities in China.
select count(city.Name) from city
join country on city.CountryCode = country.Code
where country.Name = 'China';

-- 8. Using IS NOT NULL, ORDER BY, and LIMIT, which country has the lowest population? Discard non-zero populations.
select name, Population from Country where Population is not null
order by Population
limit 1;

-- 9. Using aggregate functions, return the number of countries the database contains.
select count(*) from country;

-- 10. What are the top ten largest countries by area?
select Name, SurfaceArea from country
order by SurfaceArea desc
limit 10;

-- 11. List the five largest cities by population in Japan.
select city.Name, city.Population from city
join country on city.CountryCode = country.Code
where country.Name = 'Japan'
order by city.Population desc
limit 5;

-- 12. List the names and country codes of every country with Elizabeth II as its Head of State. You will need to fix the mistake first!
select Name, Code from country where HeadOfState = 'Elisabeth II';

-- 13. List the top ten countries with the smallest population-to-area ratio. Discard any countries with a ratio of 0.
select Name from country where Population / SurfaceArea > 0
order by Population / SurfaceArea
limit 10;

-- 14. List every unique world language.
select distinct Language from countrylanguage;

-- 15. List the names and GNP of the world's top 10 richest countries.
select Name, GNP from country
order by GNP desc
limit 10;

-- 16. List the names of, and number of languages spoken by, the top ten most multilingual countries.
