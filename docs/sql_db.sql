PGDMP     '                    {         	   bookshelf    15.2    15.1 V    y           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            z           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            {           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            |           1262    60764 	   bookshelf    DATABASE     |   CREATE DATABASE bookshelf WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Italian_Italy.1252';
    DROP DATABASE bookshelf;
                postgres    false                        3079    60765    unaccent 	   EXTENSION     <   CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;
    DROP EXTENSION unaccent;
                   false            }           0    0    EXTENSION unaccent    COMMENT     P   COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';
                        false    2            ?            1259    60772    autore    TABLE     s   CREATE TABLE public.autore (
    id integer NOT NULL,
    nome character varying,
    cognome character varying
);
    DROP TABLE public.autore;
       public         heap    postgres    false            ?            1259    60777    autore_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.autore_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.autore_id_seq;
       public          postgres    false    215            ~           0    0    autore_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.autore_id_seq OWNED BY public.autore.id;
          public          postgres    false    216            ?            1259    60778    autore_opera    TABLE     d   CREATE TABLE public.autore_opera (
    id_autore integer NOT NULL,
    id_opera integer NOT NULL
);
     DROP TABLE public.autore_opera;
       public         heap    postgres    false            ?            1259    60781    azione    TABLE     ?   CREATE TABLE public.azione (
    id integer NOT NULL,
    tipo character varying(100),
    "timestamp" timestamp without time zone,
    id_edizione integer,
    id_utente character varying(100)
);
    DROP TABLE public.azione;
       public         heap    postgres    false            ?            1259    60784    azione_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.azione_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.azione_id_seq;
       public          postgres    false    218                       0    0    azione_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.azione_id_seq OWNED BY public.azione.id;
          public          postgres    false    219            ?            1259    60785    commento    TABLE     ?   CREATE TABLE public.commento (
    id integer NOT NULL,
    testo character varying(10000),
    "timestamp" timestamp without time zone,
    id_riferimento integer,
    tipo_riferimento character varying(100),
    id_utente character varying(100)
);
    DROP TABLE public.commento;
       public         heap    postgres    false            ?            1259    60790    commento_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.commento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.commento_id_seq;
       public          postgres    false    220            ?           0    0    commento_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.commento_id_seq OWNED BY public.commento.id;
          public          postgres    false    221            ?            1259    60791    edizione    TABLE     ^  CREATE TABLE public.edizione (
    id integer NOT NULL,
    isbn character varying(100),
    data_pubblicazione date,
    editore character varying,
    numero_pagine integer,
    paese_pubblicazione character varying,
    id_opera integer,
    lingua character varying(20),
    url character varying(100),
    descrizione character varying(1000)
);
    DROP TABLE public.edizione;
       public         heap    postgres    false            ?            1259    60796    edizione_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.edizione_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.edizione_id_seq;
       public          postgres    false    222            ?           0    0    edizione_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.edizione_id_seq OWNED BY public.edizione.id;
          public          postgres    false    223            ?            1259    60797    edizione_raccolta    TABLE     ?   CREATE TABLE public.edizione_raccolta (
    id_edizione integer NOT NULL,
    id_utente character varying(100) NOT NULL,
    nome_raccolta character varying(100) NOT NULL
);
 %   DROP TABLE public.edizione_raccolta;
       public         heap    postgres    false            ?            1259    60800    genere    TABLE     Y   CREATE TABLE public.genere (
    id integer NOT NULL,
    nome character varying(100)
);
    DROP TABLE public.genere;
       public         heap    postgres    false            ?            1259    60803    genere_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.genere_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.genere_id_seq;
       public          postgres    false    225            ?           0    0    genere_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.genere_id_seq OWNED BY public.genere.id;
          public          postgres    false    226            ?            1259    60804    genere_opera    TABLE     d   CREATE TABLE public.genere_opera (
    id_genere integer NOT NULL,
    id_opera integer NOT NULL
);
     DROP TABLE public.genere_opera;
       public         heap    postgres    false            ?            1259    60807    mi_piace    TABLE     ?   CREATE TABLE public.mi_piace (
    id_riferimento integer NOT NULL,
    tipo_riferimento character varying NOT NULL,
    id_utente character varying NOT NULL
);
    DROP TABLE public.mi_piace;
       public         heap    postgres    false            ?            1259    60812    opera    TABLE     ?   CREATE TABLE public.opera (
    id integer NOT NULL,
    titolo character varying(100),
    anno integer,
    descrizione character varying(10000),
    lingua_originale character varying(100)
);
    DROP TABLE public.opera;
       public         heap    postgres    false            ?            1259    60817    opera_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.opera_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.opera_id_seq;
       public          postgres    false    229            ?           0    0    opera_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.opera_id_seq OWNED BY public.opera.id;
          public          postgres    false    230            ?            1259    60818    opere_preferite    VIEW     ?   CREATE VIEW public.opere_preferite AS
