-- properties
ALTER TABLE properties RENAME COLUMN weight TO atomic_mass;
ALTER TABLE properties RENAME COLUMN melting_point TO melting_point_celsius;
ALTER TABLE properties RENAME COLUMN boiling_point TO boiling_point_celsius;
ALTER TABLE properties ALTER COLUMN melting_point_celsius SET NOT NULL;
ALTER TABLE properties ALTER COLUMN boiling_point_celsius SET NOT NULL;
-- elements
ALTER TABLE elements ADD UNIQUE (symbol);
ALTER TABLE elements ADD UNIQUE (name);
ALTER TABLE elements ALTER COLUMN symbol SET NOT NULL;
ALTER TABLE elements ALTER COLUMN name SET NOT NULL;
--  add foreign keys
ALTER TABLE properties ADD FOREIGN KEY(atomic_number) REFERENCES elements(atomic_number);
-- types 
CREATE TABLE types (
  type_id SERIAL PRIMARY KEY,
  type VARCHAR(30) NOT NULL
);
INSERT INTO types (
  type
)
SELECT DISTINCT TYPE
FROM properties;
ALTER TABLE properties ADD type_id INT REFERENCES types(type_id);
UPDATE properties p
SET 
  type_id = t.type_id
FROM types t
WHERE t.type = p.type;
ALTER TABLE properties ALTER COLUMN type_id SET NOT NULL;
-- update values
UPDATE elements
SET 
  symbol = INITCAP(symbol) 
WHERE symbol <> INITCAP(symbol);
-- remove all the trailing zeros
ALTER TABLE properties ALTER COLUMN atomic_mass TYPE DECIMAL;
UPDATE properties
SET
  atomic_mass=to_char(atomic_mass, 'FM999.9999')::DECIMAL
;
-- add elements
INSERT INTO elements (
atomic_number,
name,
symbol
)
VALUES 
( 9, 'Fluorine', 'F'),
(10, 'Neon', 'Ne')
;
WITH ins (
  name, type, atomic_mass, melting_point_celsius, boiling_point_celsius
) AS
( VALUES
    ( 'Fluorine', 'nonmetal', 18.998, -220,   -188.1) ,
    ( 'Neon',     'nonmetal', 20.18,  -248.6, -246.1)
)
INSERT INTO properties (
  atomic_number,
  type,
  atomic_mass,
  melting_point_celsius,
  boiling_point_celsius,
  type_id
) 
SELECT 
  e.atomic_number,
  s.type,
  s.atomic_mass,
  s.melting_point_celsius,
  s.boiling_point_celsius,
  t.type_id  
FROM ins s
JOIN elements e ON e.name=s.name
JOIN types t ON t.type=s.type
;

DELETE FROM properties WHERE atomic_number = 1000;
DELETE FROM elements e WHERE e.atomic_number = 1000;
ALTER TABLE properties DROP COLUMN type;

SELECT 
  e.atomic_number,
  e.name,
  e.symbol,
  t.type,
  p.atomic_mass,
  p.melting_point_celsius,
  p.boiling_point_celsius
FROM elements e
JOIN properties p ON p.atomic_number=e.atomic_number
JOIN types t ON t.type_id=p.type_id
WHERE e.atomic_number=1
   OR e.name = 'Hydrogen'
   OR e.symbol = 'H'
;
