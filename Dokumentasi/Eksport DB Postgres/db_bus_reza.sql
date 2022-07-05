--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

-- Started on 2022-07-05 22:31:53

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
-- TOC entry 226 (class 1259 OID 16685)
-- Name: flyway_schema_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.flyway_schema_history (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


ALTER TABLE public.flyway_schema_history OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16556)
-- Name: tb_agency; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_agency (
    id bigint NOT NULL,
    code character varying(255),
    details character varying(255),
    name character varying(255),
    owner_user_id bigint
);


ALTER TABLE public.tb_agency OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16555)
-- Name: tb_agency_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_agency_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_agency_id_seq OWNER TO postgres;

--
-- TOC entry 3416 (class 0 OID 0)
-- Dependencies: 209
-- Name: tb_agency_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_agency_id_seq OWNED BY public.tb_agency.id;


--
-- TOC entry 212 (class 1259 OID 16565)
-- Name: tb_bus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_bus (
    id bigint NOT NULL,
    capacity integer,
    code character varying(255),
    make character varying(255),
    agency_id bigint
);


ALTER TABLE public.tb_bus OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16564)
-- Name: tb_bus_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_bus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_bus_id_seq OWNER TO postgres;

--
-- TOC entry 3417 (class 0 OID 0)
-- Dependencies: 211
-- Name: tb_bus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_bus_id_seq OWNED BY public.tb_bus.id;


--
-- TOC entry 214 (class 1259 OID 16574)
-- Name: tb_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_role (
    id bigint NOT NULL,
    name character varying(20)
);


ALTER TABLE public.tb_role OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16573)
-- Name: tb_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_role_id_seq OWNER TO postgres;

--
-- TOC entry 3418 (class 0 OID 0)
-- Dependencies: 213
-- Name: tb_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_role_id_seq OWNED BY public.tb_role.id;


--
-- TOC entry 216 (class 1259 OID 16581)
-- Name: tb_stop; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_stop (
    id bigint NOT NULL,
    code character varying(255),
    detail character varying(255),
    name character varying(255)
);


ALTER TABLE public.tb_stop OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16580)
-- Name: tb_stop_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_stop_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_stop_id_seq OWNER TO postgres;

--
-- TOC entry 3419 (class 0 OID 0)
-- Dependencies: 215
-- Name: tb_stop_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_stop_id_seq OWNED BY public.tb_stop.id;


--
-- TOC entry 218 (class 1259 OID 16590)
-- Name: tb_ticket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_ticket (
    id bigint NOT NULL,
    cancellable boolean,
    journey_date character varying(255),
    seat_number integer,
    user_id bigint,
    trip_schedule_id bigint
);


ALTER TABLE public.tb_ticket OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16589)
-- Name: tb_ticket_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_ticket_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_ticket_id_seq OWNER TO postgres;

--
-- TOC entry 3420 (class 0 OID 0)
-- Dependencies: 217
-- Name: tb_ticket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_ticket_id_seq OWNED BY public.tb_ticket.id;


--
-- TOC entry 220 (class 1259 OID 16597)
-- Name: tb_trip; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_trip (
    id bigint NOT NULL,
    fare integer NOT NULL,
    journey_time integer NOT NULL,
    agency_id bigint,
    bus_id bigint,
    dest_stop_id bigint,
    source_stop_id bigint
);


ALTER TABLE public.tb_trip OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16596)
-- Name: tb_trip_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_trip_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_trip_id_seq OWNER TO postgres;

--
-- TOC entry 3421 (class 0 OID 0)
-- Dependencies: 219
-- Name: tb_trip_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_trip_id_seq OWNED BY public.tb_trip.id;


--
-- TOC entry 222 (class 1259 OID 16604)
-- Name: tb_trip_schedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_trip_schedule (
    id bigint NOT NULL,
    available_seats integer NOT NULL,
    trip_date character varying(255),
    trip_id bigint
);


ALTER TABLE public.tb_trip_schedule OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16603)
-- Name: tb_trip_schedule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_trip_schedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_trip_schedule_id_seq OWNER TO postgres;

--
-- TOC entry 3422 (class 0 OID 0)
-- Dependencies: 221
-- Name: tb_trip_schedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_trip_schedule_id_seq OWNED BY public.tb_trip_schedule.id;


