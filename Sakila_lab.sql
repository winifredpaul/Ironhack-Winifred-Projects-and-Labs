USE Sakila;

SHOW TABLES;

SELECT * FROM actor;
SELECT * FROM film;
SELECT * FROM customer;

SELECT title
FROM film;

SELECT name AS language
FROM Language;

SELECT first_name
FROM Staff;

SELECT DISTINCT release_year
FROM film;

SELECT COUNT(store_id) AS number_of_stores
FROM store;

SELECT COUNT(staff_id) AS number_of_employees
FROM staff;

SELECT COUNT(inventory_id) AS films_available_for_rent
FROM inventory;

SELECT COUNT(rental_id) AS films_rented
FROM rental;

SELECT COUNT(DISTINCT last_name) AS distinct_actor_last_names
FROM actor;

SELECT title, length
FROM film
ORDER BY length DESC
LIMIT 10;

SELECT *
FROM actor
WHERE first_name = 'SCARLETT';

SELECT title, length
FROM film
WHERE title LIKE '%ARMAGEDDON%'
AND length > 100;

SELECT COUNT(film_id) AS behind_the_scenes_films
FROM film
WHERE special_features LIKE '%Behind the Scenes%';
