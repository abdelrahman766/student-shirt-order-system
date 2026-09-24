--
-- PostgreSQL database dump
--

\restrict FcqdQlzWNivjqp3ZuZ93SDHsjScjmvuZJVddfoYbXO5wOB6M7jkd5Nf2o0fvVfW

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

-- Started on 2026-09-24 21:01:46

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 224 (class 1259 OID 18892)
-- Name: academic_years; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.academic_years (
    id integer NOT NULL,
    year_name character varying(20) NOT NULL
);


ALTER TABLE public.academic_years OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 18891)
-- Name: academic_years_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.academic_years_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.academic_years_id_seq OWNER TO postgres;

--
-- TOC entry 4954 (class 0 OID 0)
-- Dependencies: 223
-- Name: academic_years_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.academic_years_id_seq OWNED BY public.academic_years.id;


--
-- TOC entry 226 (class 1259 OID 18903)
-- Name: shirt_orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shirt_orders (
    id integer NOT NULL,
    student_id integer NOT NULL,
    size character varying(3) NOT NULL,
    shirt_number integer NOT NULL,
    receipt_number character varying(100) NOT NULL,
    height_cm numeric(5,2) NOT NULL,
    weight_kg numeric(5,2) NOT NULL,
    address text NOT NULL,
    school character varying(200) NOT NULL,
    academic_year_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT shirt_orders_height_cm_check CHECK (((height_cm > (0)::numeric) AND (height_cm <= (300)::numeric))),
    CONSTRAINT shirt_orders_shirt_number_check CHECK (((shirt_number >= 0) AND (shirt_number <= 999))),
    CONSTRAINT shirt_orders_size_check CHECK (((size)::text = ANY ((ARRAY['S'::character varying, 'M'::character varying, 'L'::character varying, 'XL'::character varying, '2XL'::character varying])::text[]))),
    CONSTRAINT shirt_orders_weight_kg_check CHECK (((weight_kg > (0)::numeric) AND (weight_kg <= (500)::numeric)))
);


ALTER TABLE public.shirt_orders OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 18902)
-- Name: shirt_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shirt_orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.shirt_orders_id_seq OWNER TO postgres;

--
-- TOC entry 4955 (class 0 OID 0)
-- Dependencies: 225
-- Name: shirt_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shirt_orders_id_seq OWNED BY public.shirt_orders.id;


--
-- TOC entry 222 (class 1259 OID 18877)
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    id integer NOT NULL,
    full_name character varying(200) NOT NULL,
    team_id integer NOT NULL
);


ALTER TABLE public.students OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 18876)
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.students_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.students_id_seq OWNER TO postgres;

--
-- TOC entry 4956 (class 0 OID 0)
-- Dependencies: 221
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.students_id_seq OWNED BY public.students.id;


--
-- TOC entry 220 (class 1259 OID 18866)
-- Name: teams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teams (
    id integer NOT NULL,
    team_name character varying(100) NOT NULL
);


ALTER TABLE public.teams OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 18865)
-- Name: teams_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teams_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.teams_id_seq OWNER TO postgres;

--
-- TOC entry 4957 (class 0 OID 0)
-- Dependencies: 219
-- Name: teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teams_id_seq OWNED BY public.teams.id;


--
-- TOC entry 4772 (class 2604 OID 18895)
-- Name: academic_years id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academic_years ALTER COLUMN id SET DEFAULT nextval('public.academic_years_id_seq'::regclass);


--
-- TOC entry 4773 (class 2604 OID 18906)
-- Name: shirt_orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shirt_orders ALTER COLUMN id SET DEFAULT nextval('public.shirt_orders_id_seq'::regclass);


--
-- TOC entry 4771 (class 2604 OID 18880)
-- Name: students id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students ALTER COLUMN id SET DEFAULT nextval('public.students_id_seq'::regclass);


--
-- TOC entry 4770 (class 2604 OID 18869)
-- Name: teams id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams ALTER COLUMN id SET DEFAULT nextval('public.teams_id_seq'::regclass);


--
-- TOC entry 4946 (class 0 OID 18892)
-- Dependencies: 224
-- Data for Name: academic_years; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.academic_years (id, year_name) FROM stdin;
1	1 ابتدائي
2	2 ابتدائى
3	3 ابتدائى
4	4 ابتدائى
5	5 ابتدائى
6	6 ابتدائى
7	1 اعدادى
8	2 اعدادى
9	3 اعدادى
10	1 ثانوي
11	2 ثانوى
12	3 ثانوى
\.