--
-- TOC entry 224 (class 1259 OID 16611)
-- Name: tb_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_user (
    id bigint NOT NULL,
    email character varying(50),
    first_name character varying(120),
    last_name character varying(120),
    mobile_number character varying(120),
    password character varying(120),
    username character varying(50)
);


ALTER TABLE public.tb_user OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16610)
-- Name: tb_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_user_id_seq OWNER TO postgres;

--
-- TOC entry 3423 (class 0 OID 0)
-- Dependencies: 223
-- Name: tb_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_user_id_seq OWNED BY public.tb_user.id;


--
-- TOC entry 225 (class 1259 OID 16619)
-- Name: tb_user_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_user_roles (
    user_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE public.tb_user_roles OWNER TO postgres;

--
-- TOC entry 3207 (class 2604 OID 16559)
-- Name: tb_agency id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_agency ALTER COLUMN id SET DEFAULT nextval('public.tb_agency_id_seq'::regclass);


--
-- TOC entry 3208 (class 2604 OID 16568)
-- Name: tb_bus id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_bus ALTER COLUMN id SET DEFAULT nextval('public.tb_bus_id_seq'::regclass);


--
-- TOC entry 3209 (class 2604 OID 16577)
-- Name: tb_role id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_role ALTER COLUMN id SET DEFAULT nextval('public.tb_role_id_seq'::regclass);


--
-- TOC entry 3210 (class 2604 OID 16584)
-- Name: tb_stop id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_stop ALTER COLUMN id SET DEFAULT nextval('public.tb_stop_id_seq'::regclass);


--
-- TOC entry 3211 (class 2604 OID 16593)
-- Name: tb_ticket id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_ticket ALTER COLUMN id SET DEFAULT nextval('public.tb_ticket_id_seq'::regclass);


--
-- TOC entry 3212 (class 2604 OID 16600)
-- Name: tb_trip id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_trip ALTER COLUMN id SET DEFAULT nextval('public.tb_trip_id_seq'::regclass);


--
-- TOC entry 3213 (class 2604 OID 16607)
-- Name: tb_trip_schedule id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_trip_schedule ALTER COLUMN id SET DEFAULT nextval('public.tb_trip_schedule_id_seq'::regclass);


--
-- TOC entry 3214 (class 2604 OID 16614)
-- Name: tb_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_user ALTER COLUMN id SET DEFAULT nextval('public.tb_user_id_seq'::regclass);


--
-- TOC entry 3410 (class 0 OID 16685)
-- Dependencies: 226
-- Data for Name: flyway_schema_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
1	1	<< Flyway Baseline >>	BASELINE	<< Flyway Baseline >>	\N	null	2022-07-05 08:53:18.374724	0	t
\.


--
-- TOC entry 3394 (class 0 OID 16556)
-- Dependencies: 210
-- Data for Name: tb_agency; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_agency (id, code, details, name, owner_user_id) FROM stdin;
\.


--
-- TOC entry 3396 (class 0 OID 16565)
-- Dependencies: 212
-- Data for Name: tb_bus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_bus (id, capacity, code, make, agency_id) FROM stdin;
\.


--
-- TOC entry 3398 (class 0 OID 16574)
-- Dependencies: 214
-- Data for Name: tb_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_role (id, name) FROM stdin;
\.


--
-- TOC entry 3400 (class 0 OID 16581)
-- Dependencies: 216
-- Data for Name: tb_stop; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_stop (id, code, detail, name) FROM stdin;
\.


--
-- TOC entry 3402 (class 0 OID 16590)
-- Dependencies: 218
-- Data for Name: tb_ticket; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_ticket (id, cancellable, journey_date, seat_number, user_id, trip_schedule_id) FROM stdin;
\.


--
-- TOC entry 3404 (class 0 OID 16597)
-- Dependencies: 220
-- Data for Name: tb_trip; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_trip (id, fare, journey_time, agency_id, bus_id, dest_stop_id, source_stop_id) FROM stdin;
\.


--
-- TOC entry 3406 (class 0 OID 16604)
-- Dependencies: 222
-- Data for Name: tb_trip_schedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_trip_schedule (id, available_seats, trip_date, trip_id) FROM stdin;
\.


--
-- TOC entry 3408 (class 0 OID 16611)
-- Dependencies: 224
-- Data for Name: tb_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_user (id, email, first_name, last_name, mobile_number, password, username) FROM stdin;
1	admin@admin.com	admin	admin	82233445566	admin	admin
\.


--
-- TOC entry 3409 (class 0 OID 16619)
-- Dependencies: 225
-- Data for Name: tb_user_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_user_roles (user_id, role_id) FROM stdin;
\.


--
-- TOC entry 3424 (class 0 OID 0)
-- Dependencies: 209
-- Name: tb_agency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_agency_id_seq', 1, false);


--
-- TOC entry 3425 (class 0 OID 0)
-- Dependencies: 211
-- Name: tb_bus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_bus_id_seq', 1, false);


--
-- TOC entry 3426 (class 0 OID 0)
-- Dependencies: 213
-- Name: tb_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_role_id_seq', 1, false);


--
-- TOC entry 3427 (class 0 OID 0)
-- Dependencies: 215
-- Name: tb_stop_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_stop_id_seq', 1, false);


--
-- TOC entry 3428 (class 0 OID 0)
-- Dependencies: 217
-- Name: tb_ticket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_ticket_id_seq', 1, false);


--
-- TOC entry 3429 (class 0 OID 0)
-- Dependencies: 219
-- Name: tb_trip_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_trip_id_seq', 1, false);


--
-- TOC entry 3430 (class 0 OID 0)
-- Dependencies: 221
-- Name: tb_trip_schedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_trip_schedule_id_seq', 1, false);


--
-- TOC entry 3431 (class 0 OID 0)
-- Dependencies: 223
-- Name: tb_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_user_id_seq', 1, false);


--
-- TOC entry 3241 (class 2606 OID 16692)
-- Name: flyway_schema_history flyway_schema_history_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);


