--
-- PostgreSQL database dump
--

\restrict CvVSGjCBgbwKhnjKTIbDVwzddmeYEs4sYheaAJCEPuNo8BN1IhuK5EdKqKqsSIC

-- Dumped from database version 16.15
-- Dumped by pg_dump version 16.15

-- Started on 2026-11-19 18:37:11

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
-- TOC entry 225 (class 1259 OID 16712)
-- Name: clases_grupales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clases_grupales (
    id_clase integer NOT NULL,
    id_entrenador integer NOT NULL,
    nombre character varying(100) NOT NULL,
    dia_semana character varying(20) NOT NULL,
    hora time without time zone NOT NULL,
    cupo integer NOT NULL,
    estado character varying(20) DEFAULT 'activa'::character varying NOT NULL,
    CONSTRAINT chk_estado_clase CHECK (((estado)::text = ANY ((ARRAY['activa'::character varying, 'suspendida'::character varying])::text[]))),
    CONSTRAINT clases_grupales_cupo_check CHECK ((cupo > 0))
);


ALTER TABLE public.clases_grupales OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16711)
-- Name: clases_grupales_id_clase_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clases_grupales_id_clase_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clases_grupales_id_clase_seq OWNER TO postgres;

--
-- TOC entry 4884 (class 0 OID 0)
-- Dependencies: 224
-- Name: clases_grupales_id_clase_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clases_grupales_id_clase_seq OWNED BY public.clases_grupales.id_clase;


--
-- TOC entry 219 (class 1259 OID 16667)
-- Name: entrenadores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entrenadores (
    id_entrenador integer NOT NULL,
    nombre character varying(100) NOT NULL,
    especialidad character varying(100) NOT NULL,
    correo character varying(100) NOT NULL
);


ALTER TABLE public.entrenadores OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16666)
-- Name: entrenadores_id_entrenador_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.entrenadores_id_entrenador_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.entrenadores_id_entrenador_seq OWNER TO postgres;

--
-- TOC entry 4885 (class 0 OID 0)
-- Dependencies: 218
-- Name: entrenadores_id_entrenador_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.entrenadores_id_entrenador_seq OWNED BY public.entrenadores.id_entrenador;


--
-- TOC entry 221 (class 1259 OID 16676)
-- Name: fichas_medicas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fichas_medicas (
    id_ficha integer NOT NULL,
    numero_documento character varying(20) NOT NULL,
    peso numeric(5,2) NOT NULL,
    estatura numeric(3,2) NOT NULL,
    lesiones text,
    CONSTRAINT fichas_medicas_estatura_check CHECK ((estatura > (0)::numeric)),
    CONSTRAINT fichas_medicas_peso_check CHECK ((peso > (0)::numeric))
);


ALTER TABLE public.fichas_medicas OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16675)
-- Name: fichas_medicas_id_ficha_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fichas_medicas_id_ficha_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.fichas_medicas_id_ficha_seq OWNER TO postgres;

--
-- TOC entry 4886 (class 0 OID 0)
-- Dependencies: 220
-- Name: fichas_medicas_id_ficha_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fichas_medicas_id_ficha_seq OWNED BY public.fichas_medicas.id_ficha;


--
-- TOC entry 227 (class 1259 OID 16725)
-- Name: inscripciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inscripciones (
    id_inscripcion integer NOT NULL,
    numero_documento character varying(20) NOT NULL,
    id_clase integer NOT NULL,
    fecha_inscripcion date DEFAULT CURRENT_DATE NOT NULL
);


ALTER TABLE public.inscripciones OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16724)
-- Name: inscripciones_id_inscripcion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inscripciones_id_inscripcion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.inscripciones_id_inscripcion_seq OWNER TO postgres;

--
-- TOC entry 4887 (class 0 OID 0)
-- Dependencies: 226
-- Name: inscripciones_id_inscripcion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inscripciones_id_inscripcion_seq OWNED BY public.inscripciones.id_inscripcion;


