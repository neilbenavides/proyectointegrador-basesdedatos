--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2023-10-24 12:09:04

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

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4854 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 33394)
-- Name: categorias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categorias (
    id integer NOT NULL,
    nombre character varying(50)
);


ALTER TABLE public.categorias OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 33393)
-- Name: categorias_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categorias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categorias_id_seq OWNER TO postgres;

--
-- TOC entry 4855 (class 0 OID 0)
-- Dependencies: 215
-- Name: categorias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categorias_id_seq OWNED BY public.categorias.id;


--
-- TOC entry 222 (class 1259 OID 33415)
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    id integer NOT NULL,
    nombre character varying(50),
    telefono character varying(50)
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 33414)
-- Name: clientes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clientes_id_seq OWNER TO postgres;

--
-- TOC entry 4856 (class 0 OID 0)
-- Dependencies: 221
-- Name: clientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clientes_id_seq OWNED BY public.clientes.id;


--
-- TOC entry 228 (class 1259 OID 33436)
-- Name: items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.items (
    id integer NOT NULL,
    orden_id integer NOT NULL,
    producto_id integer NOT NULL,
    cantidad integer,
    monto_venta integer
);


ALTER TABLE public.items OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 33435)
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.items_id_seq OWNER TO postgres;

--
-- TOC entry 4857 (class 0 OID 0)
-- Dependencies: 227
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.items_id_seq OWNED BY public.items.id;


--
-- TOC entry 224 (class 1259 OID 33422)
-- Name: ordenes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ordenes (
    id integer NOT NULL,
    cliente_id integer NOT NULL,
    sucursal_id integer NOT NULL,
    fecha character varying(50),
    total integer
);


ALTER TABLE public.ordenes OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 33421)
-- Name: ordenes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ordenes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ordenes_id_seq OWNER TO postgres;

--
-- TOC entry 4858 (class 0 OID 0)
-- Dependencies: 223
-- Name: ordenes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ordenes_id_seq OWNED BY public.ordenes.id;


--
-- TOC entry 218 (class 1259 OID 33401)
-- Name: productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productos (
    id integer NOT NULL,
    nombre character varying(50),
    marca character varying(50),
    categoria_id integer NOT NULL,
    precio_unitario integer
);


ALTER TABLE public.productos OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 33400)
-- Name: productos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.productos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.productos_id_seq OWNER TO postgres;

--
-- TOC entry 4859 (class 0 OID 0)
-- Dependencies: 217
-- Name: productos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos_id_seq OWNED BY public.productos.id;


--
-- TOC entry 226 (class 1259 OID 33429)
-- Name: stocks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stocks (
    id integer NOT NULL,
    sucursal_id integer NOT NULL,
    producto_id integer NOT NULL,
    cantidad integer
);


ALTER TABLE public.stocks OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 33428)
-- Name: stocks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stocks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.stocks_id_seq OWNER TO postgres;

--
-- TOC entry 4860 (class 0 OID 0)
-- Dependencies: 225
-- Name: stocks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stocks_id_seq OWNED BY public.stocks.id;


--
-- TOC entry 220 (class 1259 OID 33408)
-- Name: sucursales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sucursales (
    id integer NOT NULL,
    nombre character varying(50),
    direccion character varying(50)
);


ALTER TABLE public.sucursales OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 33407)
-- Name: sucursales_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sucursales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sucursales_id_seq OWNER TO postgres;

--
-- TOC entry 4861 (class 0 OID 0)
-- Dependencies: 219
-- Name: sucursales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sucursales_id_seq OWNED BY public.sucursales.id;


--
-- TOC entry 4664 (class 2604 OID 33397)
-- Name: categorias id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias ALTER COLUMN id SET DEFAULT nextval('public.categorias_id_seq'::regclass);


--
-- TOC entry 4667 (class 2604 OID 33418)
-- Name: clientes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes ALTER COLUMN id SET DEFAULT nextval('public.clientes_id_seq'::regclass);


--
-- TOC entry 4670 (class 2604 OID 33439)
-- Name: items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- TOC entry 4668 (class 2604 OID 33425)
-- Name: ordenes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordenes ALTER COLUMN id SET DEFAULT nextval('public.ordenes_id_seq'::regclass);


--
-- TOC entry 4665 (class 2604 OID 33404)
-- Name: productos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos ALTER COLUMN id SET DEFAULT nextval('public.productos_id_seq'::regclass);


--
-- TOC entry 4669 (class 2604 OID 33432)
-- Name: stocks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stocks ALTER COLUMN id SET DEFAULT nextval('public.stocks_id_seq'::regclass);


--
-- TOC entry 4666 (class 2604 OID 33411)
-- Name: sucursales id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sucursales ALTER COLUMN id SET DEFAULT nextval('public.sucursales_id_seq'::regclass);


