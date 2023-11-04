--
-- PostgreSQL database dump
--

-- Dumped from database version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)

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
-- Name: animals; Type: TABLE; Schema: public; Owner: nickperry12
--

CREATE TABLE public.animals (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    binomial_name character varying(100) NOT NULL,
    max_weight numeric(10,5),
    max_age integer,
    conversion_status character(2),
    class character varying(100),
    phylum character varying(100),
    kingdom character varying(100)
);


ALTER TABLE public.animals OWNER TO nickperry12;

--
-- Name: animals_id_seq; Type: SEQUENCE; Schema: public; Owner: nickperry12
--

CREATE SEQUENCE public.animals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.animals_id_seq OWNER TO nickperry12;

--
-- Name: animals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nickperry12
--

ALTER SEQUENCE public.animals_id_seq OWNED BY public.animals.id;


--
-- Name: countries; Type: TABLE; Schema: public; Owner: nickperry12
--

CREATE TABLE public.countries (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    capital character varying(50) NOT NULL,
    population integer,
    continent character varying(50)
);


ALTER TABLE public.countries OWNER TO nickperry12;

--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: nickperry12
--

CREATE SEQUENCE public.countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.countries_id_seq OWNER TO nickperry12;

--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nickperry12
--

ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;


--
-- Name: singers; Type: TABLE; Schema: public; Owner: nickperry12
--

CREATE TABLE public.singers (
    id integer NOT NULL,
    first_name character varying(80) NOT NULL,
    occupation character varying(150),
    date_of_birth date NOT NULL,
    deceased boolean DEFAULT false NOT NULL,
    last_name character varying(100)
);


ALTER TABLE public.singers OWNER TO nickperry12;

--
-- Name: famous_people_id_seq; Type: SEQUENCE; Schema: public; Owner: nickperry12
--

CREATE SEQUENCE public.famous_people_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.famous_people_id_seq OWNER TO nickperry12;

--
-- Name: famous_people_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nickperry12
--

ALTER SEQUENCE public.famous_people_id_seq OWNED BY public.singers.id;


--
-- Name: animals id; Type: DEFAULT; Schema: public; Owner: nickperry12
--

ALTER TABLE ONLY public.animals ALTER COLUMN id SET DEFAULT nextval('public.animals_id_seq'::regclass);


--
-- Name: countries id; Type: DEFAULT; Schema: public; Owner: nickperry12
--

ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);


--
-- Name: singers id; Type: DEFAULT; Schema: public; Owner: nickperry12
--

ALTER TABLE ONLY public.singers ALTER COLUMN id SET DEFAULT nextval('public.famous_people_id_seq'::regclass);


--
-- Data for Name: animals; Type: TABLE DATA; Schema: public; Owner: nickperry12
--

COPY public.animals (id, name, binomial_name, max_weight, max_age, conversion_status, class, phylum, kingdom) FROM stdin;
1	Dove	Columbidae Columbiformes	2.00000	15	LC	Aves	Chordata	Animalia
2	Golden Eagle	Aquila Chrysaetos	6.35000	24	LC	Aves	Chordata	Animalia
3	Peregrine Falcon	Falco Peregrinus	1.50000	15	LC	Aves	Chordata	Animalia
4	Pigeon	Columbidae Columbiformes	2.00000	15	LC	Aves	Chordata	Animalia
5	Kakapo	Strigops habroptila	4.00000	60	CR	Aves	Chordata	Animalia
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: nickperry12
--

COPY public.countries (id, name, capital, population, continent) FROM stdin;
\.


--
-- Data for Name: singers; Type: TABLE DATA; Schema: public; Owner: nickperry12
--

COPY public.singers (id, first_name, occupation, date_of_birth, deceased, last_name) FROM stdin;
1	Bruce	Singer/Songwriter	1949-09-23	f	Springsteen
3	Frank	Singer/Actor	1915-12-12	t	Sinatra
5	Madonna	Singer, Actress	1958-08-16	f	
6	Prince	Singer, Songwriter, Musician, Actor	1958-06-07	t	
7	Elvis	Singer/Musician/Actor	1935-01-08	t	Presley
\.


--
-- Name: animals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nickperry12
--

SELECT pg_catalog.setval('public.animals_id_seq', 5, true);


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nickperry12
--

SELECT pg_catalog.setval('public.countries_id_seq', 4, true);


--
-- Name: famous_people_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nickperry12
--

SELECT pg_catalog.setval('public.famous_people_id_seq', 7, true);


--
-- Name: countries countries_name_key; Type: CONSTRAINT; Schema: public; Owner: nickperry12
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_name_key UNIQUE (name);


--
-- PostgreSQL database dump complete
--