SELECT
    NULL::integer AS id,
    NULL::character varying(100) AS titolo,
    NULL::integer AS anno,
    NULL::character varying(10000) AS descrizione,
    NULL::character varying(100) AS lingua_originale;
 "   DROP VIEW public.opere_preferite;
       public          postgres    false            ?            1259    60822    raccolta    TABLE     ?   CREATE TABLE public.raccolta (
    nome character varying(100) NOT NULL,
    descrizione character varying(100),
    id_utente character varying(100) NOT NULL
);
    DROP TABLE public.raccolta;
       public         heap    postgres    false            ?            1259    60825    segue    TABLE     x   CREATE TABLE public.segue (
    seguace character varying(100) NOT NULL,
    seguito character varying(100) NOT NULL
);
    DROP TABLE public.segue;
       public         heap    postgres    false            ?            1259    60828    utente    TABLE     ?   CREATE TABLE public.utente (
    username character varying(100) NOT NULL,
    password character varying(100),
    nazionalita character varying(100)
);
    DROP TABLE public.utente;
       public         heap    postgres    false            ?           2604    60831 	   autore id    DEFAULT     f   ALTER TABLE ONLY public.autore ALTER COLUMN id SET DEFAULT nextval('public.autore_id_seq'::regclass);
 8   ALTER TABLE public.autore ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215            ?           2604    60832 	   azione id    DEFAULT     f   ALTER TABLE ONLY public.azione ALTER COLUMN id SET DEFAULT nextval('public.azione_id_seq'::regclass);
 8   ALTER TABLE public.azione ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218            ?           2604    60833    commento id    DEFAULT     j   ALTER TABLE ONLY public.commento ALTER COLUMN id SET DEFAULT nextval('public.commento_id_seq'::regclass);
 :   ALTER TABLE public.commento ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220            ?           2604    60834    edizione id    DEFAULT     j   ALTER TABLE ONLY public.edizione ALTER COLUMN id SET DEFAULT nextval('public.edizione_id_seq'::regclass);
 :   ALTER TABLE public.edizione ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222            ?           2604    60835 	   genere id    DEFAULT     f   ALTER TABLE ONLY public.genere ALTER COLUMN id SET DEFAULT nextval('public.genere_id_seq'::regclass);
 8   ALTER TABLE public.genere ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    225            ?           2604    60836    opera id    DEFAULT     d   ALTER TABLE ONLY public.opera ALTER COLUMN id SET DEFAULT nextval('public.opera_id_seq'::regclass);
 7   ALTER TABLE public.opera ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    229            d          0    60772    autore 
   TABLE DATA           3   COPY public.autore (id, nome, cognome) FROM stdin;
    public          postgres    false    215   hf       f          0    60778    autore_opera 
   TABLE DATA           ;   COPY public.autore_opera (id_autore, id_opera) FROM stdin;
    public          postgres    false    217   %g       g          0    60781    azione 
   TABLE DATA           O   COPY public.azione (id, tipo, "timestamp", id_edizione, id_utente) FROM stdin;
    public          postgres    false    218   dg       i          0    60785    commento 
   TABLE DATA           g   COPY public.commento (id, testo, "timestamp", id_riferimento, tipo_riferimento, id_utente) FROM stdin;
    public          postgres    false    220   eh       k          0    60791    edizione 
   TABLE DATA           ?   COPY public.edizione (id, isbn, data_pubblicazione, editore, numero_pagine, paese_pubblicazione, id_opera, lingua, url, descrizione) FROM stdin;
    public          postgres    false    222   ?j       m          0    60797    edizione_raccolta 
   TABLE DATA           R   COPY public.edizione_raccolta (id_edizione, id_utente, nome_raccolta) FROM stdin;
    public          postgres    false    224   ?m       n          0    60800    genere 
   TABLE DATA           *   COPY public.genere (id, nome) FROM stdin;
    public          postgres    false    225   ,n       p          0    60804    genere_opera 
   TABLE DATA           ;   COPY public.genere_opera (id_genere, id_opera) FROM stdin;
    public          postgres    false    227   ?n       q          0    60807    mi_piace 
   TABLE DATA           O   COPY public.mi_piace (id_riferimento, tipo_riferimento, id_utente) FROM stdin;
    public          postgres    false    228    o       r          0    60812    opera 
   TABLE DATA           P   COPY public.opera (id, titolo, anno, descrizione, lingua_originale) FROM stdin;
    public          postgres    false    229   po       t          0    60822    raccolta 
   TABLE DATA           @   COPY public.raccolta (nome, descrizione, id_utente) FROM stdin;
    public          postgres    false    232   r       u          0    60825    segue 
   TABLE DATA           1   COPY public.segue (seguace, seguito) FROM stdin;
    public          postgres    false    233   s       v          0    60828    utente 
   TABLE DATA           A   COPY public.utente (username, password, nazionalita) FROM stdin;
    public          postgres    false    234   -s       ?           0    0    autore_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.autore_id_seq', 1, false);
          public          postgres    false    216            ?           0    0    azione_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.azione_id_seq', 19, true);
          public          postgres    false    219            ?           0    0    commento_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.commento_id_seq', 29, true);
          public          postgres    false    221            ?           0    0    edizione_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.edizione_id_seq', 1, false);
          public          postgres    false    223            ?           0    0    genere_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.genere_id_seq', 11, true);
          public          postgres    false    226            ?           0    0    opera_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.opera_id_seq', 1, false);
          public          postgres    false    230            ?           2606    60838    segue Amico_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.segue
    ADD CONSTRAINT "Amico_pkey" PRIMARY KEY (seguace, seguito);
 <   ALTER TABLE ONLY public.segue DROP CONSTRAINT "Amico_pkey";
       public            postgres    false    233    233            ?           2606    60840    autore Autore_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.autore
    ADD CONSTRAINT "Autore_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.autore DROP CONSTRAINT "Autore_pkey";
       public            postgres    false    215            ?           2606    60842    azione Azione_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.azione
    ADD CONSTRAINT "Azione_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.azione DROP CONSTRAINT "Azione_pkey";
       public            postgres    false    218            ?           2606    60844    commento Commento_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.commento
    ADD CONSTRAINT "Commento_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.commento DROP CONSTRAINT "Commento_pkey";
       public            postgres    false    220            ?           2606    60846 '   edizione_raccolta EdizioneRaccolta_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY public.edizione_raccolta
    ADD CONSTRAINT "EdizioneRaccolta_pkey" PRIMARY KEY (id_edizione, id_utente, nome_raccolta);
 S   ALTER TABLE ONLY public.edizione_raccolta DROP CONSTRAINT "EdizioneRaccolta_pkey";
       public            postgres    false    224    224    224            ?           2606    60848    edizione Edizione_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.edizione
    ADD CONSTRAINT "Edizione_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.edizione DROP CONSTRAINT "Edizione_pkey";
       public            postgres    false    222            ?           2606    60850    genere Generi_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.genere
    ADD CONSTRAINT "Generi_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.genere DROP CONSTRAINT "Generi_pkey";
       public            postgres    false    225            ?           2606    60852    opera Opera_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.opera
    ADD CONSTRAINT "Opera_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.opera DROP CONSTRAINT "Opera_pkey";
       public            postgres    false    229            ?           2606    60854    genere_opera OpereGeneri_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.genere_opera
    ADD CONSTRAINT "OpereGeneri_pkey" PRIMARY KEY (id_genere, id_opera);
 I   ALTER TABLE ONLY public.genere_opera DROP CONSTRAINT "OpereGeneri_pkey";
       public            postgres    false    227    227            ?           2606    60856 #   raccolta Raccolta_Nome_IDUtente_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.raccolta
    ADD CONSTRAINT "Raccolta_Nome_IDUtente_key" UNIQUE (nome, id_utente);
 O   ALTER TABLE ONLY public.raccolta DROP CONSTRAINT "Raccolta_Nome_IDUtente_key";
       public            postgres    false    232    232            ?           2606    60858    raccolta Raccolta_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.raccolta
    ADD CONSTRAINT "Raccolta_pkey" PRIMARY KEY (nome, id_utente);
 B   ALTER TABLE ONLY public.raccolta DROP CONSTRAINT "Raccolta_pkey";
       public            postgres    false    232    232            ?           2606    60860    utente Utente_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.utente
    ADD CONSTRAINT "Utente_pkey" PRIMARY KEY (username);
 >   ALTER TABLE ONLY public.utente DROP CONSTRAINT "Utente_pkey";
       public            postgres    false    234            ?           2606    60862    autore_opera autore_opera_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.autore_opera
    ADD CONSTRAINT autore_opera_pkey PRIMARY KEY (id_autore, id_opera);
 H   ALTER TABLE ONLY public.autore_opera DROP CONSTRAINT autore_opera_pkey;
       public            postgres    false    217    217            ?           2606    60864    mi_piace mi_piace_pkey1 
   CONSTRAINT     ~   ALTER TABLE ONLY public.mi_piace
    ADD CONSTRAINT mi_piace_pkey1 PRIMARY KEY (id_riferimento, tipo_riferimento, id_utente);
 A   ALTER TABLE ONLY public.mi_piace DROP CONSTRAINT mi_piace_pkey1;
       public            postgres    false    228    228    228            c           2618    60821    opere_preferite _RETURN    RULE     ?  CREATE OR REPLACE VIEW public.opere_preferite AS
 SELECT o.id,
    o.titolo,
    o.anno,
    o.descrizione,
    o.lingua_originale
   FROM (public.opera o
     LEFT JOIN ( SELECT mi_piace.id_riferimento
           FROM public.mi_piace
          WHERE ((mi_piace.tipo_riferimento)::text = 'opera'::text)) mp ON ((o.id = mp.id_riferimento)))
  GROUP BY o.id
  ORDER BY COALESCE(count(mp.id_riferimento), (0)::bigint) DESC;
   CREATE OR REPLACE VIEW public.opere_preferite AS