--
-- TOC entry 223 (class 1259 OID 16694)
-- Name: membresias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.membresias (
    id_membresia integer NOT NULL,
    numero_documento character varying(20) NOT NULL,
    id_plan integer NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_fin date NOT NULL,
    valor_pagado numeric(10,2) NOT NULL,
    CONSTRAINT membresias_check CHECK ((fecha_fin >= fecha_inicio)),
    CONSTRAINT membresias_fecha_fin_check CHECK ((fecha_fin > fecha_inicio)),
    CONSTRAINT membresias_valor_pagado_check CHECK ((valor_pagado > (0)::numeric))
);


ALTER TABLE public.membresias OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16693)
-- Name: membresias_id_membresia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.membresias_id_membresia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.membresias_id_membresia_seq OWNER TO postgres;

--
-- TOC entry 4888 (class 0 OID 0)
-- Dependencies: 222
-- Name: membresias_id_membresia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.membresias_id_membresia_seq OWNED BY public.membresias.id_membresia;


--
-- TOC entry 229 (class 1259 OID 16817)
-- Name: ocupacion_clases; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.ocupacion_clases AS
 SELECT c.nombre AS clase,
    c.dia_semana,
    c.hora,
    c.cupo,
    count(i.id_inscripcion) AS inscritos
   FROM (public.clases_grupales c
     LEFT JOIN public.inscripciones i ON ((c.id_clase = i.id_clase)))
  WHERE ((c.estado)::text = 'activa'::text)
  GROUP BY c.id_clase, c.nombre, c.dia_semana, c.hora, c.cupo;


ALTER VIEW public.ocupacion_clases OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16656)
-- Name: planes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planes (
    id_plan integer NOT NULL,
    nombre character varying(50) NOT NULL,
    duracion integer NOT NULL,
    precio numeric(10,2) NOT NULL,
    CONSTRAINT planes_duracion_check CHECK ((duracion > 0)),
    CONSTRAINT planes_precio_check CHECK ((precio > (0)::numeric))
);


ALTER TABLE public.planes OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16655)
-- Name: planes_id_plan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.planes_id_plan_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.planes_id_plan_seq OWNER TO postgres;

--
-- TOC entry 4889 (class 0 OID 0)
-- Dependencies: 216
-- Name: planes_id_plan_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.planes_id_plan_seq OWNED BY public.planes.id_plan;


--
-- TOC entry 215 (class 1259 OID 16648)
-- Name: socios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socios (
    numero_documento character varying(20) NOT NULL,
    nombre character varying(100) NOT NULL,
    telefono character varying(20) NOT NULL,
    correo character varying(100),
    acepta_whatsapp boolean DEFAULT false NOT NULL
);


ALTER TABLE public.socios OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16812)
-- Name: socios_vencidos; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.socios_vencidos AS
 SELECT s.nombre AS socio,
    s.telefono,
    s.acepta_whatsapp,
    max(m.fecha_fin) AS ultima_fecha_fin
   FROM (public.socios s
     JOIN public.membresias m ON (((s.numero_documento)::text = (m.numero_documento)::text)))
  GROUP BY s.numero_documento, s.nombre, s.telefono, s.acepta_whatsapp
 HAVING (max(m.fecha_fin) < CURRENT_DATE);


ALTER VIEW public.socios_vencidos OWNER TO postgres;

--
-- TOC entry 4676 (class 2604 OID 16715)
-- Name: clases_grupales id_clase; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clases_grupales ALTER COLUMN id_clase SET DEFAULT nextval('public.clases_grupales_id_clase_seq'::regclass);


--
-- TOC entry 4673 (class 2604 OID 16670)
-- Name: entrenadores id_entrenador; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entrenadores ALTER COLUMN id_entrenador SET DEFAULT nextval('public.entrenadores_id_entrenador_seq'::regclass);


