USE Sakila;

SELECT
	category.name AS category,
	COUNT(film.film_id) AS number_of_films
From category
JOIN film_category
	ON category.category_id = film_category.category_id
JOIN film
    ON film_category.film_id = film.film_id
GROUP BY category.name
ORDER BY number_of_films DESC;

SELECT
	store.store_id,
    city.city,
    country.country
FROM store
JOIN address
	ON store.address_id = address.address_id
JOIN city
	ON address.city_id = city.city_id
JOIN country
	ON city.country_id = country.country_id;
    
SELECT 
    store.store_id,
    ROUND(SUM(payment.amount), 2) AS total_revenue_dollars
FROM store
JOIN staff
    ON store.store_id = staff.store_id
JOIN payment
    ON staff.staff_id = payment.staff_id
GROUP BY store.store_id
ORDER BY total_revenue_dollars DESC; 

SELECT
	category.name AS category,
    ROUND(AVG(film.length),2) AS average_running_time_minutes
FROM category
JOIN film_category
	ON category.category_id = film_category.category_id
JOIN film
	on film_category.film_id = film.film_id
GROUP BY category.name
ORDER BY average_running_time_minutes DESC;

SELECT 
    category.name AS category,
    ROUND(AVG(film.length), 2) AS average_running_time_minutes
FROM category
JOIN film_category
    ON category.category_id = film_category.category_id
JOIN film
    ON film_category.film_id = film.film_id
GROUP BY category.name
ORDER BY average_running_time_minutes DESC
LIMIT 1;

SELECT
	film.title,
    COUNT(rental.rental_id) AS rental_count
FROM film
JOIN inventory
	ON film.film_id = inventory.film_id
JOIN rental
	ON inventory.inventory_id = rental.inventory_id
GROUP BY film.title
ORDER BY rental_count DESC
LIMIT 10;

SELECT
	film.title,
    inventory.store_id,
    COUNT(inventory.inventory_id) AS copies_in_store,
    CASE
		WHEN COUNT(inventory.inventory_id) > 0 THEN 'Can be rented from Store 1'
        ELSE 'Cannot be rented from Store 1'
	END AS rental_status
FROM film
LEFT JOIN inventory
	ON film.film_id = inventory.film_id
    AND inventory.store_id = 1
WHERE film.title = 'Academy Dinosaur'
GROUP BY film.title, inventory.store_id;

SELECT 
    film.title,
    CASE
        WHEN IFNULL(COUNT(inventory.inventory_id), 0) > 0 THEN 'Available'
        ELSE 'NOT available'
    END AS availability_status
FROM film
LEFT JOIN inventory
    ON film.film_id = inventory.film_id
GROUP BY film.film_id, film.title
ORDER BY film.title;
