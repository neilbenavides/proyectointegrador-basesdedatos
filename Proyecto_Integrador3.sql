--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2023-10-08 14:05:07

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
-- TOC entry 4856 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 24678)
-- Name: categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categoria (
    id integer NOT NULL,
    nombre character varying(50)
);


ALTER TABLE public.categoria OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 24677)
-- Name: categoria_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categoria_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categoria_id_seq OWNER TO postgres;

--
-- TOC entry 4857 (class 0 OID 0)
-- Dependencies: 215
-- Name: categoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categoria_id_seq OWNED BY public.categoria.id;


--
-- TOC entry 224 (class 1259 OID 24725)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    id integer NOT NULL,
    nombre character varying(50),
    telefono integer
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 24724)
-- Name: cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cliente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cliente_id_seq OWNER TO postgres;

--
-- TOC entry 4858 (class 0 OID 0)
-- Dependencies: 223
-- Name: cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cliente_id_seq OWNED BY public.cliente.id;


--
-- TOC entry 228 (class 1259 OID 24749)
-- Name: item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item (
    id integer NOT NULL,
    orden_id integer,
    producto_id integer,
    cantidad integer,
    monto_venta numeric
);


ALTER TABLE public.item OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 24748)
-- Name: item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.item_id_seq OWNER TO postgres;

--
-- TOC entry 4859 (class 0 OID 0)
-- Dependencies: 227
-- Name: item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.item_id_seq OWNED BY public.item.id;


--
-- TOC entry 226 (class 1259 OID 24732)
-- Name: orden; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orden (
    id integer NOT NULL,
    cliente_id integer,
    sucursal_id integer,
    fecha integer,
    total integer
);


ALTER TABLE public.orden OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 24731)
-- Name: orden_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orden_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orden_id_seq OWNER TO postgres;

--
-- TOC entry 4860 (class 0 OID 0)
-- Dependencies: 225
-- Name: orden_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orden_id_seq OWNED BY public.orden.id;


--
-- TOC entry 218 (class 1259 OID 24685)
-- Name: producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.producto (
    id integer NOT NULL,
    categoria_id integer,
    nombre character varying(50),
    marca character varying(50),
    precio_unitario numeric
);


ALTER TABLE public.producto OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 24684)
-- Name: producto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.producto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.producto_id_seq OWNER TO postgres;

--
-- TOC entry 4861 (class 0 OID 0)
-- Dependencies: 217
-- Name: producto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.producto_id_seq OWNED BY public.producto.id;


--
-- TOC entry 222 (class 1259 OID 24706)
-- Name: stock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stock (
    id integer NOT NULL,
    sucursal_id integer NOT NULL,
    producto_id integer NOT NULL,
    cantidad integer
);


ALTER TABLE public.stock OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 24705)
-- Name: stock_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stock_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.stock_id_seq OWNER TO postgres;

--
-- TOC entry 4862 (class 0 OID 0)
-- Dependencies: 221
-- Name: stock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stock_id_seq OWNED BY public.stock.id;


--
-- TOC entry 220 (class 1259 OID 24699)
-- Name: sucursal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sucursal (
    id integer NOT NULL,
    nombre character varying(50),
    direccion character varying(50)
);


ALTER TABLE public.sucursal OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24698)
-- Name: sucursal_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sucursal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sucursal_id_seq OWNER TO postgres;

--
-- TOC entry 4863 (class 0 OID 0)
-- Dependencies: 219
-- Name: sucursal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sucursal_id_seq OWNED BY public.sucursal.id;


--
-- TOC entry 4664 (class 2604 OID 24681)
-- Name: categoria id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria ALTER COLUMN id SET DEFAULT nextval('public.categoria_id_seq'::regclass);


--
-- TOC entry 4668 (class 2604 OID 24728)
-- Name: cliente id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente ALTER COLUMN id SET DEFAULT nextval('public.cliente_id_seq'::regclass);


--
-- TOC entry 4670 (class 2604 OID 24752)
-- Name: item id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item ALTER COLUMN id SET DEFAULT nextval('public.item_id_seq'::regclass);


--
-- TOC entry 4669 (class 2604 OID 24735)
-- Name: orden id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden ALTER COLUMN id SET DEFAULT nextval('public.orden_id_seq'::regclass);


--
-- TOC entry 4665 (class 2604 OID 24688)
-- Name: producto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto ALTER COLUMN id SET DEFAULT nextval('public.producto_id_seq'::regclass);


--
-- TOC entry 4667 (class 2604 OID 24709)
-- Name: stock id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock ALTER COLUMN id SET DEFAULT nextval('public.stock_id_seq'::regclass);


--
-- TOC entry 4666 (class 2604 OID 24702)
-- Name: sucursal id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sucursal ALTER COLUMN id SET DEFAULT nextval('public.sucursal_id_seq'::regclass);


