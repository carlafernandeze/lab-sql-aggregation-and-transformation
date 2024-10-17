USE sakila;
--- Challenge 1
--- 1.1
SELECT max(length) as max_duration, min(length) as min_duration
FROM film;

--- 1.2
SELECT AVG(length) FROM film;

SELECT FLOOR(AVG(length)/60) AS hours,
MOD(FLOOR(AVG(length)),60) AS minutes
FROM FILM;

--- 2.1
SELECT * FROM rental;
SELECT DATE(rental_date) as operational_days
FROM rental;

SELECT 
DATE(MIN(rental_date)) as first_date, 
DATE(MAX(rental_date)) AS last_date,
DATEDIFF(MAX(rental_date), MIN(rental_date)) AS days_difference
FROM rental;

--- 2.2
SELECT * FROM rental
SELECT *, MONTH(rental_date) AS rental_month, dayofweek(rental_date) AS rental_day_of_week
FROM rental
LIMIT 20;

--- 2.3
SELECT *, dayofweek(rental_date) AS rental_day_of_week,
CASE 
WHEN dayofweek(rental_date) = 1 or dayofweek(rental_date) = 7 then 'Weekend'
WHEN dayofweek(rental_date) in (2, 3, 4, 5, 6) THEN 'Workday'
END AS day_type
FROM rental;

--- 3
SELECT * FROM rental;
SELECT title, IFNULL(rental_duration, 'Not Available') AS rental_duration
FROM FILM
ORDER BY title ASC;

--- 4
SELECT * FROM customer;
SELECT CONCAT(first_name,' ',last_name) AS full_name, SUBSTRING(email,1,3) AS email_prefix
FROM customer
GROUP BY last_name ASC;

--- CHALLENGE 2
--- 1.1 
SELECT * FROM film;
SELECT COUNT(*) as total_films_released
FROM film;

--- 1.2
SELECT rating, COUNT(*) AS total_films_rating
FROM film
GROUP BY rating;

--- 1.3
SELECT rating, COUNT(*) AS total_films_rating
FROM film
GROUP BY rating
ORDER BY total_films_rating DESC;

--- 2.1
SELECT rating, ROUND(AVG(length),2) AS avg_length_by_rating
FROM film
GROUP BY rating
ORDER BY avg_length_by_rating DESC;

--- 2.2
SELECT rating, ROUND(AVG(length),2) AS avg_length
FROM film
GROUP BY rating
HAVING AVG(length) > 120;

--- 3
SELECT * FROM actor;

SELECT last_name
FROM actor
GROUP BY last_name
HAVING COUNT(*) = 1;