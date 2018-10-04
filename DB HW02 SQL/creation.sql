-- Table Creation Queries
-------------------------

-- users
CREATE TABLE users (
	id INTEGER PRIMARY KEY NOT NULL,
	name VARCHAR(255) NOT NULL,
	date_of_birth DATE NOT NULL
);

-- movies
CREATE TABLE movies (
	id INTEGER PRIMARY KEY NOT NULL,
	name VARCHAR(255) NOT NULL,
	genre VARCHAR(255) NOT NULL,
	release_date DATE NOT NULL
);

-- reviews
CREATE TABLE reviews (
	user_id INTEGER NOT NULL,
	movie_id INTEGER NOT NULL,
	rating NUMERIC NOT NULL,
	comment VARCHAR(5000),
	FOREIGN KEY (user_id) REFERENCES users (id),
	FOREIGN KEY (movie_id) REFERENCES movies (id),
	PRIMARY KEY (user_id, movie_id)
);

-- actors
CREATE TABLE actors (
	id INTEGER PRIMARY KEY NOT NULL,
	name VARCHAR(255) NOT NULL,
	gender VARCHAR(10) NOT NULL,
	date_of_birth DATE NOT NULL
);

-- lead
CREATE TABLE lead (
	actor_id INTEGER NOT NULL,
	movie_id INTEGER NOT NULL,
	FOREIGN KEY (actor_id) REFERENCES actors (id),
	FOREIGN KEY (movie_id) REFERENCES movies (id),
	PRIMARY KEY (actor_id, movie_id)
);