--
-- TOC entry 3217 (class 2606 OID 16563)
-- Name: tb_agency tb_agency_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_agency
    ADD CONSTRAINT tb_agency_pkey PRIMARY KEY (id);


--
-- TOC entry 3219 (class 2606 OID 16572)
-- Name: tb_bus tb_bus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_bus
    ADD CONSTRAINT tb_bus_pkey PRIMARY KEY (id);


--
-- TOC entry 3223 (class 2606 OID 16579)
-- Name: tb_role tb_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_role
    ADD CONSTRAINT tb_role_pkey PRIMARY KEY (id);


--
-- TOC entry 3225 (class 2606 OID 16588)
-- Name: tb_stop tb_stop_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_stop
    ADD CONSTRAINT tb_stop_pkey PRIMARY KEY (id);


--
-- TOC entry 3227 (class 2606 OID 16595)
-- Name: tb_ticket tb_ticket_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_ticket
    ADD CONSTRAINT tb_ticket_pkey PRIMARY KEY (id);


--
-- TOC entry 3229 (class 2606 OID 16602)
-- Name: tb_trip tb_trip_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_trip
    ADD CONSTRAINT tb_trip_pkey PRIMARY KEY (id);


--
-- TOC entry 3231 (class 2606 OID 16609)
-- Name: tb_trip_schedule tb_trip_schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_trip_schedule
    ADD CONSTRAINT tb_trip_schedule_pkey PRIMARY KEY (id);


--
-- TOC entry 3233 (class 2606 OID 16618)
-- Name: tb_user tb_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_user
    ADD CONSTRAINT tb_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3239 (class 2606 OID 16623)
-- Name: tb_user_roles tb_user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_user_roles
    ADD CONSTRAINT tb_user_roles_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 3221 (class 2606 OID 16625)
-- Name: tb_bus uk2x8q9txwx59cij0fu8f4bbgww; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_bus
    ADD CONSTRAINT uk2x8q9txwx59cij0fu8f4bbgww UNIQUE (code);


--
-- TOC entry 3235 (class 2606 OID 16629)
-- Name: tb_user uk4vih17mube9j7cqyjlfbcrk4m; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_user
    ADD CONSTRAINT uk4vih17mube9j7cqyjlfbcrk4m UNIQUE (email);