--
-- TOC entry 4674 (class 2604 OID 16679)
-- Name: fichas_medicas id_ficha; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fichas_medicas ALTER COLUMN id_ficha SET DEFAULT nextval('public.fichas_medicas_id_ficha_seq'::regclass);


--
-- TOC entry 4678 (class 2604 OID 16728)
-- Name: inscripciones id_inscripcion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones ALTER COLUMN id_inscripcion SET DEFAULT nextval('public.inscripciones_id_inscripcion_seq'::regclass);


--
-- TOC entry 4675 (class 2604 OID 16697)
-- Name: membresias id_membresia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membresias ALTER COLUMN id_membresia SET DEFAULT nextval('public.membresias_id_membresia_seq'::regclass);


--
-- TOC entry 4672 (class 2604 OID 16659)
-- Name: planes id_plan; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planes ALTER COLUMN id_plan SET DEFAULT nextval('public.planes_id_plan_seq'::regclass);


--
-- TOC entry 4876 (class 0 OID 16712)
-- Dependencies: 225
-- Data for Name: clases_grupales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clases_grupales (id_clase, id_entrenador, nombre, dia_semana, hora, cupo, estado) FROM stdin;
1	1	CrossFit Matutino	Lunes	07:00:00	3	activa
2	2	Yoga Restaurativo	Miércoles	18:00:00	10	activa
4	2	Pilates Core	Sábado	09:00:00	10	activa
3	1	Funcional Intenso	Viernes	17:00:00	8	suspendida
5	1	Spinning Nocturno	Jueves	19:00:00	12	activa
6	2	Pilates Vespertino	Viernes	18:00:00	12	activa
\.


--
-- TOC entry 4870 (class 0 OID 16667)
-- Dependencies: 219
-- Data for Name: entrenadores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.entrenadores (id_entrenador, nombre, especialidad, correo) FROM stdin;
1	Carlos Gómez	CrossFit y Funcional	carlos.gomez@cuerpoactivo.com
2	Laura Martínez	Yoga y Pilates	laura.martinez@cuerpoactivo.com
3	Andrés Rojas	Boxeo	andres.rojas@cuerpoactivo.com
\.


--
-- TOC entry 4872 (class 0 OID 16676)
-- Dependencies: 221
-- Data for Name: fichas_medicas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fichas_medicas (id_ficha, numero_documento, peso, estatura, lesiones) FROM stdin;
1	10101001	58.50	1.65	Ninguna
2	10101002	78.20	1.78	Molestia leve en rodilla derecha
3	10101003	62.00	1.68	\N
4	10101004	85.40	1.80	Lumbalgia antigua
\.


--
-- TOC entry 4878 (class 0 OID 16725)
-- Dependencies: 227
-- Data for Name: inscripciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inscripciones (id_inscripcion, numero_documento, id_clase, fecha_inscripcion) FROM stdin;
1	10101001	1	2026-11-01
2	10101002	1	2026-11-02
3	10101003	1	2026-11-03
4	10101001	2	2026-11-04
5	10101004	2	2026-11-05
6	10101005	2	2026-11-06
7	10101002	3	2026-11-07
8	10101005	3	2026-11-08
9	10101003	4	2026-11-09
10	10101004	4	2026-11-10
11	10101007	2	2026-11-12
12	10101008	2	2026-11-13
13	10101007	4	2026-11-14
14	10101008	4	2026-11-15
15	10101001	6	2026-11-19
\.


