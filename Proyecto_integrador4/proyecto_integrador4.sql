--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2023-10-14 13:59:28

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
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4855 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 25116)
-- Name: categorias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categorias (
    id integer NOT NULL,
    nombre character varying(50)
);


ALTER TABLE public.categorias OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 25115)
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
-- TOC entry 4856 (class 0 OID 0)
-- Dependencies: 216
-- Name: categorias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categorias_id_seq OWNED BY public.categorias.id;


--
-- TOC entry 223 (class 1259 OID 25142)
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    id integer NOT NULL,
    nombre character varying(50),
    telefono character varying(50)
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 25141)
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
-- TOC entry 4857 (class 0 OID 0)
-- Dependencies: 222
-- Name: clientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clientes_id_seq OWNED BY public.clientes.id;


--
-- TOC entry 229 (class 1259 OID 25183)
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
-- TOC entry 228 (class 1259 OID 25182)
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
-- TOC entry 4858 (class 0 OID 0)
-- Dependencies: 228
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.items_id_seq OWNED BY public.items.id;


--
-- TOC entry 225 (class 1259 OID 25149)
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
-- TOC entry 224 (class 1259 OID 25148)
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
-- TOC entry 4859 (class 0 OID 0)
-- Dependencies: 224
-- Name: ordenes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ordenes_id_seq OWNED BY public.ordenes.id;


--
-- TOC entry 219 (class 1259 OID 25123)
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
-- TOC entry 218 (class 1259 OID 25122)
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
-- TOC entry 4860 (class 0 OID 0)
-- Dependencies: 218
-- Name: productos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos_id_seq OWNED BY public.productos.id;


--
-- TOC entry 227 (class 1259 OID 25166)
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
-- TOC entry 226 (class 1259 OID 25165)
-- Name: stoks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stoks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.stoks_id_seq OWNER TO postgres;

--
-- TOC entry 4861 (class 0 OID 0)
-- Dependencies: 226
-- Name: stoks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stoks_id_seq OWNED BY public.stocks.id;


--
-- TOC entry 221 (class 1259 OID 25135)
-- Name: sucursales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sucursales (
    id integer NOT NULL,
    nombre character varying(50),
    direccion character varying(50)
);


ALTER TABLE public.sucursales OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 25134)
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
-- TOC entry 4862 (class 0 OID 0)
-- Dependencies: 220
-- Name: sucursales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sucursales_id_seq OWNED BY public.sucursales.id;


--
-- TOC entry 4665 (class 2604 OID 25119)
-- Name: categorias id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias ALTER COLUMN id SET DEFAULT nextval('public.categorias_id_seq'::regclass);


--
-- TOC entry 4668 (class 2604 OID 25145)
-- Name: clientes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes ALTER COLUMN id SET DEFAULT nextval('public.clientes_id_seq'::regclass);


--
-- TOC entry 4671 (class 2604 OID 25186)
-- Name: items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- TOC entry 4669 (class 2604 OID 25152)
-- Name: ordenes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordenes ALTER COLUMN id SET DEFAULT nextval('public.ordenes_id_seq'::regclass);


--
-- TOC entry 4666 (class 2604 OID 25126)
-- Name: productos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos ALTER COLUMN id SET DEFAULT nextval('public.productos_id_seq'::regclass);


--
-- TOC entry 4670 (class 2604 OID 25169)
-- Name: stocks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stocks ALTER COLUMN id SET DEFAULT nextval('public.stoks_id_seq'::regclass);


--
-- TOC entry 4667 (class 2604 OID 25138)
-- Name: sucursales id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sucursales ALTER COLUMN id SET DEFAULT nextval('public.sucursales_id_seq'::regclass);


--
-- TOC entry 4837 (class 0 OID 25116)
-- Dependencies: 217
-- Data for Name: categorias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categorias (id, nombre) FROM stdin;
1	Electrónicos
2	Ropa
3	Hogar
4	Deportes
5	Juguetes
\.


--
-- TOC entry 4843 (class 0 OID 25142)
-- Dependencies: 223
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clientes (id, nombre, telefono) FROM stdin;
1	Juan	1234567890
2	María	987654321
3	Pedro	5555555555
\.


--
-- TOC entry 4849 (class 0 OID 25183)
-- Dependencies: 229
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.items (id, orden_id, producto_id, cantidad, monto_venta) FROM stdin;
1	1	9	7	175
2	1	8	8	400
3	2	9	3	75
4	2	5	9	270
5	2	5	10	300
6	2	6	3	60
7	3	1	9	9000
8	4	1	4	4000
9	4	2	8	6400
10	5	6	2	40
11	5	7	3	45
12	6	4	9	630
13	6	9	4	100
14	6	3	2	100
15	7	5	8	240
16	7	9	6	150
17	7	8	2	100
18	8	1	6	6000
19	8	1	10	10000
20	8	3	2	100
21	9	8	9	450
22	9	3	3	150
23	9	7	2	30
24	9	10	5	50
25	10	9	9	225
26	10	1	7	7000
27	10	3	6	300
28	11	7	5	75
29	11	9	8	200
30	11	3	9	450
31	12	2	7	5600
32	12	1	5	5000
33	12	6	9	180
34	12	8	9	450
35	12	8	4	200
36	13	9	4	100
37	13	2	6	4800
38	14	1	5	5000
39	14	4	7	490
40	15	9	6	150
41	15	5	9	2709
\.


