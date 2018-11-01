-- 1. Store points
CREATE TABLE places (name varchar, geom geometry);

INSERT INTO places VALUES
    ('The Spot (Home)', 'POINT(34.026469 -118.280190)'),
    ('Bridge Mm. Hall', 'POINT(34.019244 -118.285951)'),
    ('GamePipe Lab',    'POINT(34.029602 -118.279987)'),
    ('Village Signal',  'POINT(34.027437 -118.283904)'),
    ('RTH',             'POINT(34.020100 -118.289900)'),
    ('Uytengsu',        'POINT(34.023900 -118.288400)'),
    ('Cromwell Field',  'POINT(34.022000 -118.287900)'),
    ('Tommy Trojan',    'POINT(34.020464 -118.285417)'),
    ('Taper Hall',      'POINT(34.022145 -118.284221)');

SELECT name, ST_AsText(geom) FROM places;

-- 2. Generate convex hull
SELECT ST_AsText(
    ST_ConvexHull(
        ST_Collect(
            places.geom)))
FROM places;

-- Outputs: "POLYGON((34.0201 -118.2899,34.019244 -118.285951,34.026469 -118.28019,34.029602 -118.279987,34.027437 -118.283904,34.0239 -118.2884,34.0201 -118.2899))"