--
-- TOC entry 4874 (class 0 OID 16694)
-- Dependencies: 223
-- Data for Name: membresias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.membresias (id_membresia, numero_documento, id_plan, fecha_inicio, fecha_fin, valor_pagado) FROM stdin;
1	10101001	1	2026-09-01	2026-10-01	90000.00
2	10101001	2	2026-10-02	2026-12-31	216000.00
3	10101002	3	2026-01-15	2027-01-15	800000.00
4	10101003	1	2026-11-01	2026-12-01	90000.00
6	10101004	1	2026-08-01	2026-08-31	90000.00
7	10101005	2	2026-10-15	2027-01-13	240000.00
8	10101006	1	2026-11-10	2026-12-10	85000.00
12	10101001	1	2026-11-15	2026-12-15	90000.00
13	10101007	2	2026-11-05	2027-02-03	240000.00
14	10101005	1	2026-11-12	2026-12-12	90000.00
15	10101008	1	2026-09-15	2026-10-15	90000.00
16	10101002	1	2026-10-20	2026-11-19	90000.00
17	10101007	1	2026-09-10	2026-10-10	80000.00
\.


--
-- TOC entry 4868 (class 0 OID 16656)
-- Dependencies: 217
-- Data for Name: planes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.planes (id_plan, nombre, duracion, precio) FROM stdin;
1	Mensual	30	90000.00
2	Trimestral	90	240000.00
3	Anual	365	850000.00
\.


--
-- TOC entry 4866 (class 0 OID 16648)
-- Dependencies: 215
-- Data for Name: socios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.socios (numero_documento, nombre, telefono, correo, acepta_whatsapp) FROM stdin;
10101003	Valentina Castro	3023334455	valentina.castro@email.com	f
10101004	Sebastián Morales	3034445566	\N	f
10101006	Juan Pablo Vélez	3056667788	juan.velez@email.com	f
10101002	Mateo Herrera	3012223344	mateo.herrera@email.com	t
10101005	Camila Ortiz	3045556677	camila.ortiz@email.com	t
10101001	Sofía Ramírez	3009998877	sofia.ramirez@email.com	t
10101007	Natalia Vargas	3067778899	\N	t
10101008	Diego Mendoza	3078889900	diego.mendoza@email.com	f
\.


--
-- TOC entry 4890 (class 0 OID 0)
-- Dependencies: 224
-- Name: clases_grupales_id_clase_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clases_grupales_id_clase_seq', 6, true);


--
-- TOC entry 4891 (class 0 OID 0)
-- Dependencies: 218
-- Name: entrenadores_id_entrenador_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.entrenadores_id_entrenador_seq', 3, true);


--
-- TOC entry 4892 (class 0 OID 0)
-- Dependencies: 220
-- Name: fichas_medicas_id_ficha_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fichas_medicas_id_ficha_seq', 5, true);


--
-- TOC entry 4893 (class 0 OID 0)
-- Dependencies: 226
-- Name: inscripciones_id_inscripcion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inscripciones_id_inscripcion_seq', 15, true);


--
-- TOC entry 4894 (class 0 OID 0)
-- Dependencies: 222
-- Name: membresias_id_membresia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.membresias_id_membresia_seq', 17, true);


--
-- TOC entry 4895 (class 0 OID 0)
-- Dependencies: 216
-- Name: planes_id_plan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.planes_id_plan_seq', 3, true);


--
-- TOC entry 4708 (class 2606 OID 16750)
-- Name: clases_grupales clases_grupales_id_entrenador_dia_semana_hora_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clases_grupales
    ADD CONSTRAINT clases_grupales_id_entrenador_dia_semana_hora_key UNIQUE (id_entrenador, dia_semana, hora);


--
-- TOC entry 4710 (class 2606 OID 16718)
-- Name: clases_grupales clases_grupales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clases_grupales
    ADD CONSTRAINT clases_grupales_pkey PRIMARY KEY (id_clase);


--
-- TOC entry 4698 (class 2606 OID 16674)
-- Name: entrenadores entrenadores_correo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entrenadores
    ADD CONSTRAINT entrenadores_correo_key UNIQUE (correo);


--
-- TOC entry 4700 (class 2606 OID 16672)
-- Name: entrenadores entrenadores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entrenadores
    ADD CONSTRAINT entrenadores_pkey PRIMARY KEY (id_entrenador);


