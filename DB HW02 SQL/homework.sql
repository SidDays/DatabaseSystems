-- Homework Queries
-------------------

-- 1. List the name(s) of the user(s) born in April who rated at most 8 for the movie 'Notebook'. Output their names sorted in descending order.

SELECT DISTINCT u.name
FROM users u, reviews r, movies m
WHERE u.id = r.user_id
AND EXTRACT(MONTH FROM u.date_of_birth) = 04
AND r.movie_id = m.id
AND r.rating <= 8.0
AND m.name = 'Notebook'
ORDER BY name DESC;

--2. Find user ‘John Doe’'s favorite type of movie genre(s) based on his movie review ratings. List the  name(s) and genre(s) of all the movie(s) under this/these movie genre(s) sorted them based on the movie genre then movie name in the ascending order.

SELECT m.genre, AVG(r.rating)
FROM users u, reviews r, movies m
WHERE u.id = r.user_id
AND u.name = 'John Doe'
AND r.movie_id = m.id
GROUP BY m.genre;

SELECT MAX(avg)
FROM (
	SELECT m.genre, AVG(r.rating)
	FROM users u, reviews r, movies m
	WHERE u.id = r.user_id
	AND u.name = 'John Doe'
	AND r.movie_id = m.id
	GROUP BY m.genre) john_genre_rating;

SELECT m.genre
FROM users u, reviews r, movies m
WHERE u.id = r.user_id
AND u.name = 'John Doe'
AND r.movie_id = m.id
GROUP BY m.genre
HAVING AVG(r.rating) = (
	SELECT MAX(avg)
	FROM (
		SELECT m.genre, AVG(r.rating)
		FROM users u, reviews r, movies m
		WHERE u.id = r.user_id
		AND u.name = 'John Doe'
		AND r.movie_id = m.id
		GROUP BY m.genre) john_genre_rating);
		
SELECT name, genre
FROM movies
WHERE genre IN (
	SELECT m.genre
	FROM users u, reviews r, movies m
	WHERE u.id = r.user_id
	AND u.name = 'John Doe'
	AND r.movie_id = m.id
	GROUP BY m.genre
	HAVING AVG(r.rating) = (
		SELECT MAX(avg)
		FROM (
			SELECT m.genre, AVG(r.rating)
			FROM users u, reviews r, movies m
			WHERE u.id = r.user_id
			AND u.name = 'John Doe'
			AND r.movie_id = m.id
			GROUP BY m.genre) john_genre_rating))
ORDER BY genre ASC, name ASC;

--3. List the movie ID(s) with most male lead. Sort the IDs in descending order. 

SELECT l.movie_id, COUNT(l.actor_id) no_of_leads
FROM movies m, lead l, actors a 
WHERE m.id = l.movie_id
AND l.actor_id = a.id
AND a.gender = 'male'
GROUP BY l.movie_id;

SELECT MAX(no_of_leads)
FROM (SELECT l.movie_id, COUNT(l.actor_id) no_of_leads
	FROM movies m, lead l, actors a 
	WHERE m.id = l.movie_id
	AND l.actor_id = a.id
	AND a.gender = 'male'
	GROUP BY l.movie_id) movie_lead_count;
	
SELECT l.movie_id, COUNT(l.actor_id) no_of_leads
FROM movies m, lead l, actors a 
WHERE m.id = l.movie_id
AND l.actor_id = a.id
AND a.gender = 'male'
GROUP BY l.movie_id
HAVING COUNT(l.actor_id) = (SELECT MAX(no_of_leads)
	FROM (SELECT l.movie_id, COUNT(l.actor_id) no_of_leads
		FROM movies m, lead l, actors a 
		WHERE m.id = l.movie_id
		AND l.actor_id = a.id
		AND a.gender = 'male'
		GROUP BY l.movie_id) movie_lead_count);

--4. List the name(s) of all comedy movie(s) that were released before 2006 and have review rating better than average rating of all movies, sorted in ascending order. 

-- Note: You should compute the average of movie average ratings, not the average of all ratings. E.g. movie A got reviews 10, 10, and 10, and movie B got just one 6, the result should be ((10 + 10 + 10) / 3 + 6) / 2 = 8, instead of (10 + 10 + 10 + 6) / 4 = 9.

SELECT r.movie_id, AVG(r.rating) movie_avg_rating
FROM movies m, reviews r
WHERE m.id = r.movie_id
GROUP BY r.movie_id;

SELECT AVG(movie_avg_rating) avg_movie_rating FROM (SELECT r.movie_id, AVG(r.rating) movie_avg_rating
	FROM movies m, reviews r
	WHERE m.id = r.movie_id
	GROUP BY r.movie_id) movie_avg_ratings;
	
