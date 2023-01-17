--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(30) NOT NULL,
    description text,
    distance_from_earth_in_lightyears text,
    size_x10exp10_km integer NOT NULL,
    human_exploration boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_pkey_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_pkey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_pkey_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_pkey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_pkey_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: human_exploration; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.human_exploration (
    name character varying(30) NOT NULL,
    explored_celestial_bodies text,
    year_of_exploration integer,
    human_exploration_id integer NOT NULL,
    moon_id integer
);


ALTER TABLE public.human_exploration OWNER TO freecodecamp;

--
-- Name: human_exploration_human_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.human_exploration_human_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.human_exploration_human_id_seq OWNER TO freecodecamp;

--
-- Name: human_exploration_human_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.human_exploration_human_id_seq OWNED BY public.human_exploration.human_exploration_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(30) NOT NULL,
    distance_from_their_planets integer,
    description text,
    diameter_size_in_km integer,
    human_exploration boolean,
    planet_id integer,
    moon_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_og_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_og_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_og_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_og_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_og_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth text,
    description text,
    diameter_size_km integer,
    human_exploration boolean,
    oxygen_percentage numeric(5,2),
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_pkey_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_pkey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_pkey_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_pkey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_pkey_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth_lightyears text,
    description text,
    diameter_size_in_km integer,
    human_exploration boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_pkey_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_pkey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_pkey_seq OWNER TO freecodecamp;

--
-- Name: star_star_pkey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_pkey_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_pkey_seq'::regclass);


--
-- Name: human_exploration human_exploration_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.human_exploration ALTER COLUMN human_exploration_id SET DEFAULT nextval('public.human_exploration_human_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_og_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_pkey_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_pkey_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Who picture the milky way?', 'We are here', 50000000, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'visible on the naked eye from earth', '2.5 Million', 104070000, false);
INSERT INTO public.galaxy VALUES (3, 'Whirlpool', 'also known as Messier 51a', '31 Million', 28382000, false);
INSERT INTO public.galaxy VALUES (4, 'Canis Major Dwarf', 'small galaxy contains a high percentage of red giants', '25000', 23600000, false);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 'it looks like a sombrero', '29.35 Million', 23652000, false);
INSERT INTO public.galaxy VALUES (5, 'Cygnus A.', 'Strongest radio source', '600 Million', 54000000, false);


