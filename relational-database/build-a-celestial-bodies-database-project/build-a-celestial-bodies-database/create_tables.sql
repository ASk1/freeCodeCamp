drop table if exists moon;
drop table if exists planet;
drop table if exists planet_types;
drop table if exists star;
drop table if exists galaxy;

create table galaxy (
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL UNIQUE,
  constellation VARCHAR(50) NOT NULL,
  description TEXT NOT NULL,
  has_life BOOLEAN,
  age_in_millions_of_years INT NOT NULL,
  distance_from_earth NUMERIC NOT NULL,
  is_spherical BOOLEAN
);
INSERT INTO galaxy (
  name,
  constellation,
  description,
  has_life,
  age_in_millions_of_years,
  distance_from_earth,
  is_spherical
)
values
('Andromeda Galaxies', 'Andromeda',
 'Andromeda, which is shortened from "Andromeda Galaxy", gets its name from the area of the sky in which it appears, the constellation of Andromeda.
Andromeda is the closest big galaxy to the Milky Way and is expected to collide with the Milky Way around 4.5 billion years from now. The two will eventually merge into a single new galaxy called Milkdromeda.
 ',
 NULL, 7000, 2500000, False
),
('Antennae Galaxies', 'Corvus',
 'Appearance is similar to an insect''s antennae.
Two colliding galaxies.
 ',
 NULL, 12000, 45000000, False
),
('Milky Way', 'Sagittarius',
 'The appearance from Earth of the galaxy—a band of light.
The galaxy containing the Sun and its Solar System, and therefore Earth..
 ',
 NULL, 12000, 45000000, True
),
('Galaxy 4', 'Constellation 4',
 'Galaxy 4 description',
 NULL, 0, 0, False
),
('Galaxy 5', 'Constellation 5',
 'Galaxy 5 description',
 NULL, 0, 0, False
),
('Galaxy 6', 'Constellation 6',
 'Galaxy 6 description',
 NULL, 0, 0, False
)
;

create table star (
  star_id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL UNIQUE,
  description TEXT NOT NULL,
  has_life BOOLEAN,
  age_in_millions_of_years INT NOT NULL,
  distance_from_earth NUMERIC NOT NULL,
  is_spherical BOOLEAN,
  galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id)  
);
insert into star(
  name,
  description,
  has_life,
  age_in_millions_of_years,
  distance_from_earth,
  is_spherical,
  galaxy_id
) VALUES
('Sun', 'The Sun is the star at the center of the Solar System. It is a massive, nearly perfect sphere of hot plasma,[18][19] heated to incandescence by nuclear fusion reactions in its core, radiating the energy from its surface mainly as visible light and infrared radiation with 10% at ultraviolet energies. It is by far the most important source of energy for life on Earth. The Sun has been an object of veneration in many cultures. It has been a central subject for astronomical research since antiquity.', NULL, 4500, 0.000016063, False, 3),
('Star 2', 'star 2 description', NULL, 0, 0, False,1),
('Star 3', 'star 3 description', NULL, 0, 0, False, 2),
('Star 4', 'star 4 description', NULL, 0, 0, False, 6),
('Star 5', 'star 5 description', NULL, 0, 0, False, 4),
('Star 6', 'star 6 description', NULL, 0, 0, False, 5)
;

create table planet_types (
  planet_types_id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL UNIQUE,
  description TEXT NOT NULL
);

insert into planet_types (
  name,
  description
) VALUES 
('Type 1', 'type description'),
('Type 2', 'type description'),
('Type 3', 'type description')
;

create table planet (
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL UNIQUE,
  description TEXT NOT NULL,
  has_life BOOLEAN,
  age_in_millions_of_years INT NOT NULL,
  distance_from_earth NUMERIC NOT NULL,
  is_spherical BOOLEAN,
  star_id INT NOT NULL REFERENCES star(star_id),
  planet_types_id INT NOT NULL REFERENCES planet_types(planet_types_id)
);
insert into planet (
  name,
  description,
  has_life,
  age_in_millions_of_years,
  distance_from_earth,
  is_spherical,
  star_id,
  planet_types_id  
) VALUES 
('Planet 1', 'planet description', False, 0, 0, False, 1, 3),
('Planet 2', 'planet description', False, 0, 0, False, 2, 3),
('Planet 3', 'planet description', False, 0, 0, False, 3, 3),
('Planet 4', 'planet description', False, 0, 0, False, 4, 3),
('Planet 5', 'planet description', False, 0, 0, False, 5, 3),
('Planet 6', 'planet description', False, 0, 0, False, 6, 3),
('Planet 7', 'planet description', False, 0, 0, False, 1, 3),
('Planet 8', 'planet description', False, 0, 0, False, 2, 3),
('Planet 9', 'planet description', False, 0, 0, False, 3, 3),
('Planet 10', 'planet description', False, 0, 0, False, 4, 3),
('Planet 11', 'planet description', False, 0, 0, False, 5, 3),
('Planet 12', 'planet description', False, 0, 0, False, 6, 3)
;

create table moon (
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL UNIQUE,
  description TEXT NOT NULL,
  has_life BOOLEAN,
  age_in_millions_of_years INT NOT NULL,
  distance_from_earth NUMERIC NOT NULL,
  is_spherical BOOLEAN,
  planet_id INT NOT NULL REFERENCES planet(planet_id)
);

insert into moon (
  name,
  description,
  has_life,
  age_in_millions_of_years,
  distance_from_earth,
  is_spherical,
  planet_id
) values
('Moon  1', 'Moon description', False, 0, 0, False,  1),
('Moon  2', 'Moon description', False, 0, 0, False,  2),
('Moon  3', 'Moon description', False, 0, 0, False,  3),
('Moon  4', 'Moon description', False, 0, 0, False,  4),
('Moon  5', 'Moon description', False, 0, 0, False,  5),
('Moon  6', 'Moon description', False, 0, 0, False,  6),
('Moon  7', 'Moon description', False, 0, 0, False,  7),
('Moon  8', 'Moon description', False, 0, 0, False,  8),
('Moon  9', 'Moon description', False, 0, 0, False,  9),
('Moon 10', 'Moon description', False, 0, 0, False, 10),
('Moon 11', 'Moon description', False, 0, 0, False, 11),
('Moon 12', 'Moon description', False, 0, 0, False, 12),
('Moon 13', 'Moon description', False, 0, 0, False,  1),
('Moon 14', 'Moon description', False, 0, 0, False,  2),
('Moon 15', 'Moon description', False, 0, 0, False,  3),
('Moon 16', 'Moon description', False, 0, 0, False,  4),
('Moon 17', 'Moon description', False, 0, 0, False,  5),
('Moon 18', 'Moon description', False, 0, 0, False,  6),
('Moon 19', 'Moon description', False, 0, 0, False,  7),
('Moon 20', 'Moon description', False, 0, 0, False,  8)
;