SELECT DISTINCT m.name
FROM movies m, reviews r
WHERE m.id = r.movie_id
AND m.release_date < 'January 1, 2006'
AND m.genre = 'comedy'
AND r.rating > (
	SELECT AVG(movie_avg_rating) avg_movie_rating FROM (SELECT AVG(r.rating) movie_avg_rating
		FROM movies m, reviews r
		WHERE m.id = r.movie_id
		GROUP BY r.movie_id) movie_avg_ratings)
ORDER BY m.name ASC;

--5 List the movie ID(s) and average review(s) where the average review is higher than 9 and one of their leading actors is the actor 'Mark Clarkson'. Sort the output by average reviews and then movie IDs.

SELECT DISTINCT l.movie_id
FROM lead l, actors a
WHERE l.actor_id = a.id
AND a.name = 'Mark Clarkson';

SELECT r.movie_id, AVG(r.rating) movie_avg_rating
FROM movies m, reviews r
WHERE m.id = r.movie_id
GROUP BY r.movie_id
HAVING AVG(r.rating) > 9
ORDER BY movie_avg_rating, r.movie_id;

SELECT r.movie_id, AVG(r.rating) movie_avg_rating
FROM movies m, reviews r
WHERE m.id = r.movie_id
AND m.id IN (
	SELECT DISTINCT l.movie_id
	FROM lead l, actors a
	WHERE l.actor_id = a.id
	AND a.name = 'Mark Clarkson')
GROUP BY r.movie_id
HAVING AVG(r.rating) > 9
ORDER BY movie_avg_rating, r.movie_id;

--6. Find the actors who played the lead together the most. Display these their names and the number of times they played the lead together. 

-- Note: The resulting table must show both actors info in the same row (Actor1 and Actor2). This might result in duplicate data where two rows might have the same actors but in different columns.

SELECT l1.movie_id, l1.actor_id, l2.actor_id
FROM lead l1, lead l2
WHERE l1.movie_id = l2.movie_id
AND l1.actor_id <> l2.actor_id;

SELECT l1.actor_id actor1_id, l2.actor_id actor2_id, COUNT(l1.movie_id) costar_count
FROM lead l1, lead l2
WHERE l1.movie_id = l2.movie_id
AND l1.actor_id <> l2.actor_id
GROUP BY l1.actor_id, l2.actor_id;

SELECT MAX(costar_count)
FROM (
	SELECT l1.actor_id actor1_id, l2.actor_id actor2_id, COUNT(l1.movie_id) costar_count
	FROM lead l1, lead l2
	WHERE l1.movie_id = l2.movie_id
	AND l1.actor_id <> l2.actor_id
	GROUP BY l1.actor_id, l2.actor_id) leads_costar;
	
SELECT l1.actor_id actor1_id, l2.actor_id actor2_id, COUNT(l1.movie_id) costar_count
FROM lead l1, lead l2
WHERE l1.movie_id = l2.movie_id
AND l1.actor_id <> l2.actor_id
GROUP BY l1.actor_id, l2.actor_id
HAVING COUNT(l1.movie_id) = (
	SELECT MAX(costar_count)
	FROM (
		SELECT l1.actor_id actor1_id, l2.actor_id actor2_id, COUNT(l1.movie_id) costar_count
		FROM lead l1, lead l2
		WHERE l1.movie_id = l2.movie_id
		AND l1.actor_id <> l2.actor_id
		GROUP BY l1.actor_id, l2.actor_id) leads_costar);
		
SELECT a1.name, a2.name
FROM actors a1, actors a2, (
	SELECT l1.actor_id actor1_id, l2.actor_id actor2_id, COUNT(l1.movie_id) costar_count
	FROM lead l1, lead l2
	WHERE l1.movie_id = l2.movie_id
	AND l1.actor_id <> l2.actor_id
	GROUP BY l1.actor_id, l2.actor_id
	HAVING COUNT(l1.movie_id) = (
		SELECT MAX(costar_count)
		FROM (
			SELECT l1.actor_id actor1_id, l2.actor_id actor2_id, COUNT(l1.movie_id) costar_count
			FROM lead l1, lead l2
			WHERE l1.movie_id = l2.movie_id
			AND l1.actor_id <> l2.actor_id
			GROUP BY l1.actor_id, l2.actor_id) leads_costar)) leads_costar_max
WHERE a1.id = leads_costar_max.actor1_id
AND a2.id = leads_costar_max.actor2_id;

