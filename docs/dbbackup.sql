PGDMP     9    	                {         	   Bookshelf    15.2    15.1 5    R           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            S           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            T           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            U           1262    16398 	   Bookshelf    DATABASE     ~   CREATE DATABASE "Bookshelf" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Italian_Italy.1252';
    DROP DATABASE "Bookshelf";
                postgres    false            �            1259    16399    Amico    TABLE     ~   CREATE TABLE public."Amico" (
    "Utente1" character varying(100) NOT NULL,
    "Utente2" character varying(100) NOT NULL
);
    DROP TABLE public."Amico";
       public         heap    postgres    false            �            1259    16402    Autore    TABLE     �   CREATE TABLE public."Autore" (
    "ID" character varying NOT NULL,
    "Nome" character varying,
    "Cognome" character varying
);
    DROP TABLE public."Autore";
       public         heap    postgres    false            �            1259    16407    AutoreOpera    TABLE     |   CREATE TABLE public."AutoreOpera" (
    "IDAutore" character varying(100) NOT NULL,
    "IDOpera" character varying(100)
);
 !   DROP TABLE public."AutoreOpera";
       public         heap    postgres    false            �            1259    16410    Azione    TABLE     �   CREATE TABLE public."Azione" (
    "ID" character varying(100) NOT NULL,
    "Tipo" character varying(100),
    "Data" date,
    "IDEdizione" character varying(100),
    "IDUtente" character varying(100)
);
    DROP TABLE public."Azione";
       public         heap    postgres    false            �            1259    16415    Commento    TABLE     �   CREATE TABLE public."Commento" (
    "ID" character varying(100) NOT NULL,
    "Testo" character varying(10000),
    "Timestamp" date,
    "IDRiferimento" character varying(100),
    "TipoRiferimento" character varying(100)
);
    DROP TABLE public."Commento";
       public         heap    postgres    false            �            1259    16420    Edizione    TABLE     A  CREATE TABLE public."Edizione" (
    "ID" character varying(100) NOT NULL,
    "ISBN" character varying(100),
    "DataPubblicazione" date,
    "Editore" character varying,
    "NumeroPagine" integer,
    "PaesePubblicazione" character varying,
    "IDOpera" character varying(100),
    "Lingua" character varying(20)
);
    DROP TABLE public."Edizione";
       public         heap    postgres    false            �            1259    16425    EdizioneRaccolta    TABLE     �   CREATE TABLE public."EdizioneRaccolta" (
    "IDEdizione" character varying(100) NOT NULL,
    "IDUtente" character varying(100) NOT NULL,
    "nomeRaccolta" character varying(100) NOT NULL
);
 &   DROP TABLE public."EdizioneRaccolta";
       public         heap    postgres    false            �            1259    16428    Generi    TABLE     u   CREATE TABLE public."Generi" (
    "ID" character varying(100) NOT NULL,
    "Descrizione" character varying(100)
);
    DROP TABLE public."Generi";
       public         heap    postgres    false            �            1259    16539    Opera    TABLE     �   CREATE TABLE public."Opera" (
    "ID" character varying(100) NOT NULL,
    "Titolo" character varying(100),
    "Anno" integer,
    "Descrizione" character varying(10000),
    "LinguaOriginale" character varying(100)
);
    DROP TABLE public."Opera";
       public         heap    postgres    false            �            1259    16431    OpereGeneri    TABLE     �   CREATE TABLE public."OpereGeneri" (
    "IDGenere" character varying(100) NOT NULL,
    "IDOpera" character varying(100) NOT NULL
);
 !   DROP TABLE public."OpereGeneri";
       public         heap    postgres    false            �            1259    16439    Raccolta    TABLE     �   CREATE TABLE public."Raccolta" (
    "Nome" character varying(100) NOT NULL,
    "Descrizione" character varying(100),
    "IDUtente" character varying(100) NOT NULL
);
    DROP TABLE public."Raccolta";
       public         heap    postgres    false            �            1259    16445    Utente    TABLE     �   CREATE TABLE public."Utente" (
    "Username" character varying(100) NOT NULL,
    "Password" character varying(100),
    "Nazionalita" character varying(100)
);
    DROP TABLE public."Utente";
       public         heap    postgres    false            D          0    16399    Amico 
   TABLE DATA           7   COPY public."Amico" ("Utente1", "Utente2") FROM stdin;
    public          postgres    false    214   �A       E          0    16402    Autore 
   TABLE DATA           ;   COPY public."Autore" ("ID", "Nome", "Cognome") FROM stdin;
    public          postgres    false    215   B       F          0    16407    AutoreOpera 
   TABLE DATA           >   COPY public."AutoreOpera" ("IDAutore", "IDOpera") FROM stdin;
    public          postgres    false    216   �B       G          0    16410    Azione 
   TABLE DATA           R   COPY public."Azione" ("ID", "Tipo", "Data", "IDEdizione", "IDUtente") FROM stdin;
    public          postgres    false    217   C       H          0    16415    Commento 
   TABLE DATA           d   COPY public."Commento" ("ID", "Testo", "Timestamp", "IDRiferimento", "TipoRiferimento") FROM stdin;
    public          postgres    false    218   (C       I          0    16420    Edizione 
   TABLE DATA           �   COPY public."Edizione" ("ID", "ISBN", "DataPubblicazione", "Editore", "NumeroPagine", "PaesePubblicazione", "IDOpera", "Lingua") FROM stdin;
    public          postgres    false    219   EC       J          0    16425    EdizioneRaccolta 
   TABLE DATA           V   COPY public."EdizioneRaccolta" ("IDEdizione", "IDUtente", "nomeRaccolta") FROM stdin;
    public          postgres    false    220   �E       K          0    16428    Generi 
   TABLE DATA           7   COPY public."Generi" ("ID", "Descrizione") FROM stdin;
    public          postgres    false    221   �E       O          0    16539    Opera 
   TABLE DATA           [   COPY public."Opera" ("ID", "Titolo", "Anno", "Descrizione", "LinguaOriginale") FROM stdin;
    public          postgres    false    225   �E       L          0    16431    OpereGeneri 
   TABLE DATA           >   COPY public."OpereGeneri" ("IDGenere", "IDOpera") FROM stdin;
    public          postgres    false    222   �H       M          0    16439    Raccolta 
   TABLE DATA           G   COPY public."Raccolta" ("Nome", "Descrizione", "IDUtente") FROM stdin;
    public          postgres    false    223   �H       N          0    16445    Utente 
   TABLE DATA           I   COPY public."Utente" ("Username", "Password", "Nazionalita") FROM stdin;
    public          postgres    false    224   �H       �           2606    16449    Amico Amico_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."Amico"
    ADD CONSTRAINT "Amico_pkey" PRIMARY KEY ("Utente1", "Utente2");
 >   ALTER TABLE ONLY public."Amico" DROP CONSTRAINT "Amico_pkey";
       public            postgres    false    214    214            �           2606    16451    AutoreOpera AutoreOpera_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public."AutoreOpera"
    ADD CONSTRAINT "AutoreOpera_pkey" PRIMARY KEY ("IDAutore");
 J   ALTER TABLE ONLY public."AutoreOpera" DROP CONSTRAINT "AutoreOpera_pkey";
       public            postgres    false    216            �           2606    16453    Autore Autore_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Autore"
    ADD CONSTRAINT "Autore_pkey" PRIMARY KEY ("ID");
 @   ALTER TABLE ONLY public."Autore" DROP CONSTRAINT "Autore_pkey";
       public            postgres    false    215            �           2606    16455    Azione Azione_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Azione"
    ADD CONSTRAINT "Azione_pkey" PRIMARY KEY ("ID");
 @   ALTER TABLE ONLY public."Azione" DROP CONSTRAINT "Azione_pkey";
       public            postgres    false    217            �           2606    16552    Commento Commento_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Commento"
    ADD CONSTRAINT "Commento_pkey" PRIMARY KEY ("ID");
 D   ALTER TABLE ONLY public."Commento" DROP CONSTRAINT "Commento_pkey";
       public            postgres    false    218            �           2606    16545 &   EdizioneRaccolta EdizioneRaccolta_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."EdizioneRaccolta"
    ADD CONSTRAINT "EdizioneRaccolta_pkey" PRIMARY KEY ("IDEdizione", "IDUtente", "nomeRaccolta");
 T   ALTER TABLE ONLY public."EdizioneRaccolta" DROP CONSTRAINT "EdizioneRaccolta_pkey";
       public            postgres    false    220    220    220            �           2606    16459    Edizione Edizione_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Edizione"
    ADD CONSTRAINT "Edizione_pkey" PRIMARY KEY ("ID");
 D   ALTER TABLE ONLY public."Edizione" DROP CONSTRAINT "Edizione_pkey";
       public            postgres    false    219            �           2606    16461    Generi Generi_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Generi"
    ADD CONSTRAINT "Generi_pkey" PRIMARY KEY ("ID");
 @   ALTER TABLE ONLY public."Generi" DROP CONSTRAINT "Generi_pkey";
       public            postgres    false    221            �           2606    16559    Opera Opera_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Opera"
    ADD CONSTRAINT "Opera_pkey" PRIMARY KEY ("ID");
 >   ALTER TABLE ONLY public."Opera" DROP CONSTRAINT "Opera_pkey";
       public            postgres    false    225            �           2606    16463    OpereGeneri OpereGeneri_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public."OpereGeneri"
    ADD CONSTRAINT "OpereGeneri_pkey" PRIMARY KEY ("IDGenere", "IDOpera");
 J   ALTER TABLE ONLY public."OpereGeneri" DROP CONSTRAINT "OpereGeneri_pkey";
       public            postgres    false    222    222            �           2606    16469 #   Raccolta Raccolta_Nome_IDUtente_key 
   CONSTRAINT     p   ALTER TABLE ONLY public."Raccolta"
    ADD CONSTRAINT "Raccolta_Nome_IDUtente_key" UNIQUE ("Nome", "IDUtente");
 Q   ALTER TABLE ONLY public."Raccolta" DROP CONSTRAINT "Raccolta_Nome_IDUtente_key";
       public            postgres    false    223    223            �           2606    16471    Raccolta Raccolta_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."Raccolta"
    ADD CONSTRAINT "Raccolta_pkey" PRIMARY KEY ("Nome", "IDUtente");
 D   ALTER TABLE ONLY public."Raccolta" DROP CONSTRAINT "Raccolta_pkey";
       public            postgres    false    223    223            �           2606    16473    Utente Utente_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Utente"
    ADD CONSTRAINT "Utente_pkey" PRIMARY KEY ("Username");
 @   ALTER TABLE ONLY public."Utente" DROP CONSTRAINT "Utente_pkey";
       public            postgres    false    224            �           2606    16474    Amico Amico_Utente1_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Amico"
    ADD CONSTRAINT "Amico_Utente1_fkey" FOREIGN KEY ("Utente1") REFERENCES public."Utente"("Username");
 F   ALTER TABLE ONLY public."Amico" DROP CONSTRAINT "Amico_Utente1_fkey";
       public          postgres    false    224    214    3239            �           2606    16479    Amico Amico_Utente2_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Amico"
    ADD CONSTRAINT "Amico_Utente2_fkey" FOREIGN KEY ("Utente2") REFERENCES public."Utente"("Username");
 F   ALTER TABLE ONLY public."Amico" DROP CONSTRAINT "Amico_Utente2_fkey";
       public          postgres    false    214    3239    224            �           2606    16484 %   AutoreOpera AutoreOpera_IDAutore_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."AutoreOpera"
    ADD CONSTRAINT "AutoreOpera_IDAutore_fkey" FOREIGN KEY ("IDAutore") REFERENCES public."Autore"("ID");
 S   ALTER TABLE ONLY public."AutoreOpera" DROP CONSTRAINT "AutoreOpera_IDAutore_fkey";
       public          postgres    false    216    3219    215            �           2606    16560 $   AutoreOpera AutoreOpera_IDOpera_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."AutoreOpera"
    ADD CONSTRAINT "AutoreOpera_IDOpera_fkey" FOREIGN KEY ("IDOpera") REFERENCES public."Opera"("ID") NOT VALID;
 R   ALTER TABLE ONLY public."AutoreOpera" DROP CONSTRAINT "AutoreOpera_IDOpera_fkey";
       public          postgres    false    3241    216    225            �           2606    16494    Azione Azione_IDEdizione_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Azione"
    ADD CONSTRAINT "Azione_IDEdizione_fkey" FOREIGN KEY ("IDEdizione") REFERENCES public."Edizione"("ID");
 K   ALTER TABLE ONLY public."Azione" DROP CONSTRAINT "Azione_IDEdizione_fkey";
       public          postgres    false    217    3227    219            �           2606    16849    Azione Azione_IDUtente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Azione"
    ADD CONSTRAINT "Azione_IDUtente_fkey" FOREIGN KEY ("IDUtente") REFERENCES public."Utente"("Username") NOT VALID;
 I   ALTER TABLE ONLY public."Azione" DROP CONSTRAINT "Azione_IDUtente_fkey";
       public          postgres    false    224    3239    217            �           2606    16504 1   EdizioneRaccolta EdizioneRaccolta_IDEdizione_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."EdizioneRaccolta"
    ADD CONSTRAINT "EdizioneRaccolta_IDEdizione_fkey" FOREIGN KEY ("IDEdizione") REFERENCES public."Edizione"("ID");
 _   ALTER TABLE ONLY public."EdizioneRaccolta" DROP CONSTRAINT "EdizioneRaccolta_IDEdizione_fkey";
       public          postgres    false    220    3227    219            �           2606    16553 /   EdizioneRaccolta EdizioneRaccolta_raccolta_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."EdizioneRaccolta"
    ADD CONSTRAINT "EdizioneRaccolta_raccolta_fkey" FOREIGN KEY ("IDUtente", "nomeRaccolta") REFERENCES public."Raccolta"("IDUtente", "Nome") NOT VALID;
 ]   ALTER TABLE ONLY public."EdizioneRaccolta" DROP CONSTRAINT "EdizioneRaccolta_raccolta_fkey";
       public          postgres    false    220    220    3235    223    223            �           2606    16565    Edizione Edizione_IDOpera_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Edizione"
    ADD CONSTRAINT "Edizione_IDOpera_fkey" FOREIGN KEY ("IDOpera") REFERENCES public."Opera"("ID") NOT VALID;
 L   ALTER TABLE ONLY public."Edizione" DROP CONSTRAINT "Edizione_IDOpera_fkey";
       public          postgres    false    219    3241    225            �           2606    16514 %   OpereGeneri OpereGeneri_IDGenere_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."OpereGeneri"
    ADD CONSTRAINT "OpereGeneri_IDGenere_fkey" FOREIGN KEY ("IDGenere") REFERENCES public."Generi"("ID");
 S   ALTER TABLE ONLY public."OpereGeneri" DROP CONSTRAINT "OpereGeneri_IDGenere_fkey";
       public          postgres    false    222    3231    221            �           2606    16570 $   OpereGeneri OpereGeneri_IDOpera_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."OpereGeneri"
    ADD CONSTRAINT "OpereGeneri_IDOpera_fkey" FOREIGN KEY ("IDOpera") REFERENCES public."Opera"("ID") NOT VALID;
 R   ALTER TABLE ONLY public."OpereGeneri" DROP CONSTRAINT "OpereGeneri_IDOpera_fkey";
       public          postgres    false    3241    225    222            �           2606    16534    Raccolta Raccolta_IDUtente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Raccolta"
    ADD CONSTRAINT "Raccolta_IDUtente_fkey" FOREIGN KEY ("IDUtente") REFERENCES public."Utente"("Username");
 M   ALTER TABLE ONLY public."Raccolta" DROP CONSTRAINT "Raccolta_IDUtente_fkey";
       public          postgres    false    223    3239    224            D      x������ � �      E   �   x��=nQE��z� �'�(��(44fb��76����dY�T��t�X�1TR�(���>�v��f���,����s��ˆ�x�p$ɘkQ�e�=Lr��Tj�nh�n����)�&X�>�L��pSl=B�M�qVS��=����^SR���p)�*B�.�Am={      F   /   x��I   �����(��:H���'�Ų(7���r� ������      G      x������ � �      H      x������ � �      I   ^  x�e��n1E��W�TP�Z6A�X���n&��
�H�x��~��<��ü�<��y��֠�R	e$(~ķ��ݱI�F�u���	5�e�S9H����*�0��ėnx��}���ς�Oc7��Ϝ�Tu���WEJ����$�x��tIy�w�s:T+~�S.�L���b�Od�a%@Y%�ǿca���V?�\�δ��n���̺ -�3쌵��N�Jy�NQX�n<�u�&�sZ�i�s4��%���[c�[s��A��y��.��<�M���g�h�
y-���,������k��/�Ph)�V�$��zA+>��ǲ_i���B[X�͞�%\Oң�N��SW�O�!=�8�е�u"���9�k�f��n@��`�p��I��*�?�a��E쬿��ns��z0���ϐ�	`���%��])/gvcoܸMe!�����UB][�c^yffˬ����L*��c�LMr��k��k�
��~kl�f�b�fJ��,�i��z.Q��5�a��)��r�@hX�Yh|sМW&\����Yz�!l:�"�
T�8p�!��rLӥ�\_��_��p ��#RA۝��j����v� @�\_      J      x������ � �      K      x������ � �      O   �  x����NA����7�`�	��Ar˥�m/-f�W�Q�Ny��Xj6�8%'��U�u��ͅ�|�!(uJɜ��i�f�Z�4׎�y��mk!39��-*S'7k��;ܞ	ݯ�L�o�^��{�5p�u���9�2�uv���s6[4�boe$4D�N6j��t~���d��E�	Z(��C�=N���d�>va^cB��}���:�N�̎�KA�\E[NY�*�\��C��=~����ӓ��O6Ri[�0R�T"O�;�x���R�"�d6l�V*L�8�+)��}s9T���b#U}�J���+Zr�q���5�>9�����Q���Wz\�+��%�qs�u��G���b�O�Zg���-��H ��!Xk��Cq� ��ԲQ=����se���|u�R-�b�_��k�'7b���Ν���,ã���]I;�[-�J�<8{�O��T��W�?�$k�x����	{���[��Cw;�<&�%H�NRk����G`@�����s22L�zxFh=�i�UۊO�#uxh4p��m���ۘ�k���c�o�Ϛ10@�Ia�\[E�8%ލ ��ĩ
8�c���4b]��H��5w(I�v�ũ�ǫ70��v?UwP���7���RB��{}��v8��~�      L      x������ � �      M      x������ � �      N      x������ � �     