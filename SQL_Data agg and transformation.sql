USE Sakila;

SELECT
MAX(length) AS max_duration,
MIN(length) AS min_duration
FROM film;

SELECT
FLOOR(AVG(length) / 60) AS hours,
ROUND(AVG(length) % 60) AS minutes
FROM film;

SELECT
DATEDIFF(MAX(rental_date), MIN(rental_date)) AS operating_days
FROM rental;

SELECT
rental_id,
rental_date,
inventory_id,
customer_id,
return_date,
staff_id,
MONTH(rental_date) AS rental_month,
DAYNAME(rental_date) AS rental_weekday
FROM rental
LIMIT 20;

SELECT
rental_id,
rental_date,
inventory_id,
customer_id,
return_date,
staff_id,
MONTH(rental_date) AS rental_month,
DAYNAME(rental_date) AS rental_weekday,
CASE
    WHEN DAYNAME(rental_date) IN ('Saturday', 'Sunday') THEN 'weekend'
    ELSE 'workday'
END AS DAY_TYPE
FROM rental
LIMIT 20;

SELECT
title,
IFNULL(rental_duration, 'Not Available') AS rental_duration
FROM film
ORDER BY title ASC;

SELECT
CONCAT(first_name, ' ', last_name) AS full_name,
LEFT(email, 3) AS email_start
FROM customer
ORDER BY last_name ASC;