--
-- TOC entry 4838 (class 0 OID 24678)
-- Dependencies: 216
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categoria (id, nombre) FROM stdin;
\.


--
-- TOC entry 4846 (class 0 OID 24725)
-- Dependencies: 224
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente (id, nombre, telefono) FROM stdin;
\.


--
-- TOC entry 4850 (class 0 OID 24749)
-- Dependencies: 228
-- Data for Name: item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.item (id, orden_id, producto_id, cantidad, monto_venta) FROM stdin;
\.


--
-- TOC entry 4848 (class 0 OID 24732)
-- Dependencies: 226
-- Data for Name: orden; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orden (id, cliente_id, sucursal_id, fecha, total) FROM stdin;
\.


--
-- TOC entry 4840 (class 0 OID 24685)
-- Dependencies: 218
-- Data for Name: producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.producto (id, categoria_id, nombre, marca, precio_unitario) FROM stdin;
\.


--
-- TOC entry 4844 (class 0 OID 24706)
-- Dependencies: 222
-- Data for Name: stock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stock (id, sucursal_id, producto_id, cantidad) FROM stdin;
\.


--
-- TOC entry 4842 (class 0 OID 24699)
-- Dependencies: 220
-- Data for Name: sucursal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sucursal (id, nombre, direccion) FROM stdin;
\.


--
-- TOC entry 4864 (class 0 OID 0)
-- Dependencies: 215
-- Name: categoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categoria_id_seq', 1, false);


--
-- TOC entry 4865 (class 0 OID 0)
-- Dependencies: 223
-- Name: cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cliente_id_seq', 1, false);


--
-- TOC entry 4866 (class 0 OID 0)
-- Dependencies: 227
-- Name: item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.item_id_seq', 1, false);


--
-- TOC entry 4867 (class 0 OID 0)
-- Dependencies: 225
-- Name: orden_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orden_id_seq', 1, false);


--
-- TOC entry 4868 (class 0 OID 0)
-- Dependencies: 217
-- Name: producto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.producto_id_seq', 1, false);


--
-- TOC entry 4869 (class 0 OID 0)
-- Dependencies: 221
-- Name: stock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stock_id_seq', 1, false);


--
-- TOC entry 4870 (class 0 OID 0)
-- Dependencies: 219
-- Name: sucursal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sucursal_id_seq', 1, false);


--
-- TOC entry 4672 (class 2606 OID 24683)
-- Name: categoria categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id);


--
-- TOC entry 4682 (class 2606 OID 24730)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);


--
-- TOC entry 4686 (class 2606 OID 24756)
-- Name: item item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT item_pkey PRIMARY KEY (id);


--
-- TOC entry 4684 (class 2606 OID 24737)
-- Name: orden orden_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden
    ADD CONSTRAINT orden_pkey PRIMARY KEY (id);


--
-- TOC entry 4674 (class 2606 OID 24692)
-- Name: producto producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (id);


--
-- TOC entry 4678 (class 2606 OID 24711)
-- Name: stock stock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT stock_pkey PRIMARY KEY (id);


--
-- TOC entry 4680 (class 2606 OID 24713)
-- Name: stock stock_sucursal_id_producto_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT stock_sucursal_id_producto_id_key UNIQUE (sucursal_id, producto_id);


--
-- TOC entry 4676 (class 2606 OID 24704)
-- Name: sucursal sucursal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sucursal
    ADD CONSTRAINT sucursal_pkey PRIMARY KEY (id);


--
-- TOC entry 4692 (class 2606 OID 24757)
-- Name: item item_orden_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT item_orden_id_fkey FOREIGN KEY (orden_id) REFERENCES public.orden(id);


--
-- TOC entry 4693 (class 2606 OID 24762)
-- Name: item item_producto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT item_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.producto(id);


--
-- TOC entry 4690 (class 2606 OID 24738)
-- Name: orden orden_cliente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden
    ADD CONSTRAINT orden_cliente_id_fkey FOREIGN KEY (cliente_id) REFERENCES public.cliente(id);


--
-- TOC entry 4691 (class 2606 OID 24743)
-- Name: orden orden_sucursal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden
    ADD CONSTRAINT orden_sucursal_id_fkey FOREIGN KEY (sucursal_id) REFERENCES public.sucursal(id);


--
-- TOC entry 4687 (class 2606 OID 24693)
-- Name: producto producto_categoria_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_categoria_id_fkey FOREIGN KEY (categoria_id) REFERENCES public.categoria(id);


--
-- TOC entry 4688 (class 2606 OID 24719)
-- Name: stock stock_producto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT stock_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.producto(id);


--
-- TOC entry 4689 (class 2606 OID 24714)
-- Name: stock stock_sucursal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT stock_sucursal_id_fkey FOREIGN KEY (sucursal_id) REFERENCES public.sucursal(id);


-- Completed on 2023-10-08 14:05:08

--
-- PostgreSQL database dump complete
--