--
-- TOC entry 4845 (class 0 OID 25149)
-- Dependencies: 225
-- Data for Name: ordenes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ordenes (id, cliente_id, sucursal_id, fecha, total) FROM stdin;
1	1	3	2023-06-12	575
2	2	1	2023-06-12	705
3	3	3	2023-06-12	9000
4	2	3	2023-06-12	10400
5	3	3	2023-06-12	85
6	1	1	2023-06-12	830
7	1	1	2023-06-12	490
8	3	3	2023-06-1	16100
9	3	2	2023-06-12	680
10	2	1	2023-06-12	7525
11	2	3	2023-06-12	725
12	3	1	2023-06-12	11430
13	3	3	2023-06-12	4900
14	3	3	2023-06-12	5490
15	1	1	2023-06-12	420
\.


--
-- TOC entry 4839 (class 0 OID 25123)
-- Dependencies: 219
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productos (id, nombre, marca, categoria_id, precio_unitario) FROM stdin;
1	Televisor	Sony	1	1000
2	Laptop	HP	1	800
3	Camisa	Zara	2	50
4	Pantalón	Levis	2	70
5	Sartén	T-fal	3	30
6	Toalla	Cannon	3	20
7	Pelota	Nike	4	15
8	Raqueta	Wilson	4	50
9	Muñeca	Barbie	5	25
10	Carro	Hot Wheels	5	10
\.


--
-- TOC entry 4847 (class 0 OID 25166)
-- Dependencies: 227
-- Data for Name: stocks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stocks (id, sucursal_id, producto_id, cantidad) FROM stdin;
1	1	1	65
2	1	2	71
3	1	3	8
4	1	4	42
5	1	5	61
6	1	6	14
7	1	7	70
8	1	8	66
9	1	9	13
10	1	10	68
11	2	1	14
12	2	2	67
13	2	3	74
14	2	4	32
15	2	5	75
16	2	6	37
17	2	7	14
18	2	8	42
19	2	9	51
20	2	10	41
21	3	1	59
22	3	2	98
23	3	3	52
24	3	4	85
25	3	5	31
26	3	6	17
27	3	7	13
28	3	8	18
29	3	9	76
30	3	10	1
\.


--
-- TOC entry 4841 (class 0 OID 25135)
-- Dependencies: 221
-- Data for Name: sucursales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sucursales (id, nombre, direccion) FROM stdin;
1	Sucursal A	Calle 1
2	Sucursal B	Calle 2
3	Sucursal C	Calle 3
\.


--
-- TOC entry 4863 (class 0 OID 0)
-- Dependencies: 216
-- Name: categorias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categorias_id_seq', 5, true);


--
-- TOC entry 4864 (class 0 OID 0)
-- Dependencies: 222
-- Name: clientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clientes_id_seq', 3, true);


--
-- TOC entry 4865 (class 0 OID 0)
-- Dependencies: 228
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.items_id_seq', 41, true);


--
-- TOC entry 4866 (class 0 OID 0)
-- Dependencies: 224
-- Name: ordenes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ordenes_id_seq', 15, true);


--
-- TOC entry 4867 (class 0 OID 0)
-- Dependencies: 218
-- Name: productos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_id_seq', 10, true);


--
-- TOC entry 4868 (class 0 OID 0)
-- Dependencies: 226
-- Name: stoks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stoks_id_seq', 30, true);


--
-- TOC entry 4869 (class 0 OID 0)
-- Dependencies: 220
-- Name: sucursales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sucursales_id_seq', 3, true);


--
-- TOC entry 4673 (class 2606 OID 25121)
-- Name: categorias categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id);


--
-- TOC entry 4679 (class 2606 OID 25147)
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);


--
-- TOC entry 4685 (class 2606 OID 25188)
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- TOC entry 4681 (class 2606 OID 25154)
-- Name: ordenes ordenes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordenes
    ADD CONSTRAINT ordenes_pkey PRIMARY KEY (id);


--
-- TOC entry 4675 (class 2606 OID 25128)
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id);


--
-- TOC entry 4683 (class 2606 OID 25171)
-- Name: stocks stoks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stocks
    ADD CONSTRAINT stoks_pkey PRIMARY KEY (id);


--
-- TOC entry 4677 (class 2606 OID 25140)
-- Name: sucursales sucursales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sucursales
    ADD CONSTRAINT sucursales_pkey PRIMARY KEY (id);


--
-- TOC entry 4691 (class 2606 OID 25189)
-- Name: items items_orden_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_orden_id_fkey FOREIGN KEY (orden_id) REFERENCES public.ordenes(id);


--
-- TOC entry 4692 (class 2606 OID 25194)
-- Name: items items_producto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.productos(id);


--
-- TOC entry 4687 (class 2606 OID 25155)
-- Name: ordenes ordenes_cliente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordenes
    ADD CONSTRAINT ordenes_cliente_id_fkey FOREIGN KEY (cliente_id) REFERENCES public.clientes(id);


--
-- TOC entry 4688 (class 2606 OID 25160)
-- Name: ordenes ordenes_sucursal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordenes
    ADD CONSTRAINT ordenes_sucursal_id_fkey FOREIGN KEY (sucursal_id) REFERENCES public.sucursales(id);


--
-- TOC entry 4686 (class 2606 OID 25129)
-- Name: productos productos_categoria_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_categoria_id_fkey FOREIGN KEY (categoria_id) REFERENCES public.categorias(id);


--
-- TOC entry 4689 (class 2606 OID 25177)
-- Name: stocks stoks_producto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stocks
    ADD CONSTRAINT stoks_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.productos(id);


--
-- TOC entry 4690 (class 2606 OID 25172)
-- Name: stocks stoks_sucursal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stocks
    ADD CONSTRAINT stoks_sucursal_id_fkey FOREIGN KEY (sucursal_id) REFERENCES public.sucursales(id);


-- Completed on 2023-10-14 13:59:33

--
-- PostgreSQL database dump complete
--

