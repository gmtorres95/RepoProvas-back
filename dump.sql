--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)

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
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    category character varying(6) NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: disciplines; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.disciplines (
    id integer NOT NULL,
    discipline character varying(255) NOT NULL,
    semester_id integer NOT NULL
);


ALTER TABLE public.disciplines OWNER TO postgres;

--
-- Name: disciplines_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.disciplines_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.disciplines_id_seq OWNER TO postgres;

--
-- Name: disciplines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.disciplines_id_seq OWNED BY public.disciplines.id;


--
-- Name: exams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exams (
    id integer NOT NULL,
    name character varying(6) NOT NULL,
    category_id integer NOT NULL,
    teacher_id integer NOT NULL,
    discipline_id integer NOT NULL,
    link character varying(255) NOT NULL
);


ALTER TABLE public.exams OWNER TO postgres;

--
-- Name: exams_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.exams_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exams_id_seq OWNER TO postgres;

--
-- Name: exams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.exams_id_seq OWNED BY public.exams.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    "timestamp" bigint NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: semesters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.semesters (
    id integer NOT NULL,
    semester character varying(10) NOT NULL
);


ALTER TABLE public.semesters OWNER TO postgres;

--
-- Name: semesters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.semesters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.semesters_id_seq OWNER TO postgres;

--
-- Name: semesters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.semesters_id_seq OWNED BY public.semesters.id;