--
-- TOC entry 3237 (class 2606 OID 16627)
-- Name: tb_user uk4wv83hfajry5tdoamn8wsqa6x; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_user
    ADD CONSTRAINT uk4wv83hfajry5tdoamn8wsqa6x UNIQUE (username);


--
-- TOC entry 3242 (class 1259 OID 16693)
-- Name: flyway_schema_history_s_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX flyway_schema_history_s_idx ON public.flyway_schema_history USING btree (success);


--
-- TOC entry 3253 (class 2606 OID 16680)
-- Name: tb_user_roles fk19t64ocsol5x06fy2cytp7gey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_user_roles
    ADD CONSTRAINT fk19t64ocsol5x06fy2cytp7gey FOREIGN KEY (user_id) REFERENCES public.tb_user(id);


--
-- TOC entry 3244 (class 2606 OID 16635)
-- Name: tb_bus fk5u7ho69v708db1wfmwyxy7ada; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_bus
    ADD CONSTRAINT fk5u7ho69v708db1wfmwyxy7ada FOREIGN KEY (agency_id) REFERENCES public.tb_agency(id);


--
-- TOC entry 3246 (class 2606 OID 16645)
-- Name: tb_ticket fk97lwd2e4myiak0iv8liqy6m73; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_ticket
    ADD CONSTRAINT fk97lwd2e4myiak0iv8liqy6m73 FOREIGN KEY (trip_schedule_id) REFERENCES public.tb_trip_schedule(id);


--
-- TOC entry 3243 (class 2606 OID 16630)
-- Name: tb_agency fkaf52n3hv8gkrwutflsx3dsu0a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_agency
    ADD CONSTRAINT fkaf52n3hv8gkrwutflsx3dsu0a FOREIGN KEY (owner_user_id) REFERENCES public.tb_user(id);


--
-- TOC entry 3247 (class 2606 OID 16650)
-- Name: tb_trip fkb9ya2jdoqp7e561bcffkfcg0w; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_trip
    ADD CONSTRAINT fkb9ya2jdoqp7e561bcffkfcg0w FOREIGN KEY (agency_id) REFERENCES public.tb_agency(id);


--
-- TOC entry 3252 (class 2606 OID 16675)
-- Name: tb_user_roles fkft1jmfcluls775jqp5142wvl8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_user_roles
    ADD CONSTRAINT fkft1jmfcluls775jqp5142wvl8 FOREIGN KEY (role_id) REFERENCES public.tb_role(id);


--
-- TOC entry 3251 (class 2606 OID 16670)
-- Name: tb_trip_schedule fkh8m8v7xrx1gxk97wmqcgdwkpd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_trip_schedule
    ADD CONSTRAINT fkh8m8v7xrx1gxk97wmqcgdwkpd FOREIGN KEY (trip_id) REFERENCES public.tb_trip(id);


--
-- TOC entry 3249 (class 2606 OID 16660)
-- Name: tb_trip fklxk3n3ls1rxdlrt0mly1utso; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_trip
    ADD CONSTRAINT fklxk3n3ls1rxdlrt0mly1utso FOREIGN KEY (dest_stop_id) REFERENCES public.tb_stop(id);


--
-- TOC entry 3250 (class 2606 OID 16665)
-- Name: tb_trip fkmm1rg49eegmxrqb6l0rmds4xf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_trip
    ADD CONSTRAINT fkmm1rg49eegmxrqb6l0rmds4xf FOREIGN KEY (source_stop_id) REFERENCES public.tb_stop(id);


--
-- TOC entry 3248 (class 2606 OID 16655)
-- Name: tb_trip fkn2846c608hiibwh4rfl73ebtl; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_trip
    ADD CONSTRAINT fkn2846c608hiibwh4rfl73ebtl FOREIGN KEY (bus_id) REFERENCES public.tb_bus(id);


--
-- TOC entry 3245 (class 2606 OID 16640)
-- Name: tb_ticket fkoa6dths1eu8gnrlchutafn97o; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_ticket
    ADD CONSTRAINT fkoa6dths1eu8gnrlchutafn97o FOREIGN KEY (user_id) REFERENCES public.tb_user(id);


-- Completed on 2022-07-05 22:31:54

--
-- PostgreSQL database dump complete
--