--
-- Data for Name: human_exploration; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.human_exploration VALUES ('Yuri Gagarin', 'Outer Space', 1961, 2, NULL);
INSERT INTO public.human_exploration VALUES ('Alan Shepard', 'Outer Space', 1961, 3, NULL);
INSERT INTO public.human_exploration VALUES ('Alexei Leonov', 'Moon', 1965, 4, 1);
INSERT INTO public.human_exploration VALUES ('Neil Armstrong', 'Moon', 1969, 1, 1);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon', 384400, 'My favorite Moon', 3475, true, 3, 1);
INSERT INTO public.moon VALUES ('Phobos', 9378, 'largest of Mars two moons', 3432, false, 4, 2);
INSERT INTO public.moon VALUES ('Deimos', 23460, 'smaller of Mars two Moons', 1934, false, 4, 3);
INSERT INTO public.moon VALUES ('Io', 421700, 'Volcanically active body in the solar system', 3642, false, 5, 4);
INSERT INTO public.moon VALUES ('Europa', 671100, 'Believed to have a subsurface ocean', 3122, false, 5, 5);
INSERT INTO public.moon VALUES ('Ganymede', 1070400, 'Largest moon in the solar system', 5268, false, 5, 6);
INSERT INTO public.moon VALUES ('Callisto', 1883700, 'Heavily Cratered', 4821, false, 5, 7);
INSERT INTO public.moon VALUES ('Mimas', 185520, 'Formed from a comet impact', 369, false, 6, 8);
INSERT INTO public.moon VALUES ('Enceladus', 238020, 'Small, icy moon', 500, false, 6, 9);
INSERT INTO public.moon VALUES ('Tethys', 294660, 'Heavily cratered', 1060, false, 6, 10);
INSERT INTO public.moon VALUES ('Dione', 377400, 'Icy moon with a bright, wispy atmosphere', 1122, false, 6, 11);
INSERT INTO public.moon VALUES ('Rhea', 527040, 'Icy moon with a thin atmosphere', 1527, false, 6, 12);
INSERT INTO public.moon VALUES ('Titan', 1221850, 'Largest moon in Saturn', 5150, false, 6, 13);
INSERT INTO public.moon VALUES ('Iapetus', 3560820, 'Large, Prominent equatorial ridge', 1470, false, 6, 14);
INSERT INTO public.moon VALUES ('Phoebe', 12952000, 'Thought to be a captured asteroid', 220, false, 6, 15);
INSERT INTO public.moon VALUES ('Miranda', 129330, 'Small, irregularly shape', 480, false, 7, 16);
INSERT INTO public.moon VALUES ('Ariel', 191020, 'Icy moon with a bright, icy atmosphere', 1158, false, 7, 17);
INSERT INTO public.moon VALUES ('Umbriel', 266000, 'Icy moon with a dark surface', 1169, false, 7, 18);
INSERT INTO public.moon VALUES ('Titania', 436820, 'Largest of Uranus moon', 1578, false, 7, 19);
INSERT INTO public.moon VALUES ('Triton', 354800, 'Icy moon with a retrograde orbit', 2700, false, 8, 20);
INSERT INTO public.moon VALUES ('Proteus', 117600, 'Large, heavily cratered, icy moon', 420, false, 8, 21);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', '104.08km', 'Nearest planet from the sun', 440, false, 42.00, 1);
INSERT INTO public.planet VALUES (2, 'Venus', '235.04 km', 'Ohh my venus', 6051, false, 21.00, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'We are here', 'My favorite planet', 6371, true, 21.00, 1);
INSERT INTO public.planet VALUES (4, 'Mars', '225 Million', 'rocky\, desert planet', 6792, false, 13.00, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', '778 Million', 'Gas giant', 139822, false, 0.01, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', '1.4 Billion', 'Ring system', 116460, false, 0.01, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', '2.9 Billion', 'Blue-green Oxygen', 50724, false, 0.01, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', '4.5 Billion', 'Blue atmosphere', 49244, false, 0.01, 1);
INSERT INTO public.planet VALUES (9, 'Kepler-438b', '640 light years', 'rocky exoplanet', 14271, false, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'Kepler-438c', '640 light years', 'rocky exoplanet', 14398, false, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'Kepler-438g', '640 light years', 'rocky exoplanet', 15545, false, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'Kepler-438i', '640 light years', 'rocky exoplanet', 16309, false, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', '1.5781e-5', 'Earth favorite star', 696340, false, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', '4.22', 'red dwarf star', 7000, false, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', '4.37', 'G-type main-sequence star', 1220000, false, 1);
INSERT INTO public.star VALUES (4, 'Alpha Centauri B', '4.37', 'K-type main-sequence star', 870000, false, 1);
INSERT INTO public.star VALUES (5, 'Bardnard Star', '6', 'Red dwarf star', 2500, false, 1);
INSERT INTO public.star VALUES (6, 'Wolf 359', '7.78', 'Red dwarf star', 2500, false, 1);


--
-- Name: galaxy_galaxy_pkey_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_pkey_seq', 6, true);


--
-- Name: human_exploration_human_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.human_exploration_human_id_seq', 4, true);


--
-- Name: moon_og_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_og_moon_id_seq', 21, true);


--
-- Name: planet_planet_pkey_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_pkey_seq', 12, true);


--
-- Name: star_star_pkey_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_pkey_seq', 6, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: human_exploration human_exploration_human_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.human_exploration
    ADD CONSTRAINT human_exploration_human_id_key UNIQUE (human_exploration_id);


--
-- Name: human_exploration human_exploration_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.human_exploration
    ADD CONSTRAINT human_exploration_pkey PRIMARY KEY (human_exploration_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_og_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_og_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: human_exploration human_exploration_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.human_exploration
    ADD CONSTRAINT human_exploration_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


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