--
-- Name: teachers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teachers (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.teachers OWNER TO postgres;

--
-- Name: teachers_disciplines; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teachers_disciplines (
    id integer NOT NULL,
    teacher_id integer NOT NULL,
    discipline_id integer NOT NULL
);


ALTER TABLE public.teachers_disciplines OWNER TO postgres;

--
-- Name: teachers_disciplines_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teachers_disciplines_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teachers_disciplines_id_seq OWNER TO postgres;

--
-- Name: teachers_disciplines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teachers_disciplines_id_seq OWNED BY public.teachers_disciplines.id;


--
-- Name: teachers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teachers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teachers_id_seq OWNER TO postgres;

--
-- Name: teachers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teachers_id_seq OWNED BY public.teachers.id;


--
-- Name: typeorm_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.typeorm_metadata (
    type character varying NOT NULL,
    database character varying,
    schema character varying,
    "table" character varying,
    name character varying,
    value text
);


ALTER TABLE public.typeorm_metadata OWNER TO postgres;

--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: disciplines id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disciplines ALTER COLUMN id SET DEFAULT nextval('public.disciplines_id_seq'::regclass);


--
-- Name: exams id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exams ALTER COLUMN id SET DEFAULT nextval('public.exams_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: semesters id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.semesters ALTER COLUMN id SET DEFAULT nextval('public.semesters_id_seq'::regclass);


--
-- Name: teachers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers ALTER COLUMN id SET DEFAULT nextval('public.teachers_id_seq'::regclass);


--
-- Name: teachers_disciplines id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers_disciplines ALTER COLUMN id SET DEFAULT nextval('public.teachers_disciplines_id_seq'::regclass);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, category) FROM stdin;
1	P1
2	P2
3	P3
4	2ch
5	Outras
\.


--
-- Data for Name: disciplines; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.disciplines (id, discipline, semester_id) FROM stdin;
1	Fundamentos da Computacao	1
2	Geometria Analitica	1
3	Calculo I	1
4	Laboratorio de CC	1
5	Algoritmos	1
6	Laboratorio de Programacao I	1
7	Algebra Linear	2
8	Calculo II	2
9	Fisica I	2
10	Laboratorio de Fisica I	2
11	Estrutura de Dados	2
12	Laboratorio de Programacao II	2
13	Introducao a Teoria dos Numeros	3
14	Calculo III	3
15	Teoria dos Grafos	3
16	Circuitos Digitais	3
17	Orientacao a Objetos	3
18	Equações Diferenciais I	4
19	Introducao a Estatistica	4
20	Organizacao de Computadores	4
21	Estrutura de Dados II	4
22	Modelagem de Sistemas	4
23	Calculo de Probabilidades	5
24	Inteligencia Artificial	5
25	Sistemas Operacionais	5
26	Banco de Dados	5
27	Engenharia de Software	5
28	Pesquisa Operacional	6
29	Linguagens Informais	6
30	Redes de Computadores	6
31	Calculo Numerico	6
32	Interacao Humano Computador	6
33	Segurança em Sis. de Computacao	7
34	Teoria da Computacao	7
35	Analise e Projeto de Algoritmos	7
36	Computacao Grafica	7
37	Linguagens de Programacao	8
38	Teoria dos Compiladores	8
39	Sistemas Distribuidos	8
40	Teste de Software	9
41	Engenharia de Requisitos	9
42	Data Warehouse	9
43	Teoria de Filas	9
44	Sistemas Inteligentes	9
45	Sistemas Nebulosos	9
46	Gerencia de Projetos	9
47	Aspectos Organizacionais de SI	9
48	Modelagem de Negocio	9
49	Sistemas Multimidia	9
50	Fluxo em Redes	9
51	Programacao Paralela	9
\.


--
-- Data for Name: exams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exams (id, name, category_id, teacher_id, discipline_id, link) FROM stdin;
1	1985.1	2	7	1	https://www.exam.com/%B3262221863515850=3503279701?8.pdf
2	2020.1	2	8	2	https://www.exam.com/%B3259065552851371=3210236852?2.pdf
3	1972.2	3	3	3	https://www.exam.com/%B8311152839137420=70012055?9.pdf
4	2000.1	3	41	3	https://www.exam.com/%B3344131426234831=37082997571?7.pdf
5	1998.2	1	42	3	https://www.exam.com/%B3836746622430583=7010127145?2.pdf
6	1978.2	5	1	4	https://www.exam.com/%B9338839186135544=51112707? .pdf
7	2014.2	2	1	5	https://www.exam.com/%B6131864514829385=9404507389?8.pdf
8	1985.1	3	1	6	https://www.exam.com/%B6580014305416983=78024647?7.pdf
9	2011.1	2	9	7	https://www.exam.com/%B2517458395561516=59029406?7.pdf
10	2016.2	2	10	8	https://www.exam.com/%B6562512228575534=5809541586?5.pdf
11	2006.1	4	2	9	https://www.exam.com/%B7802585888595523=9702635599?2.pdf
12	1996.2	3	43	9	https://www.exam.com/%B5660633078415519=65077617?5.pdf
13	1971.2	3	2	10	https://www.exam.com/%B2174568348002920=42108279?8.pdf
14	1997.1	3	43	10	https://www.exam.com/%B6542356737224126=0903966180?9.pdf
15	1991.1	3	1	11	https://www.exam.com/%B4708239575212976=7104983330?4.pdf
16	2019.1	2	1	12	https://www.exam.com/%B2393566683212444=5409933842? .pdf
17	1972.1	2	11	13	https://www.exam.com/%B8318312226235305=38082148?4.pdf
18	2019.1	2	3	14	https://www.exam.com/%B6422387360200344=5005467430?6.pdf
19	2016.1	4	5	15	https://www.exam.com/%B9322554367966231=2507439167?4.pdf
20	1980.2	2	12	16	https://www.exam.com/%B2620881642226334=6604259522?4.pdf
21	1993.2	2	13	17	https://www.exam.com/%B2348557318485014=4403249256?3.pdf
22	1982.2	3	14	18	https://www.exam.com/%B8394256022484847=9805538820?4.pdf
23	1999.2	2	15	19	https://www.exam.com/%B6453883126426957=7510556273?8.pdf
24	2015.2	2	16	20	https://www.exam.com/%B8151768814374743=25061192?6.pdf
25	1979.2	3	1	21	https://www.exam.com/%B9580797928448870=92038106055?3.pdf
26	1992.2	5	17	22	https://www.exam.com/%B9553457781167827=61092386069?8.pdf
27	1979.1	2	18	23	https://www.exam.com/%B2554675157350113=7907518496?1.pdf
28	1977.2	1	5	24	https://www.exam.com/%B6137354741012217=24023594691?4.pdf
29	1972.2	4	19	25	https://www.exam.com/%B7937884244387198=2309275159?5.pdf
30	2002.1	2	20	26	https://www.exam.com/%B5424332002579210=90032407360?2.pdf
31	1980.1	5	21	27	https://www.exam.com/%B8197954200743243=0905369976?3.pdf
32	1987.1	3	4	28	https://www.exam.com/%B4762601728569311=4910595218?1.pdf
33	2004.1	4	6	29	https://www.exam.com/%B5811976197218182=4209671525?2.pdf
34	1976.2	3	22	30	https://www.exam.com/%B4737209238295234=39119174996?3.pdf
35	1975.2	5	23	31	https://www.exam.com/%B5362854777548590=84127695995?6.pdf
36	2017.1	3	24	32	https://www.exam.com/%B5780862453053706=0709709815?1.pdf
37	2014.1	4	25	33	https://www.exam.com/%B7284568512211943=09038604368?2.pdf
38	2006.2	5	26	34	https://www.exam.com/%B7331452133251705=53024123?5.pdf
39	1993.1	3	27	35	https://www.exam.com/%B6739417475157976=0907246935?6.pdf
40	1989.1	2	28	36	https://www.exam.com/%B6852265172085225=48119079?2.pdf
41	1977.1	1	29	37	https://www.exam.com/%B2480155218727820=6902949929?3.pdf
42	1988.2	4	6	38	https://www.exam.com/%B6774053384827106=39024672?9.pdf
43	1972.1	3	4	39	https://www.exam.com/%B4362735598852587=4011290306?3.pdf
44	2017.2	3	30	40	https://www.exam.com/%B4676183573758711=34011933330?5.pdf
45	2007.1	3	31	41	https://www.exam.com/%B7166446216065575=4803650174?5.pdf
46	1977.1	3	32	42	https://www.exam.com/%B1798891483110701=42107509404?2.pdf
47	2019.1	3	33	43	https://www.exam.com/%B6615614414468434=78013756515?4.pdf
48	1997.1	3	34	44	https://www.exam.com/%B7650417863301116=82089308?5.pdf
49	2002.2	3	35	45	https://www.exam.com/%B2827402443535184=25107475487?7.pdf
50	2012.1	2	36	46	https://www.exam.com/%B7714235891594856=25055325?5.pdf
51	1993.2	2	37	47	https://www.exam.com/%B7818367352250384=37108337223?1.pdf
52	1988.2	4	38	48	https://www.exam.com/%B4621496367746746=5202801692?5.pdf
53	2014.1	4	39	49	https://www.exam.com/%B4343428046030885=4302328771?7.pdf
54	2004.1	4	40	50	https://www.exam.com/%B5430677643247614=21091235?8.pdf
55	1989.1	1	40	51	https://www.exam.com/%B8325242822251041=2903170759?3.pdf
56	1983.2	4	7	1	https://www.exam.com/%B7179478541428262=7304620802?7.pdf
57	1978.1	3	8	2	https://www.exam.com/%B2526185591757281=5503569757?3.pdf
58	1971.2	2	3	3	https://www.exam.com/%B4688192861727366=3402812285?9.pdf
59	1997.2	4	41	3	https://www.exam.com/%B5153655258462728=5703665449?6.pdf
60	1971.1	5	42	3	https://www.exam.com/%B1666641276696472=9110262738?5.pdf
61	1983.2	4	1	4	https://www.exam.com/%B6120577475227874=68056979214?1.pdf
62	1989.1	3	1	5	https://www.exam.com/%B9692547722591862=9602492322? .pdf
63	1979.2	4	1	6	https://www.exam.com/%B7155848732519354=7407718328?5.pdf
64	1978.2	2	9	7	https://www.exam.com/%B1972432575016328=16103612253?3.pdf
65	2003.2	1	10	8	https://www.exam.com/%B2414771237437604=33012339?2.pdf
66	2012.2	4	2	9	https://www.exam.com/%B3853722265257275=58105766667?2.pdf
67	1980.1	3	43	9	https://www.exam.com/%B5812144145890626=20084331? .pdf
68	1973.1	4	2	10	https://www.exam.com/%B7626258243490178=21112557? .pdf
69	2017.2	4	43	10	https://www.exam.com/%B3164734732234241=7408387546?1.pdf
70	2020.2	1	1	11	https://www.exam.com/%B1907308789617122=61111704?3.pdf
71	2001.1	4	1	12	https://www.exam.com/%B4043747922181768=6108151332?2.pdf
72	1977.1	5	11	13	https://www.exam.com/%B4475103892574560=7004590956?6.pdf
73	2008.2	3	3	14	https://www.exam.com/%B5725557651361119=9007243213?9.pdf
74	2019.2	2	5	15	https://www.exam.com/%B6163832771636562=47099446?3.pdf
75	2018.2	2	12	16	https://www.exam.com/%B8227947366305338=02043256?5.pdf
76	1983.1	3	13	17	https://www.exam.com/%B5233406859277624=93027337616?1.pdf
77	2014.2	3	14	18	https://www.exam.com/%B6828353444456551=14016378?4.pdf
78	1989.2	1	15	19	https://www.exam.com/%B2478581609858530=5111704211?2.pdf
79	2005.1	5	16	20	https://www.exam.com/%B5511502908122153=21089422?3.pdf
80	2017.2	3	1	21	https://www.exam.com/%B6928008170926677=74028444618?5.pdf
81	1995.1	4	17	22	https://www.exam.com/%B6317528832478465=0611550358?7.pdf
82	2003.2	5	18	23	https://www.exam.com/%B5582556184226341=35059778?4.pdf
83	1998.2	3	5	24	https://www.exam.com/%B8380693533311383=6706603931?1.pdf
84	1985.2	2	19	25	https://www.exam.com/%B4149563386645684=06024196?1.pdf
85	2005.1	1	20	26	https://www.exam.com/%B4987622394864704=8808744889?7.pdf
86	1988.1	2	21	27	https://www.exam.com/%B7887159842264194=3610665315?3.pdf
87	2017.2	2	4	28	https://www.exam.com/%B1960584887166773=3411575646?4.pdf
88	2009.1	5	6	29	https://www.exam.com/%B5295172613171416=7105383287?4.pdf
89	2001.2	4	22	30	https://www.exam.com/%B5877466165161342=47089304?4.pdf
90	2002.2	2	23	31	https://www.exam.com/%B7446782784127065=1207340408?2.pdf
91	1995.1	4	24	32	https://www.exam.com/%B8946766749629813=4805606794?7.pdf
92	1998.1	2	25	33	https://www.exam.com/%B3492466393919784=6310197541?9.pdf
93	2008.1	1	26	34	https://www.exam.com/%B4758885824492457=58018475945?4.pdf
94	1987.2	5	27	35	https://www.exam.com/%B4573287765724085=08061501940?3.pdf
95	1983.2	4	28	36	https://www.exam.com/%B1743574764331370=3507374188?3.pdf
96	1977.1	4	29	37	https://www.exam.com/%B9247131813000569=5712448780?6.pdf
97	1973.2	1	6	38	https://www.exam.com/%B4423362275119965=5802253558?3.pdf
98	1980.1	3	4	39	https://www.exam.com/%B5818710748533615=97092679199?5.pdf
99	1973.2	1	30	40	https://www.exam.com/%B2938468176533111=2903657830?3.pdf
100	2003.1	5	31	41	https://www.exam.com/%B8381175740087673=6103489222?8.pdf
101	2010.2	5	32	42	https://www.exam.com/%B7611861660102224=34026261?6.pdf
102	1983.1	2	33	43	https://www.exam.com/%B3551165178628306=4407959827?7.pdf
103	2000.1	1	34	44	https://www.exam.com/%B4443544237412631=16024463?2.pdf
104	2009.2	3	35	45	https://www.exam.com/%B7618314244608710=9308541377?5.pdf
105	2006.1	1	36	46	https://www.exam.com/%B2106893536444362=39013254295?9.pdf
106	1974.2	2	37	47	https://www.exam.com/%B4150316597911153=45042367804?2.pdf
107	2002.1	3	38	48	https://www.exam.com/%B6271025759885271=16092096079?8.pdf
108	2018.2	4	39	49	https://www.exam.com/%B6184272072598855=3311308398?5.pdf
109	1987.1	3	40	50	https://www.exam.com/%B4205448026220382=2805882642?2.pdf
110	2012.2	4	40	51	https://www.exam.com/%B2326031264577784=1909818447?5.pdf
111	1979.1	2	7	1	https://www.exam.com/%B7906473435845774=84058452?1.pdf
112	2003.2	5	8	2	https://www.exam.com/%B9717509288082555=2303666729?9.pdf
113	1992.2	1	3	3	https://www.exam.com/%B8485088397673825=96058679783?1.pdf
114	2000.1	2	41	3	https://www.exam.com/%B6888640435567624=1204337846?3.pdf
115	2010.1	4	42	3	https://www.exam.com/%B4711239161419111=43059937?9.pdf
116	2012.1	4	1	4	https://www.exam.com/%B6361788577462728=6504854597?1.pdf
117	2003.2	2	1	5	https://www.exam.com/%B6372669201597277=16048277927?2.pdf
118	1971.1	4	1	6	https://www.exam.com/%B4283752839269378=16096786206?3.pdf
119	2006.1	4	9	7	https://www.exam.com/%B8480827256874295=1611450817?3.pdf
120	1983.1	1	10	8	https://www.exam.com/%B5932648145769164=7903645682?1.pdf
121	2004.2	3	2	9	https://www.exam.com/%B5182595182920745=70041841834?1.pdf
122	1985.2	4	43	9	https://www.exam.com/%B3098415635362759=8003709611?8.pdf
123	2004.2	1	2	10	https://www.exam.com/%B9155382358528351=65053005194?3.pdf
124	2005.1	3	43	10	https://www.exam.com/%B6633887134598386=84099572?6.pdf
125	2007.1	4	1	11	https://www.exam.com/%B3337979121627624=0407990227?5.pdf
126	1975.2	5	1	12	https://www.exam.com/%B5338492306811786=18033426435?4.pdf
127	2014.1	2	11	13	https://www.exam.com/%B2221130407370651=6006303326?4.pdf
128	2011.1	2	3	14	https://www.exam.com/%B5248875567358756=4711939730?5.pdf
129	2006.1	2	5	15	https://www.exam.com/%B8427307371168670=52129037?1.pdf
130	1985.1	4	12	16	https://www.exam.com/%B2647986547875318=5109455553?2.pdf
131	2020.2	2	13	17	https://www.exam.com/%B5573513636313174=5311575987? .pdf
132	1971.1	4	14	18	https://www.exam.com/%B6267604421063918=0606760189?5.pdf
133	2017.2	4	15	19	https://www.exam.com/%B5409461918361720=8302806915?1.pdf
134	1983.1	5	16	20	https://www.exam.com/%B8671633674771193=46103197?4.pdf
135	1999.2	5	1	21	https://www.exam.com/%B1824833860425332=66063814?7.pdf
136	1982.2	1	17	22	https://www.exam.com/%B5354339679317027=0504605395?8.pdf
137	1984.2	3	18	23	https://www.exam.com/%B4871466817422214=2804111357?2.pdf
138	2012.2	3	5	24	https://www.exam.com/%B3555743772484641=1507919652?2.pdf
139	1985.1	1	19	25	https://www.exam.com/%B8588770422078314=24044861439?7.pdf
140	2009.2	4	20	26	https://www.exam.com/%B4867438718015863=8105628893? .pdf
141	2004.1	3	21	27	https://www.exam.com/%B6158721184579819=84054129621?5.pdf
142	1979.2	4	4	28	https://www.exam.com/%B4261132301882198=91052091820?1.pdf
143	2018.1	1	6	29	https://www.exam.com/%B8542378864273458=02106752?5.pdf
144	2006.2	5	22	30	https://www.exam.com/%B9897772446637611=7708357758?2.pdf
145	2019.2	4	23	31	https://www.exam.com/%B3757471735358711=3402648279?8.pdf
146	1979.1	3	24	32	https://www.exam.com/%B9436374726133646=86115179809?3.pdf
147	2001.2	3	25	33	https://www.exam.com/%B9485487952494836=63062877313?5.pdf
148	1991.1	4	26	34	https://www.exam.com/%B3481065127255326=42114437?1.pdf
149	1995.2	1	27	35	https://www.exam.com/%B2866691517825253=77032034?2.pdf
150	1993.2	2	28	36	https://www.exam.com/%B4994537115524674=7504209805?6.pdf
151	1992.2	1	29	37	https://www.exam.com/%B8566595934531435=5507307253?7.pdf
152	1979.1	4	6	38	https://www.exam.com/%B3733318807501731=71108631164?8.pdf
153	2012.2	2	4	39	https://www.exam.com/%B8886537545867274=62091439?7.pdf
154	2002.1	3	30	40	https://www.exam.com/%B4623637726272711=37061537?4.pdf
155	1998.2	4	31	41	https://www.exam.com/%B2391817929453674=32023202977?1.pdf
156	2006.2	4	32	42	https://www.exam.com/%B5282471708214383=5709284179?1.pdf
157	1971.1	2	33	43	https://www.exam.com/%B8664484519810643=5409155146?1.pdf
158	2017.1	2	34	44	https://www.exam.com/%B1101428265084698=4805837577?1.pdf
159	1978.2	2	35	45	https://www.exam.com/%B6531507221171281=3506142507?1.pdf
160	1973.1	2	36	46	https://www.exam.com/%B3443861663205728=7104600223?7.pdf
161	1975.1	2	37	47	https://www.exam.com/%B1218171812027725=2103435935?5.pdf
162	2000.2	5	38	48	https://www.exam.com/%B9828156345740351=86059927?4.pdf
163	1982.2	4	39	49	https://www.exam.com/%B8371811742572804=3410653776?5.pdf
164	2017.1	2	40	50	https://www.exam.com/%B4019194487251116=12041761310?9.pdf
165	1986.1	5	40	51	https://www.exam.com/%B2831242443073768=9012369954?4.pdf
166	2013.2	3	7	1	https://www.exam.com/%B4468122828646916=66021792523?8.pdf
167	1989.1	3	8	2	https://www.exam.com/%B2796355258881127=55125442?6.pdf
168	1985.2	2	3	3	https://www.exam.com/%B4286165462045843=7105885432?7.pdf
169	2006.2	5	41	3	https://www.exam.com/%B8182616868485121=65056755?5.pdf
170	2005.1	1	42	3	https://www.exam.com/%B2265764241117858=3210555821?3.pdf
171	1998.2	5	1	4	https://www.exam.com/%B7465452859477873=67097706296?8.pdf
172	2016.2	2	1	5	https://www.exam.com/%B6531334142562786=97091178?4.pdf
173	2017.1	3	1	6	https://www.exam.com/%B9881575535658466=4409548931?3.pdf
174	1973.2	2	9	7	https://www.exam.com/%B3494511702064119=30116892074?3.pdf
175	2018.1	2	10	8	https://www.exam.com/%B1302291824325279=05093129597?6.pdf
176	2019.1	2	2	9	https://www.exam.com/%B7978367478865523=42097683?8.pdf
177	2008.1	5	43	9	https://www.exam.com/%B8454336721521202=4807649864?7.pdf
178	1987.1	4	2	10	https://www.exam.com/%B2621194638177462=3611857979?4.pdf
179	2005.2	5	43	10	https://www.exam.com/%B4118874971182685=33126608?7.pdf
180	1981.2	3	1	11	https://www.exam.com/%B4387889832006313=98097101?9.pdf
181	2006.1	2	1	12	https://www.exam.com/%B2312132586683376=7810777171?3.pdf
182	1992.2	1	11	13	https://www.exam.com/%B5065438151330192=7608376819?6.pdf
183	2008.1	2	3	14	https://www.exam.com/%B3964396344044342=5211155643?5.pdf
184	2002.1	3	5	15	https://www.exam.com/%B5923580773659685=41087617356?1.pdf
185	1995.1	4	12	16	https://www.exam.com/%B2056052908786608=24109915?2.pdf
186	1988.2	3	13	17	https://www.exam.com/%B6146833262612468=4711743307?4.pdf
187	1987.2	2	14	18	https://www.exam.com/%B8627477658355373=1309306285?3.pdf
188	2000.2	1	15	19	https://www.exam.com/%B8547446528205713=3402672264?6.pdf
189	1992.2	2	16	20	https://www.exam.com/%B6566691682796187=3304458808?8.pdf
190	1976.1	2	1	21	https://www.exam.com/%B6201208131849440=37107145665?2.pdf
191	1999.1	3	17	22	https://www.exam.com/%B4845795688260533=4706196571?3.pdf
192	1983.2	5	18	23	https://www.exam.com/%B1766423154804564=3209292659?4.pdf
193	2000.2	4	5	24	https://www.exam.com/%B3363877588251256=67093151?2.pdf
194	2008.1	1	19	25	https://www.exam.com/%B7728061185971514=38101426?3.pdf
195	2018.1	2	20	26	https://www.exam.com/%B2708195860445744=78068503?9.pdf
196	1987.2	2	21	27	https://www.exam.com/%B5668124288312724=1905741976?4.pdf
197	1989.1	3	4	28	https://www.exam.com/%B9375707482791600=2901609874?3.pdf
198	2016.1	4	6	29	https://www.exam.com/%B3415845018933175=7809188323?7.pdf
199	1981.2	5	22	30	https://www.exam.com/%B2392227642437612=6102859116?6.pdf
200	2007.2	1	23	31	https://www.exam.com/%B8078387475644455=94079497? .pdf
201	1981.2	1	24	32	https://www.exam.com/%B6784433472454545=14038573094?6.pdf
202	2010.2	4	25	33	https://www.exam.com/%B1337017255948514=7305138437?7.pdf
203	1975.2	4	26	34	https://www.exam.com/%B6444058801221827=95031934?4.pdf
204	2002.1	1	27	35	https://www.exam.com/%B5233265589668754=8610132231?8.pdf
205	2004.2	2	28	36	https://www.exam.com/%B8647560572562379=73045228?6.pdf
206	2003.1	4	29	37	https://www.exam.com/%B6724867307857086=6108303983?1.pdf
207	2002.1	2	6	38	https://www.exam.com/%B2807076159683744=66111342?3.pdf
208	2018.2	4	4	39	https://www.exam.com/%B2285405175397722=3407824788?4.pdf
209	2001.1	3	30	40	https://www.exam.com/%B2150959166577372=3809536713?5.pdf
210	1990.1	2	31	41	https://www.exam.com/%B5820753231342439=6911169596?5.pdf
211	1993.1	3	32	42	https://www.exam.com/%B1816727886729674=5210139355?9.pdf
212	2010.2	3	33	43	https://www.exam.com/%B3191402950416891=91093833303?9.pdf
213	1995.2	3	34	44	https://www.exam.com/%B4252743030732648=9601520744?3.pdf
214	2016.1	2	35	45	https://www.exam.com/%B8326177568840484=8807958815?8.pdf
215	1991.1	2	36	46	https://www.exam.com/%B6682887551595755=6402489149?5.pdf
216	1981.1	1	37	47	https://www.exam.com/%B8236853549481090=33124804?1.pdf
217	2002.1	4	38	48	https://www.exam.com/%B8962763553288752=5303572435?6.pdf
218	1978.1	1	39	49	https://www.exam.com/%B4068737370271072=8908303432?3.pdf
219	2007.1	5	40	50	https://www.exam.com/%B4145463250595397=2608531325?6.pdf
220	1980.2	2	40	51	https://www.exam.com/%B1237535787670795=4808675853?5.pdf
221	1994.2	4	7	1	https://www.exam.com/%B5558885164668983=9209641142?1.pdf
222	2004.2	4	8	2	https://www.exam.com/%B1638503665762987=57073379?6.pdf
223	1980.1	5	3	3	https://www.exam.com/%B6541884084124236=91053682?4.pdf
224	1989.1	5	41	3	https://www.exam.com/%B8348221425173871=0209375499?6.pdf
225	2018.1	2	42	3	https://www.exam.com/%B1421883854105445=21082435432?3.pdf
226	2018.2	1	1	4	https://www.exam.com/%B4381501660981337=2707171250?8.pdf
227	2019.2	4	1	5	https://www.exam.com/%B1557162348439261=8911560339?3.pdf
228	2012.2	4	1	6	https://www.exam.com/%B1683067689326101=9609198808?8.pdf
229	2015.1	5	9	7	https://www.exam.com/%B7287682235318491=4210647160?6.pdf
230	1998.2	5	10	8	https://www.exam.com/%B4292452904757125=33022682?5.pdf
231	1986.1	2	2	9	https://www.exam.com/%B1953708031155574=65058193688?4.pdf
232	2001.1	4	43	9	https://www.exam.com/%B6872618381718696=6806733254?2.pdf
233	1987.1	3	2	10	https://www.exam.com/%B5064151103313536=6108291318?4.pdf
234	2009.1	5	43	10	https://www.exam.com/%B1961688541572321=8410231264?7.pdf
235	1988.2	2	1	11	https://www.exam.com/%B8514377853325601=57071945?8.pdf
236	1971.1	5	1	12	https://www.exam.com/%B8881214615575083=17103411699?8.pdf
237	1984.1	4	11	13	https://www.exam.com/%B5122652332431074=6111810866?4.pdf
238	2009.2	2	3	14	https://www.exam.com/%B7772941475143137=79014013999?7.pdf
239	2001.2	1	5	15	https://www.exam.com/%B2634794261054521=9806114821?7.pdf
240	1996.2	5	12	16	https://www.exam.com/%B7497077160996744=02125644?4.pdf
241	1979.1	4	13	17	https://www.exam.com/%B5779149747833065=4907247695?2.pdf
242	1975.1	3	14	18	https://www.exam.com/%B5726227667243622=4207763748?1.pdf
243	1976.2	1	15	19	https://www.exam.com/%B7370438867635370=61024574?2.pdf
244	2001.2	2	16	20	https://www.exam.com/%B4622537057416289=55017886?6.pdf
245	2010.2	2	1	21	https://www.exam.com/%B2413006260756783=49092884868?8.pdf
246	2001.1	2	17	22	https://www.exam.com/%B6941013465342216=3204745502?2.pdf
247	2000.1	1	18	23	https://www.exam.com/%B6228899802781715=58034662?2.pdf
248	1973.2	3	5	24	https://www.exam.com/%B3122733347433678=5012372974?3.pdf
249	2007.1	4	19	25	https://www.exam.com/%B4251571369114525=0402514505?7.pdf
250	1991.1	4	20	26	https://www.exam.com/%B2471784358056673=9803957929?3.pdf
251	2001.2	3	21	27	https://www.exam.com/%B5417225432208537=2205708160?4.pdf
252	1970.1	3	4	28	https://www.exam.com/%B7871498383416142=18096318?4.pdf
253	1990.1	3	6	29	https://www.exam.com/%B8385866957172870=35022414924?3.pdf
254	1996.1	3	22	30	https://www.exam.com/%B9537622963443295=77129956?5.pdf
255	1990.2	1	23	31	https://www.exam.com/%B6997882816733361=47107673006?6.pdf
256	2011.2	3	24	32	https://www.exam.com/%B9598776067138866=19065936?6.pdf
257	2002.2	4	25	33	https://www.exam.com/%B4470874336347995=8603686502?1.pdf
258	1993.1	5	26	34	https://www.exam.com/%B7289513283948633=4608945951?1.pdf
259	2019.1	3	27	35	https://www.exam.com/%B7135882661125234=10119291834?3.pdf
260	1975.1	3	28	36	https://www.exam.com/%B9458367332294815=1307177964?4.pdf
261	1984.2	4	29	37	https://www.exam.com/%B2824856347566583=5810583659?2.pdf
262	1991.1	4	6	38	https://www.exam.com/%B8142776477556127=8107399735?1.pdf
263	1975.2	3	4	39	https://www.exam.com/%B2177331899036333=63064506? .pdf
264	2018.1	3	30	40	https://www.exam.com/%B9862313243983816=0302985720?9.pdf
265	1995.2	2	31	41	https://www.exam.com/%B5665521358807815=23043823?8.pdf
266	1994.1	4	32	42	https://www.exam.com/%B7776217054603155=46101484?8.pdf
267	1981.1	1	33	43	https://www.exam.com/%B2635215714220245=96111913?4.pdf
268	2006.1	3	34	44	https://www.exam.com/%B3672278387212611=9510629456?4.pdf
269	2019.1	5	35	45	https://www.exam.com/%B5958960357821958=2707326412?9.pdf
270	2016.1	4	36	46	https://www.exam.com/%B2875146024435456=89064524?5.pdf
271	2010.2	3	37	47	https://www.exam.com/%B4669328768060089=5502840347?1.pdf
272	2003.2	4	38	48	https://www.exam.com/%B8626356469215832=45021523?8.pdf
273	1981.2	3	39	49	https://www.exam.com/%B5282706457393638=47031781?2.pdf
274	1987.1	5	40	50	https://www.exam.com/%B8684997318449743=81042811697?2.pdf
275	2006.2	1	40	51	https://www.exam.com/%B7845717076455188=10014081?4.pdf
276	1984.1	2	7	1	https://www.exam.com/%B4418422257663762=17021617001?5.pdf
277	1997.2	5	8	2	https://www.exam.com/%B7724782160562564=9306429308?2.pdf
278	2001.2	1	3	3	https://www.exam.com/%B8360533583766720=17091157?9.pdf
279	2012.2	2	41	3	https://www.exam.com/%B4172360443133376=32049822?7.pdf
280	1995.2	2	42	3	https://www.exam.com/%B4590609092163723=3310173298?8.pdf
281	1998.2	4	1	4	https://www.exam.com/%B8034876570741271=57084889542?2.pdf
282	1982.1	2	1	5	https://www.exam.com/%B8187574788255261=2605886394? .pdf
283	1998.2	5	1	6	https://www.exam.com/%B4242586581771549=9706113303? .pdf
284	1997.1	4	9	7	https://www.exam.com/%B5186554968763114=4203278860?4.pdf
285	1973.2	2	10	8	https://www.exam.com/%B1162864636092871=0012948896? .pdf
286	1991.2	3	2	9	https://www.exam.com/%B8226014522388461=7506968573?8.pdf
287	2015.1	4	43	9	https://www.exam.com/%B3443361394366127=1910570440?9.pdf
288	1975.1	2	2	10	https://www.exam.com/%B8583242447323214=1611453266?6.pdf
289	2010.1	5	43	10	https://www.exam.com/%B5537568289630531=37079308?4.pdf
290	1975.1	4	1	11	https://www.exam.com/%B1602682164888631=6311655823?8.pdf
291	1980.2	2	1	12	https://www.exam.com/%B3262405047667872=41058507?2.pdf
292	1980.1	4	11	13	https://www.exam.com/%B3112537274154991=7111493823?1.pdf
293	2003.2	5	3	14	https://www.exam.com/%B9692818825100144=7407810248?8.pdf
294	1998.2	2	5	15	https://www.exam.com/%B4047843148277761=6410517439? .pdf
295	2011.2	4	12	16	https://www.exam.com/%B7764945518211633=19053435?7.pdf
296	1995.1	3	13	17	https://www.exam.com/%B9316350663424864=61076764?4.pdf
297	1987.1	2	14	18	https://www.exam.com/%B9909466811537723=9105431260?3.pdf
298	1995.1	2	15	19	https://www.exam.com/%B5135754244930688=17077026807?8.pdf
299	1983.1	2	16	20	https://www.exam.com/%B4011571596221354=42114168436?6.pdf
300	2014.1	3	1	21	https://www.exam.com/%B5278169277635623=20044839?1.pdf
301	2004.1	2	17	22	https://www.exam.com/%B8428676235268565=4603390543?5.pdf
302	1980.1	4	18	23	https://www.exam.com/%B8347461626811029=0106182941?4.pdf
303	1993.2	3	5	24	https://www.exam.com/%B4981318712477633=0410159300?4.pdf
304	2013.2	1	19	25	https://www.exam.com/%B5775681197719580=53091478690?5.pdf
305	1988.1	2	20	26	https://www.exam.com/%B2290993170393563=46023957360?1.pdf
306	2014.1	2	21	27	https://www.exam.com/%B4104452061710458=52047223365?1.pdf
307	1983.1	4	4	28	https://www.exam.com/%B2721753210322675=8109557729? .pdf
308	2013.2	2	6	29	https://www.exam.com/%B2510546022216122=02025378284?4.pdf
309	1983.2	2	22	30	https://www.exam.com/%B9184337428052711=59107622? .pdf
310	2003.1	5	23	31	https://www.exam.com/%B9645747616312891=3512232628?9.pdf
311	1975.2	2	24	32	https://www.exam.com/%B6644356435632629=2908972207?2.pdf
312	2014.1	2	25	33	https://www.exam.com/%B5883687264479480=74037285?1.pdf
313	2016.2	3	26	34	https://www.exam.com/%B8622298568667866=7603116820?7.pdf
314	1990.2	5	27	35	https://www.exam.com/%B5059771387261529=1408757700?5.pdf
315	2007.2	4	28	36	https://www.exam.com/%B7165182392737772=41095095?4.pdf
316	1981.1	4	29	37	https://www.exam.com/%B2108959629287245=13111447?3.pdf
317	2009.1	5	6	38	https://www.exam.com/%B3362983735002822=4603480687? .pdf
318	1972.2	1	4	39	https://www.exam.com/%B2741533817833791=33026382?2.pdf
319	1977.1	2	30	40	https://www.exam.com/%B6626862290211666=7701514804?6.pdf
320	2004.1	2	31	41	https://www.exam.com/%B4848260145155533=53116729531? .pdf
321	2015.1	5	32	42	https://www.exam.com/%B3828865856937348=4901291578?3.pdf
322	1993.1	1	33	43	https://www.exam.com/%B5366733547186496=1507753294?2.pdf
323	1981.2	5	34	44	https://www.exam.com/%B8717784184761902=81025993?1.pdf
324	2008.2	4	35	45	https://www.exam.com/%B8541430635972435=6504247575?8.pdf
325	2018.2	2	36	46	https://www.exam.com/%B4433285365571534=16049344317?4.pdf
326	1974.1	2	37	47	https://www.exam.com/%B7660150284224987=39071431668? .pdf
327	1975.1	5	38	48	https://www.exam.com/%B5692842212342239=04071215820?2.pdf
328	2004.1	3	39	49	https://www.exam.com/%B6572124492048179=7406632341?7.pdf
329	1993.1	2	40	50	https://www.exam.com/%B4143341478001301=28056907431?4.pdf
330	1976.2	3	40	51	https://www.exam.com/%B9382337844485416=4905573575?2.pdf
331	1999.2	4	7	1	https://www.exam.com/%B3696898518378136=0503772790?9.pdf
332	1972.2	1	8	2	https://www.exam.com/%B2161544253876456=0606233957?9.pdf
333	1979.1	5	3	3	https://www.exam.com/%B1675019696111551=91025299967? .pdf
334	2004.1	2	41	3	https://www.exam.com/%B8463329608244834=18087455941?6.pdf
335	1999.2	5	42	3	https://www.exam.com/%B9703835547755026=73041557433?2.pdf
336	1971.1	2	1	4	https://www.exam.com/%B8578599513584538=7011662779?7.pdf
337	1989.2	2	1	5	https://www.exam.com/%B2708783837767813=21109925?2.pdf
338	2000.2	2	1	6	https://www.exam.com/%B5287211571242484=93057398132?5.pdf
339	2018.2	4	9	7	https://www.exam.com/%B9136725733611787=50064446?1.pdf
340	2001.1	4	10	8	https://www.exam.com/%B2858676610286532=3504184304?6.pdf
341	2008.2	3	2	9	https://www.exam.com/%B6337474201855872=91022606?1.pdf
342	1976.1	3	43	9	https://www.exam.com/%B8178682663155957=5709407394?8.pdf
343	1978.2	1	2	10	https://www.exam.com/%B8912754813283777=89019415?5.pdf
344	1973.2	2	43	10	https://www.exam.com/%B4355053685353855=5007938830?4.pdf
345	2004.2	1	1	11	https://www.exam.com/%B2104634603402735=5901164990?4.pdf
346	1997.2	3	1	12	https://www.exam.com/%B2212456474197232=46052498? .pdf
347	2011.2	5	11	13	https://www.exam.com/%B4711054883576052=46088442?5.pdf
348	1979.1	2	3	14	https://www.exam.com/%B3245585857044316=1505280545?1.pdf
349	2019.2	2	5	15	https://www.exam.com/%B2851287239267647=9811400892?1.pdf
350	2008.2	3	12	16	https://www.exam.com/%B2883613336427587=0402178611?3.pdf
351	2002.2	3	13	17	https://www.exam.com/%B4783918464624392=74083207857?5.pdf
352	1976.2	5	14	18	https://www.exam.com/%B8823865674153014=3907234175?7.pdf
353	1974.1	3	15	19	https://www.exam.com/%B6190300223171824=33051822?3.pdf
354	1993.2	2	16	20	https://www.exam.com/%B3245777553024838=33067912360?2.pdf
355	1999.1	1	1	21	https://www.exam.com/%B5572435657645593=7302695114?5.pdf
356	2008.2	2	17	22	https://www.exam.com/%B4551687545208544=07108189941?5.pdf
357	2003.1	5	18	23	https://www.exam.com/%B2431446786402156=7602902534?5.pdf
358	2002.2	1	5	24	https://www.exam.com/%B6343598237335203=68026306?3.pdf
359	1983.1	2	19	25	https://www.exam.com/%B4155677341420651=59026653?3.pdf
360	1975.2	3	20	26	https://www.exam.com/%B7340212213283752=3708311401?6.pdf
361	1984.2	2	21	27	https://www.exam.com/%B7977383618311034=52016679?4.pdf
362	1999.2	2	4	28	https://www.exam.com/%B2366683206785874=8209362465?1.pdf
363	1998.1	5	6	29	https://www.exam.com/%B3566618121191734=95104774?3.pdf
364	1992.2	1	22	30	https://www.exam.com/%B7581767238002282=8204562145?4.pdf
365	2014.1	1	23	31	https://www.exam.com/%B9610035575261738=26065378?8.pdf
366	2013.2	1	24	32	https://www.exam.com/%B8577668333925026=07075142?8.pdf
367	2006.2	3	25	33	https://www.exam.com/%B7383733215414612=5703248631?6.pdf
368	1972.2	2	26	34	https://www.exam.com/%B3714676932661809=9611269517?5.pdf
369	1977.1	4	27	35	https://www.exam.com/%B5794488848492036=5710502747?4.pdf
370	2020.2	5	28	36	https://www.exam.com/%B4754481357308666=6610322544?3.pdf
371	1984.1	5	29	37	https://www.exam.com/%B5511667249576170=60059476?2.pdf
372	1992.1	3	6	38	https://www.exam.com/%B4651403225105965=6211796663?4.pdf
373	1997.2	1	4	39	https://www.exam.com/%B4743883873157192=6203915427?4.pdf
374	2006.2	2	30	40	https://www.exam.com/%B9976435144336212=44052681?7.pdf
375	1993.2	2	31	41	https://www.exam.com/%B3249086188025641=1003686690?4.pdf
376	2013.2	4	32	42	https://www.exam.com/%B6538528854697455=23067632?2.pdf
377	1977.2	3	33	43	https://www.exam.com/%B6011586429346571=42021378598?4.pdf
378	1985.2	4	34	44	https://www.exam.com/%B6167544217352129=4811470787?9.pdf
379	2002.2	1	35	45	https://www.exam.com/%B5644166556165592=82126648?2.pdf
380	1973.1	4	36	46	https://www.exam.com/%B5571325467214266=6909547165?1.pdf
381	1976.2	4	37	47	https://www.exam.com/%B2778262242142858=47107871367?3.pdf
382	1986.2	2	38	48	https://www.exam.com/%B2571717251293357=08113666905?4.pdf
383	2019.2	2	39	49	https://www.exam.com/%B6309416705661857=21033929639?3.pdf
384	1979.2	5	40	50	https://www.exam.com/%B1273535736956035=16054741910?2.pdf
385	2010.1	3	40	51	https://www.exam.com/%B6657386931123501=5602208747?2.pdf
386	1982.2	2	7	1	https://www.exam.com/%B4626641319955288=69052592300?1.pdf
387	1981.1	3	8	2	https://www.exam.com/%B5752232112780733=54094635889?9.pdf
388	1993.2	3	3	3	https://www.exam.com/%B7281634234925742=61096234?9.pdf
389	2006.2	5	41	3	https://www.exam.com/%B7198636471575772=22052298867?8.pdf
390	1984.1	2	42	3	https://www.exam.com/%B8735690862574205=1705574503?1.pdf
391	1978.1	4	1	4	https://www.exam.com/%B2361630459693219=59065817?1.pdf
392	1998.1	3	1	5	https://www.exam.com/%B7837627289848849=4602902721?5.pdf
393	2017.2	3	1	6	https://www.exam.com/%B8174515384684375=1602513885?2.pdf
394	2004.2	4	9	7	https://www.exam.com/%B9128409893875824=2203263656?3.pdf
395	1980.2	3	10	8	https://www.exam.com/%B2775077147563374=00062086932?1.pdf
396	2017.2	5	2	9	https://www.exam.com/%B6141685875540302=10115941206?7.pdf
397	1991.2	3	43	9	https://www.exam.com/%B8015316617032419=8805331708?3.pdf
398	1990.2	3	2	10	https://www.exam.com/%B8614366875483538=68119605?8.pdf
399	1972.2	3	43	10	https://www.exam.com/%B3973886614188848=8007477225?7.pdf
400	1982.1	3	1	11	https://www.exam.com/%B1387504961329428=2903148870?8.pdf
401	1982.2	4	1	12	https://www.exam.com/%B2576033187628264=74016638?7.pdf
402	1998.1	4	11	13	https://www.exam.com/%B3228153572785947=9206628622?3.pdf
403	1981.2	1	3	14	https://www.exam.com/%B6201807538488753=4010604910?4.pdf
404	1993.1	5	5	15	https://www.exam.com/%B3141756602596137=8006231767? .pdf
405	1997.2	3	12	16	https://www.exam.com/%B3665584149008501=74084925? .pdf
406	2011.2	2	13	17	https://www.exam.com/%B5188183374529756=47106939?7.pdf
407	1986.1	3	14	18	https://www.exam.com/%B8855508174094271=89091847?5.pdf
408	1995.2	3	15	19	https://www.exam.com/%B5454312361516875=16098017268?7.pdf
409	2008.2	3	16	20	https://www.exam.com/%B3904337541256418=3304390439?3.pdf
410	2013.2	3	1	21	https://www.exam.com/%B9285770359510111=8607278628?6.pdf
411	2009.1	2	17	22	https://www.exam.com/%B6379917646647177=7806801898?4.pdf
412	2010.2	3	18	23	https://www.exam.com/%B7856346714819532=5808985985?2.pdf
413	1986.1	1	5	24	https://www.exam.com/%B3002027665835154=07089534?3.pdf
414	2002.1	3	19	25	https://www.exam.com/%B3879756227346195=5009661503?4.pdf
415	2018.1	4	20	26	https://www.exam.com/%B2303385626542021=78092565?5.pdf
416	1976.1	2	21	27	https://www.exam.com/%B4331644019348532=35025018?7.pdf
417	2009.1	2	4	28	https://www.exam.com/%B5373068148477797=70059759774?3.pdf
418	2006.2	1	6	29	https://www.exam.com/%B3767367685546642=64045663?6.pdf
419	2019.2	1	22	30	https://www.exam.com/%B4068838528785145=2708998890?2.pdf
420	1992.2	5	23	31	https://www.exam.com/%B9297523557462777=13084378?3.pdf
421	2009.1	3	24	32	https://www.exam.com/%B4304595266184747=1802134292?2.pdf
422	1976.2	2	25	33	https://www.exam.com/%B1161185849288505=35107726626?4.pdf
423	1983.1	5	26	34	https://www.exam.com/%B3333314896937888=14068775?8.pdf
424	1983.2	2	27	35	https://www.exam.com/%B3734181256241189=4501259963?5.pdf
425	1987.2	3	28	36	https://www.exam.com/%B1533042536371632=0508239370?4.pdf
426	1980.2	4	29	37	https://www.exam.com/%B2534575572333998=0109476152?3.pdf
427	2002.1	3	6	38	https://www.exam.com/%B3573059413773433=20036762149?7.pdf
428	2016.2	2	4	39	https://www.exam.com/%B6134664739314873=82038903? .pdf
429	1980.2	3	30	40	https://www.exam.com/%B5625034881967414=65044013?1.pdf
430	2005.1	2	31	41	https://www.exam.com/%B2944859973702697=7607573640?2.pdf
431	1984.1	3	32	42	https://www.exam.com/%B5308342884242982=5310430561?3.pdf
432	1976.2	2	33	43	https://www.exam.com/%B4300669631438356=79022696237?8.pdf
433	1987.1	4	34	44	https://www.exam.com/%B7433855558951754=0105783147?3.pdf
434	1992.2	2	35	45	https://www.exam.com/%B2705731275381882=9708871657?1.pdf
435	1974.2	5	36	46	https://www.exam.com/%B7314814617786254=33074573?1.pdf
436	2012.2	4	37	47	https://www.exam.com/%B7431261864066486=5306750547?6.pdf
437	2018.2	4	38	48	https://www.exam.com/%B3724586592357438=6610924758?3.pdf
438	2011.1	4	39	49	https://www.exam.com/%B7397945210921541=3109719281?3.pdf
439	1985.2	3	40	50	https://www.exam.com/%B8373103886886400=23039205668?6.pdf
440	2006.1	2	40	51	https://www.exam.com/%B4987502814395613=41051198?8.pdf
441	1979.1	4	7	1	https://www.exam.com/%B6282368100120231=26085614020?5.pdf
442	1975.2	1	8	2	https://www.exam.com/%B1847629787631224=3002449973?2.pdf
443	1973.1	3	3	3	https://www.exam.com/%B7026437834428768=32118905?2.pdf
444	1984.2	2	41	3	https://www.exam.com/%B3297686574785826=3203941850?6.pdf
445	1975.1	2	42	3	https://www.exam.com/%B2515155538296193=32101304730?5.pdf
446	2010.2	3	1	4	https://www.exam.com/%B4672141288144241=81037772?2.pdf
447	2011.1	1	1	5	https://www.exam.com/%B2164546925812137=0804376170?6.pdf
448	1986.1	2	1	6	https://www.exam.com/%B7643915632468115=41062852?8.pdf
449	1983.1	2	9	7	https://www.exam.com/%B2472407326681636=44084442?2.pdf
450	1989.2	2	10	8	https://www.exam.com/%B8366593606651924=96056507312?7.pdf
451	2015.2	3	2	9	https://www.exam.com/%B5034534065180545=8903456515?1.pdf
452	1993.2	4	43	9	https://www.exam.com/%B8666678979474416=57122176479?2.pdf
453	2002.1	3	2	10	https://www.exam.com/%B4525123333662921=7910349940?3.pdf
454	1981.1	5	43	10	https://www.exam.com/%B4694611775053430=3509324648?5.pdf
455	1983.1	4	1	11	https://www.exam.com/%B7570530559219696=94057626?1.pdf
456	1989.2	4	1	12	https://www.exam.com/%B5115202033463231=1902793313?4.pdf
457	2006.1	3	11	13	https://www.exam.com/%B4138885334835238=96109651639?3.pdf
458	2013.1	4	3	14	https://www.exam.com/%B4758324813680114=59055388?3.pdf
459	2007.2	4	5	15	https://www.exam.com/%B7701829477477126=1110588886?8.pdf
460	2017.2	3	12	16	https://www.exam.com/%B3365528122201843=9106137490? .pdf
461	1991.2	4	13	17	https://www.exam.com/%B6150741398348435=8105451468?3.pdf
462	1980.2	2	14	18	https://www.exam.com/%B7351872784726160=94029671838?1.pdf
463	1998.1	3	15	19	https://www.exam.com/%B1317410205097950=2503641947?6.pdf
464	2001.2	4	16	20	https://www.exam.com/%B7574596588320316=01127893?3.pdf
465	2017.1	3	1	21	https://www.exam.com/%B3118338865000273=07077843?6.pdf
466	1992.2	3	17	22	https://www.exam.com/%B7854562798309627=5507268270?7.pdf
467	1982.2	3	18	23	https://www.exam.com/%B1237091416641565=75117234?3.pdf
468	2012.1	4	5	24	https://www.exam.com/%B5061241538626636=4701839239?8.pdf
469	1976.2	3	19	25	https://www.exam.com/%B9647302676598715=14044535? .pdf
470	2006.1	2	20	26	https://www.exam.com/%B4843440217122888=18038064?8.pdf
471	1983.2	2	21	27	https://www.exam.com/%B8458675324022847=07094383?2.pdf
472	1990.2	3	4	28	https://www.exam.com/%B8161354522150922=72117654?3.pdf
473	1997.1	1	6	29	https://www.exam.com/%B7459698669522583=14075241704?3.pdf
474	1973.2	4	22	30	https://www.exam.com/%B3667747208132742=76105127532?3.pdf
475	1976.2	5	23	31	https://www.exam.com/%B8814739722383197=5310812876?8.pdf
476	2006.1	2	24	32	https://www.exam.com/%B5369309863068723=53107658?7.pdf
477	2005.2	3	25	33	https://www.exam.com/%B8151541510086667=15049427514?8.pdf
478	1984.2	3	26	34	https://www.exam.com/%B8082741586333243=4005289399?2.pdf
479	1998.2	1	27	35	https://www.exam.com/%B3776481858556613=8905442784?1.pdf
480	2014.2	1	28	36	https://www.exam.com/%B4124834241074305=6303621205?9.pdf
481	2019.2	3	29	37	https://www.exam.com/%B6626288714201371=11083818?6.pdf
482	1984.2	3	6	38	https://www.exam.com/%B9438661188697514=9708216534?2.pdf
483	1994.2	3	4	39	https://www.exam.com/%B3545185617884883=32104952756?3.pdf
484	2016.1	1	30	40	https://www.exam.com/%B6167969561561648=52064731?1.pdf
485	1997.1	2	31	41	https://www.exam.com/%B3271377708833258=18057583?7.pdf
486	2000.2	4	32	42	https://www.exam.com/%B4188463161986032=93082667370?1.pdf
487	2012.1	3	33	43	https://www.exam.com/%B5060367828470458=9401757285?2.pdf
488	2000.2	1	34	44	https://www.exam.com/%B1386726121364455=6604878371?7.pdf
489	1992.2	3	35	45	https://www.exam.com/%B4989727352672764=86098894?7.pdf
490	1973.1	2	36	46	https://www.exam.com/%B5398927062856227=76095348?1.pdf
491	1988.2	4	37	47	https://www.exam.com/%B6855151310457837=18034128716?4.pdf
492	1995.2	4	38	48	https://www.exam.com/%B2189476489465585=6009151412?8.pdf
493	2006.1	2	39	49	https://www.exam.com/%B8724872328177485=12079799534?4.pdf
494	2000.1	3	40	50	https://www.exam.com/%B4717538236166309=7511958200?9.pdf
495	1976.1	4	40	51	https://www.exam.com/%B6774247360357681=39049017681?3.pdf
496	2007.2	2	7	1	https://www.exam.com/%B5822154318885865=3710183837?4.pdf
497	1987.2	2	8	2	https://www.exam.com/%B9222287831527386=8002344113?4.pdf
498	2002.2	5	3	3	https://www.exam.com/%B4844954969665787=96085806?1.pdf
499	2011.2	2	41	3	https://www.exam.com/%B3041834621669462=56085745993?6.pdf
500	2013.2	3	42	3	https://www.exam.com/%B3711277477795629=8311974394?3.pdf
501	2007.2	4	7	1	https://www.exam.com/%B4973204166897328=3011174834?4.pdf
502	2004.1	4	8	2	https://www.exam.com/%B1092102037521448=0108241170?8.pdf
503	1985.2	3	3	3	https://www.exam.com/%B6462098033183417=40072829422?3.pdf
504	1995.1	1	41	3	https://www.exam.com/%B4257963292296814=9508797682?2.pdf
505	1972.2	2	42	3	https://www.exam.com/%B4463872151812485=4211832471?6.pdf
506	2007.1	3	1	4	https://www.exam.com/%B2530566212885549=29074116313?3.pdf
507	1993.1	4	1	5	https://www.exam.com/%B2406045674681763=5407155940?2.pdf
508	1988.1	3	1	6	https://www.exam.com/%B7803083362446763=5704633181?7.pdf
509	1986.1	5	9	7	https://www.exam.com/%B7702881521331210=4903947260?8.pdf
510	2018.1	2	10	8	https://www.exam.com/%B2251713084126357=9209571241?4.pdf
511	1997.1	5	2	9	https://www.exam.com/%B2115418562567345=02109571578?7.pdf
512	2015.1	4	43	9	https://www.exam.com/%B9525749642945776=4804556990?4.pdf
513	1975.1	2	2	10	https://www.exam.com/%B9742768756144616=6308379576?2.pdf
514	2000.2	2	43	10	https://www.exam.com/%B4822785868716442=15094026? .pdf
515	1972.2	3	1	11	https://www.exam.com/%B2811680564886586=1411878543?7.pdf
516	2005.2	1	1	12	https://www.exam.com/%B4152348105657402=9610199370?1.pdf
517	1975.2	3	11	13	https://www.exam.com/%B6316112276125466=51026767?7.pdf
518	1983.2	3	3	14	https://www.exam.com/%B7108039514145881=7712694849?8.pdf
519	1997.2	4	5	15	https://www.exam.com/%B3334641216019242=1502546646?8.pdf
520	1998.1	4	12	16	https://www.exam.com/%B6441354355407346=5907963130?1.pdf
521	1992.2	4	13	17	https://www.exam.com/%B2493214441727553=48064573369?5.pdf
522	1993.1	2	14	18	https://www.exam.com/%B4460516788482063=7607560326?7.pdf
523	1976.1	3	15	19	https://www.exam.com/%B2394013552941796=05101751?8.pdf
524	1988.1	2	16	20	https://www.exam.com/%B5113469263465089=60104685?7.pdf
525	1979.1	5	1	21	https://www.exam.com/%B7511413638971883=44113398?3.pdf
526	2006.1	3	17	22	https://www.exam.com/%B4752797336737318=71121864875?9.pdf
527	1993.1	2	18	23	https://www.exam.com/%B5133855806265197=7308923797?6.pdf
528	1991.2	2	5	24	https://www.exam.com/%B7362544781753861=96107292820? .pdf
529	2010.1	3	19	25	https://www.exam.com/%B3878884653302287=37031333?8.pdf
530	1983.1	2	20	26	https://www.exam.com/%B2292462323680635=37058721?6.pdf
531	2016.2	3	21	27	https://www.exam.com/%B9351212701263883=9710374826?1.pdf
532	2012.2	4	4	28	https://www.exam.com/%B3552160587667225=5910846895?6.pdf
533	1998.1	4	6	29	https://www.exam.com/%B8089775261281791=38086663?5.pdf
534	2016.2	3	22	30	https://www.exam.com/%B3155253581611929=1308808941?9.pdf
535	2011.1	4	23	31	https://www.exam.com/%B8376561786531678=9304622313?2.pdf
536	1996.1	4	24	32	https://www.exam.com/%B3181737247379034=0404891442?2.pdf
537	1984.1	1	25	33	https://www.exam.com/%B8402887269973024=16083973?3.pdf
538	2001.2	1	26	34	https://www.exam.com/%B2577349041242853=3212698226?5.pdf
539	2017.2	1	27	35	https://www.exam.com/%B5085232885881297=2606311808?1.pdf
540	2010.1	5	28	36	https://www.exam.com/%B5938934856243561=3908887288? .pdf
541	1974.2	5	29	37	https://www.exam.com/%B5705976898713814=90025061660?1.pdf
542	1991.1	1	6	38	https://www.exam.com/%B6243366605396051=1006679993?6.pdf
543	1986.1	2	4	39	https://www.exam.com/%B8211386544557209=57073198512?7.pdf
544	1996.2	3	30	40	https://www.exam.com/%B9929467456686656=33024873?3.pdf
545	1987.1	3	31	41	https://www.exam.com/%B3112347658270664=5904166220?1.pdf
546	1990.1	4	32	42	https://www.exam.com/%B7887385771123730=3510143770?4.pdf
547	1976.1	5	33	43	https://www.exam.com/%B2576226726180933=78093156?1.pdf
548	1995.2	4	34	44	https://www.exam.com/%B3867724424378839=3206134524?3.pdf
549	1984.1	4	35	45	https://www.exam.com/%B3587163850721533=09105393?6.pdf
550	1993.2	3	36	46	https://www.exam.com/%B4115464612169951=31088553?6.pdf
551	1979.2	2	37	47	https://www.exam.com/%B8624327616284257=2210976535? .pdf
552	1999.2	3	38	48	https://www.exam.com/%B5741768866807398=20099779?3.pdf
553	1985.1	1	39	49	https://www.exam.com/%B3382282655232442=22086445?6.pdf
554	2006.2	4	40	50	https://www.exam.com/%B8473458603957383=7008719962?3.pdf
555	1977.2	4	40	51	https://www.exam.com/%B3126848131954375=4509198181?3.pdf
556	2011.2	3	7	1	https://www.exam.com/%B6206250648847363=4402210385?6.pdf
557	2006.2	3	8	2	https://www.exam.com/%B5531487360586781=64118684779?7.pdf
558	2019.1	3	3	3	https://www.exam.com/%B3957079839246666=0103870219?2.pdf
559	2006.2	2	41	3	https://www.exam.com/%B1557641188524431=8103824245?5.pdf
560	2000.1	5	42	3	https://www.exam.com/%B3070675485532051=62087373?7.pdf
561	1976.1	1	1	4	https://www.exam.com/%B2017441764444283=07059952907?7.pdf
562	2009.2	1	1	5	https://www.exam.com/%B6473883103375832=82067816?2.pdf
563	1986.1	4	1	6	https://www.exam.com/%B8932421427851528=7902128529?6.pdf
564	2020.2	2	9	7	https://www.exam.com/%B6681261353542648=9507143281? .pdf
565	1985.2	4	10	8	https://www.exam.com/%B5554663853183344=13055105121?3.pdf
566	1977.1	4	2	9	https://www.exam.com/%B6682746567324468=81063035220?7.pdf
567	1989.2	2	43	9	https://www.exam.com/%B4864978167930208=40069317043?9.pdf
568	2019.1	1	2	10	https://www.exam.com/%B1940211276884582=60113652578?3.pdf
569	2012.1	3	43	10	https://www.exam.com/%B2248173608554544=9409891150?7.pdf
570	2014.1	2	1	11	https://www.exam.com/%B8344471668282334=68038348?3.pdf
571	1994.1	4	1	12	https://www.exam.com/%B8214417191137651=9505966658?1.pdf
572	1982.1	4	11	13	https://www.exam.com/%B3277745946858281=8101176329?7.pdf
573	1974.1	3	3	14	https://www.exam.com/%B6778163860421355=8203838491?1.pdf
574	2018.2	3	5	15	https://www.exam.com/%B2238102972460062=20108604?8.pdf
575	2000.2	4	12	16	https://www.exam.com/%B1544358688626474=45103294876?5.pdf
576	2005.1	1	13	17	https://www.exam.com/%B6664861717643131=7707437575? .pdf
577	2001.2	3	14	18	https://www.exam.com/%B4147662735471718=7702351165?1.pdf
578	2015.1	4	15	19	https://www.exam.com/%B5734523642058024=17114253323?8.pdf
579	2019.1	4	16	20	https://www.exam.com/%B9935214175737564=7306276307?1.pdf
580	1979.1	4	1	21	https://www.exam.com/%B9086683324510783=7805188659?7.pdf
581	1994.2	3	17	22	https://www.exam.com/%B7034911842082530=8710823365?8.pdf
582	1985.1	2	18	23	https://www.exam.com/%B2224746415506986=22042837278?7.pdf
583	1974.1	2	5	24	https://www.exam.com/%B6323541390634714=42113679848?8.pdf
584	1991.1	5	19	25	https://www.exam.com/%B8348576370453732=1510279276?4.pdf
585	2012.2	5	20	26	https://www.exam.com/%B3730878258927902=6206522179?8.pdf
586	2011.2	2	21	27	https://www.exam.com/%B3228686616148765=08122075?5.pdf
587	1986.1	4	4	28	https://www.exam.com/%B6460561437222795=2705670724?2.pdf
588	1980.1	2	6	29	https://www.exam.com/%B2682798263584321=99103968?1.pdf
589	1993.2	3	22	30	https://www.exam.com/%B1097028345727847=8803216332?6.pdf
590	1989.2	1	23	31	https://www.exam.com/%B2567734114344090=12015808302?4.pdf
591	2019.2	5	24	32	https://www.exam.com/%B5253263822681456=15013647?6.pdf
592	1974.1	2	25	33	https://www.exam.com/%B1342294222876325=37061692?7.pdf
593	2012.1	1	26	34	https://www.exam.com/%B1866368667384454=5003626784?9.pdf
594	2000.2	3	27	35	https://www.exam.com/%B6157576274682983=7711981211?8.pdf
595	1988.2	2	28	36	https://www.exam.com/%B5313268323552304=7910233623?2.pdf
596	2004.2	4	29	37	https://www.exam.com/%B3786083772224458=8605356747?3.pdf
597	1974.2	5	6	38	https://www.exam.com/%B5367117142230246=65073802?9.pdf
598	2004.1	5	4	39	https://www.exam.com/%B7358055368664786=43049998? .pdf
599	2003.1	3	30	40	https://www.exam.com/%B6184045223543572=17029966?1.pdf
600	1987.2	5	31	41	https://www.exam.com/%B4858560341375944=89105001?4.pdf
601	2005.2	3	32	42	https://www.exam.com/%B3839313875708110=01068522157?7.pdf
602	2002.1	3	33	43	https://www.exam.com/%B6472750131551652=0304562405?1.pdf
603	2009.1	3	34	44	https://www.exam.com/%B7633863760761194=7404174996?7.pdf
604	1995.1	1	35	45	https://www.exam.com/%B7512046712479523=5812152690?1.pdf
605	2016.1	2	36	46	https://www.exam.com/%B8101863928577101=4204402679?8.pdf
606	2003.1	2	37	47	https://www.exam.com/%B8225662414670553=85121649329?5.pdf
607	2015.1	1	38	48	https://www.exam.com/%B9669267532968745=8904632536?5.pdf
608	1991.1	3	39	49	https://www.exam.com/%B2374173574861949=37021713? .pdf
609	1979.1	3	40	50	https://www.exam.com/%B4222723264433587=14093865827?3.pdf
610	1996.2	3	40	51	https://www.exam.com/%B3872225786606398=43102638630?9.pdf
611	1996.1	4	7	1	https://www.exam.com/%B3068140455470468=85036963?2.pdf
612	1979.2	2	8	2	https://www.exam.com/%B5171256172424554=11081675?7.pdf
613	1973.2	3	3	3	https://www.exam.com/%B5385777116463654=4107145129?1.pdf
614	2008.2	3	41	3	https://www.exam.com/%B7972673676243164=2511962804?1.pdf
615	2011.1	2	42	3	https://www.exam.com/%B6733675343629262=59107352046?2.pdf
616	1982.1	1	1	4	https://www.exam.com/%B5354721977545647=33072392328?1.pdf
617	1985.1	2	1	5	https://www.exam.com/%B4944263385058185=42094263?5.pdf
618	2007.1	2	1	6	https://www.exam.com/%B5366194943063722=4602383568?3.pdf
619	1997.1	2	9	7	https://www.exam.com/%B5546986872561411=4105306214?6.pdf
620	1999.2	2	10	8	https://www.exam.com/%B9068128661818772=9002712806?6.pdf
621	2003.2	1	2	9	https://www.exam.com/%B2830653264734298=53058906820?8.pdf
622	2010.2	2	43	9	https://www.exam.com/%B5273399870253098=6509295443?3.pdf
623	2000.2	3	2	10	https://www.exam.com/%B5562865457473592=6407814545?3.pdf
624	1973.1	2	43	10	https://www.exam.com/%B8541437243673835=04094251?6.pdf
625	1979.2	3	1	11	https://www.exam.com/%B5796286086557322=3112734165?5.pdf
626	1997.1	1	1	12	https://www.exam.com/%B1674671515334418=92082281571?5.pdf
627	1973.1	3	11	13	https://www.exam.com/%B4343960548057691=9205510543?5.pdf
628	2008.1	4	3	14	https://www.exam.com/%B7550562443364817=6705511467?8.pdf
629	2001.2	3	5	15	https://www.exam.com/%B5135684137269484=3905954585?6.pdf
630	2014.2	3	12	16	https://www.exam.com/%B5139879352629176=61079458158?6.pdf
631	2002.2	1	13	17	https://www.exam.com/%B8851658183103611=68086671?8.pdf
632	1996.2	2	14	18	https://www.exam.com/%B3761277435368432=2004627736?1.pdf
633	1975.2	5	15	19	https://www.exam.com/%B3828438589666773=7112221385?4.pdf
634	2001.2	5	16	20	https://www.exam.com/%B2114836814342358=61075454683?4.pdf
635	2003.1	3	1	21	https://www.exam.com/%B4104784424335491=8303660496?6.pdf
636	2001.2	2	17	22	https://www.exam.com/%B5876134218249487=6108618330?4.pdf
637	1975.1	2	18	23	https://www.exam.com/%B9656690477848793=57084819238? .pdf
638	1999.2	3	5	24	https://www.exam.com/%B8056702079083507=5202176549?3.pdf
639	1982.2	3	19	25	https://www.exam.com/%B8813599042550493=3905697584?8.pdf
640	1988.1	2	20	26	https://www.exam.com/%B3866619917294459=76095847658?6.pdf
641	1977.1	4	21	27	https://www.exam.com/%B2178429578128937=9302568729? .pdf
642	1987.1	3	4	28	https://www.exam.com/%B1227048372809748=51017146?2.pdf
643	1983.1	3	6	29	https://www.exam.com/%B6276893381228572=9402532954?7.pdf
644	2004.1	2	22	30	https://www.exam.com/%B8649507162121213=86029264?3.pdf
645	1974.1	3	23	31	https://www.exam.com/%B8636920275345653=01079026?8.pdf
646	1999.2	2	24	32	https://www.exam.com/%B8080627677617433=64099784?3.pdf
647	1976.2	2	25	33	https://www.exam.com/%B4851301247683678=75024122?7.pdf
648	1999.1	3	26	34	https://www.exam.com/%B4572666012286454=2610206393?1.pdf
649	1983.2	3	27	35	https://www.exam.com/%B8555413265649817=3605596754?5.pdf
650	2011.2	2	28	36	https://www.exam.com/%B1883684707426562=2701434876?7.pdf
651	1996.1	5	29	37	https://www.exam.com/%B7619370511315824=10107318105?6.pdf
652	1991.1	2	6	38	https://www.exam.com/%B6408741001573486=80054944401?3.pdf
653	1977.1	5	4	39	https://www.exam.com/%B7438800333194477=8306146251?5.pdf
654	1976.1	4	30	40	https://www.exam.com/%B5014928874424168=81091395785?6.pdf
655	1988.2	4	31	41	https://www.exam.com/%B8678673743504771=2004493923?3.pdf
656	1981.2	2	32	42	https://www.exam.com/%B2312437871420647=0703928772?8.pdf
657	2017.1	2	33	43	https://www.exam.com/%B6944627375567213=5808146625?3.pdf
658	1970.2	1	34	44	https://www.exam.com/%B4529795432184782=6503285271?7.pdf
659	1993.1	3	35	45	https://www.exam.com/%B7175038147618445=0910824194?5.pdf
660	2002.1	2	36	46	https://www.exam.com/%B7244803535365281=1102892171?4.pdf
661	2016.1	1	37	47	https://www.exam.com/%B3038421199037763=4304665938?6.pdf
662	1989.2	3	38	48	https://www.exam.com/%B5195842977575405=5105830817?1.pdf
663	2008.1	1	39	49	https://www.exam.com/%B7380883487933938=3206913976?9.pdf
664	1984.2	1	40	50	https://www.exam.com/%B2582117943133995=24048305351?4.pdf
665	2015.2	4	40	51	https://www.exam.com/%B9793237346859211=01087066436?1.pdf
666	2005.1	3	7	1	https://www.exam.com/%B3498076946584147=7309236667? .pdf
667	1998.1	3	8	2	https://www.exam.com/%B5453311865428003=56017663?1.pdf
668	1971.2	5	3	3	https://www.exam.com/%B3627438776597872=61045919560?5.pdf
669	1971.1	3	41	3	https://www.exam.com/%B6429281494560622=7311946540?5.pdf
670	1986.1	5	42	3	https://www.exam.com/%B5935360428630596=28068907?7.pdf
671	2018.1	3	1	4	https://www.exam.com/%B6349954315187326=95089988?2.pdf
672	1981.2	3	1	5	https://www.exam.com/%B7502171178547845=49125984864?7.pdf
673	1971.2	3	1	6	https://www.exam.com/%B3358197161623431=9310980117?8.pdf
674	2003.2	4	9	7	https://www.exam.com/%B7217907480447751=53075272913?8.pdf
675	1972.2	1	10	8	https://www.exam.com/%B4107277762511513=70076627?6.pdf
676	1995.2	2	2	9	https://www.exam.com/%B5987781941966245=4903290877?5.pdf
677	2005.2	2	43	9	https://www.exam.com/%B2843262328615691=30047529?3.pdf
678	2013.1	4	2	10	https://www.exam.com/%B9141245312217813=0710676657?3.pdf
679	2017.1	1	43	10	https://www.exam.com/%B6427172369756265=24028256379?8.pdf
680	1973.1	4	1	11	https://www.exam.com/%B9512513302782853=7710552946?2.pdf
681	2020.1	1	1	12	https://www.exam.com/%B4435666526642327=17027348585?4.pdf
682	1986.2	2	11	13	https://www.exam.com/%B3111751635382676=9207533537?8.pdf
683	1985.1	3	3	14	https://www.exam.com/%B1477441846844613=51048045?4.pdf
684	1991.1	4	5	15	https://www.exam.com/%B8155391794235525=1410579879?4.pdf
685	2017.2	2	12	16	https://www.exam.com/%B4372985293218869=88069379481?5.pdf
686	1999.1	3	13	17	https://www.exam.com/%B3749862359175272=40091503332?3.pdf
687	1983.1	3	14	18	https://www.exam.com/%B5367771538882336=0009963111?1.pdf
688	1982.2	3	15	19	https://www.exam.com/%B6246769996085453=36045929?6.pdf
689	1972.2	4	16	20	https://www.exam.com/%B6782188115626122=3102468611?7.pdf
690	1994.2	5	1	21	https://www.exam.com/%B4368618261279642=27086808694?4.pdf
691	1999.1	2	17	22	https://www.exam.com/%B8287582400896158=28102763?8.pdf
692	1996.2	3	18	23	https://www.exam.com/%B3507206527123715=9102489698?8.pdf
693	1987.2	1	5	24	https://www.exam.com/%B6437646085571623=6708704625? .pdf
694	2020.1	4	19	25	https://www.exam.com/%B2621666168355782=36075052?8.pdf
695	1987.1	2	20	26	https://www.exam.com/%B2625175948515805=50095256?5.pdf
696	1991.2	2	21	27	https://www.exam.com/%B9818663823458783=83083106?3.pdf
697	1972.2	4	4	28	https://www.exam.com/%B7321572576448687=72097382?6.pdf
698	1983.2	4	6	29	https://www.exam.com/%B2883797826424221=0602921234?3.pdf
699	1976.1	3	22	30	https://www.exam.com/%B6567692991308406=73046254206?3.pdf
700	1980.1	5	23	31	https://www.exam.com/%B8421644984760321=1111165521?7.pdf
701	2002.2	3	24	32	https://www.exam.com/%B4438239561644954=24068634?9.pdf
702	1972.2	3	25	33	https://www.exam.com/%B8533642420750517=05034155609?6.pdf
703	1984.2	2	26	34	https://www.exam.com/%B5269211741078233=50109783?7.pdf
704	2020.1	2	27	35	https://www.exam.com/%B5346643545929816=30019958731?3.pdf
705	2009.1	3	28	36	https://www.exam.com/%B8420614842882707=35056632420?3.pdf
706	1993.1	3	29	37	https://www.exam.com/%B1288785077226843=28014646422?3.pdf
707	1989.2	4	6	38	https://www.exam.com/%B3853425254932736=4205867480?6.pdf
708	1973.1	4	4	39	https://www.exam.com/%B8744832311583863=8401206942? .pdf
709	2018.1	5	30	40	https://www.exam.com/%B2245228172153935=1607397116?1.pdf
710	2002.2	4	31	41	https://www.exam.com/%B6502924776572152=13062014?3.pdf
711	2002.1	3	32	42	https://www.exam.com/%B9637731784764527=6003416835?7.pdf
712	1974.2	4	33	43	https://www.exam.com/%B7593447436135061=73087842653?3.pdf
713	1981.1	2	34	44	https://www.exam.com/%B5617267423614222=6802128897?7.pdf
714	1980.1	2	35	45	https://www.exam.com/%B4001198745612726=1007292497? .pdf
715	2011.2	5	36	46	https://www.exam.com/%B2186837554625515=87039734072?4.pdf
716	2014.1	2	37	47	https://www.exam.com/%B5540673585855853=4405935930?3.pdf
717	2010.1	3	38	48	https://www.exam.com/%B3762418586936147=1011648698?4.pdf
718	1996.1	4	39	49	https://www.exam.com/%B2095425103951551=73039668?8.pdf
719	1994.1	4	40	50	https://www.exam.com/%B5806918372742856=15086059539?4.pdf
720	1977.1	2	40	51	https://www.exam.com/%B4750153735157102=8404601524?3.pdf
721	2007.1	2	7	1	https://www.exam.com/%B3276622163457213=7905872696?9.pdf
722	2017.2	2	8	2	https://www.exam.com/%B5471612118775538=7502440286?3.pdf
723	1988.2	3	3	3	https://www.exam.com/%B3376601425904819=2810256178?7.pdf
724	1974.2	5	41	3	https://www.exam.com/%B7871564476747158=73048402458?8.pdf
725	1982.1	3	42	3	https://www.exam.com/%B6303869200633539=6210821533?8.pdf
726	2016.1	3	1	4	https://www.exam.com/%B4647069277640771=93022925?1.pdf
727	1983.1	1	1	5	https://www.exam.com/%B4623925161253833=45073927?6.pdf
728	2010.1	3	1	6	https://www.exam.com/%B7974561326464422=48094302?7.pdf
729	1991.2	2	9	7	https://www.exam.com/%B2623143280388555=4907717675?1.pdf
730	2007.2	3	10	8	https://www.exam.com/%B6738640665103167=7905441534?8.pdf
731	1985.1	5	2	9	https://www.exam.com/%B2088887546867335=65111537697?7.pdf
732	1993.1	4	43	9	https://www.exam.com/%B4197417574933314=1604342673?7.pdf
733	1995.1	3	2	10	https://www.exam.com/%B9593155473356062=40054652690?4.pdf
734	1973.1	2	43	10	https://www.exam.com/%B7126060355162218=93061534?4.pdf
735	2019.2	5	1	11	https://www.exam.com/%B2701459819175121=95063174?6.pdf
736	1993.1	2	1	12	https://www.exam.com/%B8642187716943155=34078832?7.pdf
737	2004.2	1	11	13	https://www.exam.com/%B8704732563055879=3109622703?2.pdf
738	1984.2	4	3	14	https://www.exam.com/%B4896540014014874=98082661940?1.pdf
739	2005.2	4	5	15	https://www.exam.com/%B8716238783736557=9610709570?2.pdf
740	1979.2	1	12	16	https://www.exam.com/%B5572521381830862=55072712?4.pdf
741	2011.1	2	13	17	https://www.exam.com/%B3063627149514013=58107308529?2.pdf
742	1980.1	4	14	18	https://www.exam.com/%B8076033708717478=59045722?3.pdf
743	2014.1	3	15	19	https://www.exam.com/%B5792397736455370=33054708?2.pdf
744	2011.2	1	16	20	https://www.exam.com/%B8711079225802552=6811292629?2.pdf
745	1985.2	5	1	21	https://www.exam.com/%B3837261514817817=54065319615?1.pdf
746	2011.2	2	17	22	https://www.exam.com/%B5687146498011765=19014798? .pdf
747	1977.1	4	18	23	https://www.exam.com/%B1380545140470936=2306548736?1.pdf
748	2003.1	4	5	24	https://www.exam.com/%B5558118118882022=1906490345?4.pdf
749	2004.1	4	19	25	https://www.exam.com/%B8136973246857121=0004872878?4.pdf
750	2005.1	1	20	26	https://www.exam.com/%B8661427754277048=6410139820?2.pdf
751	2006.1	5	21	27	https://www.exam.com/%B6465181956380738=8910516165?4.pdf
752	1982.1	3	4	28	https://www.exam.com/%B7188774274183285=20036911?8.pdf
753	1984.2	5	6	29	https://www.exam.com/%B5706047988456837=75023613?3.pdf
754	1987.2	5	22	30	https://www.exam.com/%B6637506734524284=5901141163?6.pdf
755	1974.1	3	23	31	https://www.exam.com/%B7027828116903513=0302574518?3.pdf
756	1992.1	4	24	32	https://www.exam.com/%B5566678418230449=1303601256?5.pdf
757	2018.1	3	25	33	https://www.exam.com/%B2464351579214413=1003800846?6.pdf
758	1986.1	4	26	34	https://www.exam.com/%B1617584687565686=80054225?3.pdf
759	1991.1	2	27	35	https://www.exam.com/%B2335411321711846=3409722168?4.pdf
760	2010.2	2	28	36	https://www.exam.com/%B4538043738311337=2304527632?2.pdf
761	2008.1	5	29	37	https://www.exam.com/%B3422218082163425=5805393423?5.pdf
762	2020.2	3	6	38	https://www.exam.com/%B5543938831413745=4803342871?6.pdf
763	1972.2	2	4	39	https://www.exam.com/%B7938456855817367=8405581140?5.pdf
764	2001.2	1	30	40	https://www.exam.com/%B2447736170373628=0309743460? .pdf
765	1989.1	5	31	41	https://www.exam.com/%B7162151464571994=59047891473?9.pdf
766	2007.2	3	32	42	https://www.exam.com/%B3646255636254857=11116733554?5.pdf
767	1978.1	1	33	43	https://www.exam.com/%B6659506957615851=50057232441?1.pdf
768	1974.2	4	34	44	https://www.exam.com/%B2277063646979771=19115447?3.pdf
769	2002.1	4	35	45	https://www.exam.com/%B6647081179075539=8903893245?4.pdf
770	1975.2	3	36	46	https://www.exam.com/%B2846777867267556=9107550667?9.pdf
771	1971.2	2	37	47	https://www.exam.com/%B6778746156365821=58066179597? .pdf
772	2017.2	5	38	48	https://www.exam.com/%B6725657118998625=1903367949?1.pdf
773	2001.1	3	39	49	https://www.exam.com/%B4223239656159552=8102628978? .pdf
774	1984.1	1	40	50	https://www.exam.com/%B8491852476246837=6309438984?7.pdf
775	1976.2	3	40	51	https://www.exam.com/%B8086222454848669=17024333801?1.pdf
776	1993.1	3	7	1	https://www.exam.com/%B4241136241490085=06044977680?8.pdf
777	2019.1	3	8	2	https://www.exam.com/%B3882253588910955=89103947727?3.pdf
778	1981.1	4	3	3	https://www.exam.com/%B9772451651439582=27118948?4.pdf
779	1974.1	4	41	3	https://www.exam.com/%B8184915142253072=07087076263?6.pdf
780	2010.2	3	42	3	https://www.exam.com/%B4844444376113275=7111354766?4.pdf
781	1988.1	2	1	4	https://www.exam.com/%B8266168035140532=13066628018?4.pdf
782	1998.2	4	1	5	https://www.exam.com/%B5133561711716477=88117389?8.pdf
783	2008.1	3	1	6	https://www.exam.com/%B2773165755872773=62115733?6.pdf
784	1978.1	2	9	7	https://www.exam.com/%B3986483511645462=45036454830?3.pdf
785	2007.1	3	10	8	https://www.exam.com/%B3368848737176255=41031395141?1.pdf
786	2016.2	2	2	9	https://www.exam.com/%B7595454552506704=63095285?8.pdf
787	2011.2	3	43	9	https://www.exam.com/%B4845840153240562=8710920697?5.pdf
788	1998.2	3	2	10	https://www.exam.com/%B8045100483132272=29079302402?2.pdf
789	1972.2	1	43	10	https://www.exam.com/%B3410026969168882=8406923224? .pdf
790	2019.2	5	1	11	https://www.exam.com/%B8598283464717296=11057041849?8.pdf
791	1986.1	1	1	12	https://www.exam.com/%B2803079123504153=4211628389?6.pdf
792	1988.2	4	11	13	https://www.exam.com/%B8716668103405472=3609563971?8.pdf
793	1998.2	4	3	14	https://www.exam.com/%B3544223177748152=3105881793?6.pdf
794	2001.2	1	5	15	https://www.exam.com/%B1202736053143517=23012624?7.pdf
795	2010.2	4	12	16	https://www.exam.com/%B1444378381246598=12091438?4.pdf
796	2005.2	4	13	17	https://www.exam.com/%B5797151146332141=5706848128?7.pdf
797	1971.2	4	14	18	https://www.exam.com/%B5225707998852388=2510833365?3.pdf
798	1992.2	4	15	19	https://www.exam.com/%B2186557626292658=7001796725?6.pdf
799	2001.2	2	16	20	https://www.exam.com/%B8482038147267653=77046898858?5.pdf
800	1987.2	4	1	21	https://www.exam.com/%B5526777681390389=7711770115?6.pdf
801	2007.2	2	17	22	https://www.exam.com/%B7154703585309027=78016184? .pdf
802	1988.1	1	18	23	https://www.exam.com/%B4621442757065584=4302416779? .pdf
803	2002.1	4	5	24	https://www.exam.com/%B5855484334801621=1703597410?5.pdf
804	1971.1	5	19	25	https://www.exam.com/%B3942158017422410=63011657927?5.pdf
805	1991.1	3	20	26	https://www.exam.com/%B2698153325671758=9602786874?6.pdf
806	1991.2	2	21	27	https://www.exam.com/%B5780357862148600=46084713858? .pdf
807	1970.1	5	4	28	https://www.exam.com/%B4825731612735314=1010417667?9.pdf
808	2001.2	2	6	29	https://www.exam.com/%B3965245514472563=17041971?2.pdf
809	1988.2	4	22	30	https://www.exam.com/%B8593408291853108=0410707225?3.pdf
810	2009.2	1	23	31	https://www.exam.com/%B3422319164476353=1704350505?4.pdf
811	1993.2	4	24	32	https://www.exam.com/%B6323993473738509=47079674?4.pdf
812	1970.2	3	25	33	https://www.exam.com/%B4847135552891595=2105265375?8.pdf
813	2017.1	1	26	34	https://www.exam.com/%B8532604377927253=13083138?6.pdf
814	1984.1	4	27	35	https://www.exam.com/%B2375848894696905=1610738537?4.pdf
815	1972.2	4	28	36	https://www.exam.com/%B7723174881937422=76018259840?2.pdf
816	2013.1	2	29	37	https://www.exam.com/%B7697921084711279=1303999195?3.pdf
817	1981.1	2	6	38	https://www.exam.com/%B6349164107232776=9304637471?1.pdf
818	2020.2	4	4	39	https://www.exam.com/%B7781324746665103=8509637694? .pdf
819	1989.1	2	30	40	https://www.exam.com/%B8649879544323402=5209676708?5.pdf
820	2014.1	5	31	41	https://www.exam.com/%B6290851479867544=92095736416?4.pdf
821	1976.2	3	32	42	https://www.exam.com/%B2285132902415333=37031318?5.pdf
822	1977.1	4	33	43	https://www.exam.com/%B5524521071714285=94129063038?7.pdf
823	2000.1	3	34	44	https://www.exam.com/%B5524960537721776=02058032?1.pdf
824	1987.2	4	35	45	https://www.exam.com/%B6003585335777524=83105087319? .pdf
825	1994.2	2	36	46	https://www.exam.com/%B4641643523103515=32067799?3.pdf
826	1979.1	4	37	47	https://www.exam.com/%B9171554584741423=9011123849?4.pdf
827	1996.1	1	38	48	https://www.exam.com/%B7241431666868361=8009302987?3.pdf
828	1997.2	2	39	49	https://www.exam.com/%B5272354163525199=54102199211?2.pdf
829	1971.2	2	40	50	https://www.exam.com/%B7375672885806978=29101623? .pdf
830	2006.1	5	40	51	https://www.exam.com/%B4440748735492616=52098979327?2.pdf
831	2016.1	5	7	1	https://www.exam.com/%B5732140556793876=15126206?1.pdf
832	1979.1	2	8	2	https://www.exam.com/%B6614081932173321=5210811770?5.pdf
833	1973.1	3	3	3	https://www.exam.com/%B1317258703886238=9307640435?3.pdf
834	2011.1	5	41	3	https://www.exam.com/%B3332074125748543=2305333942?2.pdf
835	2018.1	3	42	3	https://www.exam.com/%B2945553144381503=5302897667?4.pdf
836	2010.1	3	1	4	https://www.exam.com/%B9151570924596667=2106654726?1.pdf
837	2020.2	3	1	5	https://www.exam.com/%B1217524732067188=0904260939?7.pdf
838	2015.1	2	1	6	https://www.exam.com/%B7540550804537658=90052776?4.pdf
839	2003.2	2	9	7	https://www.exam.com/%B6426841573908715=25112657451?8.pdf
840	2010.1	4	10	8	https://www.exam.com/%B3248356232913076=87079357?8.pdf
841	2009.1	5	2	9	https://www.exam.com/%B2784185541034557=8703230732?2.pdf
842	1987.2	2	43	9	https://www.exam.com/%B8673243174454455=6505549263?1.pdf
843	1982.2	4	2	10	https://www.exam.com/%B8407636064384091=7510166658? .pdf
844	2009.2	2	43	10	https://www.exam.com/%B3226511286652925=8604510130?1.pdf
845	1985.1	2	1	11	https://www.exam.com/%B1580580608822468=24127983?6.pdf
846	2007.2	2	1	12	https://www.exam.com/%B2422453036243481=26105887?9.pdf
847	2008.1	1	11	13	https://www.exam.com/%B8212212229245657=41019468090?7.pdf
848	1974.2	1	3	14	https://www.exam.com/%B4661931756894663=82087361310?4.pdf
849	1979.2	3	5	15	https://www.exam.com/%B1837675182151847=9807344763?2.pdf
850	1989.1	3	12	16	https://www.exam.com/%B1938465163226121=47028345300?1.pdf
851	2007.1	4	13	17	https://www.exam.com/%B8408286237821270=27065038?4.pdf
852	1992.1	4	14	18	https://www.exam.com/%B9837766383753526=63072857747?2.pdf
853	2005.2	4	15	19	https://www.exam.com/%B5134173765533998=7904173753?5.pdf
854	2001.1	4	16	20	https://www.exam.com/%B6827374578652278=4905261938?6.pdf
855	2005.2	3	1	21	https://www.exam.com/%B2461235688632432=0212261772?3.pdf
856	1994.1	2	17	22	https://www.exam.com/%B7594045717272508=7809415560?6.pdf
857	1973.1	3	18	23	https://www.exam.com/%B6748050993114329=2607399341?3.pdf
858	2004.2	2	5	24	https://www.exam.com/%B6381266481618308=53048104597?3.pdf
859	2009.2	3	19	25	https://www.exam.com/%B1872125811661511=4206921956?9.pdf
860	1984.2	3	20	26	https://www.exam.com/%B8634533165483113=2206149889?6.pdf
861	1992.1	4	21	27	https://www.exam.com/%B6523844864152892=47089541536?5.pdf
862	2016.2	4	4	28	https://www.exam.com/%B8780686774856633=39054642534?5.pdf
863	1999.2	5	6	29	https://www.exam.com/%B2853145412657842=6211466940?3.pdf
864	1974.2	5	22	30	https://www.exam.com/%B7673485793830926=4309151203?1.pdf
865	1994.1	2	23	31	https://www.exam.com/%B3867624608133040=6609134863?8.pdf
866	2017.1	1	24	32	https://www.exam.com/%B3238148833185825=28025033?6.pdf
867	1973.1	4	25	33	https://www.exam.com/%B6457710882886389=0609802283?3.pdf
868	1980.2	1	26	34	https://www.exam.com/%B2638651638163216=9608252313?6.pdf
869	1994.2	2	27	35	https://www.exam.com/%B3252518961384863=01117685?8.pdf
870	2001.2	1	28	36	https://www.exam.com/%B6556915831535375=2312455840?1.pdf
871	1988.1	5	29	37	https://www.exam.com/%B3583760724274431=5310952674?4.pdf
872	1993.1	5	6	38	https://www.exam.com/%B2405288523218327=56082927?7.pdf
873	1974.2	4	4	39	https://www.exam.com/%B2423534422416615=7209805862?4.pdf
874	2018.1	5	30	40	https://www.exam.com/%B5063314037847224=7405600265?2.pdf
875	1980.1	2	31	41	https://www.exam.com/%B8443571862737481=50038228?1.pdf
876	2006.2	4	32	42	https://www.exam.com/%B2831384171667143=19127725?1.pdf
877	1976.1	2	33	43	https://www.exam.com/%B5325521972433633=0703364571?7.pdf
878	1990.1	1	34	44	https://www.exam.com/%B6163688558422322=6904242378?3.pdf
879	1977.2	2	35	45	https://www.exam.com/%B7142264537212334=84073601?8.pdf
880	2009.1	2	36	46	https://www.exam.com/%B8933955583985875=36044089?3.pdf
881	1996.1	4	37	47	https://www.exam.com/%B6407890886664284=76118532?7.pdf
882	1975.1	5	38	48	https://www.exam.com/%B8472656788820200=5711134332?6.pdf
883	2004.2	4	39	49	https://www.exam.com/%B3156364919260779=61026977?6.pdf
884	1989.1	3	40	50	https://www.exam.com/%B8514549792534525=8901204690?8.pdf
885	1986.2	3	40	51	https://www.exam.com/%B2817175776653711=1605598517?7.pdf
886	1970.1	2	7	1	https://www.exam.com/%B2243661338254226=0304883730?1.pdf
887	1993.2	2	8	2	https://www.exam.com/%B4357172782173070=5402887398?8.pdf
888	2009.1	3	3	3	https://www.exam.com/%B1497794584313694=4502684450?7.pdf
889	1996.2	5	41	3	https://www.exam.com/%B8799569020527776=2704279982?5.pdf
890	2000.1	4	42	3	https://www.exam.com/%B4675435748330894=3410308909?1.pdf
891	2015.1	2	1	4	https://www.exam.com/%B9878088767135382=1508930494?7.pdf
892	2014.1	3	1	5	https://www.exam.com/%B6885234133432656=54064024346? .pdf
893	1993.2	3	1	6	https://www.exam.com/%B6822251317133623=4405813791?2.pdf
894	1975.1	4	9	7	https://www.exam.com/%B4850615153548911=6211323192?4.pdf
895	1976.2	1	10	8	https://www.exam.com/%B3335583742593702=33094018?1.pdf
896	1996.2	4	2	9	https://www.exam.com/%B4258830839255777=23094213?5.pdf
897	2009.1	4	43	9	https://www.exam.com/%B4867233892368745=34042923?8.pdf
898	2015.2	2	2	10	https://www.exam.com/%B8859516713469205=93067964606?6.pdf
899	1989.1	3	43	10	https://www.exam.com/%B8119720313730227=5912781163?4.pdf
900	1974.1	4	1	11	https://www.exam.com/%B6273182798604213=4110878149? .pdf
901	1975.2	1	1	12	https://www.exam.com/%B2117458626828385=7602613799?7.pdf
902	1981.1	1	11	13	https://www.exam.com/%B5857661812273880=60064145897?9.pdf
903	1984.2	5	3	14	https://www.exam.com/%B1984548193648639=93066053113?1.pdf
904	1985.1	4	5	15	https://www.exam.com/%B9648550417668853=91065448?5.pdf
905	1973.2	1	12	16	https://www.exam.com/%B5145858761313311=42053497220?6.pdf
906	1994.1	3	13	17	https://www.exam.com/%B4314951754772670=01128175?3.pdf
907	1978.2	4	14	18	https://www.exam.com/%B3434780835855344=5908518546?6.pdf
908	1976.2	3	15	19	https://www.exam.com/%B4767293444356394=2808669906?6.pdf
909	1984.1	5	16	20	https://www.exam.com/%B6636853326552290=5810889900?6.pdf
910	2016.2	2	1	21	https://www.exam.com/%B7721835121940023=59114522?5.pdf
911	1977.1	4	17	22	https://www.exam.com/%B8161009908856164=7302433464?6.pdf
912	1990.2	2	18	23	https://www.exam.com/%B8111152359381791=6101470309?4.pdf
913	1979.2	4	5	24	https://www.exam.com/%B4487715427341700=9508579665?5.pdf
914	2016.1	2	19	25	https://www.exam.com/%B7706648454773158=19065566?3.pdf
915	2013.1	3	20	26	https://www.exam.com/%B1381367494265163=90041575731?7.pdf
916	1989.1	4	21	27	https://www.exam.com/%B2998878483639435=96043017495?2.pdf
917	1993.2	2	4	28	https://www.exam.com/%B6824325615824243=3609684514?1.pdf
918	1972.2	4	6	29	https://www.exam.com/%B1317732113869667=3409131126?9.pdf
919	1979.1	4	22	30	https://www.exam.com/%B6323491188448914=9611639809? .pdf
920	1988.2	2	23	31	https://www.exam.com/%B3436407242882447=2607644694?4.pdf
921	1973.1	4	24	32	https://www.exam.com/%B6877155330889601=2509180381?8.pdf
922	1990.2	4	25	33	https://www.exam.com/%B7640154231445821=00013197237?2.pdf
923	1978.2	3	26	34	https://www.exam.com/%B5496672577853707=3001928577?8.pdf
924	2017.2	2	27	35	https://www.exam.com/%B1645434481550765=49063659435?1.pdf
925	1983.2	4	28	36	https://www.exam.com/%B6764119519995499=4504633659?5.pdf
926	2011.2	3	29	37	https://www.exam.com/%B4115368146736304=2202948205?7.pdf
927	2013.2	2	6	38	https://www.exam.com/%B3086525338465471=3708881769?7.pdf
928	2009.1	5	4	39	https://www.exam.com/%B5188673113301569=7402940528?6.pdf
929	1984.1	3	30	40	https://www.exam.com/%B4881791928090287=45096835475?4.pdf
930	1998.2	2	31	41	https://www.exam.com/%B6767045257156463=4307112229?6.pdf
931	1982.2	3	32	42	https://www.exam.com/%B7841629326964866=49067535183?9.pdf
932	1981.1	3	33	43	https://www.exam.com/%B3343440648147085=61063311839?6.pdf
933	1991.1	1	34	44	https://www.exam.com/%B2884251993561370=47087665108?7.pdf
934	2008.1	3	35	45	https://www.exam.com/%B3349416436182245=0111448560?4.pdf
935	1991.2	4	36	46	https://www.exam.com/%B6861475290288243=4309177322?3.pdf
936	1983.1	2	37	47	https://www.exam.com/%B2369326470928178=6812374214?3.pdf
937	2007.1	4	38	48	https://www.exam.com/%B3443511236886391=52023555855?6.pdf
938	1999.2	2	39	49	https://www.exam.com/%B1630778360528267=36105851?4.pdf
939	1980.1	5	40	50	https://www.exam.com/%B3623821432275314=6804218349?5.pdf
940	1978.2	2	40	51	https://www.exam.com/%B2971438307053089=1206713694?1.pdf
941	1988.1	2	7	1	https://www.exam.com/%B3675296775680548=5809906291?3.pdf
942	1974.2	1	8	2	https://www.exam.com/%B9172868827384987=9101714571?1.pdf
943	2016.2	5	3	3	https://www.exam.com/%B4250765384430784=0608601693?4.pdf
944	1984.1	3	41	3	https://www.exam.com/%B4589870545775973=9712843299?2.pdf
945	1978.1	2	42	3	https://www.exam.com/%B8178662365753794=85066294?9.pdf
946	1988.1	2	1	4	https://www.exam.com/%B7525762492238775=0908199857?6.pdf
947	1983.1	3	1	5	https://www.exam.com/%B6985787823187309=29036548?8.pdf
948	1982.1	3	1	6	https://www.exam.com/%B7714167345507476=78039077?2.pdf
949	1992.2	3	9	7	https://www.exam.com/%B2128898340754141=60102847?8.pdf
950	1975.1	2	10	8	https://www.exam.com/%B4873776127932335=62046436159?6.pdf
951	2004.2	4	2	9	https://www.exam.com/%B4489685519267542=1811253433?5.pdf
952	2017.2	4	43	9	https://www.exam.com/%B3588571459424495=35044051623?1.pdf
953	1971.1	2	2	10	https://www.exam.com/%B6262615160453230=22091905?2.pdf
954	1981.2	2	43	10	https://www.exam.com/%B7473859934786096=60028965032?1.pdf
955	1977.1	2	1	11	https://www.exam.com/%B5672446062113866=3610585830?3.pdf
956	2002.2	1	1	12	https://www.exam.com/%B2505117463727993=4308149888?7.pdf
957	2001.2	3	11	13	https://www.exam.com/%B8775210368868388=10044112?1.pdf
958	1984.2	3	3	14	https://www.exam.com/%B6980378873211779=1605495373?8.pdf
959	2007.1	4	5	15	https://www.exam.com/%B5475823625564254=21066581993?4.pdf
960	2007.2	5	12	16	https://www.exam.com/%B1524425317055683=2003406160?4.pdf
961	1995.1	5	13	17	https://www.exam.com/%B3734282109467543=3006517865?5.pdf
962	2008.1	2	14	18	https://www.exam.com/%B3777641131899811=0604691430?7.pdf
963	1990.2	5	15	19	https://www.exam.com/%B9866104662115482=70014097? .pdf
964	1972.2	4	16	20	https://www.exam.com/%B2224689294515478=80117487?2.pdf
965	1997.2	3	1	21	https://www.exam.com/%B4942520544573058=4410714311?1.pdf
966	1995.2	2	17	22	https://www.exam.com/%B9782691383877626=81075802409?7.pdf
967	1998.1	4	18	23	https://www.exam.com/%B7223315401060422=6005584883?1.pdf
968	1985.1	1	5	24	https://www.exam.com/%B5401266170254961=22089802?3.pdf
969	2004.1	2	19	25	https://www.exam.com/%B4962538154558361=63065788?6.pdf
970	1998.2	1	20	26	https://www.exam.com/%B7258740216433075=1510601636?9.pdf
971	2004.1	3	21	27	https://www.exam.com/%B9758759225836155=30085262?6.pdf
972	2018.2	2	4	28	https://www.exam.com/%B4869675328152032=49057526871?4.pdf
973	1989.2	4	6	29	https://www.exam.com/%B3933358638872691=71046357?3.pdf
974	2012.1	2	22	30	https://www.exam.com/%B7825014988078718=1606288966?8.pdf
975	2002.2	2	23	31	https://www.exam.com/%B3228982371556235=8406655139?2.pdf
976	1975.2	1	24	32	https://www.exam.com/%B5117696964661903=19086304?7.pdf
977	1999.1	3	25	33	https://www.exam.com/%B1188832485625573=21067831?9.pdf
978	1973.1	5	26	34	https://www.exam.com/%B1740771551498137=4001336113?7.pdf
979	2011.1	1	27	35	https://www.exam.com/%B8898267350372146=12085186?1.pdf
980	2007.2	4	28	36	https://www.exam.com/%B4883505275562451=72023776?8.pdf
981	2018.2	2	29	37	https://www.exam.com/%B5610103382834433=67098651946?5.pdf
982	1984.1	3	6	38	https://www.exam.com/%B6367510467725372=89076887782?5.pdf
983	2013.1	3	4	39	https://www.exam.com/%B4201329860776153=3206599554?9.pdf
984	2017.2	1	30	40	https://www.exam.com/%B8711787999452366=85045401?7.pdf
985	1977.2	4	31	41	https://www.exam.com/%B1387300198143215=73102654? .pdf
986	1982.1	5	32	42	https://www.exam.com/%B3492644754675648=26063438?5.pdf
987	2000.1	4	33	43	https://www.exam.com/%B5402210657721488=7103909874?2.pdf
988	1974.1	1	34	44	https://www.exam.com/%B6778352864558780=7403610295?2.pdf
989	2008.2	3	35	45	https://www.exam.com/%B7873404121667237=74092123?5.pdf
990	1988.2	5	36	46	https://www.exam.com/%B4595011515633907=5106237168?3.pdf
991	1992.1	3	37	47	https://www.exam.com/%B4174165887368652=26034615561?9.pdf
992	2007.2	2	38	48	https://www.exam.com/%B4501274483692476=31085285?3.pdf
993	1983.2	2	39	49	https://www.exam.com/%B5140298828214707=4802797142?4.pdf
994	1991.1	3	40	50	https://www.exam.com/%B2383122471763553=8308534806?5.pdf
995	1989.1	4	40	51	https://www.exam.com/%B3749478752686437=64043193004?1.pdf
996	1973.2	2	7	1	https://www.exam.com/%B7630464319647656=6104578564?7.pdf
997	2006.1	4	8	2	https://www.exam.com/%B8443097664367811=6506154615?2.pdf
998	1975.2	4	3	3	https://www.exam.com/%B1741653576823671=2208774733?6.pdf
999	1991.2	2	41	3	https://www.exam.com/%B2723686826664132=6902747851?3.pdf
1000	1995.2	4	42	3	https://www.exam.com/%B5989515425408439=47072845083?4.pdf
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, "timestamp", name) FROM stdin;
\.


--
-- Data for Name: semesters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.semesters (id, semester) FROM stdin;
1	1
2	2
3	3
4	4
5	5
6	6
7	7
8	8
9	Eletivas
\.


--
-- Data for Name: teachers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teachers (id, name) FROM stdin;
1	Zelia Barreto
2	Arsenio Furtado
3	Sophie Aires
4	Marisol Quintas
5	Nilo Berenguer
6	Abigail Camargo
7	Clarinha Caeiro
8	Paulo Madruga
9	Adrien Amorim
10	Lukas Garrau
11	Petra Varanda
12	Evelina Janes
13	Rubim Mondragao
14	Rebeca Freire
15	Dulce Diegues
16	Daiana Abranches
17	Milene Vides
18	Rayanne Milheirao
19	Otilia Briao
20	Allana Lampreia
21	Maia Faleiro
22	Melina Chainho
23	Ezra Castanheda
24	Cael Rios
25	Jefferson Condorcet
26	Daria Castanheda
27	Adelia Meira
28	Ariana Beiriz
29	Isis Abelho
30	Hellen Xisto
31	Walter Fitas
32	Filipe Marcondes
33	Israel Carrilho
34	Willian Tristao
35	Iasmin Filipe
36	Lyara Robalinho
37	Rayanne Pires
38	Edson Damasceno
39	Aurea Viveiros
40	Alexandro Machado
41	Eduard Teves
42	Eurico Filgueiras
43	Zilda Pegado
\.


--
-- Data for Name: teachers_disciplines; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teachers_disciplines (id, teacher_id, discipline_id) FROM stdin;
1	7	1
2	8	2
3	3	3
4	41	3
5	42	3
6	1	4
7	1	5
8	1	6
9	9	7
10	10	8
11	2	9
12	43	9
13	2	10
14	43	10
15	1	11
16	1	12
17	11	13
18	3	14
19	5	15
20	12	16
21	13	17
22	14	18
23	15	19
24	16	20
25	1	21
26	17	22
27	18	23
28	5	24
29	19	25
30	20	26
31	21	27
32	4	28
33	6	29
34	22	30
35	23	31
36	24	32
37	25	33
38	26	34
39	27	35
40	28	36
41	29	37
42	6	38
43	4	39
44	30	40
45	31	41
46	32	42
47	33	43
48	34	44
49	35	45
50	36	46
51	37	47
52	38	48
53	39	49
54	40	50
55	40	51
\.


--
-- Data for Name: typeorm_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.typeorm_metadata (type, database, schema, "table", name, value) FROM stdin;
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 5, true);


--
-- Name: disciplines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.disciplines_id_seq', 51, true);


--
-- Name: exams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exams_id_seq', 1000, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 1, false);


--
-- Name: semesters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.semesters_id_seq', 9, true);


--
-- Name: teachers_disciplines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teachers_disciplines_id_seq', 55, true);


--
-- Name: teachers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teachers_id_seq', 43, true);


--
-- Name: migrations PK_8c82d7f526340ab734260ea46be; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT "PK_8c82d7f526340ab734260ea46be" PRIMARY KEY (id);


--
-- Name: categories categories_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pk PRIMARY KEY (id);


--
-- Name: disciplines disciplines_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disciplines
    ADD CONSTRAINT disciplines_pk PRIMARY KEY (id);


--
-- Name: exams exams_link_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exams
    ADD CONSTRAINT exams_link_key UNIQUE (link);


--
-- Name: exams exams_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exams
    ADD CONSTRAINT exams_pk PRIMARY KEY (id);


--
-- Name: semesters semesters_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.semesters
    ADD CONSTRAINT semesters_pk PRIMARY KEY (id);


--
-- Name: teachers_disciplines teachers_disciplines_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers_disciplines
    ADD CONSTRAINT teachers_disciplines_pk PRIMARY KEY (id);


--
-- Name: teachers teachers_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_pk PRIMARY KEY (id);


--
-- Name: disciplines disciplines_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disciplines
    ADD CONSTRAINT disciplines_fk0 FOREIGN KEY (semester_id) REFERENCES public.semesters(id);


--
-- Name: exams exams_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exams
    ADD CONSTRAINT exams_fk0 FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: exams exams_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exams
    ADD CONSTRAINT exams_fk1 FOREIGN KEY (teacher_id) REFERENCES public.teachers(id);


--
-- Name: exams exams_fk2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exams
    ADD CONSTRAINT exams_fk2 FOREIGN KEY (discipline_id) REFERENCES public.disciplines(id);


--
-- Name: teachers_disciplines teachers_disciplines_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers_disciplines
    ADD CONSTRAINT teachers_disciplines_fk0 FOREIGN KEY (teacher_id) REFERENCES public.teachers(id);


--
-- Name: teachers_disciplines teachers_disciplines_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers_disciplines
    ADD CONSTRAINT teachers_disciplines_fk1 FOREIGN KEY (discipline_id) REFERENCES public.disciplines(id);


--
-- PostgreSQL database dump complete
--
