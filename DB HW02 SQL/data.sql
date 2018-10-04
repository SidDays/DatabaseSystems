-- Data Insertion Queries
-------------------------

-- users
INSERT INTO users VALUES (1, 'Siddhesh Karekar', '1995-07-31');
INSERT INTO users VALUES (2, 'Rohit Sahasrabuddhe', '1993-10-10');
INSERT INTO users VALUES (3, 'Harmeet Singh', '1994-11-25');
INSERT INTO users VALUES (4, 'Gautham Venkat', '1995-09-15');
INSERT INTO users VALUES (5, 'Sagar Hatte', '1993-09-27');
INSERT INTO users VALUES (10, 'Eashani Deorukhkar', 'November 8, 1995');

INSERT INTO users VALUES (20, 'John Doe', 'April 1, 1992');
INSERT INTO users VALUES (21, 'Jane Doe', 'April 2, 1992');
INSERT INTO users VALUES (22, 'See Kwell', 'April 30, 1990');

-- movies
INSERT INTO movies VALUES (1, 'Lawn With The Wind', 'comedy', '2003-01-05');
INSERT INTO movies VALUES (2, '2+2=U', 'comedy', '2004-11-05');
INSERT INTO movies VALUES (3, 'Notebook', 'drama', '2006-03-12');
INSERT INTO movies VALUES (4, 'First Time at the Zoo', 'comedy', '2011-10-10');
INSERT INTO movies VALUES (5, 'The light is coming', 'mystery', '2015-12-15');
INSERT INTO movies VALUES (6, 'Really old movie', 'documentary', '2001-09-25');

-- reviews
INSERT INTO reviews VALUES (20, 1, 10.0, 'Literally the best movie ever!');
INSERT INTO reviews VALUES (20, 2, 9.2, 'Would watch again.');
INSERT INTO reviews VALUES (20, 3, 5.0, 'Too sad!');
INSERT INTO reviews VALUES (20, 4, 6.32);
INSERT INTO reviews VALUES (20, 5, 10.0, 'Enlightenment is key!');

INSERT INTO reviews VALUES (21, 2, 2.7, 'Terrible!');
INSERT INTO reviews VALUES (21, 3, 8.1, 'I love this romance movie.');

INSERT INTO reviews VALUES (22, 2, 7.2, 'This movie was nothing special.');
INSERT INTO reviews VALUES (22, 3, 7.1, 'This movie was okay.');
INSERT INTO reviews VALUES (22, 6, 9.1, 'Epic movie.');

-- actors
INSERT INTO actors VALUES (1, 'Mark Clarkson', 'male', 'November 8, 1995');
INSERT INTO actors VALUES (2, 'Jack Drake', 'male', 'April 22, 1990');
INSERT INTO actors VALUES (3, 'Lava Shwava', 'female', 'July 30, 1994');
INSERT INTO actors VALUES (4, 'Margaret Tarmaset', 'female', 'December 31, 1989');
INSERT INTO actors VALUES (5, 'Julie Unroolie', 'female', 'August 3, 1961');
INSERT INTO actors VALUES (6, 'Relly Patelly', 'male', 'March 15, 1955');

-- lead
INSERT INTO lead VALUES (1, 1);
INSERT INTO lead VALUES (2, 1);

INSERT INTO lead VALUES (1, 2);
INSERT INTO lead VALUES (4, 2);
INSERT INTO lead VALUES (5, 2);

INSERT INTO lead VALUES (3, 3);
INSERT INTO lead VALUES (4, 3);

INSERT INTO lead VALUES (1, 4);
INSERT INTO lead VALUES (6, 4);
INSERT INTO lead VALUES (3, 4);
INSERT INTO lead VALUES (4, 4);