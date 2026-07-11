USE sakila;

SELECT Count(*) AS number_of_copies
FROM inventory
WHERE film_id = (
	SELECT film_id
    FROM film
    WHERE title = 'Hunchback Impossible');
    
SELECT
	film_id,
    title,
    length
FROM film
WHERE length > (
	SELECT AVG(length)
    FROM film)
ORDER BY length DESC;
    
SELECT
    actor_id,
    first_name,
    last_name
FROM actor
WHERE actor_id IN (
    SELECT actor_id
    FROM film_actor
    WHERE film_id = (
        SELECT film_id
        FROM film
        WHERE title = 'Alone Trip'
    )
);
    
SELECT
	film_id,
    title
FROM film
WHERE film_id IN (
	SELECT film_id
    FROM film_category
    WHERE category_id = (
		SELECT category_id
        FROM category
        WHERE name = 'Family'))
ORDER BY title;

SELECT
    first_name,
    last_name,
    email
FROM customer
WHERE address_id IN (
    SELECT address_id
    FROM address
    WHERE city_id IN (
        SELECT city_id
        FROM city
        WHERE country_id = (
            SELECT country_id
            FROM country
            WHERE country = 'Canada'
        )
    )
);

SELECT
    c.first_name,
    c.last_name,
    c.email
FROM customer AS c
JOIN address AS a
    ON c.address_id = a.address_id
JOIN city AS ci
    ON a.city_id = ci.city_id
JOIN country AS co
    ON ci.country_id = co.country_id
WHERE co.country = 'Canada';

SELECT
    f.film_id,
    f.title
FROM film AS f
JOIN film_actor AS fa
    ON f.film_id = fa.film_id
WHERE fa.actor_id = (
    SELECT actor_id
    FROM film_actor
    GROUP BY actor_id
    ORDER BY COUNT(film_id) DESC
    LIMIT 1
)
ORDER BY f.title;

SELECT DISTINCT
    film.film_id,
    film.title
FROM film
JOIN inventory
    ON film.film_id = inventory.film_id
JOIN rental
    ON inventory.inventory_id = rental.inventory_id
WHERE rental.customer_id = (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    ORDER BY SUM(amount) DESC
    LIMIT 1
)
ORDER BY film.title;

SELECT
    customer_id AS client_id,
    SUM(amount) AS total_amount_spent
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > (
    SELECT AVG(total_amount_spent)
    FROM (
        SELECT
            SUM(amount) AS total_amount_spent
        FROM payment
        GROUP BY customer_id
    ) AS customer_spending
)
ORDER BY total_amount_spent DESC;