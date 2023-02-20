PGDMP     /                    {         	   bookshelf    15.2    15.1 :    [           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            \           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ]           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ^           1262    24737 	   bookshelf    DATABASE     |   CREATE DATABASE bookshelf WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Italian_Italy.1252';
    DROP DATABASE bookshelf;
                postgres    false            �            1259    24741    autore    TABLE     }   CREATE TABLE public.autore (
    id character varying NOT NULL,
    nome character varying,
    cognome character varying
);
    DROP TABLE public.autore;
       public         heap    postgres    false            �            1259    24746    autore_opera    TABLE     y   CREATE TABLE public.autore_opera (
    id_autore character varying(100) NOT NULL,
    id_opera character varying(100)
);
     DROP TABLE public.autore_opera;
       public         heap    postgres    false            �            1259    24749    azione    TABLE     �   CREATE TABLE public.azione (
    id character varying(100) NOT NULL,
    tipo character varying(100),
    "timestamp" timestamp without time zone,
    id_edizione character varying(100),
    id_utente character varying(100)
);
    DROP TABLE public.azione;
       public         heap    postgres    false            �            1259    24752    commento    TABLE       CREATE TABLE public.commento (
    id character varying(100) NOT NULL,
    testo character varying(10000),
    "timestamp" timestamp without time zone,
    id_riferimento character varying(100),
    tipo_riferimento character varying(100),
    id_utente character varying(100)
);
    DROP TABLE public.commento;
       public         heap    postgres    false            �            1259    24757    edizione    TABLE     3  CREATE TABLE public.edizione (
    id character varying(100) NOT NULL,
    isbn character varying(100),
    data_pubblicazione date,
    editore character varying,
    numero_pagine integer,
    paese_pubblicazione character varying,
    id_opera character varying(100),
    lingua character varying(20)
);
    DROP TABLE public.edizione;
       public         heap    postgres    false            �            1259    24762    edizione_raccolta    TABLE     �   CREATE TABLE public.edizione_raccolta (
    id_edizione character varying(100) NOT NULL,
    id_utente character varying(100) NOT NULL,
    nome_raccolta character varying(100) NOT NULL
);
 %   DROP TABLE public.edizione_raccolta;
       public         heap    postgres    false            �            1259    24765    genere    TABLE     h   CREATE TABLE public.genere (
    id character varying(100) NOT NULL,
    nome character varying(100)
);
    DROP TABLE public.genere;
       public         heap    postgres    false            �            1259    24773    genere_opera    TABLE     �   CREATE TABLE public.genere_opera (
    id_genere character varying(100) NOT NULL,
    id_opera character varying(100) NOT NULL
);
     DROP TABLE public.genere_opera;
       public         heap    postgres    false            �            1259    24879    mi_piace    TABLE     �   CREATE TABLE public.mi_piace (
    id character varying(100) NOT NULL,
    id_riferimento character varying(100),
    tipo_riferimento character varying(100),
    id_utente character varying(100)
);
    DROP TABLE public.mi_piace;
       public         heap    postgres    false            �            1259    24768    opera    TABLE     �   CREATE TABLE public.opera (
    id character varying(100) NOT NULL,
    titolo character varying(100),
    anno integer,
    descrizione character varying(10000),
    lingua_originale character varying(100)
);
    DROP TABLE public.opera;
       public         heap    postgres    false            �            1259    24776    raccolta    TABLE     �   CREATE TABLE public.raccolta (
    nome character varying(100) NOT NULL,
    descrizione character varying(100),
    id_utente character varying(100) NOT NULL
);
    DROP TABLE public.raccolta;
       public         heap    postgres    false            �            1259    24738    segue    TABLE     x   CREATE TABLE public.segue (
    seguace character varying(100) NOT NULL,
    seguito character varying(100) NOT NULL
);
    DROP TABLE public.segue;
       public         heap    postgres    false            �            1259    24779    utente    TABLE     �   CREATE TABLE public.utente (
    username character varying(100) NOT NULL,
    password character varying(100),
    nazionalita character varying(100)
);
    DROP TABLE public.utente;
       public         heap    postgres    false            M          0    24741    autore 
   TABLE DATA           3   COPY public.autore (id, nome, cognome) FROM stdin;
    public          postgres    false    215   �G       N          0    24746    autore_opera 
   TABLE DATA           ;   COPY public.autore_opera (id_autore, id_opera) FROM stdin;
    public          postgres    false    216   KH       O          0    24749    azione 
   TABLE DATA           O   COPY public.azione (id, tipo, "timestamp", id_edizione, id_utente) FROM stdin;
    public          postgres    false    217   �H       P          0    24752    commento 
   TABLE DATA           g   COPY public.commento (id, testo, "timestamp", id_riferimento, tipo_riferimento, id_utente) FROM stdin;
    public          postgres    false    218   �H       Q          0    24757    edizione 
   TABLE DATA              COPY public.edizione (id, isbn, data_pubblicazione, editore, numero_pagine, paese_pubblicazione, id_opera, lingua) FROM stdin;
    public          postgres    false    219   �I       R          0    24762    edizione_raccolta 
   TABLE DATA           R   COPY public.edizione_raccolta (id_edizione, id_utente, nome_raccolta) FROM stdin;
    public          postgres    false    220   �K       S          0    24765    genere 
   TABLE DATA           *   COPY public.genere (id, nome) FROM stdin;
    public          postgres    false    221   L       U          0    24773    genere_opera 
   TABLE DATA           ;   COPY public.genere_opera (id_genere, id_opera) FROM stdin;
    public          postgres    false    223   aL       X          0    24879    mi_piace 
   TABLE DATA           S   COPY public.mi_piace (id, id_riferimento, tipo_riferimento, id_utente) FROM stdin;
    public          postgres    false    226   �L       T          0    24768    opera 
   TABLE DATA           P   COPY public.opera (id, titolo, anno, descrizione, lingua_originale) FROM stdin;
    public          postgres    false    222   �L       V          0    24776    raccolta 
   TABLE DATA           @   COPY public.raccolta (nome, descrizione, id_utente) FROM stdin;
    public          postgres    false    224   eO       L          0    24738    segue 
   TABLE DATA           1   COPY public.segue (seguace, seguito) FROM stdin;
    public          postgres    false    214   �O       W          0    24779    utente 
   TABLE DATA           A   COPY public.utente (username, password, nazionalita) FROM stdin;
    public          postgres    false    225   �O       �           2606    24783    segue Amico_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.segue
    ADD CONSTRAINT "Amico_pkey" PRIMARY KEY (seguace, seguito);
 <   ALTER TABLE ONLY public.segue DROP CONSTRAINT "Amico_pkey";
       public            postgres    false    214    214            �           2606    24785    autore_opera AutoreOpera_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.autore_opera
    ADD CONSTRAINT "AutoreOpera_pkey" PRIMARY KEY (id_autore);
 I   ALTER TABLE ONLY public.autore_opera DROP CONSTRAINT "AutoreOpera_pkey";
       public            postgres    false    216            �           2606    24787    autore Autore_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.autore
    ADD CONSTRAINT "Autore_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.autore DROP CONSTRAINT "Autore_pkey";
       public            postgres    false    215            �           2606    24789    azione Azione_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.azione
    ADD CONSTRAINT "Azione_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.azione DROP CONSTRAINT "Azione_pkey";
       public            postgres    false    217            �           2606    24791    commento Commento_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.commento
    ADD CONSTRAINT "Commento_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.commento DROP CONSTRAINT "Commento_pkey";
       public            postgres    false    218            �           2606    24793 '   edizione_raccolta EdizioneRaccolta_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.edizione_raccolta
    ADD CONSTRAINT "EdizioneRaccolta_pkey" PRIMARY KEY (id_edizione, id_utente, nome_raccolta);
 S   ALTER TABLE ONLY public.edizione_raccolta DROP CONSTRAINT "EdizioneRaccolta_pkey";
       public            postgres    false    220    220    220            �           2606    24795    edizione Edizione_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.edizione
    ADD CONSTRAINT "Edizione_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.edizione DROP CONSTRAINT "Edizione_pkey";
       public            postgres    false    219            �           2606    24797    genere Generi_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.genere
    ADD CONSTRAINT "Generi_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.genere DROP CONSTRAINT "Generi_pkey";
       public            postgres    false    221            �           2606    24799    opera Opera_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.opera
    ADD CONSTRAINT "Opera_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.opera DROP CONSTRAINT "Opera_pkey";
       public            postgres    false    222            �           2606    24801    genere_opera OpereGeneri_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.genere_opera
    ADD CONSTRAINT "OpereGeneri_pkey" PRIMARY KEY (id_genere, id_opera);
 I   ALTER TABLE ONLY public.genere_opera DROP CONSTRAINT "OpereGeneri_pkey";
       public            postgres    false    223    223            �           2606    24803 #   raccolta Raccolta_Nome_IDUtente_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.raccolta
    ADD CONSTRAINT "Raccolta_Nome_IDUtente_key" UNIQUE (nome, id_utente);
 O   ALTER TABLE ONLY public.raccolta DROP CONSTRAINT "Raccolta_Nome_IDUtente_key";
       public            postgres    false    224    224            �           2606    24805    raccolta Raccolta_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.raccolta
    ADD CONSTRAINT "Raccolta_pkey" PRIMARY KEY (nome, id_utente);
 B   ALTER TABLE ONLY public.raccolta DROP CONSTRAINT "Raccolta_pkey";
       public            postgres    false    224    224            �           2606    24807    utente Utente_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.utente
    ADD CONSTRAINT "Utente_pkey" PRIMARY KEY (username);
 >   ALTER TABLE ONLY public.utente DROP CONSTRAINT "Utente_pkey";
       public            postgres    false    225            �           2606    24883    mi_piace mi_piace_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.mi_piace
    ADD CONSTRAINT mi_piace_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.mi_piace DROP CONSTRAINT mi_piace_pkey;
       public            postgres    false    226            �           2606    24808    segue Amico_Utente1_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.segue
    ADD CONSTRAINT "Amico_Utente1_fkey" FOREIGN KEY (seguace) REFERENCES public.utente(username);
 D   ALTER TABLE ONLY public.segue DROP CONSTRAINT "Amico_Utente1_fkey";
       public          postgres    false    225    3245    214            �           2606    24813    segue Amico_Utente2_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.segue
    ADD CONSTRAINT "Amico_Utente2_fkey" FOREIGN KEY (seguito) REFERENCES public.utente(username);
 D   ALTER TABLE ONLY public.segue DROP CONSTRAINT "Amico_Utente2_fkey";
       public          postgres    false    225    3245    214            �           2606    24818 &   autore_opera AutoreOpera_IDAutore_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.autore_opera
    ADD CONSTRAINT "AutoreOpera_IDAutore_fkey" FOREIGN KEY (id_autore) REFERENCES public.autore(id);
 R   ALTER TABLE ONLY public.autore_opera DROP CONSTRAINT "AutoreOpera_IDAutore_fkey";
       public          postgres    false    216    215    3223            �           2606    24823 %   autore_opera AutoreOpera_IDOpera_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.autore_opera
    ADD CONSTRAINT "AutoreOpera_IDOpera_fkey" FOREIGN KEY (id_opera) REFERENCES public.opera(id) NOT VALID;
 Q   ALTER TABLE ONLY public.autore_opera DROP CONSTRAINT "AutoreOpera_IDOpera_fkey";
       public          postgres    false    216    3237    222            �           2606    24828    azione Azione_IDEdizione_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.azione
    ADD CONSTRAINT "Azione_IDEdizione_fkey" FOREIGN KEY (id_edizione) REFERENCES public.edizione(id);
 I   ALTER TABLE ONLY public.azione DROP CONSTRAINT "Azione_IDEdizione_fkey";
       public          postgres    false    219    217    3231            �           2606    24833    azione Azione_IDUtente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.azione
    ADD CONSTRAINT "Azione_IDUtente_fkey" FOREIGN KEY (id_utente) REFERENCES public.utente(username) NOT VALID;
 G   ALTER TABLE ONLY public.azione DROP CONSTRAINT "Azione_IDUtente_fkey";
       public          postgres    false    3245    217    225            �           2606    24838 2   edizione_raccolta EdizioneRaccolta_IDEdizione_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.edizione_raccolta
    ADD CONSTRAINT "EdizioneRaccolta_IDEdizione_fkey" FOREIGN KEY (id_edizione) REFERENCES public.edizione(id);
 ^   ALTER TABLE ONLY public.edizione_raccolta DROP CONSTRAINT "EdizioneRaccolta_IDEdizione_fkey";
       public          postgres    false    3231    220    219            �           2606    24843 0   edizione_raccolta EdizioneRaccolta_raccolta_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.edizione_raccolta
    ADD CONSTRAINT "EdizioneRaccolta_raccolta_fkey" FOREIGN KEY (id_utente, nome_raccolta) REFERENCES public.raccolta(id_utente, nome) NOT VALID;
 \   ALTER TABLE ONLY public.edizione_raccolta DROP CONSTRAINT "EdizioneRaccolta_raccolta_fkey";
       public          postgres    false    224    220    220    3241    224            �           2606    24848    edizione Edizione_IDOpera_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.edizione
    ADD CONSTRAINT "Edizione_IDOpera_fkey" FOREIGN KEY (id_opera) REFERENCES public.opera(id) NOT VALID;
 J   ALTER TABLE ONLY public.edizione DROP CONSTRAINT "Edizione_IDOpera_fkey";
       public          postgres    false    3237    219    222            �           2606    24853 &   genere_opera OpereGeneri_IDGenere_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.genere_opera
    ADD CONSTRAINT "OpereGeneri_IDGenere_fkey" FOREIGN KEY (id_genere) REFERENCES public.genere(id);
 R   ALTER TABLE ONLY public.genere_opera DROP CONSTRAINT "OpereGeneri_IDGenere_fkey";
       public          postgres    false    3235    223    221            �           2606    24858 %   genere_opera OpereGeneri_IDOpera_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.genere_opera
    ADD CONSTRAINT "OpereGeneri_IDOpera_fkey" FOREIGN KEY (id_opera) REFERENCES public.opera(id) NOT VALID;
 Q   ALTER TABLE ONLY public.genere_opera DROP CONSTRAINT "OpereGeneri_IDOpera_fkey";
       public          postgres    false    3237    222    223            �           2606    24863    raccolta Raccolta_IDUtente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.raccolta
    ADD CONSTRAINT "Raccolta_IDUtente_fkey" FOREIGN KEY (id_utente) REFERENCES public.utente(username);
 K   ALTER TABLE ONLY public.raccolta DROP CONSTRAINT "Raccolta_IDUtente_fkey";
       public          postgres    false    225    224    3245            �           2606    24868     commento commento_id_utente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.commento
    ADD CONSTRAINT commento_id_utente_fkey FOREIGN KEY (id_utente) REFERENCES public.utente(username) NOT VALID;
 J   ALTER TABLE ONLY public.commento DROP CONSTRAINT commento_id_utente_fkey;
       public          postgres    false    225    218    3245            �           2606    24884     mi_piace mi_piace_id_utente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.mi_piace
    ADD CONSTRAINT mi_piace_id_utente_fkey FOREIGN KEY (id_utente) REFERENCES public.utente(username) NOT VALID;
 J   ALTER TABLE ONLY public.mi_piace DROP CONSTRAINT mi_piace_id_utente_fkey;
       public          postgres    false    225    226    3245            M   �   x��=nQE��z� �'�(��(44fb��76����dY�T��t�X�1TR�(���>�v��f���,����s��ˆ�x�p$ɘkQ�e�=Lr��Tj�nh�n����)�&X�>�L��pSl=B�M�qVS��=����^SR���p)�*B�.�Am={      N   /   x��I   �����(��:H���'�Ų(7���r� ������      O   J   x�3��q	��4202�50�54R00�#NC�D.ctycTytyTyS�f��f����������1z\\\ ��+Y      P   �   x�e�;
�0�Y>�.�Gd;^��YL�!�ĥ��iJ_-�����TmHN�1�f�
��P/�@=;���/���l敉�=�P�y\�uE�A��\�Y���v��r�i�$zڦ ������x*X���u}�U�S���)��ι#�C'      Q   ^  x�e��n1E��W�TP�Z6A�X���n&��
�H�x��~��<��ü�<��y��֠�R	e$(~ķ��ݱI�F�u���	5�e�S9H����*�0��ėnx��}���ς�Oc7��Ϝ�Tu���WEJ����$�x��tIy�w�s:T+~�S.�L���b�Od�a%@Y%�ǿca���V?�\�δ��n���̺ -�3쌵��N�Jy�NQX�n<�u�&�sZ�i�s4��%���[c�[s��A��y��.��<�M���g�h�
y-���,������k��/�Ph)�V�$��zA+>��ǲ_i���B[X�͞�%\Oң�N��SW�O�!=�8�е�u"���9�k�f��n@��`�p��I��*�?�a��E쬿��ns��z0���ϐ�	`���%��])/gvcoܸMe!�����UB][�c^yffˬ����L*��c�LMr��k��k�
��~kl�f�b�fJ��,�i��z.Q��5�a��)��r�@hX�Yh|sМW&\����Yz�!l:�"�
T�8p�!��rLӥ�\_��_��p ��#RA۝��j����v� @�\_      R      x������ � �      S   :   x�3���M̫��2�tK�+I,��2�NLOTHK����L,J�2�t-�LN����� �@�      U      x�3�4�2bc 6�=... c�      X   6   x�3�4��/H-J����2Bp����������Լ�|��	���)�	�@� �5�      T   �  x����NA����7�`�	��Ar˥�m/-f�W�Q�Ny��Xj6�8%'��U�u��ͅ�|�!(uJɜ��i�f�Z�4׎�y��mk!39��-*S'7k��;ܞ	ݯ�L�o�^��{�5p�u���9�2�uv���s6[4�boe$4D�N6j��t~���d��E�	Z(��C�=N���d�>va^cB��}���:�N�̎�KA�\E[NY�*�\��C��=~����ӓ��O6Ri[�0R�T"O�;�x���R�"�d6l�V*L�8�+)��}s9T���b#U}�J���+Zr�q���5�>9�����Q���Wz\�+��%�qs�u��G���b�O�Zg���-��H ��!Xk��Cq� ��ԲQ=����se���|u�R-�b�_��k�'7b���Ν���,ã���]I;�[-�J�<8{�O��T��W�?�$k�x����	{���[��Cw;�<&�%H�NRk����G`@�����s22L�zxFh=�i�UۊO�#uxh4p��m���ۘ�k���c�o�Ϛ10@�Ia�\[E�8%ލ ��ĩ
8�c���4b]��H��5w(I�v�ũ�ǫ70��v?UwP���7���RB��{}��v8��~�      V      x������ � �      L      x������ � �      W   /   x��/���".0	f�� 
$_b'�9�E��P�$9�b���� z     