--
-- TOC entry 4702 (class 2606 OID 16687)
-- Name: fichas_medicas fichas_medicas_numero_documento_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fichas_medicas
    ADD CONSTRAINT fichas_medicas_numero_documento_key UNIQUE (numero_documento);


--
-- TOC entry 4704 (class 2606 OID 16685)
-- Name: fichas_medicas fichas_medicas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fichas_medicas
    ADD CONSTRAINT fichas_medicas_pkey PRIMARY KEY (id_ficha);


--
-- TOC entry 4712 (class 2606 OID 16733)
-- Name: inscripciones inscripciones_numero_documento_id_clase_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones
    ADD CONSTRAINT inscripciones_numero_documento_id_clase_key UNIQUE (numero_documento, id_clase);


--
-- TOC entry 4714 (class 2606 OID 16731)
-- Name: inscripciones inscripciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones
    ADD CONSTRAINT inscripciones_pkey PRIMARY KEY (id_inscripcion);


--
-- TOC entry 4706 (class 2606 OID 16700)
-- Name: membresias membresias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membresias
    ADD CONSTRAINT membresias_pkey PRIMARY KEY (id_membresia);


--
-- TOC entry 4694 (class 2606 OID 16665)
-- Name: planes planes_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planes
    ADD CONSTRAINT planes_nombre_key UNIQUE (nombre);


--
-- TOC entry 4696 (class 2606 OID 16663)
-- Name: planes planes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planes
    ADD CONSTRAINT planes_pkey PRIMARY KEY (id_plan);


--
-- TOC entry 4690 (class 2606 OID 16654)
-- Name: socios socios_correo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socios
    ADD CONSTRAINT socios_correo_key UNIQUE (correo);


--
-- TOC entry 4692 (class 2606 OID 16652)
-- Name: socios socios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socios
    ADD CONSTRAINT socios_pkey PRIMARY KEY (numero_documento);


--
-- TOC entry 4718 (class 2606 OID 16719)
-- Name: clases_grupales clases_grupales_id_entrenador_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clases_grupales
    ADD CONSTRAINT clases_grupales_id_entrenador_fkey FOREIGN KEY (id_entrenador) REFERENCES public.entrenadores(id_entrenador);


--
-- TOC entry 4715 (class 2606 OID 16751)
-- Name: fichas_medicas fichas_medicas_numero_documento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fichas_medicas
    ADD CONSTRAINT fichas_medicas_numero_documento_fkey FOREIGN KEY (numero_documento) REFERENCES public.socios(numero_documento) ON DELETE CASCADE;


--
-- TOC entry 4719 (class 2606 OID 16739)
-- Name: inscripciones inscripciones_id_clase_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones
    ADD CONSTRAINT inscripciones_id_clase_fkey FOREIGN KEY (id_clase) REFERENCES public.clases_grupales(id_clase);


--
-- TOC entry 4720 (class 2606 OID 16756)
-- Name: inscripciones inscripciones_numero_documento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones
    ADD CONSTRAINT inscripciones_numero_documento_fkey FOREIGN KEY (numero_documento) REFERENCES public.socios(numero_documento) ON DELETE CASCADE;


--
-- TOC entry 4716 (class 2606 OID 16706)
-- Name: membresias membresias_id_plan_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membresias
    ADD CONSTRAINT membresias_id_plan_fkey FOREIGN KEY (id_plan) REFERENCES public.planes(id_plan);


--
-- TOC entry 4717 (class 2606 OID 16701)
-- Name: membresias membresias_numero_documento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membresias
    ADD CONSTRAINT membresias_numero_documento_fkey FOREIGN KEY (numero_documento) REFERENCES public.socios(numero_documento);


-- Completed on 2026-11-19 18:37:11

--
-- PostgreSQL database dump complete
--

\unrestrict CvVSGjCBgbwKhnjKTIbDVwzddmeYEs4sYheaAJCEPuNo8BN1IhuK5EdKqKqsSIC

