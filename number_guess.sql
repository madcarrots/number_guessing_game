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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: records; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.records (
    username character varying(22) NOT NULL,
    number_of_guesses integer,
    secret_number integer,
    games_played integer,
    best_game integer
);


ALTER TABLE public.records OWNER TO freecodecamp;

--
-- Data for Name: records; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.records VALUES ('USER_1777550456181', 0, 436, 2, 324);
INSERT INTO public.records VALUES ('USER_1777550456182', 0, 80, 5, 81);
INSERT INTO public.records VALUES ('USER_1777550552568', 0, 186, 1, 187);
INSERT INTO public.records VALUES ('USER_1777550552567', 0, 830, 1, 831);
INSERT INTO public.records VALUES ('USER_1777551265061', 0, 471, 2, 472);
INSERT INTO public.records VALUES ('USER_1777550980142', 0, 423, 2, 424);
INSERT INTO public.records VALUES ('USER_1777551265062', 0, 159, 5, 160);
INSERT INTO public.records VALUES ('USER_1777550980143', 0, 460, 5, 461);
INSERT INTO public.records VALUES ('USER_1777551949228', 0, 939, 2, 675);
INSERT INTO public.records VALUES ('USER_1777551008676', 0, 745, 2, 304);
INSERT INTO public.records VALUES ('USER_1777551293933', 0, 294, 2, 295);
INSERT INTO public.records VALUES ('USER_1777551008677', 0, 388, 5, 19);
INSERT INTO public.records VALUES ('USER_1777551949229', 0, 63, 5, 9);
INSERT INTO public.records VALUES ('USER_1777551293934', 0, 110, 5, 41);
INSERT INTO public.records VALUES ('USER_1777551023207', 0, 540, 2, 17);
INSERT INTO public.records VALUES ('USER_1777551023208', 0, 263, 5, 25);
INSERT INTO public.records VALUES ('USER_1777551038605', 0, 573, 2, 574);
INSERT INTO public.records VALUES ('USER_1777551301575', 0, 118, 2, 119);
INSERT INTO public.records VALUES ('USER_1777551038606', 0, 88, 5, 89);
INSERT INTO public.records VALUES ('USER_1777552346074', 0, 27, 2, 28);
INSERT INTO public.records VALUES ('USER_1777551301576', 0, 753, 5, 108);
INSERT INTO public.records VALUES ('USER_1777551044083', 0, 2, 2, 3);
INSERT INTO public.records VALUES ('USER_1777551044084', 0, 898, 5, 98);
INSERT INTO public.records VALUES ('USER_1777552346075', 0, 924, 5, 35);
INSERT INTO public.records VALUES ('USER_1777551310798', 0, 547, 2, 548);
INSERT INTO public.records VALUES ('USER_1777551129395', 0, 895, 2, 201);
INSERT INTO public.records VALUES ('TOM', 0, 185, 3, 7);
INSERT INTO public.records VALUES ('USER_1777551129396', 0, 124, 5, 125);
INSERT INTO public.records VALUES ('USER_1777551310799', 0, 643, 5, 30);
INSERT INTO public.records VALUES ('USER_1777551161193', 0, 721, 2, 722);
INSERT INTO public.records VALUES ('USER_1777551161194', 0, 399, 5, 58);
INSERT INTO public.records VALUES ('USER_1777551513626', 0, 123, 2, 124);
INSERT INTO public.records VALUES ('USER_1777551513627', 0, 101, 5, 4);
INSERT INTO public.records VALUES ('USER_1777552871541', 0, 524, 2, 525);
INSERT INTO public.records VALUES ('USER_1777551551145', 0, 754, 2, 435);
INSERT INTO public.records VALUES ('USER_1777552871542', 0, 61, 5, 62);
INSERT INTO public.records VALUES ('USER_1777551551146', 0, 885, 5, 349);
INSERT INTO public.records VALUES ('USER_1777551571012', 0, 974, 2, 288);
INSERT INTO public.records VALUES ('USER_1777551571013', 0, 484, 5, 315);
INSERT INTO public.records VALUES ('USER_1777551739607', 0, 650, 2, 54);
INSERT INTO public.records VALUES ('USER_1777551739608', 0, 248, 5, 140);


--
-- Name: records records_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.records
    ADD CONSTRAINT records_pkey PRIMARY KEY (username);


--
-- PostgreSQL database dump complete
--

