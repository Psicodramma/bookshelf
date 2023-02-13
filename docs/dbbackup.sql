PGDMP     )    3                {         	   bookshelf    14.5    14.4 8    L           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            M           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            N           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            O           1262    16609 	   bookshelf    DATABASE     f   CREATE DATABASE bookshelf WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Europe.1252';
    DROP DATABASE bookshelf;
                postgres    false            �            1259    16763    Amico    TABLE     ~   CREATE TABLE public."Amico" (
    "Utente1" character varying(100) NOT NULL,
    "Utente2" character varying(100) NOT NULL
);
    DROP TABLE public."Amico";
       public         heap    postgres    false            �            1259    16624    Autore    TABLE     �   CREATE TABLE public."Autore" (
    "ID" character varying NOT NULL,
    "Nome" character varying,
    "Cognome" character varying
);
    DROP TABLE public."Autore";
       public         heap    postgres    false            �            1259    16631    AutoreOpera    TABLE     |   CREATE TABLE public."AutoreOpera" (
    "IDAutore" character varying(100) NOT NULL,
    "IDOpera" character varying(100)
);
 !   DROP TABLE public."AutoreOpera";
       public         heap    postgres    false            �            1259    16718    Azione    TABLE     �   CREATE TABLE public."Azione" (
    "ID" character varying(100) NOT NULL,
    "Tipo" character varying(100),
    "Data" date,
    "IDEdizione" character varying(100),
    "IDRaccolta" character varying(100),
    "IDUtente" character varying(100)
);
    DROP TABLE public."Azione";
       public         heap    postgres    false            �            1259    16733    Commento    TABLE     �   CREATE TABLE public."Commento" (
    "ID" character varying(100) NOT NULL,
    "Testo" character varying(10000),
    "Timestamp" date,
    "IDRiferimento" character varying(100),
    "TipoRiferimento" character varying(100)
);
    DROP TABLE public."Commento";
       public         heap    postgres    false            �            1259    16646    Edizione    TABLE       CREATE TABLE public."Edizione" (
    "ID" character varying(100) NOT NULL,
    "ISBN" character varying(100),
    "DataPubblicazione" date,
    "Editore" character varying,
    "NumeroPagine" integer,
    "PaesePubblicazione" character varying,
    "IDOpera" character varying(100)
);
    DROP TABLE public."Edizione";
       public         heap    postgres    false            �            1259    16703    EdizioneRaccolta    TABLE     �   CREATE TABLE public."EdizioneRaccolta" (
    "IDEdizione" character varying(100) NOT NULL,
    "IDRaccolta" character varying(100) NOT NULL
);
 &   DROP TABLE public."EdizioneRaccolta";
       public         heap    postgres    false            �            1259    16738    Generi    TABLE     u   CREATE TABLE public."Generi" (
    "ID" character varying(100) NOT NULL,
    "Descrizione" character varying(100)
);
    DROP TABLE public."Generi";
       public         heap    postgres    false            �            1259    16743    LibriGeneri    TABLE     �   CREATE TABLE public."LibriGeneri" (
    "IDGenere" character varying(100) NOT NULL,
    "IDLibro" character varying(100) NOT NULL
);
 !   DROP TABLE public."LibriGeneri";
       public         heap    postgres    false            �            1259    16610    Opera    TABLE        CREATE TABLE public."Opera" (
    "Titolo" character varying(100),
    "Autore" character varying(100),
    "ID" character varying(100) NOT NULL,
    "Anno" integer,
    "Descrizione" character varying(10000),
    "LinguaOriginale" character varying(2)
);
    DROP TABLE public."Opera";
       public         heap    postgres    false            �            1259    16785    Raccolta    TABLE     �   CREATE TABLE public."Raccolta" (
    "Nome" character varying(100) NOT NULL,
    "Descrizione" character varying(100),
    "IDUtente" character varying(100) NOT NULL
);
    DROP TABLE public."Raccolta";
       public         heap    postgres    false            �            1259    16807    RaccoltaEdizione    TABLE     �   CREATE TABLE public."RaccoltaEdizione" (
    "IDRaccolta" character varying(100) NOT NULL,
    "IDEdizione" character varying(100) NOT NULL,
    "IDUtente" character varying(100) NOT NULL
);
 &   DROP TABLE public."RaccoltaEdizione";
       public         heap    postgres    false            �            1259    16758    Utente    TABLE     �   CREATE TABLE public."Utente" (
    "Username" character varying(100) NOT NULL,
    "Password" character varying(100),
    "Nazionalita" character varying(100)
);
    DROP TABLE public."Utente";
       public         heap    postgres    false            G          0    16763    Amico 
   TABLE DATA           7   COPY public."Amico" ("Utente1", "Utente2") FROM stdin;
    public          postgres    false    219   KF       >          0    16624    Autore 
   TABLE DATA           ;   COPY public."Autore" ("ID", "Nome", "Cognome") FROM stdin;
    public          postgres    false    210   hF       ?          0    16631    AutoreOpera 
   TABLE DATA           >   COPY public."AutoreOpera" ("IDAutore", "IDOpera") FROM stdin;
    public          postgres    false    211   �F       B          0    16718    Azione 
   TABLE DATA           `   COPY public."Azione" ("ID", "Tipo", "Data", "IDEdizione", "IDRaccolta", "IDUtente") FROM stdin;
    public          postgres    false    214   �F       C          0    16733    Commento 
   TABLE DATA           d   COPY public."Commento" ("ID", "Testo", "Timestamp", "IDRiferimento", "TipoRiferimento") FROM stdin;
    public          postgres    false    215   �F       @          0    16646    Edizione 
   TABLE DATA           �   COPY public."Edizione" ("ID", "ISBN", "DataPubblicazione", "Editore", "NumeroPagine", "PaesePubblicazione", "IDOpera") FROM stdin;
    public          postgres    false    212   G       A          0    16703    EdizioneRaccolta 
   TABLE DATA           H   COPY public."EdizioneRaccolta" ("IDEdizione", "IDRaccolta") FROM stdin;
    public          postgres    false    213   G       D          0    16738    Generi 
   TABLE DATA           7   COPY public."Generi" ("ID", "Descrizione") FROM stdin;
    public          postgres    false    216   ;G       E          0    16743    LibriGeneri 
   TABLE DATA           >   COPY public."LibriGeneri" ("IDGenere", "IDLibro") FROM stdin;
    public          postgres    false    217   �G       =          0    16610    Opera 
   TABLE DATA           e   COPY public."Opera" ("Titolo", "Autore", "ID", "Anno", "Descrizione", "LinguaOriginale") FROM stdin;
    public          postgres    false    209   �G       H          0    16785    Raccolta 
   TABLE DATA           G   COPY public."Raccolta" ("Nome", "Descrizione", "IDUtente") FROM stdin;
    public          postgres    false    220   H       I          0    16807    RaccoltaEdizione 
   TABLE DATA           T   COPY public."RaccoltaEdizione" ("IDRaccolta", "IDEdizione", "IDUtente") FROM stdin;
    public          postgres    false    221   2H       F          0    16758    Utente 
   TABLE DATA           I   COPY public."Utente" ("Username", "Password", "Nazionalita") FROM stdin;
    public          postgres    false    218   OH       �           2606    16767    Amico Amico_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."Amico"
    ADD CONSTRAINT "Amico_pkey" PRIMARY KEY ("Utente1", "Utente2");
 >   ALTER TABLE ONLY public."Amico" DROP CONSTRAINT "Amico_pkey";
       public            postgres    false    219    219            �           2606    16635    AutoreOpera AutoreOpera_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public."AutoreOpera"
    ADD CONSTRAINT "AutoreOpera_pkey" PRIMARY KEY ("IDAutore");
 J   ALTER TABLE ONLY public."AutoreOpera" DROP CONSTRAINT "AutoreOpera_pkey";
       public            postgres    false    211            �           2606    16630    Autore Autore_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Autore"
    ADD CONSTRAINT "Autore_pkey" PRIMARY KEY ("ID");
 @   ALTER TABLE ONLY public."Autore" DROP CONSTRAINT "Autore_pkey";
       public            postgres    false    210            �           2606    16722    Azione Azione_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Azione"
    ADD CONSTRAINT "Azione_pkey" PRIMARY KEY ("ID");
 @   ALTER TABLE ONLY public."Azione" DROP CONSTRAINT "Azione_pkey";
       public            postgres    false    214            �           2606    16707 &   EdizioneRaccolta EdizioneRaccolta_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."EdizioneRaccolta"
    ADD CONSTRAINT "EdizioneRaccolta_pkey" PRIMARY KEY ("IDEdizione", "IDRaccolta");
 T   ALTER TABLE ONLY public."EdizioneRaccolta" DROP CONSTRAINT "EdizioneRaccolta_pkey";
       public            postgres    false    213    213            �           2606    16652    Edizione Edizione_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Edizione"
    ADD CONSTRAINT "Edizione_pkey" PRIMARY KEY ("ID");
 D   ALTER TABLE ONLY public."Edizione" DROP CONSTRAINT "Edizione_pkey";
       public            postgres    false    212            �           2606    16742    Generi Generi_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Generi"
    ADD CONSTRAINT "Generi_pkey" PRIMARY KEY ("ID");
 @   ALTER TABLE ONLY public."Generi" DROP CONSTRAINT "Generi_pkey";
       public            postgres    false    216            �           2606    16747    LibriGeneri LibriGeneri_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public."LibriGeneri"
    ADD CONSTRAINT "LibriGeneri_pkey" PRIMARY KEY ("IDGenere", "IDLibro");
 J   ALTER TABLE ONLY public."LibriGeneri" DROP CONSTRAINT "LibriGeneri_pkey";
       public            postgres    false    217    217            �           2606    16616    Opera Opera_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Opera"
    ADD CONSTRAINT "Opera_pkey" PRIMARY KEY ("ID");
 >   ALTER TABLE ONLY public."Opera" DROP CONSTRAINT "Opera_pkey";
       public            postgres    false    209            �           2606    16811 &   RaccoltaEdizione RaccoltaEdizione_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."RaccoltaEdizione"
    ADD CONSTRAINT "RaccoltaEdizione_pkey" PRIMARY KEY ("IDRaccolta", "IDEdizione", "IDUtente");
 T   ALTER TABLE ONLY public."RaccoltaEdizione" DROP CONSTRAINT "RaccoltaEdizione_pkey";
       public            postgres    false    221    221    221            �           2606    16801 #   Raccolta Raccolta_Nome_IDUtente_key 
   CONSTRAINT     p   ALTER TABLE ONLY public."Raccolta"
    ADD CONSTRAINT "Raccolta_Nome_IDUtente_key" UNIQUE ("Nome", "IDUtente");
 Q   ALTER TABLE ONLY public."Raccolta" DROP CONSTRAINT "Raccolta_Nome_IDUtente_key";
       public            postgres    false    220    220            �           2606    16789    Raccolta Raccolta_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."Raccolta"
    ADD CONSTRAINT "Raccolta_pkey" PRIMARY KEY ("Nome", "IDUtente");
 D   ALTER TABLE ONLY public."Raccolta" DROP CONSTRAINT "Raccolta_pkey";
       public            postgres    false    220    220            �           2606    16762    Utente Utente_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Utente"
    ADD CONSTRAINT "Utente_pkey" PRIMARY KEY ("Username");
 @   ALTER TABLE ONLY public."Utente" DROP CONSTRAINT "Utente_pkey";
       public            postgres    false    218            �           2606    16768    Amico Amico_Utente1_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Amico"
    ADD CONSTRAINT "Amico_Utente1_fkey" FOREIGN KEY ("Utente1") REFERENCES public."Utente"("Username");
 F   ALTER TABLE ONLY public."Amico" DROP CONSTRAINT "Amico_Utente1_fkey";
       public          postgres    false    218    3228    219            �           2606    16773    Amico Amico_Utente2_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Amico"
    ADD CONSTRAINT "Amico_Utente2_fkey" FOREIGN KEY ("Utente2") REFERENCES public."Utente"("Username");
 F   ALTER TABLE ONLY public."Amico" DROP CONSTRAINT "Amico_Utente2_fkey";
       public          postgres    false    219    3228    218            �           2606    16636 %   AutoreOpera AutoreOpera_IDAutore_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."AutoreOpera"
    ADD CONSTRAINT "AutoreOpera_IDAutore_fkey" FOREIGN KEY ("IDAutore") REFERENCES public."Autore"("ID");
 S   ALTER TABLE ONLY public."AutoreOpera" DROP CONSTRAINT "AutoreOpera_IDAutore_fkey";
       public          postgres    false    3214    211    210            �           2606    16641 $   AutoreOpera AutoreOpera_IDOpera_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."AutoreOpera"
    ADD CONSTRAINT "AutoreOpera_IDOpera_fkey" FOREIGN KEY ("IDOpera") REFERENCES public."Opera"("ID") NOT VALID;
 R   ALTER TABLE ONLY public."AutoreOpera" DROP CONSTRAINT "AutoreOpera_IDOpera_fkey";
       public          postgres    false    209    3212    211            �           2606    16723    Azione Azione_IDEdizione_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Azione"
    ADD CONSTRAINT "Azione_IDEdizione_fkey" FOREIGN KEY ("IDEdizione") REFERENCES public."Edizione"("ID");
 K   ALTER TABLE ONLY public."Azione" DROP CONSTRAINT "Azione_IDEdizione_fkey";
       public          postgres    false    3218    212    214            �           2606    16780    Azione Azione_IDUtente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Azione"
    ADD CONSTRAINT "Azione_IDUtente_fkey" FOREIGN KEY ("IDUtente") REFERENCES public."Utente"("Username") NOT VALID;
 I   ALTER TABLE ONLY public."Azione" DROP CONSTRAINT "Azione_IDUtente_fkey";
       public          postgres    false    3228    218    214            �           2606    16708 1   EdizioneRaccolta EdizioneRaccolta_IDEdizione_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."EdizioneRaccolta"
    ADD CONSTRAINT "EdizioneRaccolta_IDEdizione_fkey" FOREIGN KEY ("IDEdizione") REFERENCES public."Edizione"("ID");
 _   ALTER TABLE ONLY public."EdizioneRaccolta" DROP CONSTRAINT "EdizioneRaccolta_IDEdizione_fkey";
       public          postgres    false    212    3218    213            �           2606    16653    Edizione Edizione_IDOpera_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Edizione"
    ADD CONSTRAINT "Edizione_IDOpera_fkey" FOREIGN KEY ("IDOpera") REFERENCES public."Opera"("ID") NOT VALID;
 L   ALTER TABLE ONLY public."Edizione" DROP CONSTRAINT "Edizione_IDOpera_fkey";
       public          postgres    false    209    212    3212            �           2606    16748 %   LibriGeneri LibriGeneri_IDGenere_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."LibriGeneri"
    ADD CONSTRAINT "LibriGeneri_IDGenere_fkey" FOREIGN KEY ("IDGenere") REFERENCES public."Generi"("ID");
 S   ALTER TABLE ONLY public."LibriGeneri" DROP CONSTRAINT "LibriGeneri_IDGenere_fkey";
       public          postgres    false    3224    216    217            �           2606    16753 $   LibriGeneri LibriGeneri_IDLibro_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."LibriGeneri"
    ADD CONSTRAINT "LibriGeneri_IDLibro_fkey" FOREIGN KEY ("IDLibro") REFERENCES public."Opera"("ID");
 R   ALTER TABLE ONLY public."LibriGeneri" DROP CONSTRAINT "LibriGeneri_IDLibro_fkey";
       public          postgres    false    209    3212    217            �           2606    16817 1   RaccoltaEdizione RaccoltaEdizione_IDEdizione_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RaccoltaEdizione"
    ADD CONSTRAINT "RaccoltaEdizione_IDEdizione_fkey" FOREIGN KEY ("IDEdizione") REFERENCES public."Edizione"("ID");
 _   ALTER TABLE ONLY public."RaccoltaEdizione" DROP CONSTRAINT "RaccoltaEdizione_IDEdizione_fkey";
       public          postgres    false    221    3218    212            �           2606    16812 :   RaccoltaEdizione RaccoltaEdizione_IDRaccolta_IDUtente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RaccoltaEdizione"
    ADD CONSTRAINT "RaccoltaEdizione_IDRaccolta_IDUtente_fkey" FOREIGN KEY ("IDRaccolta", "IDUtente") REFERENCES public."Raccolta"("Nome", "IDUtente");
 h   ALTER TABLE ONLY public."RaccoltaEdizione" DROP CONSTRAINT "RaccoltaEdizione_IDRaccolta_IDUtente_fkey";
       public          postgres    false    3234    220    220    221    221            �           2606    16790    Raccolta Raccolta_IDUtente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Raccolta"
    ADD CONSTRAINT "Raccolta_IDUtente_fkey" FOREIGN KEY ("IDUtente") REFERENCES public."Utente"("Username");
 M   ALTER TABLE ONLY public."Raccolta" DROP CONSTRAINT "Raccolta_IDUtente_fkey";
       public          postgres    false    220    218    3228            G      x������ � �      >   2   x�3�t+�LM)�L����L-�*N�H�2��J�M-����KL������ '��      ?      x������ � �      B      x������ � �      C      x������ � �      @      x������ � �      A      x������ � �      D   �   x�-���0���S�	i���RF�(���JR%�!oOl��ٲ���RX\AK�h�5��E�Zi�>I�F8x�ɍ��X��^{cq��&�<�4��*x���7�t�zql�?���ȉ�����l�R-��������T�0�n�k���4d      E      x������ � �      =      x������ � �      H      x������ � �      I      x������ � �      F      x������ � �     