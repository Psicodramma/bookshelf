PGDMP         ;                {            bookshelfTest    15.2    15.1 R    m           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            n           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            o           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            p           1262    26098    bookshelfTest    DATABASE     �   CREATE DATABASE "bookshelfTest" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Italian_Italy.1252';
    DROP DATABASE "bookshelfTest";
                postgres    false            �            1259    26099    autore    TABLE     s   CREATE TABLE public.autore (
    id integer NOT NULL,
    nome character varying,
    cognome character varying
);
    DROP TABLE public.autore;
       public         heap    postgres    false            �            1259    26104    autore_id_seq    SEQUENCE     �   CREATE SEQUENCE public.autore_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.autore_id_seq;
       public          postgres    false    214            q           0    0    autore_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.autore_id_seq OWNED BY public.autore.id;
          public          postgres    false    215            �            1259    26105    autore_opera    TABLE     d   CREATE TABLE public.autore_opera (
    id_autore integer NOT NULL,
    id_opera integer NOT NULL
);
     DROP TABLE public.autore_opera;
       public         heap    postgres    false            �            1259    26108    azione    TABLE     �   CREATE TABLE public.azione (
    id integer NOT NULL,
    tipo character varying(100),
    "timestamp" timestamp without time zone,
    id_edizione integer,
    id_utente character varying(100)
);
    DROP TABLE public.azione;
       public         heap    postgres    false            �            1259    26111    azione_id_seq    SEQUENCE     �   CREATE SEQUENCE public.azione_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.azione_id_seq;
       public          postgres    false    217            r           0    0    azione_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.azione_id_seq OWNED BY public.azione.id;
          public          postgres    false    218            �            1259    26112    commento    TABLE     �   CREATE TABLE public.commento (
    id integer NOT NULL,
    testo character varying(10000),
    "timestamp" timestamp without time zone,
    id_riferimento integer,
    tipo_riferimento character varying(100),
    id_utente character varying(100)
);
    DROP TABLE public.commento;
       public         heap    postgres    false            �            1259    26117    commento_id_seq    SEQUENCE     �   CREATE SEQUENCE public.commento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.commento_id_seq;
       public          postgres    false    219            s           0    0    commento_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.commento_id_seq OWNED BY public.commento.id;
          public          postgres    false    220            �            1259    26118    edizione    TABLE       CREATE TABLE public.edizione (
    id integer NOT NULL,
    isbn character varying(100),
    data_pubblicazione date,
    editore character varying,
    numero_pagine integer,
    paese_pubblicazione character varying,
    id_opera integer,
    lingua character varying(20)
);
    DROP TABLE public.edizione;
       public         heap    postgres    false            �            1259    26123    edizione_id_seq    SEQUENCE     �   CREATE SEQUENCE public.edizione_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.edizione_id_seq;
       public          postgres    false    221            t           0    0    edizione_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.edizione_id_seq OWNED BY public.edizione.id;
          public          postgres    false    222            �            1259    26124    edizione_raccolta    TABLE     �   CREATE TABLE public.edizione_raccolta (
    id_edizione integer NOT NULL,
    id_utente character varying(100) NOT NULL,
    nome_raccolta character varying(100) NOT NULL
);
 %   DROP TABLE public.edizione_raccolta;
       public         heap    postgres    false            �            1259    26127    genere    TABLE     Y   CREATE TABLE public.genere (
    id integer NOT NULL,
    nome character varying(100)
);
    DROP TABLE public.genere;
       public         heap    postgres    false            �            1259    26130    genere_id_seq    SEQUENCE     �   CREATE SEQUENCE public.genere_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.genere_id_seq;
       public          postgres    false    224            u           0    0    genere_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.genere_id_seq OWNED BY public.genere.id;
          public          postgres    false    225            �            1259    26131    genere_opera    TABLE     d   CREATE TABLE public.genere_opera (
    id_genere integer NOT NULL,
    id_opera integer NOT NULL
);
     DROP TABLE public.genere_opera;
       public         heap    postgres    false            �            1259    26134    mi_piace    TABLE     �   CREATE TABLE public.mi_piace (
    id_riferimento integer NOT NULL,
    tipo_riferimento character varying NOT NULL,
    id_utente character varying NOT NULL
);
    DROP TABLE public.mi_piace;
       public         heap    postgres    false            �            1259    26139    opera    TABLE     �   CREATE TABLE public.opera (
    id integer NOT NULL,
    titolo character varying(100),
    anno integer,
    descrizione character varying(10000),
    lingua_originale character varying(100)
);
    DROP TABLE public.opera;
       public         heap    postgres    false            �            1259    26144    opera_id_seq    SEQUENCE     �   CREATE SEQUENCE public.opera_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.opera_id_seq;
       public          postgres    false    228            v           0    0    opera_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.opera_id_seq OWNED BY public.opera.id;
          public          postgres    false    229            �            1259    26145    raccolta    TABLE     �   CREATE TABLE public.raccolta (
    nome character varying(100) NOT NULL,
    descrizione character varying(100),
    id_utente character varying(100) NOT NULL
);
    DROP TABLE public.raccolta;
       public         heap    postgres    false            �            1259    26148    segue    TABLE     x   CREATE TABLE public.segue (
    seguace character varying(100) NOT NULL,
    seguito character varying(100) NOT NULL
);
    DROP TABLE public.segue;
       public         heap    postgres    false            �            1259    26151    utente    TABLE     �   CREATE TABLE public.utente (
    username character varying(100) NOT NULL,
    password character varying(100),
    nazionalita character varying(100)
);
    DROP TABLE public.utente;
       public         heap    postgres    false            �           2604    26154 	   autore id    DEFAULT     f   ALTER TABLE ONLY public.autore ALTER COLUMN id SET DEFAULT nextval('public.autore_id_seq'::regclass);
 8   ALTER TABLE public.autore ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214            �           2604    26155 	   azione id    DEFAULT     f   ALTER TABLE ONLY public.azione ALTER COLUMN id SET DEFAULT nextval('public.azione_id_seq'::regclass);
 8   ALTER TABLE public.azione ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217            �           2604    26156    commento id    DEFAULT     j   ALTER TABLE ONLY public.commento ALTER COLUMN id SET DEFAULT nextval('public.commento_id_seq'::regclass);
 :   ALTER TABLE public.commento ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219            �           2604    26157    edizione id    DEFAULT     j   ALTER TABLE ONLY public.edizione ALTER COLUMN id SET DEFAULT nextval('public.edizione_id_seq'::regclass);
 :   ALTER TABLE public.edizione ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221            �           2604    26158 	   genere id    DEFAULT     f   ALTER TABLE ONLY public.genere ALTER COLUMN id SET DEFAULT nextval('public.genere_id_seq'::regclass);
 8   ALTER TABLE public.genere ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224            �           2604    26159    opera id    DEFAULT     d   ALTER TABLE ONLY public.opera ALTER COLUMN id SET DEFAULT nextval('public.opera_id_seq'::regclass);
 7   ALTER TABLE public.opera ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    228            X          0    26099    autore 
   TABLE DATA           3   COPY public.autore (id, nome, cognome) FROM stdin;
    public          postgres    false    214   U_       Z          0    26105    autore_opera 
   TABLE DATA           ;   COPY public.autore_opera (id_autore, id_opera) FROM stdin;
    public          postgres    false    216   r_       [          0    26108    azione 
   TABLE DATA           O   COPY public.azione (id, tipo, "timestamp", id_edizione, id_utente) FROM stdin;
    public          postgres    false    217   �_       ]          0    26112    commento 
   TABLE DATA           g   COPY public.commento (id, testo, "timestamp", id_riferimento, tipo_riferimento, id_utente) FROM stdin;
    public          postgres    false    219   �_       _          0    26118    edizione 
   TABLE DATA              COPY public.edizione (id, isbn, data_pubblicazione, editore, numero_pagine, paese_pubblicazione, id_opera, lingua) FROM stdin;
    public          postgres    false    221   �_       a          0    26124    edizione_raccolta 
   TABLE DATA           R   COPY public.edizione_raccolta (id_edizione, id_utente, nome_raccolta) FROM stdin;
    public          postgres    false    223   �_       b          0    26127    genere 
   TABLE DATA           *   COPY public.genere (id, nome) FROM stdin;
    public          postgres    false    224   `       d          0    26131    genere_opera 
   TABLE DATA           ;   COPY public.genere_opera (id_genere, id_opera) FROM stdin;
    public          postgres    false    226    `       e          0    26134    mi_piace 
   TABLE DATA           O   COPY public.mi_piace (id_riferimento, tipo_riferimento, id_utente) FROM stdin;
    public          postgres    false    227   =`       f          0    26139    opera 
   TABLE DATA           P   COPY public.opera (id, titolo, anno, descrizione, lingua_originale) FROM stdin;
    public          postgres    false    228   Z`       h          0    26145    raccolta 
   TABLE DATA           @   COPY public.raccolta (nome, descrizione, id_utente) FROM stdin;
    public          postgres    false    230   w`       i          0    26148    segue 
   TABLE DATA           1   COPY public.segue (seguace, seguito) FROM stdin;
    public          postgres    false    231   �`       j          0    26151    utente 
   TABLE DATA           A   COPY public.utente (username, password, nazionalita) FROM stdin;
    public          postgres    false    232   �`       w           0    0    autore_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.autore_id_seq', 1, false);
          public          postgres    false    215            x           0    0    azione_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.azione_id_seq', 1, false);
          public          postgres    false    218            y           0    0    commento_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.commento_id_seq', 1, false);
          public          postgres    false    220            z           0    0    edizione_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.edizione_id_seq', 1, false);
          public          postgres    false    222            {           0    0    genere_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.genere_id_seq', 1, false);
          public          postgres    false    225            |           0    0    opera_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.opera_id_seq', 1, false);
          public          postgres    false    229            �           2606    26161    segue Amico_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.segue
    ADD CONSTRAINT "Amico_pkey" PRIMARY KEY (seguace, seguito);
 <   ALTER TABLE ONLY public.segue DROP CONSTRAINT "Amico_pkey";
       public            postgres    false    231    231            �           2606    26163    autore_opera AutoreOpera_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.autore_opera
    ADD CONSTRAINT "AutoreOpera_pkey" PRIMARY KEY (id_autore);
 I   ALTER TABLE ONLY public.autore_opera DROP CONSTRAINT "AutoreOpera_pkey";
       public            postgres    false    216            �           2606    26165    autore Autore_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.autore
    ADD CONSTRAINT "Autore_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.autore DROP CONSTRAINT "Autore_pkey";
       public            postgres    false    214            �           2606    26167    azione Azione_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.azione
    ADD CONSTRAINT "Azione_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.azione DROP CONSTRAINT "Azione_pkey";
       public            postgres    false    217            �           2606    26169    commento Commento_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.commento
    ADD CONSTRAINT "Commento_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.commento DROP CONSTRAINT "Commento_pkey";
       public            postgres    false    219            �           2606    26171 '   edizione_raccolta EdizioneRaccolta_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.edizione_raccolta
    ADD CONSTRAINT "EdizioneRaccolta_pkey" PRIMARY KEY (id_edizione, id_utente, nome_raccolta);
 S   ALTER TABLE ONLY public.edizione_raccolta DROP CONSTRAINT "EdizioneRaccolta_pkey";
       public            postgres    false    223    223    223            �           2606    26173    edizione Edizione_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.edizione
    ADD CONSTRAINT "Edizione_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.edizione DROP CONSTRAINT "Edizione_pkey";
       public            postgres    false    221            �           2606    26175    genere Generi_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.genere
    ADD CONSTRAINT "Generi_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.genere DROP CONSTRAINT "Generi_pkey";
       public            postgres    false    224            �           2606    26177    opera Opera_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.opera
    ADD CONSTRAINT "Opera_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.opera DROP CONSTRAINT "Opera_pkey";
       public            postgres    false    228            �           2606    26179    genere_opera OpereGeneri_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.genere_opera
    ADD CONSTRAINT "OpereGeneri_pkey" PRIMARY KEY (id_genere, id_opera);
 I   ALTER TABLE ONLY public.genere_opera DROP CONSTRAINT "OpereGeneri_pkey";
       public            postgres    false    226    226            �           2606    26181 #   raccolta Raccolta_Nome_IDUtente_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.raccolta
    ADD CONSTRAINT "Raccolta_Nome_IDUtente_key" UNIQUE (nome, id_utente);
 O   ALTER TABLE ONLY public.raccolta DROP CONSTRAINT "Raccolta_Nome_IDUtente_key";
       public            postgres    false    230    230            �           2606    26183    raccolta Raccolta_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.raccolta
    ADD CONSTRAINT "Raccolta_pkey" PRIMARY KEY (nome, id_utente);
 B   ALTER TABLE ONLY public.raccolta DROP CONSTRAINT "Raccolta_pkey";
       public            postgres    false    230    230            �           2606    26185    utente Utente_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.utente
    ADD CONSTRAINT "Utente_pkey" PRIMARY KEY (username);
 >   ALTER TABLE ONLY public.utente DROP CONSTRAINT "Utente_pkey";
       public            postgres    false    232            �           2606    26187    mi_piace mi_piace_pkey1 
   CONSTRAINT     ~   ALTER TABLE ONLY public.mi_piace
    ADD CONSTRAINT mi_piace_pkey1 PRIMARY KEY (id_riferimento, tipo_riferimento, id_utente);
 A   ALTER TABLE ONLY public.mi_piace DROP CONSTRAINT mi_piace_pkey1;
       public            postgres    false    227    227    227            �           2606    26188    segue Amico_Utente1_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.segue
    ADD CONSTRAINT "Amico_Utente1_fkey" FOREIGN KEY (seguace) REFERENCES public.utente(username);
 D   ALTER TABLE ONLY public.segue DROP CONSTRAINT "Amico_Utente1_fkey";
       public          postgres    false    232    231    3259            �           2606    26193    segue Amico_Utente2_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.segue
    ADD CONSTRAINT "Amico_Utente2_fkey" FOREIGN KEY (seguito) REFERENCES public.utente(username);
 D   ALTER TABLE ONLY public.segue DROP CONSTRAINT "Amico_Utente2_fkey";
       public          postgres    false    232    3259    231            �           2606    26198 &   autore_opera AutoreOpera_IDAutore_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.autore_opera
    ADD CONSTRAINT "AutoreOpera_IDAutore_fkey" FOREIGN KEY (id_autore) REFERENCES public.autore(id);
 R   ALTER TABLE ONLY public.autore_opera DROP CONSTRAINT "AutoreOpera_IDAutore_fkey";
       public          postgres    false    214    3233    216            �           2606    26203 %   autore_opera AutoreOpera_IDOpera_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.autore_opera
    ADD CONSTRAINT "AutoreOpera_IDOpera_fkey" FOREIGN KEY (id_opera) REFERENCES public.opera(id) NOT VALID;
 Q   ALTER TABLE ONLY public.autore_opera DROP CONSTRAINT "AutoreOpera_IDOpera_fkey";
       public          postgres    false    216    228    3251            �           2606    26208    azione Azione_IDEdizione_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.azione
    ADD CONSTRAINT "Azione_IDEdizione_fkey" FOREIGN KEY (id_edizione) REFERENCES public.edizione(id);
 I   ALTER TABLE ONLY public.azione DROP CONSTRAINT "Azione_IDEdizione_fkey";
       public          postgres    false    221    217    3241            �           2606    26213    azione Azione_IDUtente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.azione
    ADD CONSTRAINT "Azione_IDUtente_fkey" FOREIGN KEY (id_utente) REFERENCES public.utente(username) NOT VALID;
 G   ALTER TABLE ONLY public.azione DROP CONSTRAINT "Azione_IDUtente_fkey";
       public          postgres    false    217    3259    232            �           2606    26218 2   edizione_raccolta EdizioneRaccolta_IDEdizione_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.edizione_raccolta
    ADD CONSTRAINT "EdizioneRaccolta_IDEdizione_fkey" FOREIGN KEY (id_edizione) REFERENCES public.edizione(id);
 ^   ALTER TABLE ONLY public.edizione_raccolta DROP CONSTRAINT "EdizioneRaccolta_IDEdizione_fkey";
       public          postgres    false    223    3241    221            �           2606    26223 0   edizione_raccolta EdizioneRaccolta_raccolta_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.edizione_raccolta
    ADD CONSTRAINT "EdizioneRaccolta_raccolta_fkey" FOREIGN KEY (id_utente, nome_raccolta) REFERENCES public.raccolta(id_utente, nome) NOT VALID;
 \   ALTER TABLE ONLY public.edizione_raccolta DROP CONSTRAINT "EdizioneRaccolta_raccolta_fkey";
       public          postgres    false    223    223    230    230    3253            �           2606    26228    edizione Edizione_IDOpera_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.edizione
    ADD CONSTRAINT "Edizione_IDOpera_fkey" FOREIGN KEY (id_opera) REFERENCES public.opera(id) NOT VALID;
 J   ALTER TABLE ONLY public.edizione DROP CONSTRAINT "Edizione_IDOpera_fkey";
       public          postgres    false    228    3251    221            �           2606    26233 &   genere_opera OpereGeneri_IDGenere_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.genere_opera
    ADD CONSTRAINT "OpereGeneri_IDGenere_fkey" FOREIGN KEY (id_genere) REFERENCES public.genere(id);
 R   ALTER TABLE ONLY public.genere_opera DROP CONSTRAINT "OpereGeneri_IDGenere_fkey";
       public          postgres    false    3245    224    226            �           2606    26238 %   genere_opera OpereGeneri_IDOpera_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.genere_opera
    ADD CONSTRAINT "OpereGeneri_IDOpera_fkey" FOREIGN KEY (id_opera) REFERENCES public.opera(id) NOT VALID;
 Q   ALTER TABLE ONLY public.genere_opera DROP CONSTRAINT "OpereGeneri_IDOpera_fkey";
       public          postgres    false    226    228    3251            �           2606    26243    raccolta Raccolta_IDUtente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.raccolta
    ADD CONSTRAINT "Raccolta_IDUtente_fkey" FOREIGN KEY (id_utente) REFERENCES public.utente(username);
 K   ALTER TABLE ONLY public.raccolta DROP CONSTRAINT "Raccolta_IDUtente_fkey";
       public          postgres    false    232    230    3259            �           2606    26248     commento commento_id_utente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.commento
    ADD CONSTRAINT commento_id_utente_fkey FOREIGN KEY (id_utente) REFERENCES public.utente(username) NOT VALID;
 J   ALTER TABLE ONLY public.commento DROP CONSTRAINT commento_id_utente_fkey;
       public          postgres    false    219    3259    232            �           2606    26253 !   mi_piace mi_piace_id_utente_fkey1    FK CONSTRAINT     �   ALTER TABLE ONLY public.mi_piace
    ADD CONSTRAINT mi_piace_id_utente_fkey1 FOREIGN KEY (id_utente) REFERENCES public.utente(username);
 K   ALTER TABLE ONLY public.mi_piace DROP CONSTRAINT mi_piace_id_utente_fkey1;
       public          postgres    false    3259    227    232            X      x������ � �      Z      x������ � �      [      x������ � �      ]      x������ � �      _      x������ � �      a      x������ � �      b      x������ � �      d      x������ � �      e      x������ � �      f      x������ � �      h      x������ � �      i      x������ � �      j      x������ � �     