PGDMP     ;    %    
            z            Taller1    14.2    14.1 #    "           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            #           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            $           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            %           1262    24576    Taller1    DATABASE     h   CREATE DATABASE "Taller1" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Colombia.1252';
    DROP DATABASE "Taller1";
                postgres    false            �            1259    24610    administrador    TABLE     �   CREATE TABLE public.administrador (
    id_vendedor integer,
    nombre character varying(100),
    id_admin integer NOT NULL
);
 !   DROP TABLE public.administrador;
       public         heap    postgres    false            �            1259    24635    compra    TABLE     �   CREATE TABLE public.compra (
    id_compra integer NOT NULL,
    estado_de_pago character varying(20),
    userid integer,
    producto_id integer
);
    DROP TABLE public.compra;
       public         heap    postgres    false            �            1259    24577 	   comprador    TABLE     f  CREATE TABLE public.comprador (
    userid integer NOT NULL,
    nombre character varying(100),
    "contraseña" character varying(20),
    tipo_identificacion character varying(30),
    num_identificacion integer,
    apodo character varying(60),
    correo character varying(100),
    ciudad character varying(50),
    direccion character varying(150)
);
    DROP TABLE public.comprador;
       public         heap    postgres    false            �            1259    24663    cuentadepago    TABLE     0  CREATE TABLE public.cuentadepago (
    id_cuentap integer NOT NULL,
    dineroencuenta numeric NOT NULL,
    tarjeta character varying(100) NOT NULL,
    tipo_tarjeta character varying(100),
    numero_tarjeta integer NOT NULL,
    fecha_ex date NOT NULL,
    cvc integer NOT NULL,
    userid integer
);
     DROP TABLE public.cuentadepago;
       public         heap    postgres    false            �            1259    24675    envio    TABLE     �   CREATE TABLE public.envio (
    id_envio integer NOT NULL,
    estado character varying(50) NOT NULL,
    guia character varying(70) NOT NULL,
    id_compra integer
);
    DROP TABLE public.envio;
       public         heap    postgres    false            �            1259    24584    producto    TABLE     
  CREATE TABLE public.producto (
    producto_id integer NOT NULL,
    nombre character varying(100),
    categoria character varying(20),
    marca character varying(30),
    stock integer,
    descripcion character varying(60),
    precios character varying(100)
);
    DROP TABLE public.producto;
       public         heap    postgres    false            �            1259    24650    vende    TABLE     P   CREATE TABLE public.vende (
    id_vendedor integer,
    producto_id integer
);
    DROP TABLE public.vende;
       public         heap    postgres    false            �            1259    24600    vendedor    TABLE        CREATE TABLE public.vendedor (
    id_vendedor integer NOT NULL,
    userid integer,
    calificacion character varying(20)
);
    DROP TABLE public.vendedor;
       public         heap    postgres    false                      0    24610    administrador 
   TABLE DATA           F   COPY public.administrador (id_vendedor, nombre, id_admin) FROM stdin;
    public          postgres    false    212   �*                 0    24635    compra 
   TABLE DATA           P   COPY public.compra (id_compra, estado_de_pago, userid, producto_id) FROM stdin;
    public          postgres    false    213   �*                 0    24577 	   comprador 
   TABLE DATA           �   COPY public.comprador (userid, nombre, "contraseña", tipo_identificacion, num_identificacion, apodo, correo, ciudad, direccion) FROM stdin;
    public          postgres    false    209   �*                 0    24663    cuentadepago 
   TABLE DATA           �   COPY public.cuentadepago (id_cuentap, dineroencuenta, tarjeta, tipo_tarjeta, numero_tarjeta, fecha_ex, cvc, userid) FROM stdin;
    public          postgres    false    215   �*                 0    24675    envio 
   TABLE DATA           B   COPY public.envio (id_envio, estado, guia, id_compra) FROM stdin;
    public          postgres    false    216   +                 0    24584    producto 
   TABLE DATA           f   COPY public.producto (producto_id, nombre, categoria, marca, stock, descripcion, precios) FROM stdin;
    public          postgres    false    210   3+                 0    24650    vende 
   TABLE DATA           9   COPY public.vende (id_vendedor, producto_id) FROM stdin;
    public          postgres    false    214   P+                 0    24600    vendedor 
   TABLE DATA           E   COPY public.vendedor (id_vendedor, userid, calificacion) FROM stdin;
    public          postgres    false    211   m+       ~           2606    24614     administrador administrador_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.administrador
    ADD CONSTRAINT administrador_pkey PRIMARY KEY (id_admin);
 J   ALTER TABLE ONLY public.administrador DROP CONSTRAINT administrador_pkey;
       public            postgres    false    212            �           2606    24639    compra compra_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.compra
    ADD CONSTRAINT compra_pkey PRIMARY KEY (id_compra);
 <   ALTER TABLE ONLY public.compra DROP CONSTRAINT compra_pkey;
       public            postgres    false    213            x           2606    24583    comprador comprador_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.comprador
    ADD CONSTRAINT comprador_pkey PRIMARY KEY (userid);
 B   ALTER TABLE ONLY public.comprador DROP CONSTRAINT comprador_pkey;
       public            postgres    false    209            �           2606    24669    cuentadepago cuentadepago_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.cuentadepago
    ADD CONSTRAINT cuentadepago_pkey PRIMARY KEY (id_cuentap);
 H   ALTER TABLE ONLY public.cuentadepago DROP CONSTRAINT cuentadepago_pkey;
       public            postgres    false    215            �           2606    24679    envio envio_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.envio
    ADD CONSTRAINT envio_pkey PRIMARY KEY (id_envio);
 :   ALTER TABLE ONLY public.envio DROP CONSTRAINT envio_pkey;
       public            postgres    false    216            z           2606    24588    producto producto_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (producto_id);
 @   ALTER TABLE ONLY public.producto DROP CONSTRAINT producto_pkey;
       public            postgres    false    210            |           2606    24604    vendedor vendedor_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.vendedor
    ADD CONSTRAINT vendedor_pkey PRIMARY KEY (id_vendedor);
 @   ALTER TABLE ONLY public.vendedor DROP CONSTRAINT vendedor_pkey;
       public            postgres    false    211            �           2606    24615 ,   administrador administrador_id_vendedor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.administrador
    ADD CONSTRAINT administrador_id_vendedor_fkey FOREIGN KEY (id_vendedor) REFERENCES public.vendedor(id_vendedor);
 V   ALTER TABLE ONLY public.administrador DROP CONSTRAINT administrador_id_vendedor_fkey;
       public          postgres    false    211    212    3196            �           2606    24645    compra compra_producto_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.compra
    ADD CONSTRAINT compra_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.producto(producto_id);
 H   ALTER TABLE ONLY public.compra DROP CONSTRAINT compra_producto_id_fkey;
       public          postgres    false    213    210    3194            �           2606    24640    compra compra_userid_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.compra
    ADD CONSTRAINT compra_userid_fkey FOREIGN KEY (userid) REFERENCES public.comprador(userid);
 C   ALTER TABLE ONLY public.compra DROP CONSTRAINT compra_userid_fkey;
       public          postgres    false    213    3192    209            �           2606    24670 %   cuentadepago cuentadepago_userid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cuentadepago
    ADD CONSTRAINT cuentadepago_userid_fkey FOREIGN KEY (userid) REFERENCES public.comprador(userid);
 O   ALTER TABLE ONLY public.cuentadepago DROP CONSTRAINT cuentadepago_userid_fkey;
       public          postgres    false    209    215    3192            �           2606    24680    envio envio_id_compra_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.envio
    ADD CONSTRAINT envio_id_compra_fkey FOREIGN KEY (id_compra) REFERENCES public.compra(id_compra);
 D   ALTER TABLE ONLY public.envio DROP CONSTRAINT envio_id_compra_fkey;
       public          postgres    false    216    213    3200            �           2606    24653    vende vende_id_vendedor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.vende
    ADD CONSTRAINT vende_id_vendedor_fkey FOREIGN KEY (id_vendedor) REFERENCES public.vendedor(id_vendedor);
 F   ALTER TABLE ONLY public.vende DROP CONSTRAINT vende_id_vendedor_fkey;
       public          postgres    false    3196    211    214            �           2606    24658    vende vende_producto_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.vende
    ADD CONSTRAINT vende_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.producto(producto_id);
 F   ALTER TABLE ONLY public.vende DROP CONSTRAINT vende_producto_id_fkey;
       public          postgres    false    214    210    3194            �           2606    24605    vendedor vendedor_userid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.vendedor
    ADD CONSTRAINT vendedor_userid_fkey FOREIGN KEY (userid) REFERENCES public.comprador(userid);
 G   ALTER TABLE ONLY public.vendedor DROP CONSTRAINT vendedor_userid_fkey;
       public          postgres    false    209    3192    211                  x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �     