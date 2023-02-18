--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.4

-- Started on 2023-02-18 16:17:37

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
-- TOC entry 209 (class 1259 OID 16948)
-- Name: amico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.amico (
    utente1 character varying(100) NOT NULL,
    utente2 character varying(100) NOT NULL
);


ALTER TABLE public.amico OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16951)
-- Name: autore; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.autore (
    id character varying NOT NULL,
    nome character varying,
    cognome character varying
);


ALTER TABLE public.autore OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16956)
-- Name: autore_opera; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.autore_opera (
    id_autore character varying(100) NOT NULL,
    id_opera character varying(100)
);


ALTER TABLE public.autore_opera OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16959)
-- Name: azione; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.azione (
    id character varying(100) NOT NULL,
    tipo character varying(100),
    "timestamp" timestamp without time zone,
    id_edizione character varying(100),
    id_utente character varying(100)
);


ALTER TABLE public.azione OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16962)
-- Name: commento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.commento (
    id character varying(100) NOT NULL,
    testo character varying(10000),
    "timestamp" date,
    id_riferimento character varying(100),
    tipo_riferimento character varying(100)
);


ALTER TABLE public.commento OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16967)
-- Name: edizione; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.edizione (
    id character varying(100) NOT NULL,
    isbn character varying(100),
    data_pubblicazione date,
    editore character varying,
    numero_pagine integer,
    paese_pubblicazione character varying,
    id_opera character varying(100),
    lingua character varying(20)
);


ALTER TABLE public.edizione OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16972)
-- Name: edizione_raccolta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.edizione_raccolta (
    id_edizione character varying(100) NOT NULL,
    id_utente character varying(100) NOT NULL,
    nome_raccolta character varying(100) NOT NULL
);


ALTER TABLE public.edizione_raccolta OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16975)
-- Name: generi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.generi (
    id character varying(100) NOT NULL,
    descrizione character varying(100)
);


ALTER TABLE public.generi OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16978)
-- Name: opera; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.opera (
    id character varying(100) NOT NULL,
    titolo character varying(100),
    anno integer,
    descrizione character varying(10000),
    lingua_originale character varying(100)
);


ALTER TABLE public.opera OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16983)
-- Name: opere_generi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.opere_generi (
    id_genere character varying(100) NOT NULL,
    id_opera character varying(100) NOT NULL
);


ALTER TABLE public.opere_generi OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16986)
-- Name: raccolta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.raccolta (
    nome character varying(100) NOT NULL,
    descrizione character varying(100),
    id_utente character varying(100) NOT NULL
);


ALTER TABLE public.raccolta OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16989)
-- Name: utente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.utente (
    username character varying(100) NOT NULL,
    password character varying(100),
    nazionalita character varying(100)
);


ALTER TABLE public.utente OWNER TO postgres;

--
-- TOC entry 3384 (class 0 OID 16948)
-- Dependencies: 209
-- Data for Name: amico; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.amico (utente1, utente2) FROM stdin;
\.


--
-- TOC entry 3385 (class 0 OID 16951)
-- Dependencies: 210
-- Data for Name: autore; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.autore (id, nome, cognome) FROM stdin;
1	Gabriel	García Márquez
2	Jane	Austen
3	Fyodor	Dostoevsky
4	Charles	Dickens
5	Ernest	Hemingway
6	James	Joyce
7	Franz	Kafka
8	Toni	Morrison
9	Virginia	Woolf
10	William	Shakespeare
\.


--
-- TOC entry 3386 (class 0 OID 16956)
-- Dependencies: 211
-- Data for Name: autore_opera; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.autore_opera (id_autore, id_opera) FROM stdin;
1	1
2	2
3	3
4	4
5	5
6	6
7	7
8	8
9	9
10	10
\.


--
-- TOC entry 3387 (class 0 OID 16959)
-- Dependencies: 212
-- Data for Name: azione; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.azione (id, tipo, "timestamp", id_edizione, id_utente) FROM stdin;
1	letti	2023-02-18 00:00:00	1	ok
\.


--
-- TOC entry 3388 (class 0 OID 16962)
-- Dependencies: 213
-- Data for Name: commento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.commento (id, testo, "timestamp", id_riferimento, tipo_riferimento) FROM stdin;
\.


--
-- TOC entry 3389 (class 0 OID 16967)
-- Dependencies: 214
-- Data for Name: edizione; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.edizione (id, isbn, data_pubblicazione, editore, numero_pagine, paese_pubblicazione, id_opera, lingua) FROM stdin;
1	978-88-04-65286-1	2015-01-01	Mondadori	432	Italia	1	Italiano
2	978-0-06-088328-7	1999-06-01	HarperCollins	417	Stati Uniti	1	Inglese
3	978-0141395203	2018-09-20	Penguin Classics	416	Regno Unito	2	Inglese
4	978-88-541-0045-5	2002-02-01	Newton Compton Editori	384	Italia	2	Italiano
5	978-0-679-60075-7	2004-04-27	Vintage	671	Stati Uniti	3	Inglese
6	978-88-09-77333-5	2012-06-01	Giunti	672	Italia	3	Italiano
7	978-0141439563	2003-02-27	Penguin Classics	544	Regno Unito	4	Inglese
8	978-0-553-21299-3	2007-03-13	Bantam Classics	480	Stati Uniti	4	Inglese
9	978-88-04-63630-3	2014-06-26	Arnoldo Mondadori Editore	360	Italia	5	Italiano
10	978-0-684-82637-8	1995-05-01	Scribner	332	Stati Uniti	5	Inglese
11	978-88-04-54744-5	2015-02-01	Mondadori	928	Italia	6	Italiano
12	978-0140186477	1986-06-16	Penguin Classics	768	Regno Unito	6	Inglese
13	978-0805210408	2004-09-07	Schocken Books	336	Stati Uniti	7	Inglese
14	978-8845259714	2009-03-01	Bompiani	352	Italia	7	Italiano
15	978-0452276725	1998-09-01	Plume	352	Stati Uniti	8	Inglese
16	978-88-04-56712-7	2007-06-01	Mondadori	255	Italia	8	Italiano
17	978-88-07-01903-1	2015-09-01	Feltrinelli	304	Italia	9	Italiano
18	978-0-679-78159-7	1997-08-01	Vintage	288	Stati Uniti	9	Inglese
19	978-8806245598	2019-02-07	Einaudi	416	Italia	10	Italiano
20	978-0-375-70443-3	2000-10-01	Vintage	432	Stati Uniti	10	Inglese
\.


--
-- TOC entry 3390 (class 0 OID 16972)
-- Dependencies: 215
-- Data for Name: edizione_raccolta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.edizione_raccolta (id_edizione, id_utente, nome_raccolta) FROM stdin;
\.


--
-- TOC entry 3391 (class 0 OID 16975)
-- Dependencies: 216
-- Data for Name: generi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.generi (id, descrizione) FROM stdin;
\.


--
-- TOC entry 3392 (class 0 OID 16978)
-- Dependencies: 217
-- Data for Name: opera; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.opera (id, titolo, anno, descrizione, lingua_originale) FROM stdin;
1	Cent'anni di solitudine	1967	Il romanzo racconta la storia della famiglia Buendía in un villaggio immaginario chiamato Macondo.	Spagnolo
2	Orgoglio e pregiudizio	1813	La storia segue le vicende delle sorelle Bennet e delle loro relazioni amorose.	Inglese
3	Delitto e castigo	1866	Il protagonista Raskolnikov uccide un usuraio e deve affrontare le conseguenze della sua azione.	Russo
4	Grandi speranze	1861	Il protagonista Pip viene aiutato da un benefattore anonimo a diventare un gentiluomo.	Inglese
5	Addio alle armi	1929	La storia segue le vicende di un americano che si arruola come ambulanza durante la prima guerra mondiale.	Inglese
6	Ulisse	1922	Il romanzo segue le avventure di Leopold Bloom e Stephen Dedalus durante un giorno a Dublino.	Inglese
7	Il processo	1925	Il protagonista Josef K. viene arrestato senza motivo e deve affrontare un processo misterioso.	Tedesco
8	Amatissima	1987	La storia segue le vicende di una giovane schiava africana e della sua relazione con il suo padrone.	Inglese
9	Mrs Dalloway	1925	Il romanzo segue una giornata nella vita di Clarissa Dalloway mentre si prepara per una festa.	Inglese
10	Romeo e Giulietta	1597	La storia segue la tragica relazione d'amore tra i protagonisti omonimi.	Inglese
\.


--
-- TOC entry 3393 (class 0 OID 16983)
-- Dependencies: 218
-- Data for Name: opere_generi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.opere_generi (id_genere, id_opera) FROM stdin;
\.


--
-- TOC entry 3394 (class 0 OID 16986)
-- Dependencies: 219
-- Data for Name: raccolta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.raccolta (nome, descrizione, id_utente) FROM stdin;
\.


--
-- TOC entry 3395 (class 0 OID 16989)
-- Dependencies: 220
-- Data for Name: utente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.utente (username, password, nazionalita) FROM stdin;
os	ok	ok
ok	ok	ok
or	ok	ok
osk	oks	oks
oska	oks	oks
ara	ara	ara
\.


--
-- TOC entry 3208 (class 2606 OID 16993)
-- Name: amico Amico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.amico
    ADD CONSTRAINT "Amico_pkey" PRIMARY KEY (utente1, utente2);


--
-- TOC entry 3212 (class 2606 OID 16995)
-- Name: autore_opera AutoreOpera_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autore_opera
    ADD CONSTRAINT "AutoreOpera_pkey" PRIMARY KEY (id_autore);


--
-- TOC entry 3210 (class 2606 OID 16997)
-- Name: autore Autore_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autore
    ADD CONSTRAINT "Autore_pkey" PRIMARY KEY (id);


--
-- TOC entry 3214 (class 2606 OID 16999)
-- Name: azione Azione_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.azione
    ADD CONSTRAINT "Azione_pkey" PRIMARY KEY (id);


--
-- TOC entry 3216 (class 2606 OID 17001)
-- Name: commento Commento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commento
    ADD CONSTRAINT "Commento_pkey" PRIMARY KEY (id);


--
-- TOC entry 3220 (class 2606 OID 17003)
-- Name: edizione_raccolta EdizioneRaccolta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.edizione_raccolta
    ADD CONSTRAINT "EdizioneRaccolta_pkey" PRIMARY KEY (id_edizione, id_utente, nome_raccolta);


--
-- TOC entry 3218 (class 2606 OID 17005)
-- Name: edizione Edizione_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.edizione
    ADD CONSTRAINT "Edizione_pkey" PRIMARY KEY (id);


--
-- TOC entry 3222 (class 2606 OID 17007)
-- Name: generi Generi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.generi
    ADD CONSTRAINT "Generi_pkey" PRIMARY KEY (id);


--
-- TOC entry 3224 (class 2606 OID 17009)
-- Name: opera Opera_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opera
    ADD CONSTRAINT "Opera_pkey" PRIMARY KEY (id);


--
-- TOC entry 3226 (class 2606 OID 17011)
-- Name: opere_generi OpereGeneri_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opere_generi
    ADD CONSTRAINT "OpereGeneri_pkey" PRIMARY KEY (id_genere, id_opera);


--
-- TOC entry 3228 (class 2606 OID 17013)
-- Name: raccolta Raccolta_Nome_IDUtente_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.raccolta
    ADD CONSTRAINT "Raccolta_Nome_IDUtente_key" UNIQUE (nome, id_utente);


--
-- TOC entry 3230 (class 2606 OID 17015)
-- Name: raccolta Raccolta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.raccolta
    ADD CONSTRAINT "Raccolta_pkey" PRIMARY KEY (nome, id_utente);


--
-- TOC entry 3232 (class 2606 OID 17017)
-- Name: utente Utente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utente
    ADD CONSTRAINT "Utente_pkey" PRIMARY KEY (username);


--
-- TOC entry 3233 (class 2606 OID 17018)
-- Name: amico Amico_Utente1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.amico
    ADD CONSTRAINT "Amico_Utente1_fkey" FOREIGN KEY (utente1) REFERENCES public.utente(username);


--
-- TOC entry 3234 (class 2606 OID 17023)
-- Name: amico Amico_Utente2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.amico
    ADD CONSTRAINT "Amico_Utente2_fkey" FOREIGN KEY (utente2) REFERENCES public.utente(username);


--
-- TOC entry 3235 (class 2606 OID 17028)
-- Name: autore_opera AutoreOpera_IDAutore_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autore_opera
    ADD CONSTRAINT "AutoreOpera_IDAutore_fkey" FOREIGN KEY (id_autore) REFERENCES public.autore(id);


--
-- TOC entry 3236 (class 2606 OID 17033)
-- Name: autore_opera AutoreOpera_IDOpera_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autore_opera
    ADD CONSTRAINT "AutoreOpera_IDOpera_fkey" FOREIGN KEY (id_opera) REFERENCES public.opera(id) NOT VALID;


--
-- TOC entry 3237 (class 2606 OID 17038)
-- Name: azione Azione_IDEdizione_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.azione
    ADD CONSTRAINT "Azione_IDEdizione_fkey" FOREIGN KEY (id_edizione) REFERENCES public.edizione(id);


--
-- TOC entry 3238 (class 2606 OID 17043)
-- Name: azione Azione_IDUtente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.azione
    ADD CONSTRAINT "Azione_IDUtente_fkey" FOREIGN KEY (id_utente) REFERENCES public.utente(username) NOT VALID;


--
-- TOC entry 3240 (class 2606 OID 17048)
-- Name: edizione_raccolta EdizioneRaccolta_IDEdizione_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.edizione_raccolta
    ADD CONSTRAINT "EdizioneRaccolta_IDEdizione_fkey" FOREIGN KEY (id_edizione) REFERENCES public.edizione(id);


--
-- TOC entry 3241 (class 2606 OID 17053)
-- Name: edizione_raccolta EdizioneRaccolta_raccolta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.edizione_raccolta
    ADD CONSTRAINT "EdizioneRaccolta_raccolta_fkey" FOREIGN KEY (id_utente, nome_raccolta) REFERENCES public.raccolta(id_utente, nome) NOT VALID;


--
-- TOC entry 3239 (class 2606 OID 17058)
-- Name: edizione Edizione_IDOpera_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.edizione
    ADD CONSTRAINT "Edizione_IDOpera_fkey" FOREIGN KEY (id_opera) REFERENCES public.opera(id) NOT VALID;


--
-- TOC entry 3242 (class 2606 OID 17063)
-- Name: opere_generi OpereGeneri_IDGenere_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opere_generi
    ADD CONSTRAINT "OpereGeneri_IDGenere_fkey" FOREIGN KEY (id_genere) REFERENCES public.generi(id);


--
-- TOC entry 3243 (class 2606 OID 17068)
-- Name: opere_generi OpereGeneri_IDOpera_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opere_generi
    ADD CONSTRAINT "OpereGeneri_IDOpera_fkey" FOREIGN KEY (id_opera) REFERENCES public.opera(id) NOT VALID;


--
-- TOC entry 3244 (class 2606 OID 17073)
-- Name: raccolta Raccolta_IDUtente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.raccolta
    ADD CONSTRAINT "Raccolta_IDUtente_fkey" FOREIGN KEY (id_utente) REFERENCES public.utente(username);


-- Completed on 2023-02-18 16:17:37

--
-- PostgreSQL database dump complete
--