SELECT
    NULL::integer AS id,
    NULL::character varying(100) AS titolo,
    NULL::integer AS anno,
    NULL::character varying(10000) AS descrizione,
    NULL::character varying(100) AS lingua_originale;
       public          postgres    false    3262    229    229    229    229    229    228    228    231            ?           2606    60866    segue Amico_Utente1_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.segue
    ADD CONSTRAINT "Amico_Utente1_fkey" FOREIGN KEY (seguace) REFERENCES public.utente(username);
 D   ALTER TABLE ONLY public.segue DROP CONSTRAINT "Amico_Utente1_fkey";
       public          postgres    false    233    3270    234            ?           2606    60871    segue Amico_Utente2_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.segue
    ADD CONSTRAINT "Amico_Utente2_fkey" FOREIGN KEY (seguito) REFERENCES public.utente(username);
 D   ALTER TABLE ONLY public.segue DROP CONSTRAINT "Amico_Utente2_fkey";
       public          postgres    false    234    233    3270            ?           2606    60876 &   autore_opera AutoreOpera_IDAutore_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.autore_opera
    ADD CONSTRAINT "AutoreOpera_IDAutore_fkey" FOREIGN KEY (id_autore) REFERENCES public.autore(id);
 R   ALTER TABLE ONLY public.autore_opera DROP CONSTRAINT "AutoreOpera_IDAutore_fkey";
       public          postgres    false    3244    217    215            ?           2606    60881 %   autore_opera AutoreOpera_IDOpera_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.autore_opera
    ADD CONSTRAINT "AutoreOpera_IDOpera_fkey" FOREIGN KEY (id_opera) REFERENCES public.opera(id) NOT VALID;
 Q   ALTER TABLE ONLY public.autore_opera DROP CONSTRAINT "AutoreOpera_IDOpera_fkey";
       public          postgres    false    3262    217    229            ?           2606    60886    azione Azione_IDEdizione_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.azione
    ADD CONSTRAINT "Azione_IDEdizione_fkey" FOREIGN KEY (id_edizione) REFERENCES public.edizione(id);
 I   ALTER TABLE ONLY public.azione DROP CONSTRAINT "Azione_IDEdizione_fkey";
       public          postgres    false    3252    218    222            ?           2606    60891    azione Azione_IDUtente_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.azione
    ADD CONSTRAINT "Azione_IDUtente_fkey" FOREIGN KEY (id_utente) REFERENCES public.utente(username) NOT VALID;
 G   ALTER TABLE ONLY public.azione DROP CONSTRAINT "Azione_IDUtente_fkey";
       public          postgres    false    3270    218    234            ?           2606    60896 2   edizione_raccolta EdizioneRaccolta_IDEdizione_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.edizione_raccolta
    ADD CONSTRAINT "EdizioneRaccolta_IDEdizione_fkey" FOREIGN KEY (id_edizione) REFERENCES public.edizione(id);
 ^   ALTER TABLE ONLY public.edizione_raccolta DROP CONSTRAINT "EdizioneRaccolta_IDEdizione_fkey";
       public          postgres    false    3252    222    224            ?           2606    60901 0   edizione_raccolta EdizioneRaccolta_raccolta_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.edizione_raccolta
    ADD CONSTRAINT "EdizioneRaccolta_raccolta_fkey" FOREIGN KEY (id_utente, nome_raccolta) REFERENCES public.raccolta(id_utente, nome) NOT VALID;
 \   ALTER TABLE ONLY public.edizione_raccolta DROP CONSTRAINT "EdizioneRaccolta_raccolta_fkey";
       public          postgres    false    3264    224    224    232    232            ?           2606    60906    edizione Edizione_IDOpera_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.edizione
    ADD CONSTRAINT "Edizione_IDOpera_fkey" FOREIGN KEY (id_opera) REFERENCES public.opera(id) NOT VALID;
 J   ALTER TABLE ONLY public.edizione DROP CONSTRAINT "Edizione_IDOpera_fkey";
       public          postgres    false    222    3262    229            ?           2606    60911 &   genere_opera OpereGeneri_IDGenere_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.genere_opera
    ADD CONSTRAINT "OpereGeneri_IDGenere_fkey" FOREIGN KEY (id_genere) REFERENCES public.genere(id);
 R   ALTER TABLE ONLY public.genere_opera DROP CONSTRAINT "OpereGeneri_IDGenere_fkey";
       public          postgres    false    225    227    3256            ?           2606    60916 %   genere_opera OpereGeneri_IDOpera_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.genere_opera
    ADD CONSTRAINT "OpereGeneri_IDOpera_fkey" FOREIGN KEY (id_opera) REFERENCES public.opera(id) NOT VALID;
 Q   ALTER TABLE ONLY public.genere_opera DROP CONSTRAINT "OpereGeneri_IDOpera_fkey";
       public          postgres    false    3262    227    229            ?           2606    60921    raccolta Raccolta_IDUtente_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.raccolta
    ADD CONSTRAINT "Raccolta_IDUtente_fkey" FOREIGN KEY (id_utente) REFERENCES public.utente(username);
 K   ALTER TABLE ONLY public.raccolta DROP CONSTRAINT "Raccolta_IDUtente_fkey";
       public          postgres    false    3270    232    234            ?           2606    60926     commento commento_id_utente_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.commento
    ADD CONSTRAINT commento_id_utente_fkey FOREIGN KEY (id_utente) REFERENCES public.utente(username) NOT VALID;
 J   ALTER TABLE ONLY public.commento DROP CONSTRAINT commento_id_utente_fkey;
       public          postgres    false    3270    234    220            ?           2606    60931 !   mi_piace mi_piace_id_utente_fkey1    FK CONSTRAINT     ?   ALTER TABLE ONLY public.mi_piace
    ADD CONSTRAINT mi_piace_id_utente_fkey1 FOREIGN KEY (id_utente) REFERENCES public.utente(username);
 K   ALTER TABLE ONLY public.mi_piace DROP CONSTRAINT mi_piace_id_utente_fkey1;
       public          postgres    false    234    228    3270            d   ?   x??=nQE??z? ?'?(??(44fb??76????dY?T??t?X?1TR?(???>?v??f????,????s???ˆ?x?p$ɘkQ?e?=Lr??Tj?nh?n????)?&X?>?L??pSl=B?M??qVS??=????^SR???p)?*B?.?Am={      f   /   x??I   ?????(??:H???'?Ų(7???r? ??????      g   ?   x????j?0????}?