--
-- TOC entry 4948 (class 0 OID 18903)
-- Dependencies: 226
-- Data for Name: shirt_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shirt_orders (id, student_id, size, shirt_number, receipt_number, height_cm, weight_kg, address, school, academic_year_id, created_at) FROM stdin;
\.


--
-- TOC entry 4944 (class 0 OID 18877)
-- Dependencies: 222
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students (id, full_name, team_id) FROM stdin;
25	Ahmed Mohamed Ali Hassan	8
26	Omar Khaled Mohamed Ali	8
27	Mahmoud Samir Ibrahim Hassan	8
28	Youssef Ahmed Mahmoud Ali	9
29	Mostafa Mohamed Hassan Ali	9
30	Abdelrahman Samir Ahmed	9
31	Karim Khaled Mohamed	10
32	Amr Ahmed Ibrahim	10
33	Mahmoud Ali Hassan	10
34	Hassan Ahmed Mohamed	11
35	Mohamed Khaled Ibrahim	11
36	Omar Samir Hassan	11
37	Ali Mohamed Ahmed	12
38	Yassin Khaled Mahmoud	12
39	Mahmoud Ahmed Hassan	12
40	Abdelrahman Mohamed Ali	13
41	Khaled Samir Ibrahim	13
42	Ahmed Hassan Mahmoud	13
43	Mostafa Ahmed Mohamed	14
44	Omar Mahmoud Ali	14
45	Youssef Samir Hassan	14
46	Karim Mohamed Ibrahim	15
47	Amr Khaled Ahmed	15
48	Mahmoud Youssef Ali	15
\.


--
-- TOC entry 4942 (class 0 OID 18866)
-- Dependencies: 220
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teams (id, team_name) FROM stdin;
8	12 اولاد
9	13 اولاد
10	14 اولاد
11	16-أ-اولاد
12	16-ب-اولاد
13	18-أ-اولاد
14	18-ب-اولاد
15	20 اولاد
\.


--
-- TOC entry 4958 (class 0 OID 0)
-- Dependencies: 223
-- Name: academic_years_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.academic_years_id_seq', 12, true);


--
-- TOC entry 4959 (class 0 OID 0)
-- Dependencies: 225
-- Name: shirt_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shirt_orders_id_seq', 2, true);


--
-- TOC entry 4960 (class 0 OID 0)
-- Dependencies: 221
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.students_id_seq', 48, true);


--
-- TOC entry 4961 (class 0 OID 0)
-- Dependencies: 219
-- Name: teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teams_id_seq', 15, true);


--
-- TOC entry 4786 (class 2606 OID 18899)
-- Name: academic_years academic_years_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academic_years
    ADD CONSTRAINT academic_years_pkey PRIMARY KEY (id);


--
-- TOC entry 4788 (class 2606 OID 18901)
-- Name: academic_years academic_years_year_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academic_years
    ADD CONSTRAINT academic_years_year_name_key UNIQUE (year_name);


--
-- TOC entry 4790 (class 2606 OID 18925)
-- Name: shirt_orders shirt_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shirt_orders
    ADD CONSTRAINT shirt_orders_pkey PRIMARY KEY (id);


--
-- TOC entry 4784 (class 2606 OID 18885)
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- TOC entry 4780 (class 2606 OID 18873)
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);


--
-- TOC entry 4782 (class 2606 OID 18875)
-- Name: teams teams_team_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_team_name_key UNIQUE (team_name);


--
-- TOC entry 4792 (class 2606 OID 18931)
-- Name: shirt_orders shirt_orders_academic_year_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shirt_orders
    ADD CONSTRAINT shirt_orders_academic_year_id_fkey FOREIGN KEY (academic_year_id) REFERENCES public.academic_years(id);


--
-- TOC entry 4793 (class 2606 OID 18926)
-- Name: shirt_orders shirt_orders_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shirt_orders
    ADD CONSTRAINT shirt_orders_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(id) ON DELETE CASCADE;


--
-- TOC entry 4791 (class 2606 OID 18886)
-- Name: students students_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(id) ON DELETE CASCADE;


-- Completed on 2026-09-24 21:01:48

--
-- PostgreSQL database dump complete
--

\unrestrict FcqdQlzWNivjqp3ZuZ93SDHsjScjmvuZJVddfoYbXO5wOB6M7jkd5Nf2o0fvVfW