--
-- TOC entry 4836 (class 0 OID 33394)
-- Dependencies: 216
-- Data for Name: categorias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categorias (id, nombre) FROM stdin;
\.


--
-- TOC entry 4842 (class 0 OID 33415)
-- Dependencies: 222
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clientes (id, nombre, telefono) FROM stdin;
\.


--
-- TOC entry 4848 (class 0 OID 33436)
-- Dependencies: 228
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.items (id, orden_id, producto_id, cantidad, monto_venta) FROM stdin;
\.


--
-- TOC entry 4844 (class 0 OID 33422)
-- Dependencies: 224
-- Data for Name: ordenes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ordenes (id, cliente_id, sucursal_id, fecha, total) FROM stdin;
\.


--
-- TOC entry 4838 (class 0 OID 33401)
-- Dependencies: 218
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productos (id, nombre, marca, categoria_id, precio_unitario) FROM stdin;
\.


--
-- TOC entry 4846 (class 0 OID 33429)
-- Dependencies: 226
-- Data for Name: stocks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stocks (id, sucursal_id, producto_id, cantidad) FROM stdin;
\.


--
-- TOC entry 4840 (class 0 OID 33408)
-- Dependencies: 220
-- Data for Name: sucursales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sucursales (id, nombre, direccion) FROM stdin;
\.


--
-- TOC entry 4862 (class 0 OID 0)
-- Dependencies: 215
-- Name: categorias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categorias_id_seq', 1, false);


--
-- TOC entry 4863 (class 0 OID 0)
-- Dependencies: 221
-- Name: clientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clientes_id_seq', 1, false);


--
-- TOC entry 4864 (class 0 OID 0)
-- Dependencies: 227
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.items_id_seq', 1, false);


--
-- TOC entry 4865 (class 0 OID 0)
-- Dependencies: 223
-- Name: ordenes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ordenes_id_seq', 1, false);


--
-- TOC entry 4866 (class 0 OID 0)
-- Dependencies: 217
-- Name: productos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_id_seq', 1, false);


--
-- TOC entry 4867 (class 0 OID 0)
-- Dependencies: 225
-- Name: stocks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stocks_id_seq', 1, false);


--
-- TOC entry 4868 (class 0 OID 0)
-- Dependencies: 219
-- Name: sucursales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sucursales_id_seq', 1, false);


--
-- TOC entry 4672 (class 2606 OID 33399)
-- Name: categorias categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id);


--
-- TOC entry 4678 (class 2606 OID 33420)
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);


--
-- TOC entry 4684 (class 2606 OID 33441)
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- TOC entry 4680 (class 2606 OID 33427)
-- Name: ordenes ordenes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordenes
    ADD CONSTRAINT ordenes_pkey PRIMARY KEY (id);


--
-- TOC entry 4674 (class 2606 OID 33406)
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id);


--
-- TOC entry 4682 (class 2606 OID 33434)
-- Name: stocks stocks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stocks
    ADD CONSTRAINT stocks_pkey PRIMARY KEY (id);


--
-- TOC entry 4676 (class 2606 OID 33413)
-- Name: sucursales sucursales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sucursales
    ADD CONSTRAINT sucursales_pkey PRIMARY KEY (id);


--
-- TOC entry 4690 (class 2606 OID 33468)
-- Name: items fk_items_ordenes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_items_ordenes FOREIGN KEY (orden_id) REFERENCES public.ordenes(id);


--
-- TOC entry 4691 (class 2606 OID 33473)
-- Name: items fk_items_productos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_items_productos FOREIGN KEY (producto_id) REFERENCES public.productos(id);


--
-- TOC entry 4686 (class 2606 OID 33457)
-- Name: ordenes fk_ordenes_clientes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordenes
    ADD CONSTRAINT fk_ordenes_clientes FOREIGN KEY (cliente_id) REFERENCES public.clientes(id);


--
-- TOC entry 4687 (class 2606 OID 33463)
-- Name: ordenes fk_ordenes_sucursales; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordenes
    ADD CONSTRAINT fk_ordenes_sucursales FOREIGN KEY (sucursal_id) REFERENCES public.sucursales(id);


--
-- TOC entry 4685 (class 2606 OID 33442)
-- Name: productos fk_productos_categorias; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT fk_productos_categorias FOREIGN KEY (categoria_id) REFERENCES public.categorias(id);


--
-- TOC entry 4688 (class 2606 OID 33452)
-- Name: stocks fk_stocks_productos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stocks
    ADD CONSTRAINT fk_stocks_productos FOREIGN KEY (producto_id) REFERENCES public.productos(id);


--
-- TOC entry 4689 (class 2606 OID 33447)
-- Name: stocks fk_stocks_sucursales; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stocks
    ADD CONSTRAINT fk_stocks_sucursales FOREIGN KEY (sucursal_id) REFERENCES public.sucursales(id);


-- Completed on 2023-10-24 12:09:06

--
-- PostgreSQL database dump complete
--