K???tY?Jv?%?4+??s?Hw? ??#?f8u?p?,{?{??????QI?e?M?Ͷ?????v_???T??????;?K?v;?$&?E,??}??شEx???أ??????V??F4?
^???^?=??YW#?p??p???ٶ?-?????I3??(??Q?{<?O"h????8$?2??????Zt?C?C?`???71??C?8?}So???WG??      i   5  x?}?Kk?0????P????o!}?ChCO?(?ٚn???n????e??v0?]?o^	E??"??@@? ??A"$?ZE?[?E[?a_D???Y??ʋI??`???3??ԯ=?????<+?N?d?uc?Z>d?_ HM?(R??༸?6=??bٚ?i?BNk.1????M??x.???Zj?1?'pQ'27^T}?8?,(M????2<T0N?%??r~?б?){??7ۣ???U???q?!-x???$?05????Ҡ?<?g??r-i^?{MZTѣ??4??6??????%???kЉM??Kw?c??n?O??hο?7#(??p5D???x??܏yӷ??R?????'??#}??????~^~??q{???Q:h?}GXx?=?T? x^	?T?Q?????Y+D???
?U%{?@+?`E-??s9?V?/p~??.??H?I?????:?y???4??׾??n?Tt8?t2>?yhY??i??m??x{ L%??	?c>????????r?ߏ???um???}?O?c9???wᕓ?,w}?l???E??̺*Wۏ?(?/HI??
_1??Vs????,_eq      k   ?  x??U?n?0<?_?`??7?M??=4Z??\??u??T`+??w)K??? ????hfgg?y??s7Z8Ñ	@??bߺ??wݱaJ
???ۦf8???ﺧ?chW???+?悪9??p??y??n6b???sR8nz??Ⱦ???p??ڶ?'?в}?7۟?雄?m8??pYa)ϐ?Pz-@&Zt?? v????۫?>???i????? ?1Q?պ6GU??Z???4????M??wT???????H\??$?(?+????У??zn ?&??Tj???W{z???ƲDXVcIcf?xn??r??bl?????&??]$??;?HOV???έT?K?Z	2)J?޴R+??R???Z?F%??\? ???6JvY?,???d??wU????DJ#a?E???}:Ʈ?u?y?F&L*??ʺ*??d$??FZ???R2?p??Dݕ?K??D\?o%?c??Rg/?qf^3?714E???A(&QeSQޑ?4?old??ldJ??6?1?h?????H?G1???=<???L???&?Җ@m?W? ?RZho?? }?-?yI?A????y*mQM[M?? Ɯ!ai?u?Ɛq۾?p???+?q?P?0KWP\?s??1a^]!?dw??<\?vơ?ѧ???WI?$?1??H??c??lj^??3ńs?r???/LԔ!`???'ˡ?ɲ?&?/?fXy?B??F?j,X-?)d?0??<?#p?%?
?UX??>????f?????      m   ?   x?]?K
?0??u?=??Bi,??J???C(?????F??.?oR?ǅD??=k?9S????0?fT??j?F?o??????߹?,U??P?c.??,/CN|??M
??+?_Y????8<??????+%8? ?_D?      n   v   x??9?@?x?? ?܄?3CH?5?h/	^??*#c????\
?;?s??M?N?,???E?k͆Rq?A?\?InL?Eq???%??h?4???.皦?F????x????&^      p   >   x????0?3??K/鿎Lo??⎁??c???M?|p-l????:?N??????E      q   `   x?3??/H-J??/??2?L???M?+?s?P?&貉U??y????\?HldC@<??@??E?1??!gjJ&?4S??nE?y?? ?h?p˹b???? ]@?      r   ?  x????NA?????7?`??	??Ar˥?m/-f?W??Q?Ny??Xj6?8%'???U?u??ͅ?|?!(uJɜ??i?f?Z?4׎?y??mk!39??-*S'7k??;ܞ	ݯ?L?o?^??{?5p?u???9?2?uv???s6[4?boe$4D?N6j??t~???d??E?	Z(??C?=N???d?>va^cB??}???:?N?̎?KA?\E[NY?*?\??C??=~????ӓ??O6Ri[?0R?T"O?;?x???R?"?d6l?V*L?8?+)??}s9T???b#U}?J???+Zr?q???5?>9?????Q???Wz\?+??%?qs?u??G???b?O?Zg???-??H ??!Xk??Cq? ??ԲQ=?????se???|u?R-?b?_??k?'7b???Ν???,ã???]I;??[-?J??<8{?O????T??W???$k?x????	{???[????Cw;?<&?%H?NRk????G`@?????s22L?zxFh=??i?UۊO?#uxh4p??m???ۘ?k???c?o?Ϛ10@?Ia?\[E?8%ލ ??ĩ
8?c???4b]??H??5w(I?v?ũ?ǫ70???v?UwP???7???RB??{}??v8??~?      t   ?   x?u??n? E??+???U?!1?ۧ}??ĐP?A??/?Q??sr??	???????"wI?;??m??@?}u?k?6?[?5???@?????l???L`g}Ҙ?$Th_C?GS\???3??4??T-?V? juf????{'?\"Mϥ ??1????&??l??s6Ǧp????C?e?|?j??X????0???+x{??????h??n??7??6?7??_?:?~?D?????J??n      u      x?K,???I??L?????? )"      v   ?   x?=??
?@D????[A(Ԟz*^b]uq?Y?????$y3aT?ǚ?n?0?I?k??_D??a#? ?@??/I@[??o??#ר??e??VPZW?S??.???9?k?????l?N?.????vb??/@?     