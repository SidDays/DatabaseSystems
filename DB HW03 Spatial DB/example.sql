-- an example query

CREATE TABLE geometries (name varchar, geom geometry);

INSERT INTO geometries VALUES
    ('Point', 'POINT(0 0)'),
    ('Linestring', 'LINESTRING(0 0, 1 1, 2 1, 2 2)'),
    ('Polygon', 'POLYGON((0 0, 1 0, 1 1, 0 1, 0 1, 0 0))');

SELECT name, ST_AsText(geom) FROM geometries;