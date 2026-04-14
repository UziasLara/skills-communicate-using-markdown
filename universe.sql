--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    name character varying(40) NOT NULL,
    star_id integer,
    comet_id integer NOT NULL,
    description text,
    age integer
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comets_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comets_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comets_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comets_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comets_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    type text,
    name character varying(20) NOT NULL,
    description text,
    rating integer
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
    type text,
    name character varying(20) NOT NULL,
    planet_id integer,
    rating integer
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
    type text,
    age_in_billions_of_years numeric(4,2),
    distance_from_earth_in_millions_of_light_years numeric(20,14),
    name character varying(20) NOT NULL,
    has_life boolean,
    is_spherical boolean,
    rating integer,
    placement_in_solar_system integer,
    star_id integer
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    type character varying(40),
    age_in_billions_of_years numeric(4,2),
    distance_from_earth_in_millions_of_light_years numeric(10,2),
    name character varying(40) NOT NULL,
    galaxy_id integer
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comets_comet_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES ('1P / Halley', 1, 1, NULL, NULL);
INSERT INTO public.comet VALUES ('Hale-Bopp', 1, 2, NULL, NULL);
INSERT INTO public.comet VALUES ('67P/C-G', 1, 3, NULL, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Barred Spiral', 'Milky Way', NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Spiral', 'Andromeda', NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Unbarred Spiral', 'Sombrero', NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Spiral', 'Whirlpool', NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Spiral', 'Black Eye', NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Ring', 'Hoag''s Object', NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Terrestrial', 'The Moon', 3, NULL);
INSERT INTO public.moon VALUES (2, 'Captured Asteroid', 'Phobos', 10, NULL);
INSERT INTO public.moon VALUES (3, 'Icy', 'Europa', 11, NULL);
INSERT INTO public.moon VALUES (4, 'Complex / Atmospheric', 'Titan', 12, NULL);
INSERT INTO public.moon VALUES (5, 'Icy / Chaotic', 'Miranda', 13, NULL);
INSERT INTO public.moon VALUES (6, 'Captured Kuiper Belt Object', 'Triton', 14, NULL);
INSERT INTO public.moon VALUES (7, 'Captured Asteroid', 'Deimos', 10, NULL);
INSERT INTO public.moon VALUES (8, 'Volcanic', 'Io', 11, NULL);
INSERT INTO public.moon VALUES (9, 'Icy / Magnetic', 'Ganymede', 11, NULL);
INSERT INTO public.moon VALUES (10, 'Icy / Cratered', 'Callisto', 11, NULL);
INSERT INTO public.moon VALUES (11, 'Irregular', 'Amalthea', 11, NULL);
INSERT INTO public.moon VALUES (12, 'Icy', 'Mimas', 12, NULL);
INSERT INTO public.moon VALUES (13, 'Icy / Geyser', 'Enceladus', 12, NULL);
INSERT INTO public.moon VALUES (14, 'Icy', 'Tethys', 12, NULL);
INSERT INTO public.moon VALUES (15, 'Icy', 'Dione', 12, NULL);
INSERT INTO public.moon VALUES (16, 'Icy', 'Rhea', 12, NULL);
INSERT INTO public.moon VALUES (17, 'Two-tone', 'Iapetus', 12, NULL);
INSERT INTO public.moon VALUES (18, 'Captured Object', 'Phoebe', 12, NULL);
INSERT INTO public.moon VALUES (19, 'Icy', 'Ariel', 13, NULL);
INSERT INTO public.moon VALUES (20, 'Icy', 'Umbriel', 13, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Gas Giant', 0.50, 2.50000000000000, 'PA-99-N2 b', false, true, NULL, NULL, 2);
INSERT INTO public.planet VALUES (3, 'Giant', 0.02, 23.00000000000000, 'M51-ULS-1b', false, true, NULL, NULL, 3);
INSERT INTO public.planet VALUES (4, NULL, 3.00, 29.00000000000000, 'Sombrero Candiate', false, NULL, NULL, NULL, 4);
INSERT INTO public.planet VALUES (5, 'Hypothetical', 1.50, 17.00000000000000, 'M64-V1 Planet', false, NULL, NULL, NULL, 5);
INSERT INTO public.planet VALUES (6, 'Short-lived Giant', 0.01, 600.00000000000000, 'Hoag''s Planets', false, NULL, NULL, NULL, 6);
INSERT INTO public.planet VALUES (8, 'Terrestrial', 4.50, 0.00000000000800, 'Mercury', false, true, 9, 1, 1);
INSERT INTO public.planet VALUES (9, 'Terrestrial', 4.50, 0.00000000000400, 'Venus', false, true, 8, 2, 1);
INSERT INTO public.planet VALUES (10, 'Terrestrial', 4.54, 0.00000000002400, 'Mars', false, true, 9, 4, 1);
INSERT INTO public.planet VALUES (11, 'Gas Giant', 4.56, 0.00000000006600, 'Jupiter', false, true, 7, 5, 1);
INSERT INTO public.planet VALUES (12, 'Gas Giant', 4.60, 0.00000000013400, 'Saturn', false, true, 10, 6, 1);
INSERT INTO public.planet VALUES (13, 'Ice Giant', 4.50, 0.00000000027200, 'Uranus', false, true, 9, 7, 1);
INSERT INTO public.planet VALUES (14, 'Ice Giant', 4.50, 0.00000000045900, 'Neptune', false, true, 4, 8, 1);
INSERT INTO public.planet VALUES (1, 'Terrestrial', 4.54, 0.00000000000000, 'Earth', true, true, NULL, 3, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Yellow Dwarf', 4.60, 0.00, 'Sun', 1);
INSERT INTO public.star VALUES (2, 'Cepheid Variable', 0.35, 2.54, 'V1', 2);
INSERT INTO public.star VALUES (3, 'Type Ic Supernova', 0.05, 23.50, 'SN 1994I Progenitor', 3);
INSERT INTO public.star VALUES (4, 'X-ray Binary', NULL, 29.30, 'ULX-1 Source', 4);
INSERT INTO public.star VALUES (5, 'Long-period Variable', 3.00, 17.30, 'M64-V1', 5);
INSERT INTO public.star VALUES (6, 'Blue Supergiant', 0.01, 600.00, 'Hoag''s Blue Supergiants', 6);


--
-- Name: comets_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comets_comet_id_seq', 3, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: comet comets_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comets_description_key UNIQUE (description);


--
-- Name: comet comets_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comets_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_description_key UNIQUE (description);


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
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

