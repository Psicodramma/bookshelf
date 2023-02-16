PGDMP     /    2                {         	   bookshelf    14.5    14.4 5    F           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            G           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            H           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            I           1262    16947 	   bookshelf    DATABASE     f   CREATE DATABASE bookshelf WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Europe.1252';
    DROP DATABASE bookshelf;
                postgres    false            �            1259    16948    amico    TABLE     x   CREATE TABLE public.amico (
    utente1 character varying(100) NOT NULL,
    utente2 character varying(100) NOT NULL
);
    DROP TABLE public.amico;
       public         heap    postgres    false            �            1259    16951    autore    TABLE     }   CREATE TABLE public.autore (
    id character varying NOT NULL,
    nome character varying,
    cognome character varying
);
    DROP TABLE public.autore;
       public         heap    postgres    false            �            1259    16956    autore_opera    TABLE     y   CREATE TABLE public.autore_opera (
    id_autore character varying(100) NOT NULL,
    id_opera character varying(100)
);
     DROP TABLE public.autore_opera;
       public         heap    postgres    false            �            1259    16959    azione    TABLE     �   CREATE TABLE public.azione (
    id character varying(100) NOT NULL,
    tipo character varying(100),
    data date,
    id_edizione character varying(100),
    id_utente character varying(100)
);
    DROP TABLE public.azione;
       public         heap    postgres    false            �            1259    16962    commento    TABLE     �   CREATE TABLE public.commento (
    id character varying(100) NOT NULL,
    testo character varying(10000),
    "timestamp" date,
    id_riferimento character varying(100),
    tipo_riferimento character varying(100)
);
    DROP TABLE public.commento;
       public         heap    postgres    false            �            1259    16967    edizione    TABLE     3  CREATE TABLE public.edizione (
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
       public         heap    postgres    false            �            1259    16972    edizione_raccolta    TABLE     �   CREATE TABLE public.edizione_raccolta (
    id_edizione character varying(100) NOT NULL,
    id_utente character varying(100) NOT NULL,
    nome_raccolta character varying(100) NOT NULL
);
 %   DROP TABLE public.edizione_raccolta;
       public         heap    postgres    false            �            1259    16975    generi    TABLE     o   CREATE TABLE public.generi (
    id character varying(100) NOT NULL,
    descrizione character varying(100)
);
    DROP TABLE public.generi;
       public         heap    postgres    false            �            1259    16978    opera    TABLE     �   CREATE TABLE public.opera (
    id character varying(100) NOT NULL,
    titolo character varying(100),
    anno integer,
    descrizione character varying(10000),
    lingua_originale character varying(100)
);
    DROP TABLE public.opera;
       public         heap    postgres    false            �            1259    16983    opere_generi    TABLE     �   CREATE TABLE public.opere_generi (
    id_genere character varying(100) NOT NULL,
    id_opera character varying(100) NOT NULL
);
     DROP TABLE public.opere_generi;
       public         heap    postgres    false            �            1259    16986    raccolta    TABLE     �   CREATE TABLE public.raccolta (
    nome character varying(100) NOT NULL,
    descrizione character varying(100),
    id_utente character varying(100) NOT NULL
);
    DROP TABLE public.raccolta;
       public         heap    postgres    false            �            1259    16989    utente    TABLE     �   CREATE TABLE public.utente (
    username character varying(100) NOT NULL,
    password character varying(100),
    nazionalita character varying(100)
);
    DROP TABLE public.utente;
       public         heap    postgres    false            8          0    16948    amico 
   TABLE DATA           1   COPY public.amico (utente1, utente2) FROM stdin;
    public          postgres    false    209   r@       9          0    16951    autore 
   TABLE DATA           3   COPY public.autore (id, nome, cognome) FROM stdin;
    public          postgres    false    210   �@       :          0    16956    autore_opera 
   TABLE DATA           ;   COPY public.autore_opera (id_autore, id_opera) FROM stdin;
    public          postgres    false    211   LA       ;          0    16959    azione 
   TABLE DATA           H   COPY public.azione (id, tipo, data, id_edizione, id_utente) FROM stdin;
    public          postgres    false    212   �A       <          0    16962    commento 
   TABLE DATA           \   COPY public.commento (id, testo, "timestamp", id_riferimento, tipo_riferimento) FROM stdin;
    public          postgres    false    213   �A       =          0    16967    edizione 
   TABLE DATA              COPY public.edizione (id, isbn, data_pubblicazione, editore, numero_pagine, paese_pubblicazione, id_opera, lingua) FROM stdin;
    public          postgres    false    214   �A       >          0    16972    edizione_raccolta 
   TABLE DATA           R   COPY public.edizione_raccolta (id_edizione, id_utente, nome_raccolta) FROM stdin;
    public          postgres    false    215   3D       ?          0    16975    generi 
   TABLE DATA           1   COPY public.generi (id, descrizione) FROM stdin;
    public          postgres    false    216   PD       @          0    16978    opera 
   TABLE DATA           P   COPY public.opera (id, titolo, anno, descrizione, lingua_originale) FROM stdin;
    public          postgres    false    217   mD       A          0    16983    opere_generi 
   TABLE DATA           ;   COPY public.opere_generi (id_genere, id_opera) FROM stdin;
    public          postgres    false    218   G       B          0    16986    raccolta 
   TABLE DATA           @   COPY public.raccolta (nome, descrizione, id_utente) FROM stdin;
    public          postgres    false    219    G       C          0    16989    utente 
   TABLE DATA           A   COPY public.utente (username, password, nazionalita) FROM stdin;
    public          postgres    false    220   =G       �           2606    16993    amico Amico_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.amico
    ADD CONSTRAINT "Amico_pkey" PRIMARY KEY (utente1, utente2);
 <   ALTER TABLE ONLY public.amico DROP CONSTRAINT "Amico_pkey";
       public            postgres    false    209    209            �           2606    16995    autore_opera AutoreOpera_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.autore_opera
    ADD CONSTRAINT "AutoreOpera_pkey" PRIMARY KEY (id_autore);
 I   ALTER TABLE ONLY public.autore_opera DROP CONSTRAINT "AutoreOpera_pkey";
       public            postgres    false    211            �           2606    16997    autore Autore_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.autore
    ADD CONSTRAINT "Autore_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.autore DROP CONSTRAINT "Autore_pkey";
       public            postgres    false    210            �           2606    16999    azione Azione_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.azione
    ADD CONSTRAINT "Azione_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.azione DROP CONSTRAINT "Azione_pkey";
       public            postgres    false    212            �           2606    17001    commento Commento_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.commento
    ADD CONSTRAINT "Commento_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.commento DROP CONSTRAINT "Commento_pkey";
       public            postgres    false    213            �           2606    17003 '   edizione_raccolta EdizioneRaccolta_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.edizione_raccolta
    ADD CONSTRAINT "EdizioneRaccolta_pkey" PRIMARY KEY (id_edizione, id_utente, nome_raccolta);
 S   ALTER TABLE ONLY public.edizione_raccolta DROP CONSTRAINT "EdizioneRaccolta_pkey";
       public            postgres    false    215    215    215            �           2606    17005    edizione Edizione_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.edizione
    ADD CONSTRAINT "Edizione_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.edizione DROP CONSTRAINT "Edizione_pkey";
       public            postgres    false    214            �           2606    17007    generi Generi_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.generi
    ADD CONSTRAINT "Generi_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.generi DROP CONSTRAINT "Generi_pkey";
       public            postgres    false    216            �           2606    17009    opera Opera_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.opera
    ADD CONSTRAINT "Opera_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.opera DROP CONSTRAINT "Opera_pkey";
       public            postgres    false    217            �           2606    17011    opere_generi OpereGeneri_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.opere_generi
    ADD CONSTRAINT "OpereGeneri_pkey" PRIMARY KEY (id_genere, id_opera);
 I   ALTER TABLE ONLY public.opere_generi DROP CONSTRAINT "OpereGeneri_pkey";
       public            postgres    false    218    218            �           2606    17013 #   raccolta Raccolta_Nome_IDUtente_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.raccolta
    ADD CONSTRAINT "Raccolta_Nome_IDUtente_key" UNIQUE (nome, id_utente);
 O   ALTER TABLE ONLY public.raccolta DROP CONSTRAINT "Raccolta_Nome_IDUtente_key";
       public            postgres    false    219    219            �           2606    17015    raccolta Raccolta_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.raccolta
    ADD CONSTRAINT "Raccolta_pkey" PRIMARY KEY (nome, id_utente);
 B   ALTER TABLE ONLY public.raccolta DROP CONSTRAINT "Raccolta_pkey";
       public            postgres    false    219    219            �           2606    17017    utente Utente_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.utente
    ADD CONSTRAINT "Utente_pkey" PRIMARY KEY (username);
 >   ALTER TABLE ONLY public.utente DROP CONSTRAINT "Utente_pkey";
       public            postgres    false    220            �           2606    17018    amico Amico_Utente1_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.amico
    ADD CONSTRAINT "Amico_Utente1_fkey" FOREIGN KEY (utente1) REFERENCES public.utente(username);
 D   ALTER TABLE ONLY public.amico DROP CONSTRAINT "Amico_Utente1_fkey";
       public          postgres    false    220    3232    209            �           2606    17023    amico Amico_Utente2_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.amico
    ADD CONSTRAINT "Amico_Utente2_fkey" FOREIGN KEY (utente2) REFERENCES public.utente(username);
 D   ALTER TABLE ONLY public.amico DROP CONSTRAINT "Amico_Utente2_fkey";
       public          postgres    false    220    209    3232            �           2606    17028 &   autore_opera AutoreOpera_IDAutore_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.autore_opera
    ADD CONSTRAINT "AutoreOpera_IDAutore_fkey" FOREIGN KEY (id_autore) REFERENCES public.autore(id);
 R   ALTER TABLE ONLY public.autore_opera DROP CONSTRAINT "AutoreOpera_IDAutore_fkey";
       public          postgres    false    211    3210    210            �           2606    17033 %   autore_opera AutoreOpera_IDOpera_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.autore_opera
    ADD CONSTRAINT "AutoreOpera_IDOpera_fkey" FOREIGN KEY (id_opera) REFERENCES public.opera(id) NOT VALID;
 Q   ALTER TABLE ONLY public.autore_opera DROP CONSTRAINT "AutoreOpera_IDOpera_fkey";
       public          postgres    false    3224    211    217            �           2606    17038    azione Azione_IDEdizione_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.azione
    ADD CONSTRAINT "Azione_IDEdizione_fkey" FOREIGN KEY (id_edizione) REFERENCES public.edizione(id);
 I   ALTER TABLE ONLY public.azione DROP CONSTRAINT "Azione_IDEdizione_fkey";
       public          postgres    false    3218    212    214            �           2606    17043    azione Azione_IDUtente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.azione
    ADD CONSTRAINT "Azione_IDUtente_fkey" FOREIGN KEY (id_utente) REFERENCES public.utente(username) NOT VALID;
 G   ALTER TABLE ONLY public.azione DROP CONSTRAINT "Azione_IDUtente_fkey";
       public          postgres    false    212    220    3232            �           2606    17048 2   edizione_raccolta EdizioneRaccolta_IDEdizione_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.edizione_raccolta
    ADD CONSTRAINT "EdizioneRaccolta_IDEdizione_fkey" FOREIGN KEY (id_edizione) REFERENCES public.edizione(id);
 ^   ALTER TABLE ONLY public.edizione_raccolta DROP CONSTRAINT "EdizioneRaccolta_IDEdizione_fkey";
       public          postgres    false    214    3218    215            �           2606    17053 0   edizione_raccolta EdizioneRaccolta_raccolta_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.edizione_raccolta
    ADD CONSTRAINT "EdizioneRaccolta_raccolta_fkey" FOREIGN KEY (id_utente, nome_raccolta) REFERENCES public.raccolta(id_utente, nome) NOT VALID;
 \   ALTER TABLE ONLY public.edizione_raccolta DROP CONSTRAINT "EdizioneRaccolta_raccolta_fkey";
       public          postgres    false    219    215    219    215    3228            �           2606    17058    edizione Edizione_IDOpera_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.edizione
    ADD CONSTRAINT "Edizione_IDOpera_fkey" FOREIGN KEY (id_opera) REFERENCES public.opera(id) NOT VALID;
 J   ALTER TABLE ONLY public.edizione DROP CONSTRAINT "Edizione_IDOpera_fkey";
       public          postgres    false    3224    214    217            �           2606    17063 &   opere_generi OpereGeneri_IDGenere_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.opere_generi
    ADD CONSTRAINT "OpereGeneri_IDGenere_fkey" FOREIGN KEY (id_genere) REFERENCES public.generi(id);
 R   ALTER TABLE ONLY public.opere_generi DROP CONSTRAINT "OpereGeneri_IDGenere_fkey";
       public          postgres    false    3222    216    218            �           2606    17068 %   opere_generi OpereGeneri_IDOpera_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.opere_generi
    ADD CONSTRAINT "OpereGeneri_IDOpera_fkey" FOREIGN KEY (id_opera) REFERENCES public.opera(id) NOT VALID;
 Q   ALTER TABLE ONLY public.opere_generi DROP CONSTRAINT "OpereGeneri_IDOpera_fkey";
       public          postgres    false    218    217    3224            �           2606    17073    raccolta Raccolta_IDUtente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.raccolta
    ADD CONSTRAINT "Raccolta_IDUtente_fkey" FOREIGN KEY (id_utente) REFERENCES public.utente(username);
 K   ALTER TABLE ONLY public.raccolta DROP CONSTRAINT "Raccolta_IDUtente_fkey";
       public          postgres    false    219    220    3232            8      x������ � �      9   �   x��=nQE��z� �'�(��(44fb��76����dY�T��t�X�1TR�(���>�v��f���,����s��ˆ�x�p$ɘkQ�e�=Lr��Tj�nh�n����)�&X�>�L��pSl=B�M�qVS��=����^SR���p)�*B�.�Am={      :   /   x��I   �����(��:H���'�Ų(7���r� ������      ;      x������ � �      <      x������ � �      =   ^  x�e��n1E��W�TP�Z6A�X���n&��
�H�x��~��<��ü�<��y��֠�R	e$(~ķ��ݱI�F�u���	5�e�S9H����*�0��ėnx��}���ς�Oc7��Ϝ�Tu���WEJ����$�x��tIy�w�s:T+~�S.�L���b�Od�a%@Y%�ǿca���V?�\�δ��n���̺ -�3쌵��N�Jy�NQX�n<�u�&�sZ�i�s4��%���[c�[s��A��y��.��<�M���g�h�
y-���,������k��/�Ph)�V�$��zA+>��ǲ_i���B[X�͞�%\Oң�N��SW�O�!=�8�е�u"���9�k�f��n@��`�p��I��*�?�a��E쬿��ns��z0���ϐ�	`���%��])/gvcoܸMe!�����UB][�c^yffˬ����L*��c�LMr��k��k�
��~kl�f�b�fJ��,�i��z.Q��5�a��)��r�@hX�Yh|sМW&\����Yz�!l:�"�
T�8p�!��rLӥ�\_��_��p ��#RA۝��j����v� @�\_      >      x������ � �      ?      x������ � �      @   �  x����NA����7�`�	��Ar˥�m/-f�W�Q�Ny��Xj6�8%'��U�u��ͅ�|�!(uJɜ��i�f�Z�4׎�y��mk!39��-*S'7k��;ܞ	ݯ�L�o�^��{�5p�u���9�2�uv���s6[4�boe$4D�N6j��t~���d��E�	Z(��C�=N���d�>va^cB��}���:�N�̎�KA�\E[NY�*�\��C��=~����ӓ��O6Ri[�0R�T"O�;�x���R�"�d6l�V*L�8�+)��}s9T���b#U}�J���+Zr�q���5�>9�����Q���Wz\�+��%�qs�u��G���b�O�Zg���-��H ��!Xk��Cq� ��ԲQ=����se���|u�R-�b�_��k�'7b���Ν���,ã���]I;�[-�J�<8{�O��T��W�?�$k�x����	{���[��Cw;�<&�%H�NRk����G`@�����s22L�zxFh=�i�UۊO�#uxh4p��m���ۘ�k���c�o�Ϛ10@�Ia�\[E�8%ލ ��ĩ
8�c���4b]��H��5w(I�v�ũ�ǫ70��v?UwP���7���RB��{}��v8��~�      A      x������ � �      B      x������ � �      C   $   x��/���".0	f�� 
$_b'�91z\\\ �     