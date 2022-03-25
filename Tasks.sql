USE sakila;
SELECT * FROM actor;
SELECT * FROM actor WHERE first_name = "John";
SELECT * FROM actor WHERE last_name = "Neeson";
SELECT * FROM actor WHERE actor_id%10 = 0;
SELECT description FROM film WHERE film_id = 100;
SELECT * FROM film WHERE rating = "R";
SELECT * FROM film WHERE rating <> "R";
SELECT * FROM film ORDER BY length ASC LIMIT 10;
SELECT title FROM film;
SELECT * FROM film WHERE special_features LIKE "%Deleted Scenes%";
SELECT DISTINCT last_name FROM actor;
SELECT last_name FROM actor GROUP BY last_name HAVING COUNT(*) > 1;
SELECT actor.actor_id, actor.first_name, actor.last_name,
count(actor_id) as film_count
FROM actor JOIN film_actor USING (actor_id)
GROUP BY actor_id
ORDER BY film_count DESC
LIMIT 1;
SELECT * FROM film JOIN inventory ON film.film_id = inventory.film_id WHERE store_id = 1 AND film.film_id = (
   SELECT film_id FROM film WHERE title = "Academy Dinosaur"
);
SELECT * FROM inventory JOIN rental ON inventory.inventory_id = rental.inventory_id WHERE inventory.film_id = (
	SELECT film_id FROM film WHERE title = "Academy Dinosaur"
);
SELECT Avg(length) FROM film;
SELECT category_id, Avg(film.length) FROM film JOIN film_category ON film.film_id = film_category.film_id GROUP BY film_category.category_id;
SELECT title, description FROM film_text WHERE description LIKE "%Robot%";
SELECT title, length FROM film WHERE length = (
SELECT max(length) FROM film
);
SELECT count(title) FROM film WHERE release_year = 2010;
SELECT title, film_category.category_id FROM film JOIN film_category ON film.film_id = film_category.film_id WHERE film_category.category_id = (
	SELECT category_id FROM category WHERE name = "Horror"
);
SELECT concat(first_name, " ", last_name) AS full_name FROM staff WHERE staff_id = 1;
SELECT title, film_actor.actor_id  FROM film JOIN film_actor ON film.film_id = film_actor.film_id WHERE film_actor.actor_id = (
	SELECT actor_id FROM actor WHERE first_name = "Fred" AND last_name = "Costner"
);
SELECT count(film_id), store_id FROM inventory WHERE film_id= (
SELECT film_id FROM film WHERE title='Bucket Brotherhood'
) GROUP BY store_id;











