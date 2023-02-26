PGDMP     
    1                {         	   bookshelf    14.5    14.5 V    m           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            n           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            o           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            p           1262    17782 	   bookshelf    DATABASE     f   CREATE DATABASE bookshelf WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Europe.1252';
    DROP DATABASE bookshelf;
                postgres    false                        3079    17783    unaccent 	   EXTENSION     <   CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;
    DROP EXTENSION unaccent;
                   false            q           0    0    EXTENSION unaccent    COMMENT     P   COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';
                        false    2            �            1259    17790    autore    TABLE     s   CREATE TABLE public.autore (
    id integer NOT NULL,
    nome character varying,
    cognome character varying
);
    DROP TABLE public.autore;
       public         heap    postgres    false            �            1259    17795    autore_id_seq    SEQUENCE     �   CREATE SEQUENCE public.autore_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.autore_id_seq;
       public          postgres    false    210            r           0    0    autore_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.autore_id_seq OWNED BY public.autore.id;
          public          postgres    false    211            �            1259    17796    autore_opera    TABLE     d   CREATE TABLE public.autore_opera (
    id_autore integer NOT NULL,
    id_opera integer NOT NULL
);
     DROP TABLE public.autore_opera;
       public         heap    postgres    false            �            1259    17799    azione    TABLE     �   CREATE TABLE public.azione (
    id integer NOT NULL,
    tipo character varying(100),
    "timestamp" timestamp without time zone,
    id_edizione integer,
    id_utente character varying(100)
);
    DROP TABLE public.azione;
       public         heap    postgres    false            �            1259    17802    azione_id_seq    SEQUENCE     �   CREATE SEQUENCE public.azione_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.azione_id_seq;
       public          postgres    false    213            s           0    0    azione_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.azione_id_seq OWNED BY public.azione.id;
          public          postgres    false    214            �            1259    17803    commento    TABLE     �   CREATE TABLE public.commento (
    id integer NOT NULL,
    testo character varying(10000),
    "timestamp" timestamp without time zone,
    id_riferimento integer,
    tipo_riferimento character varying(100),
    id_utente character varying(100)
);
    DROP TABLE public.commento;
       public         heap    postgres    false            �            1259    17808    commento_id_seq    SEQUENCE     �   CREATE SEQUENCE public.commento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.commento_id_seq;
       public          postgres    false    215            t           0    0    commento_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.commento_id_seq OWNED BY public.commento.id;
          public          postgres    false    216            �            1259    17809    edizione    TABLE     ^  CREATE TABLE public.edizione (
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
       public         heap    postgres    false            �            1259    17814    edizione_id_seq    SEQUENCE     �   CREATE SEQUENCE public.edizione_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.edizione_id_seq;
       public          postgres    false    217            u           0    0    edizione_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.edizione_id_seq OWNED BY public.edizione.id;
          public          postgres    false    218            �            1259    17815    edizione_raccolta    TABLE     �   CREATE TABLE public.edizione_raccolta (
    id_edizione integer NOT NULL,
    id_utente character varying(100) NOT NULL,
    nome_raccolta character varying(100) NOT NULL
);
 %   DROP TABLE public.edizione_raccolta;
       public         heap    postgres    false            �            1259    17818    genere    TABLE     Y   CREATE TABLE public.genere (
    id integer NOT NULL,
    nome character varying(100)
);
    DROP TABLE public.genere;
       public         heap    postgres    false            �            1259    17821    genere_id_seq    SEQUENCE     �   CREATE SEQUENCE public.genere_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.genere_id_seq;
       public          postgres    false    220            v           0    0    genere_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.genere_id_seq OWNED BY public.genere.id;
          public          postgres    false    221            �            1259    17822    genere_opera    TABLE     d   CREATE TABLE public.genere_opera (
    id_genere integer NOT NULL,
    id_opera integer NOT NULL
);
     DROP TABLE public.genere_opera;
       public         heap    postgres    false            �            1259    17825    mi_piace    TABLE     �   CREATE TABLE public.mi_piace (
    id_riferimento integer NOT NULL,
    tipo_riferimento character varying NOT NULL,
    id_utente character varying NOT NULL
);
    DROP TABLE public.mi_piace;
       public         heap    postgres    false            �            1259    17830    opera    TABLE     �   CREATE TABLE public.opera (
    id integer NOT NULL,
    titolo character varying(100),
    anno integer,
    descrizione character varying(10000),
    lingua_originale character varying(100)
);
    DROP TABLE public.opera;
       public         heap    postgres    false            �            1259    17835    opera_id_seq    SEQUENCE     �   CREATE SEQUENCE public.opera_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.opera_id_seq;
       public          postgres    false    224            w           0    0    opera_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.opera_id_seq OWNED BY public.opera.id;
          public          postgres    false    225            �            1259    17949    opere_preferite    VIEW     �   CREATE VIEW public.opere_preferite AS
SELECT
    NULL::integer AS id,
    NULL::character varying(100) AS titolo,
    NULL::integer AS anno,
    NULL::character varying(10000) AS descrizione,
    NULL::character varying(100) AS lingua_originale;
 "   DROP VIEW public.opere_preferite;
       public          postgres    false            �            1259    17836    raccolta    TABLE     �   CREATE TABLE public.raccolta (
    nome character varying(100) NOT NULL,
    descrizione character varying(100),
    id_utente character varying(100) NOT NULL
);
    DROP TABLE public.raccolta;
       public         heap    postgres    false            �            1259    17839    segue    TABLE     x   CREATE TABLE public.segue (
    seguace character varying(100) NOT NULL,
    seguito character varying(100) NOT NULL
);
    DROP TABLE public.segue;
       public         heap    postgres    false            �            1259    17842    utente    TABLE     �   CREATE TABLE public.utente (
    username character varying(100) NOT NULL,
    password character varying(100),
    nazionalita character varying(100)
);
    DROP TABLE public.utente;
       public         heap    postgres    false            �           2604    17845 	   autore id    DEFAULT     f   ALTER TABLE ONLY public.autore ALTER COLUMN id SET DEFAULT nextval('public.autore_id_seq'::regclass);
 8   ALTER TABLE public.autore ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    210            �           2604    17846 	   azione id    DEFAULT     f   ALTER TABLE ONLY public.azione ALTER COLUMN id SET DEFAULT nextval('public.azione_id_seq'::regclass);
 8   ALTER TABLE public.azione ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    213            �           2604    17847    commento id    DEFAULT     j   ALTER TABLE ONLY public.commento ALTER COLUMN id SET DEFAULT nextval('public.commento_id_seq'::regclass);
 :   ALTER TABLE public.commento ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215            �           2604    17848    edizione id    DEFAULT     j   ALTER TABLE ONLY public.edizione ALTER COLUMN id SET DEFAULT nextval('public.edizione_id_seq'::regclass);
 :   ALTER TABLE public.edizione ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217            �           2604    17849 	   genere id    DEFAULT     f   ALTER TABLE ONLY public.genere ALTER COLUMN id SET DEFAULT nextval('public.genere_id_seq'::regclass);
 8   ALTER TABLE public.genere ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220            �           2604    17850    opera id    DEFAULT     d   ALTER TABLE ONLY public.opera ALTER COLUMN id SET DEFAULT nextval('public.opera_id_seq'::regclass);
 7   ALTER TABLE public.opera ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224            X          0    17790    autore 
   TABLE DATA           3   COPY public.autore (id, nome, cognome) FROM stdin;
    public          postgres    false    210   Rf       Z          0    17796    autore_opera 
   TABLE DATA           ;   COPY public.autore_opera (id_autore, id_opera) FROM stdin;
    public          postgres    false    212   g       [          0    17799    azione 
   TABLE DATA           O   COPY public.azione (id, tipo, "timestamp", id_edizione, id_utente) FROM stdin;
    public          postgres    false    213   Ng       ]          0    17803    commento 
   TABLE DATA           g   COPY public.commento (id, testo, "timestamp", id_riferimento, tipo_riferimento, id_utente) FROM stdin;
    public          postgres    false    215   �g       _          0    17809    edizione 
   TABLE DATA           �   COPY public.edizione (id, isbn, data_pubblicazione, editore, numero_pagine, paese_pubblicazione, id_opera, lingua, url, descrizione) FROM stdin;
    public          postgres    false    217   xi       a          0    17815    edizione_raccolta 
   TABLE DATA           R   COPY public.edizione_raccolta (id_edizione, id_utente, nome_raccolta) FROM stdin;
    public          postgres    false    219   _l       b          0    17818    genere 
   TABLE DATA           *   COPY public.genere (id, nome) FROM stdin;
    public          postgres    false    220   �l       d          0    17822    genere_opera 
   TABLE DATA           ;   COPY public.genere_opera (id_genere, id_opera) FROM stdin;
    public          postgres    false    222   �l       e          0    17825    mi_piace 
   TABLE DATA           O   COPY public.mi_piace (id_riferimento, tipo_riferimento, id_utente) FROM stdin;
    public          postgres    false    223   m       f          0    17830    opera 
   TABLE DATA           P   COPY public.opera (id, titolo, anno, descrizione, lingua_originale) FROM stdin;
    public          postgres    false    224   {m       h          0    17836    raccolta 
   TABLE DATA           @   COPY public.raccolta (nome, descrizione, id_utente) FROM stdin;
    public          postgres    false    226   p       i          0    17839    segue 
   TABLE DATA           1   COPY public.segue (seguace, seguito) FROM stdin;
    public          postgres    false    227   �p       j          0    17842    utente 
   TABLE DATA           A   COPY public.utente (username, password, nazionalita) FROM stdin;
    public          postgres    false    228   �p       x           0    0    autore_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.autore_id_seq', 1, false);
          public          postgres    false    211            y           0    0    azione_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.azione_id_seq', 1, false);
          public          postgres    false    214            z           0    0    commento_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.commento_id_seq', 25, true);
          public          postgres    false    216            {           0    0    edizione_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.edizione_id_seq', 1, false);
          public          postgres    false    218            |           0    0    genere_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.genere_id_seq', 1, false);
          public          postgres    false    221            }           0    0    opera_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.opera_id_seq', 1, false);
          public          postgres    false    225            �           2606    17852    segue Amico_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.segue
    ADD CONSTRAINT "Amico_pkey" PRIMARY KEY (seguace, seguito);
 <   ALTER TABLE ONLY public.segue DROP CONSTRAINT "Amico_pkey";
       public            postgres    false    227    227            �           2606    17856    autore Autore_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.autore
    ADD CONSTRAINT "Autore_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.autore DROP CONSTRAINT "Autore_pkey";
       public            postgres    false    210            �           2606    17858    azione Azione_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.azione
    ADD CONSTRAINT "Azione_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.azione DROP CONSTRAINT "Azione_pkey";
       public            postgres    false    213            �           2606    17860    commento Commento_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.commento
    ADD CONSTRAINT "Commento_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.commento DROP CONSTRAINT "Commento_pkey";
       public            postgres    false    215            �           2606    17862 '   edizione_raccolta EdizioneRaccolta_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.edizione_raccolta
    ADD CONSTRAINT "EdizioneRaccolta_pkey" PRIMARY KEY (id_edizione, id_utente, nome_raccolta);
 S   ALTER TABLE ONLY public.edizione_raccolta DROP CONSTRAINT "EdizioneRaccolta_pkey";
       public            postgres    false    219    219    219            �           2606    17864    edizione Edizione_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.edizione
    ADD CONSTRAINT "Edizione_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.edizione DROP CONSTRAINT "Edizione_pkey";
       public            postgres    false    217            �           2606    17866    genere Generi_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.genere
    ADD CONSTRAINT "Generi_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.genere DROP CONSTRAINT "Generi_pkey";
       public            postgres    false    220            �           2606    17868    opera Opera_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.opera
    ADD CONSTRAINT "Opera_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.opera DROP CONSTRAINT "Opera_pkey";
       public            postgres    false    224            �           2606    17870    genere_opera OpereGeneri_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.genere_opera
    ADD CONSTRAINT "OpereGeneri_pkey" PRIMARY KEY (id_genere, id_opera);
 I   ALTER TABLE ONLY public.genere_opera DROP CONSTRAINT "OpereGeneri_pkey";
       public            postgres    false    222    222            �           2606    17872 #   raccolta Raccolta_Nome_IDUtente_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.raccolta
    ADD CONSTRAINT "Raccolta_Nome_IDUtente_key" UNIQUE (nome, id_utente);
 O   ALTER TABLE ONLY public.raccolta DROP CONSTRAINT "Raccolta_Nome_IDUtente_key";
       public            postgres    false    226    226            �           2606    17874    raccolta Raccolta_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.raccolta
    ADD CONSTRAINT "Raccolta_pkey" PRIMARY KEY (nome, id_utente);
 B   ALTER TABLE ONLY public.raccolta DROP CONSTRAINT "Raccolta_pkey";
       public            postgres    false    226    226            �           2606    17876    utente Utente_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.utente
    ADD CONSTRAINT "Utente_pkey" PRIMARY KEY (username);
 >   ALTER TABLE ONLY public.utente DROP CONSTRAINT "Utente_pkey";
       public            postgres    false    228            �           2606    17955    autore_opera autore_opera_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.autore_opera
    ADD CONSTRAINT autore_opera_pkey PRIMARY KEY (id_autore, id_opera);
 H   ALTER TABLE ONLY public.autore_opera DROP CONSTRAINT autore_opera_pkey;
       public            postgres    false    212    212            �           2606    17878    mi_piace mi_piace_pkey1 
   CONSTRAINT     ~   ALTER TABLE ONLY public.mi_piace
    ADD CONSTRAINT mi_piace_pkey1 PRIMARY KEY (id_riferimento, tipo_riferimento, id_utente);
 A   ALTER TABLE ONLY public.mi_piace DROP CONSTRAINT mi_piace_pkey1;
       public            postgres    false    223    223    223            W           2618    17952    opere_preferite _RETURN    RULE     �  CREATE OR REPLACE VIEW public.opere_preferite AS
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
       public          postgres    false    224    223    223    224    224    224    3253    224    229            �           2606    17879    segue Amico_Utente1_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.segue
    ADD CONSTRAINT "Amico_Utente1_fkey" FOREIGN KEY (seguace) REFERENCES public.utente(username);
 D   ALTER TABLE ONLY public.segue DROP CONSTRAINT "Amico_Utente1_fkey";
       public          postgres    false    227    228    3261            �           2606    17884    segue Amico_Utente2_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.segue
    ADD CONSTRAINT "Amico_Utente2_fkey" FOREIGN KEY (seguito) REFERENCES public.utente(username);
 D   ALTER TABLE ONLY public.segue DROP CONSTRAINT "Amico_Utente2_fkey";
       public          postgres    false    227    228    3261            �           2606    17889 &   autore_opera AutoreOpera_IDAutore_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.autore_opera
    ADD CONSTRAINT "AutoreOpera_IDAutore_fkey" FOREIGN KEY (id_autore) REFERENCES public.autore(id);
 R   ALTER TABLE ONLY public.autore_opera DROP CONSTRAINT "AutoreOpera_IDAutore_fkey";
       public          postgres    false    210    3235    212            �           2606    17894 %   autore_opera AutoreOpera_IDOpera_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.autore_opera
    ADD CONSTRAINT "AutoreOpera_IDOpera_fkey" FOREIGN KEY (id_opera) REFERENCES public.opera(id) NOT VALID;
 Q   ALTER TABLE ONLY public.autore_opera DROP CONSTRAINT "AutoreOpera_IDOpera_fkey";
       public          postgres    false    212    224    3253            �           2606    17899    azione Azione_IDEdizione_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.azione
    ADD CONSTRAINT "Azione_IDEdizione_fkey" FOREIGN KEY (id_edizione) REFERENCES public.edizione(id);
 I   ALTER TABLE ONLY public.azione DROP CONSTRAINT "Azione_IDEdizione_fkey";
       public          postgres    false    3243    217    213            �           2606    17904    azione Azione_IDUtente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.azione
    ADD CONSTRAINT "Azione_IDUtente_fkey" FOREIGN KEY (id_utente) REFERENCES public.utente(username) NOT VALID;
 G   ALTER TABLE ONLY public.azione DROP CONSTRAINT "Azione_IDUtente_fkey";
       public          postgres    false    3261    228    213            �           2606    17909 2   edizione_raccolta EdizioneRaccolta_IDEdizione_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.edizione_raccolta
    ADD CONSTRAINT "EdizioneRaccolta_IDEdizione_fkey" FOREIGN KEY (id_edizione) REFERENCES public.edizione(id);
 ^   ALTER TABLE ONLY public.edizione_raccolta DROP CONSTRAINT "EdizioneRaccolta_IDEdizione_fkey";
       public          postgres    false    217    219    3243            �           2606    17914 0   edizione_raccolta EdizioneRaccolta_raccolta_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.edizione_raccolta
    ADD CONSTRAINT "EdizioneRaccolta_raccolta_fkey" FOREIGN KEY (id_utente, nome_raccolta) REFERENCES public.raccolta(id_utente, nome) NOT VALID;
 \   ALTER TABLE ONLY public.edizione_raccolta DROP CONSTRAINT "EdizioneRaccolta_raccolta_fkey";
       public          postgres    false    219    3255    226    226    219            �           2606    17919    edizione Edizione_IDOpera_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.edizione
    ADD CONSTRAINT "Edizione_IDOpera_fkey" FOREIGN KEY (id_opera) REFERENCES public.opera(id) NOT VALID;
 J   ALTER TABLE ONLY public.edizione DROP CONSTRAINT "Edizione_IDOpera_fkey";
       public          postgres    false    217    3253    224            �           2606    17924 &   genere_opera OpereGeneri_IDGenere_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.genere_opera
    ADD CONSTRAINT "OpereGeneri_IDGenere_fkey" FOREIGN KEY (id_genere) REFERENCES public.genere(id);
 R   ALTER TABLE ONLY public.genere_opera DROP CONSTRAINT "OpereGeneri_IDGenere_fkey";
       public          postgres    false    222    220    3247            �           2606    17929 %   genere_opera OpereGeneri_IDOpera_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.genere_opera
    ADD CONSTRAINT "OpereGeneri_IDOpera_fkey" FOREIGN KEY (id_opera) REFERENCES public.opera(id) NOT VALID;
 Q   ALTER TABLE ONLY public.genere_opera DROP CONSTRAINT "OpereGeneri_IDOpera_fkey";
       public          postgres    false    3253    224    222            �           2606    17934    raccolta Raccolta_IDUtente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.raccolta
    ADD CONSTRAINT "Raccolta_IDUtente_fkey" FOREIGN KEY (id_utente) REFERENCES public.utente(username);
 K   ALTER TABLE ONLY public.raccolta DROP CONSTRAINT "Raccolta_IDUtente_fkey";
       public          postgres    false    226    228    3261            �           2606    17939     commento commento_id_utente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.commento
    ADD CONSTRAINT commento_id_utente_fkey FOREIGN KEY (id_utente) REFERENCES public.utente(username) NOT VALID;
 J   ALTER TABLE ONLY public.commento DROP CONSTRAINT commento_id_utente_fkey;
       public          postgres    false    228    3261    215            �           2606    17944 !   mi_piace mi_piace_id_utente_fkey1    FK CONSTRAINT     �   ALTER TABLE ONLY public.mi_piace
    ADD CONSTRAINT mi_piace_id_utente_fkey1 FOREIGN KEY (id_utente) REFERENCES public.utente(username);
 K   ALTER TABLE ONLY public.mi_piace DROP CONSTRAINT mi_piace_id_utente_fkey1;
       public          postgres    false    223    228    3261            X   �   x��=nQE��z� �'�(��(44fb��76����dY�T��t�X�1TR�(���>�v��f���,����s��ˆ�x�p$ɘkQ�e�=Lr��Tj�nh�n����)�&X�>�L��pSl=B�M�qVS��=����^SR���p)�*B�.�Am={      Z   /   x��I   �����(��:H���'�Ų(7���r� ������      [   J   x�3��q	��4202�50�54R00�#NC�D.ctycTytyTyS�f��f����������1z\\\ ��+Y      ]   �  x�}�K��0���P�y�<���P�^hCO{�ɚn��]误�F��#0|�hf4C��S��!���K�H>��(�|:u�9����$��"�2`���ӕ�گ=r�-ko�<#��?�wc�(I�� 92G���։�oӗ���M�	�,XĒb��硛.��-��¢DSbF֥_����q���ʙh@�k΋Sj�p�`�`å�ʺ�C����C)��r1W�6�0�B�֤�#��	't��G|P8�i޻w��B��p9פ!	�I}�4�ȸ9h�6�Q�W�V����?i�_�Ź�8�Ź;��dx�0[�^�ϝ,��>��}�>-��)eS���%���~��_~n�?���֖�
=
��;��i������K/�f�}ܭf��K�>ʲx�-0����w��V�y'h��dC�%a��>����1�C~9��I5M��j �      _   �  x��U�n�0<�_�`��7�M��=4Z��\��u��T`+��w)K��� ����hfgg�y�s7Z8Ñ	@��bߺ��wݱaJ
���ۦf8���ﺧ�chW���+�悪9��p��y��n6b���sR8nz�Ⱦ���p��ڶ�'�в}�7۟�雄�m8��pYa)ϐ�Pz-@&Zt� v����۫�>���i����� �1Q�պ6GU��Z���4����M��wT�������H\��$�(�+����У��zn �&��Tj���W{z���ƲDXVcIcf�xn��r��bl�����&��]$��;�HOV���έT�K�Z	2)J�޴R+��R���Z�F%��\� ���6JvY�,���d��wU����DJ#a�E���}:Ʈ�u�y�F&L*�ʺ*��d$��FZ���R2�p��Dݕ�K�D\�o%�c��Rg/�qf^3�714E���A(&QeSQޑ�4�old��ldJ��6�1�h�����H�G1���=<���L���&�Җ@m�W� �RZho� }�-�yI�A����y*mQM[M� Ɯ!ai�u�Ɛq۾�p���+�q�P�0KWP\�s��1a^]!�dw�<\�vơ�ѧ���WI�$�1�H��c��lj^��3ńs�r���/LԔ!`���'ˡ�ɲ�&�/�fXy�B��F�j,X-�)d�0��<�#p�%�
�UX��>����f�����      a   ;   x�3�,N-J���tq�quwwr�2�L,���I����t
�T�s��qq������� ~�      b   :   x�3���M̫��2�tK�+I,��2�NLOTHK����L,J�2�t-�LN����� �@�      d      x�3�4�2bc 6�=... c�      e   O   x�3��/H-J��/��2�L���M�+�s�P�&貉U��y����\�HldC@<��@��E�1��!gjJ&ܴ=... �02�      f   �  x����NA����7�`�	��Ar˥�m/-f�W�Q�Ny��Xj6�8%'��U�u��ͅ�|�!(uJɜ��i�f�Z�4׎�y��mk!39��-*S'7k��;ܞ	ݯ�L�o�^��{�5p�u���9�2�uv���s6[4�boe$4D�N6j��t~���d��E�	Z(��C�=N���d�>va^cB��}���:�N�̎�KA�\E[NY�*�\��C��=~����ӓ��O6Ri[�0R�T"O�;�x���R�"�d6l�V*L�8�+)��}s9T���b#U}�J���+Zr�q���5�>9�����Q���Wz\�+��%�qs�u��G���b�O�Zg���-��H ��!Xk��Cq� ��ԲQ=����se���|u�R-�b�_��k�'7b���Ν���,ã���]I;�[-�J�<8{�O��T��W�?�$k�x����	{���[��Cw;�<&�%H�NRk����G`@�����s22L�zxFh=�i�UۊO�#uxh4p��m���ۘ�k���c�o�Ϛ10@�Ia�\[E�8%ލ ��ĩ
8�c���4b]��H��5w(I�v�ũ�ǫ70��v?UwP���7���RB��{}��v8��~�      h   �   x�u�A
� E�z
O�;L	�h�U6҈i��z�6�Ԛ��y�?ohZ
���y
�0��L�����i�QE�«7��F��n���,fL��Xy2ڭ���������i�8I����}
�k�k�j�~~F��Nђ��%��I��=����H�v�      i      x�K,���I��L����� )"      j   Z   x��/���".0	f�� 
$_b'�9�E��P�$9�dQ^~NJ>'���J�L��@NqbNY*'�t��*N-J���RQ!>\1z\\\ 3�+�     