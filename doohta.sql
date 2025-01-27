PGDMP  1    &                |            doohta    17.2    17.2      $           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            %           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            &           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            '           1262    16387    doohta    DATABASE     �   CREATE DATABASE doohta WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE doohta;
                     postgres    false            �            1259    16414    ad    TABLE     �   CREATE TABLE public.ad (
    id bigint NOT NULL,
    name "char" NOT NULL,
    created_date date NOT NULL,
    modified_date date NOT NULL,
    length "char" NOT NULL,
    crc "char",
    preview_url "char"
);
    DROP TABLE public.ad;
       public         heap r       postgres    false            �            1259    16431    ad_playback_settings    TABLE     �  CREATE TABLE public.ad_playback_settings (
    id bigint NOT NULL,
    start_date date NOT NULL,
    end_date date,
    monday boolean DEFAULT false,
    tuesday boolean DEFAULT false,
    wednesday boolean DEFAULT false,
    thursday boolean DEFAULT false,
    friday boolean DEFAULT false,
    saturday boolean DEFAULT false,
    sunday boolean DEFAULT false,
    start_time "char",
    end_time "char"
);
 (   DROP TABLE public.ad_playback_settings;
       public         heap r       postgres    false            �            1259    16419    ad_resource    TABLE     p   CREATE TABLE public.ad_resource (
    id bigint NOT NULL,
    name "char" NOT NULL,
    type "char" NOT NULL
);
    DROP TABLE public.ad_resource;
       public         heap r       postgres    false            �            1259    16388    device    TABLE     �   CREATE TABLE public.device (
    id bigint NOT NULL,
    device_name "char" NOT NULL,
    serial_number "char" NOT NULL,
    user_id bigint NOT NULL,
    device_type_id bigint NOT NULL
);
    DROP TABLE public.device;
       public         heap r       postgres    false            �            1259    16443    device_playlist    TABLE     �   CREATE TABLE public.device_playlist (
    id bigint NOT NULL,
    device_id bigint,
    ad_id bigint,
    added_date date,
    modified_date date,
    slot integer
);
 #   DROP TABLE public.device_playlist;
       public         heap r       postgres    false            �            1259    16403    device_type    TABLE     �   CREATE TABLE public.device_type (
    id bigint NOT NULL,
    type_name "char" NOT NULL,
    platform "char",
    version "char"
);
    DROP TABLE public.device_type;
       public         heap r       postgres    false            �            1259    16393    user    TABLE     #  CREATE TABLE public."user" (
    id bigint NOT NULL,
    user_name "char" NOT NULL,
    email "char" NOT NULL,
    created_at date,
    created_by "char",
    last_name "char",
    first_name "char",
    is_owner boolean,
    last_login_at date,
    profile_pic "char",
    status "char"
);
    DROP TABLE public."user";
       public         heap r       postgres    false                      0    16414    ad 
   TABLE DATA           ]   COPY public.ad (id, name, created_date, modified_date, length, crc, preview_url) FROM stdin;
    public               postgres    false    220   \&                  0    16431    ad_playback_settings 
   TABLE DATA           �   COPY public.ad_playback_settings (id, start_date, end_date, monday, tuesday, wednesday, thursday, friday, saturday, sunday, start_time, end_time) FROM stdin;
    public               postgres    false    222   y&                 0    16419    ad_resource 
   TABLE DATA           5   COPY public.ad_resource (id, name, type) FROM stdin;
    public               postgres    false    221   �&                 0    16388    device 
   TABLE DATA           Y   COPY public.device (id, device_name, serial_number, user_id, device_type_id) FROM stdin;
    public               postgres    false    217   �&       !          0    16443    device_playlist 
   TABLE DATA           `   COPY public.device_playlist (id, device_id, ad_id, added_date, modified_date, slot) FROM stdin;
    public               postgres    false    223   �&                 0    16403    device_type 
   TABLE DATA           G   COPY public.device_type (id, type_name, platform, version) FROM stdin;
    public               postgres    false    219   �&                 0    16393    user 
   TABLE DATA           �   COPY public."user" (id, user_name, email, created_at, created_by, last_name, first_name, is_owner, last_login_at, profile_pic, status) FROM stdin;
    public               postgres    false    218   
'       }           2606    16418 
   ad ad_pkey 
   CONSTRAINT     H   ALTER TABLE ONLY public.ad
    ADD CONSTRAINT ad_pkey PRIMARY KEY (id);
 4   ALTER TABLE ONLY public.ad DROP CONSTRAINT ad_pkey;
       public                 postgres    false    220            �           2606    16442 .   ad_playback_settings ad_playback_settings_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.ad_playback_settings
    ADD CONSTRAINT ad_playback_settings_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.ad_playback_settings DROP CONSTRAINT ad_playback_settings_pkey;
       public                 postgres    false    222                       2606    16423    ad_resource ad_resource_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.ad_resource
    ADD CONSTRAINT ad_resource_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.ad_resource DROP CONSTRAINT ad_resource_pkey;
       public                 postgres    false    221            v           2606    16392    device device_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.device
    ADD CONSTRAINT device_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.device DROP CONSTRAINT device_pkey;
       public                 postgres    false    217            �           2606    16447 $   device_playlist device_playlist_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.device_playlist
    ADD CONSTRAINT device_playlist_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.device_playlist DROP CONSTRAINT device_playlist_pkey;
       public                 postgres    false    223            {           2606    16407    device_type device_type_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.device_type
    ADD CONSTRAINT device_type_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.device_type DROP CONSTRAINT device_type_pkey;
       public                 postgres    false    219            y           2606    16397    user user_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public                 postgres    false    218            w           1259    16413    fki_device_type    INDEX     L   CREATE INDEX fki_device_type ON public.device USING btree (device_type_id);
 #   DROP INDEX public.fki_device_type;
       public                 postgres    false    217            �           1259    16459    fki_playlist_ad    INDEX     L   CREATE INDEX fki_playlist_ad ON public.device_playlist USING btree (ad_id);
 #   DROP INDEX public.fki_playlist_ad;
       public                 postgres    false    223            �           1259    16453    fki_playlist_device    INDEX     T   CREATE INDEX fki_playlist_device ON public.device_playlist USING btree (device_id);
 '   DROP INDEX public.fki_playlist_device;
       public                 postgres    false    223            �           2606    16408    device device_type    FK CONSTRAINT     ~   ALTER TABLE ONLY public.device
    ADD CONSTRAINT device_type FOREIGN KEY (device_type_id) REFERENCES public.device_type(id);
 <   ALTER TABLE ONLY public.device DROP CONSTRAINT device_type;
       public               postgres    false    217    219    4731            �           2606    16454    device_playlist playlist_ad    FK CONSTRAINT     u   ALTER TABLE ONLY public.device_playlist
    ADD CONSTRAINT playlist_ad FOREIGN KEY (ad_id) REFERENCES public.ad(id);
 E   ALTER TABLE ONLY public.device_playlist DROP CONSTRAINT playlist_ad;
       public               postgres    false    4733    220    223            �           2606    16448    device_playlist playlist_device    FK CONSTRAINT     �   ALTER TABLE ONLY public.device_playlist
    ADD CONSTRAINT playlist_device FOREIGN KEY (device_id) REFERENCES public.device(id);
 I   ALTER TABLE ONLY public.device_playlist DROP CONSTRAINT playlist_device;
       public               postgres    false    217    223    4726            �           2606    16398    device user_device    FK CONSTRAINT     r   ALTER TABLE ONLY public.device
    ADD CONSTRAINT user_device FOREIGN KEY (user_id) REFERENCES public."user"(id);
 <   ALTER TABLE ONLY public.device DROP CONSTRAINT user_device;
       public               postgres    false    218    4729    217                  x������ � �             x������ � �            x������ � �            x������ � �      !      x������ � �            x������ � �            x������ � �     