--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    constellation character varying(50) NOT NULL,
    description text NOT NULL,
    has_life boolean,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric NOT NULL,
    is_spherical boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL,
    has_life boolean,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric NOT NULL,
    is_spherical boolean,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL,
    has_life boolean,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric NOT NULL,
    is_spherical boolean,
    star_id integer NOT NULL,
    planet_types_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_types_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_types_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL,
    has_life boolean,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric NOT NULL,
    is_spherical boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_planet_types_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxies', 'Andromeda', 'Andromeda, which is shortened from "Andromeda Galaxy", gets its name from the area of the sky in which it appears, the constellation of Andromeda.
Andromeda is the closest big galaxy to the Milky Way and is expected to collide with the Milky Way around 4.5 billion years from now. The two will eventually merge into a single new galaxy called Milkdromeda.
 ', NULL, 7000, 2500000, false);
INSERT INTO public.galaxy VALUES (2, 'Antennae Galaxies', 'Corvus', 'Appearance is similar to an insect''s antennae.
Two colliding galaxies.
 ', NULL, 12000, 45000000, false);
INSERT INTO public.galaxy VALUES (3, 'Milky Way', 'Sagittarius', 'The appearance from Earth of the galaxy—a band of light.
The galaxy containing the Sun and its Solar System, and therefore Earth..
 ', NULL, 12000, 45000000, true);
INSERT INTO public.galaxy VALUES (4, 'Galaxy 4', 'Constellation 4', 'Galaxy 4 description', NULL, 0, 0, false);
INSERT INTO public.galaxy VALUES (5, 'Galaxy 5', 'Constellation 5', 'Galaxy 5 description', NULL, 0, 0, false);
INSERT INTO public.galaxy VALUES (6, 'Galaxy 6', 'Constellation 6', 'Galaxy 6 description', NULL, 0, 0, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon  1', 'Moon description', false, 0, 0, false, 1);
INSERT INTO public.moon VALUES (2, 'Moon  2', 'Moon description', false, 0, 0, false, 2);
INSERT INTO public.moon VALUES (3, 'Moon  3', 'Moon description', false, 0, 0, false, 3);
INSERT INTO public.moon VALUES (4, 'Moon  4', 'Moon description', false, 0, 0, false, 4);
INSERT INTO public.moon VALUES (5, 'Moon  5', 'Moon description', false, 0, 0, false, 5);
INSERT INTO public.moon VALUES (6, 'Moon  6', 'Moon description', false, 0, 0, false, 6);
INSERT INTO public.moon VALUES (7, 'Moon  7', 'Moon description', false, 0, 0, false, 7);
INSERT INTO public.moon VALUES (8, 'Moon  8', 'Moon description', false, 0, 0, false, 8);
INSERT INTO public.moon VALUES (9, 'Moon  9', 'Moon description', false, 0, 0, false, 9);
INSERT INTO public.moon VALUES (10, 'Moon 10', 'Moon description', false, 0, 0, false, 10);
INSERT INTO public.moon VALUES (11, 'Moon 11', 'Moon description', false, 0, 0, false, 11);
INSERT INTO public.moon VALUES (12, 'Moon 12', 'Moon description', false, 0, 0, false, 12);
INSERT INTO public.moon VALUES (13, 'Moon 13', 'Moon description', false, 0, 0, false, 1);
INSERT INTO public.moon VALUES (14, 'Moon 14', 'Moon description', false, 0, 0, false, 2);
INSERT INTO public.moon VALUES (15, 'Moon 15', 'Moon description', false, 0, 0, false, 3);
INSERT INTO public.moon VALUES (16, 'Moon 16', 'Moon description', false, 0, 0, false, 4);
INSERT INTO public.moon VALUES (17, 'Moon 17', 'Moon description', false, 0, 0, false, 5);
INSERT INTO public.moon VALUES (18, 'Moon 18', 'Moon description', false, 0, 0, false, 6);
INSERT INTO public.moon VALUES (19, 'Moon 19', 'Moon description', false, 0, 0, false, 7);
INSERT INTO public.moon VALUES (20, 'Moon 20', 'Moon description', false, 0, 0, false, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Planet 1', 'planet description', false, 0, 0, false, 1, 3);
INSERT INTO public.planet VALUES (2, 'Planet 2', 'planet description', false, 0, 0, false, 2, 3);
INSERT INTO public.planet VALUES (3, 'Planet 3', 'planet description', false, 0, 0, false, 3, 3);
INSERT INTO public.planet VALUES (4, 'Planet 4', 'planet description', false, 0, 0, false, 4, 3);
INSERT INTO public.planet VALUES (5, 'Planet 5', 'planet description', false, 0, 0, false, 5, 3);
INSERT INTO public.planet VALUES (6, 'Planet 6', 'planet description', false, 0, 0, false, 6, 3);
INSERT INTO public.planet VALUES (7, 'Planet 7', 'planet description', false, 0, 0, false, 1, 3);
INSERT INTO public.planet VALUES (8, 'Planet 8', 'planet description', false, 0, 0, false, 2, 3);
INSERT INTO public.planet VALUES (9, 'Planet 9', 'planet description', false, 0, 0, false, 3, 3);
INSERT INTO public.planet VALUES (10, 'Planet 10', 'planet description', false, 0, 0, false, 4, 3);
INSERT INTO public.planet VALUES (11, 'Planet 11', 'planet description', false, 0, 0, false, 5, 3);
INSERT INTO public.planet VALUES (12, 'Planet 12', 'planet description', false, 0, 0, false, 6, 3);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'Type 1', 'type description');
INSERT INTO public.planet_types VALUES (2, 'Type 2', 'type description');
INSERT INTO public.planet_types VALUES (3, 'Type 3', 'type description');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The Sun is the star at the center of the Solar System. It is a massive, nearly perfect sphere of hot plasma,[18][19] heated to incandescence by nuclear fusion reactions in its core, radiating the energy from its surface mainly as visible light and infrared radiation with 10% at ultraviolet energies. It is by far the most important source of energy for life on Earth. The Sun has been an object of veneration in many cultures. It has been a central subject for astronomical research since antiquity.', NULL, 4500, 0.000016063, false, 3);
INSERT INTO public.star VALUES (2, 'Star 2', 'star 2 description', NULL, 0, 0, false, 1);
INSERT INTO public.star VALUES (3, 'Star 3', 'star 3 description', NULL, 0, 0, false, 2);
INSERT INTO public.star VALUES (4, 'Star 4', 'star 4 description', NULL, 0, 0, false, 6);
INSERT INTO public.star VALUES (5, 'Star 5', 'star 5 description', NULL, 0, 0, false, 4);
INSERT INTO public.star VALUES (6, 'Star 6', 'star 6 description', NULL, 0, 0, false, 5);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_types_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_types planet_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_name_key UNIQUE (name);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_planet_types_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_types_id_fkey FOREIGN KEY (planet_types_id) REFERENCES public.planet_types(planet_types_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

