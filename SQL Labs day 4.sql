
--                                   Lab | SQL Queries 7

-- Which last names are not repeated?

select last_name, count(distinct last_name) as diff_lastnames
from sakila.actor 
group by last_name;

-- Which last names appear more than once?
use sakila;

select last_name from sakila.actor
group by (last_name)
having count(last_name) >1;

-- Rentals by employee.
select staff_id, count(rental_id) from sakila.rental
group by staff_id;


-- films by year 
select release_year, count(film_id) from sakila.film
group by release_year;


-- films by rating 
select rating, count(film_id) from sakila.film
group by rating;


-- mean lenght by rating 
select rating, round(avg(length)) from sakila.film
group by rating;


-- which kind of movies ratingshave mean duration higher than 2 hours
select rating, round(avg(length)) from sakila.film
group by rating
having round(avg(length)) >=120; 

-- List movies and add information of 
-- average duration for their rating and original language.
select title, language_id, rating, round(avg(length)) as 'avg_length' from sakila.film
group by title, anguage_id, rating; 

select title, language_id, rating, length, 
avg(length) over (partition by rating) as 'av_duration'
from sakila.film;


-- Which rentals are longer than expected?
select avg(rental_duration) from sakila.film;

select film_id, rental_duration,
avg(rental_duration) over(partition by film_id)
as average_rental from sakila.film
where rental_duration > (select avg(rental_duration) from sakila.film);