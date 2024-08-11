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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(255) NOT NULL,
    first_discovery integer,
    symbolism character varying(255),
    number_of_main_stars integer,
    number_of_stars_with_planets integer,
    brightest_star character varying(120),
    family character varying(120)
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_type character varying(255) NOT NULL,
    galaxy_group character varying(255) NOT NULL,
    distance_from_earth_light_years real NOT NULL,
    discovery_year integer NOT NULL,
    has_active_galactic_nucleaus boolean NOT NULL,
    has_black_hole boolean NOT NULL,
    diameter_light_years integer NOT NULL,
    summary_description text
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
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    physically_visited boolean,
    has_atmosphere boolean,
    orbital_period numeric(7,2),
    orbital_period_unit character varying(40),
    mean_radius_km numeric(8,2),
    mass_kg real,
    mean_orbit_radius integer
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
    name character varying(255) NOT NULL,
    star_id integer NOT NULL,
    mass_in_kg real,
    equatorial_radius_km numeric(7,2),
    moon_count integer,
    distance_from_host_star real,
    is_exoplanet boolean,
    orbital_period_amount numeric(7,2),
    orbital_period_unit character varying(20),
    potentially_habitable boolean
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
    constellation_id integer,
    galaxy_id integer NOT NULL,
    mass_solar_mass numeric(4,2) NOT NULL,
    surface_temp_in_kelvin integer,
    planet_count integer,
    estimated_planet_age character varying(255),
    distance_from_earth integer,
    distance_unit character varying(25),
    is_visible_without_telescope boolean NOT NULL,
    emits_flares boolean NOT NULL,
    name character varying(255) NOT NULL
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Andromeda', NULL, 'The Princess or Chained Woman', 3, 1, 'Alpheratz', 'Perseus');
INSERT INTO public.constellation VALUES (2, 'Apus', 1603, 'The Bird of Paradise', 2, 0, 'Alpha Apodis', 'Hercules');
INSERT INTO public.constellation VALUES (3, 'Aries', NULL, 'The Ram', 3, 0, 'Hamal', 'Zodiac');
INSERT INTO public.constellation VALUES (4, 'Centaurus', NULL, 'The Centaur', 2, 2, 'Alpha Centauri', 'Hercules ');
INSERT INTO public.constellation VALUES (5, 'Cassiopeia', NULL, 'The Queen', 3, 0, 'Schedar', 'Perseus');
INSERT INTO public.constellation VALUES (6, 'Cygnus', NULL, 'The Swan', 3, 2, 'Deneb', NULL);
INSERT INTO public.constellation VALUES (7, 'Aquarius', NULL, 'The Water Bearer', 3, 2, 'Sadalsuud', 'Zodiac');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxy', 'spiral galaxy', 'local group', 2.5e+06, 965, true, true, 220000, 'Although several dozen minor galaxies lie closer to our Milky Way, the Andromeda galaxy is the closest large spiral galaxy to ours. The Andromeda galaxy is the brightest external galaxy visible in our night sky. And, at 2.5 million light-years, it''s the most distant thing we humans can see with the unaided eye. Astronomers sometimes call the Andromeda galaxy by the name Messier 31, or M31. Most Messier objects are star clusters or gas clouds in our Milky Way galaxy. But the Andromeda galaxy is a whole separate galaxy, even bigger than our Milky Way. In a dark sky, you can see that it''s big on the sky as well, a smudge of distant light larger than a full moon.');
INSERT INTO public.galaxy VALUES (2, 'Milky Way Galaxy', 'barred spiral', 'local group', 0, 1610, true, true, 100000, 'The Milky Way is a huge collection of stars, dust and gas. It''s called a spiral galaxy because if you could view it from the top or bottom, it would look like a spinning pinwheel. The Sun is located on one of the spiral arms, about 25,000 light-years away from the center of the galaxy.
');
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 'spiral galaxy', 'local group', 163000, 1519, false, true, 14000, 'The Large Magellanic Cloud (LMC) is a dwarf galaxy and satellite galaxy of the Milky Way. At a distance of around 50 kiloparsecs (163,000 light-years), the LMC is the second- or third-closest galaxy to the Milky Way, after the Sagittarius Dwarf Spheroidal (c. 16 kiloparsecs (52,000 light-years) away) and the possible dwarf irregular galaxy called the Canis Major Overdensity. The Large Magellanic Cloud is about 9.86 kiloparsecs (32,200 light-years) across. It is roughly one-hundredth the mass of the Milky Way and is the fourth-largest galaxy in the Local Group, after the Andromeda Galaxy (M31), the Milky Way, and the Triangulum Galaxy (M33). The LMC is classified as a Magellanic spiral. It contains a stellar bar that is geometrically off-center, suggesting that it was once a barred dwarf spiral galaxy before its spiral arms were disrupted, likely by tidal interactions from the nearby Small Magellanic Cloud (SMC) and the Milky Way''s gravity. The LMC is predicted to merge with the Milky Way in approximately 2.4 billion years. The LMC is visible as a faint cloud from the southern hemisphere of the Earth and from as far north as 20° N. It straddles the constellations Dorado and Mensa and has an apparent length of about 10° to the naked eye, 20 times the Moon''s diameter, from dark sites away from light pollution.');
INSERT INTO public.galaxy VALUES (4, 'Cigar Galaxy (Messier 82)', 'spiral galaxy', 'm81 group', 1.15e+07, 1774, true, true, 40800, 'Messier 82 (also known as NGC 3034, Cigar Galaxy or M82) is a starburst galaxy approximately 12 million light-years away in the constellation Ursa Major. It is the second-largest member of the M81 Group, with the D25 isophotal diameter of 12.52 kiloparsecs (40,800 light-years). It is about five times more luminous than the Milky Way and its central region is about one hundred times more luminous. The starburst activity is thought to have been triggered by interaction with neighboring galaxy M81. As one of the closest starburst galaxies to Earth, M82 is the prototypical example of this galaxy type.');
INSERT INTO public.galaxy VALUES (5, 'Pinwheel galaxy', 'spiral galaxy', 'm101 group', 2.09e+07, 1781, true, true, 170000, 'The Pinwheel Galaxy M101 is a spiral galaxy 170,000 lightyears across, located 25 million lightyears away from Earth in the Ursa Major constellation. The galaxy is about twice the diameter of our own galaxy the Milky Way and is thought to contain about 1 trillion stars. The Pinwheel Galaxy was discovered by Perre Méchain, a colleague of Charles Messier, in 1781, and Messier eventually included it in his famous Messier Catalogue of deep-sky objects. If you would like to observe the Pinwheel Galaxy or photograph it, it is best seen in the northern hemisphere in April and can be observed through a small telescope.');
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 'elliptical galaxy', 'virgo 2', 2.94e+07, 1781, true, true, 50000, 'The Sombrero Galaxy (also known as Messier Object 104, M104 or NGC 4594) is a peculiar galaxy of unclear classificationin the constellation borders of Virgo and Corvus, being about 9.55 megaparsecs (31.1 million light-years)from the Milky Way galaxy. It is a member of the Virgo II Groups, a series of galaxies and galaxy clusters strung out from the southern edge of the Virgo Supercluster. It has an isophotal diameter of approximately 29.09 to 32.32 kiloparsecs (94,900 to 105,000 light-years), making it slightly bigger in size than the Milky Way.');
INSERT INTO public.galaxy VALUES (7, 'NGC 1300', 'barred spiral', 'NGC 1300 group', 6.1e+07, 1835, true, true, 110000, 'NGC 1300 is a barred spiral galaxy located about 65 million light-years away in the constellation Eridanus. The galaxy is about 110,000 light-years across. It is a member of the Eridanus Cluster, a cluster of 200 galaxies, in a subgroup of 2-4 galaxies in the cluster known as the NGC 1300 Group. It was discovered by John Herschel in 1835.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Earth''s Moon', 3, true, false, 27.30, 'days', 1737.40, 7.34e+22, 384399);
INSERT INTO public.moon VALUES (2, 'Io', 5, false, false, 1.77, 'days', 1821.30, 8.93e+22, 421700);
INSERT INTO public.moon VALUES (3, 'Europa', 5, false, false, 3.55, 'days', 1560.80, 4.8e+22, 670900);
INSERT INTO public.moon VALUES (4, 'Ganymede', 5, false, false, 7.15, 'days', 2634.10, 1.48e+23, 1070400);
INSERT INTO public.moon VALUES (5, 'Callisto', 5, false, false, 16.69, 'days', 2410.30, 1.08e+23, 1882700);
INSERT INTO public.moon VALUES (6, 'Miranda', 7, false, false, 1.41, 'days', 235.80, 6.59e+19, 129390);
INSERT INTO public.moon VALUES (7, 'Ariel', 7, false, false, 2.52, 'days', 578.90, 1.35e+21, 190900);
INSERT INTO public.moon VALUES (8, 'Umbriel', 7, false, false, 4.14, 'days', 584.70, 1.27e+21, 265970);
INSERT INTO public.moon VALUES (9, 'Titania', 7, false, false, 8.71, 'days', 788.90, 3.49e+21, 435840);
INSERT INTO public.moon VALUES (10, 'Oberon', 7, false, false, 13.46, 'days', 761.40, 3.01e+21, 582600);
INSERT INTO public.moon VALUES (11, 'Phobos', 4, false, false, 7.65, 'hours', 11.27, 1.08e+16, 9376);
INSERT INTO public.moon VALUES (12, 'Deimos', 4, false, false, 30.35, 'hours', 6.20, 1.48e+15, 23463);
INSERT INTO public.moon VALUES (13, 'Enceladus', 6, false, false, 1.37, 'days', 252.10, 1.08e+20, 238020);
INSERT INTO public.moon VALUES (14, 'Titan', 6, true, true, 15.95, 'days', 2574.70, 1.35e+23, 1221870);
INSERT INTO public.moon VALUES (15, 'Bergelmir', 6, false, false, 1000.00, 'days', 30.00, 2e+16, 19103000);
INSERT INTO public.moon VALUES (16, 'Bestla', 6, false, false, 1000.00, 'days', 30.00, 2e+16, 19049000);
INSERT INTO public.moon VALUES (17, 'Hyperion', 6, false, false, 21.28, 'days', 135.00, 5.6e+18, 1481000);
INSERT INTO public.moon VALUES (18, 'Despina', 8, false, false, 8.00, 'hours', 74.00, 1.8e+18, 52526);
INSERT INTO public.moon VALUES (19, 'Galatea', 8, false, false, 0.43, 'days', 88.00, 2.12e+18, 61953);
INSERT INTO public.moon VALUES (20, 'Halimede', 8, false, false, 1879.08, 'days', 31.00, 2.2e+17, 16631000);
INSERT INTO public.moon VALUES (21, 'Charon', 18, false, false, 6.39, 'days', 606.00, 1.59e+21, 19591);
INSERT INTO public.moon VALUES (22, 'Nix', 18, false, false, 24.86, 'days', 42.00, 4.5e+16, 48694);
INSERT INTO public.moon VALUES (23, 'Hydra', 18, false, false, 38.20, 'days', 51.00, 4.8e+16, 64738);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 3.3e+23, 2439.70, 0, 5.7909228e+07, false, 88.00, 'days', false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 4.87e+24, 6052.00, 0, 1.0820947e+08, false, 224.70, 'days', true);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 5.972e+24, 6378.14, 1, 1.4959826e+08, false, 365.00, 'days', true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 6.4171e+23, 3396.20, 2, 2.2793936e+08, false, 687.00, 'days', true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 1.898e+27, 71492.00, 95, 7.78479e+08, false, 11.86, 'years', false);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 5.683e+26, 58232.00, 146, 1.43e+09, false, 29.45, 'years', false);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 8.68e+25, 25559.00, 28, 2.871e+09, false, 84.02, 'years', false);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 1.024e+26, 24622.00, 16, 4.495e+09, false, 164.80, 'years', false);
INSERT INTO public.planet VALUES (9, 'Teegarden''s star b', 3, 6.93e+24, 6658.14, NULL, 3.87e+06, true, 4.90, 'days', false);
INSERT INTO public.planet VALUES (10, 'Teegarden''s star c', 3, 6.27e+24, 6480.83, NULL, 6.81e+06, true, 11.40, 'days', true);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri c', 4, 4.65e+25, 10907.26, NULL, 2.21e+08, true, 5.27, 'years', false);
INSERT INTO public.planet VALUES (12, 'Proxima Centauri d', 4, 1.56e+24, 4421.96, NULL, 4.32e+06, true, 5.17, 'days', false);
INSERT INTO public.planet VALUES (13, 'Proxima Centauri b', 4, 6.4e+24, 6517.82, NULL, 7.27e+06, true, 11.19, 'days', false);
INSERT INTO public.planet VALUES (14, 'HD 219134 b', 5, 2.55e+25, 9579.97, NULL, 5.54e+06, true, 3.09, 'days', false);
INSERT INTO public.planet VALUES (15, 'HD 219134 c', 5, 2.37e+25, 9025.07, NULL, 9.28e+06, true, 6.76, 'days', false);
INSERT INTO public.planet VALUES (16, 'HD 219134 d', 5, 9.94e+25, 15800.57, NULL, 3.37e+07, true, 46.86, 'days', false);
INSERT INTO public.planet VALUES (17, 'HD 219134 e', 5, 4.23e+26, 64903.31, NULL, 3.83e+08, true, 5.04, 'years', false);
INSERT INTO public.planet VALUES (18, 'Pluto', 1, 1.3e+22, 1188.00, 5, 5.91e+09, false, 274.94, 'years', false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, NULL, 2, 1.00, 5778, 8, '4.5 billion years', 149000000, 'km', true, true, 'Sun');
INSERT INTO public.star VALUES (2, 1, 2, 1.30, 6210, 4, '3.1 billion years', 44, 'light years', true, false, 'Titawin(Upsilon Andromedae)');
INSERT INTO public.star VALUES (3, 3, 2, 0.09, 3500, 4, '8 bilion years', 13, 'light years', false, true, 'Teegarden''s Star');
INSERT INTO public.star VALUES (4, 4, 2, 0.12, 3040, 3, '4.85 million years', 4, 'light years', false, true, 'Proxima Centauri');
INSERT INTO public.star VALUES (5, 5, 2, 0.81, 4699, 7, '12.5 billion years', 21, 'light years', false, true, 'HR 8832');
INSERT INTO public.star VALUES (6, 6, 2, 0.42, 3586, 2, '3 billion years', 26, 'light years', false, false, 'Gliese 806');
INSERT INTO public.star VALUES (7, 7, 2, 0.35, 3201, 4, '9.9 billion years', 15, 'light years', false, true, 'Gliese 876');


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 7, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 18, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: star fkey_constellation_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fkey_constellation_id FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id) ON DELETE CASCADE;


--
-- Name: star fkey_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fkey_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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
-- PostgreSQL database dump complete
--
