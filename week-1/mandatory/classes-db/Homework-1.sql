--En el terminal se ejecutan los siguientes comandos:
--1.- Creamos tabla llamada cyf_classes:
CREATE DATABASE cyf_classes owner postgres;

\q

psql -U postgres cyf_classes

--2.- Se crea tabla llamda mentors:
CREATE TABLE mentors(
cyf_classes(# id SERIAL PRIMARY KEY,
cyf_classes(# name VARCHAR(50) NOT NULL,
cyf_classes(# yearsInGlasgow int,
cyf_classes(# address VARCHAR(120),
cyf_classes(# favProgramLanguage VARCHAR(100)
cyf_classes(# );

--Para ver la tabla ejecuto \d mentors:
\d mentors
                                           Tabla ½public.mentors╗
      Columna       |          Tipo          | Ordenamiento | Nulable  |             Por omisi¾n
--------------------+------------------------+--------------+----------+-------------------------------------
 id                 | integer                |              | not null | nextval('mentors_id_seq'::regclass)
 name               | character varying(50)  |              | not null |
 yearsinglasgow     | integer                |              |          |
 address            | character varying(120) |              |          |
 favprogramlanguage | character varying(100) |              |          |
═ndices:
    "mentors_pkey" PRIMARY KEY, btree (id)

--3.- Añadir información a la tabla mentors:
INSERT INTO mentors (name, yearsinglasgow, address, favprogramlanguage) VALUES ('Maria Victoria Bilbao', 0, 'Barcelona', 'JavaScript');

-- Comprobación de si la información se cargo:
SELECT * FROM mentors;
 id |         name          | yearsinglasgow |      address      | favprogramlanguage
----+-----------------------+----------------+-------------------+--------------------
  1 | Maria Victoria Bilbao |              0 | Barcelona, España | JavaScript
(1 fila)

INSERT INTO mentors (name, yearsinglasgow, address, favprogramlanguage) VALUES ('Nancy Gonzalez', 1, 'Av. Romulo Gallegos, Caracas. Venezuela', 'JavaScript');

INSERT INTO mentors (name, yearsinglasgow, address, favprogramlanguage) VALUES ('Jesus Cepeda', 20, '39 Dalmally St, Glasgow G20 6RY, Reino Unido', 'PHP');

INSERT INTO mentors (name, yearsinglasgow, address, favprogramlanguage) VALUES ('Ruvi Soria', 5, 'Calle de Hortensia 15, Barcelona.', 'Python');

INSERT INTO mentors (name, yearsinglasgow, address, favprogramlanguage) VALUES ('Wendy Andrade', 12, '135 Cortmalaw Cres, Glasgow G33 1TD, Regne Unit', 'JavaScript');

-- Comprobación de los 5 mentores:
SELECT * FROM mentors;
 id |         name          | yearsinglasgow |                     address                     | favprogramlanguage
----+-----------------------+----------------+-------------------------------------------------+--------------------
  1 | Maria Victoria Bilbao |              0 | Barcelona                                       | JavaScript
  2 | Nancy Gonzalez        |              1 | Av. Romulo Gallegos, Caracas. Venezuela         | JavaScript
  3 | Jesus Cepeda          |             20 | 39 Dalmally St, Glasgow G20 6RY, Reino Unido    | PHP
  4 | Ruvi Soria            |              5 | Calle de Hortensia 15, Barcelona.               | Python
  5 | Wendy Andrade         |             12 | 135 Cortmalaw Cres, Glasgow G33 1TD, Regne Unit | JavaScript
(5 filas)

INSERT INTO mentors (name, yearsinglasgow, address, favprogramlanguage) VALUES ('Pedro Bilbao', 60, '119 Cortmalaw Cres, Glasgow G33 1TD, Regne Unit', 'JavaScript, PHP, Python');

SELECT * FROM mentors;
 id |         name          | yearsinglasgow |                     address                     |   favprogramlanguage   
----+-----------------------+----------------+-------------------------------------------------+-------------------------
  1 | Maria Victoria Bilbao |              0 | Barcelona                                       | JavaScript
  2 | Nancy Gonzalez        |              1 | Av. Romulo Gallegos, Caracas. Venezuela         | JavaScript
  3 | Jesus Cepeda          |             20 | 39 Dalmally St, Glasgow G20 6RY, Reino Unido    | PHP
  4 | Ruvi Soria            |              5 | Calle de Hortensia 15, Barcelona.               | Python
  5 | Wendy Andrade         |             12 | 135 Cortmalaw Cres, Glasgow G33 1TD, Regne Unit | JavaScript
  6 | Pedro Bilbao          |             60 | 119 Cortmalaw Cres, Glasgow G33 1TD, Regne Unit | JavaScript, PHP, Python
  (6 filas)


--4.- Creamos tabla llamada students:
CREATE TABLE students(
cyf_classes(# id SERIAL PRIMARY KEY,
cyf_classes(# name VARCHAR(50) NOT NULL,
cyf_classes(# address VARCHAR(120),
cyf_classes(# graduated BOOL
cyf_classes(# );

-- Comprobación de la creación:
SELECT * FROM students;
 id | name | address | graduated
----+------+---------+-----------
(0 filas)

--5.- Añadir datos en la tabla de students (10 estudiantes):
INSERT INTO students (name, address, graduated) VALUES ('Juan De Sousa', 'Passeig de Fabra i Puig, 330. Barcelona', 'true');

INSERT INTO students (name, address, graduated) VALUES ('Alejandro Gil', 'Carrer de Luca. Barcelona', 'false');

-- Comprobación de dos estudiantes creados:
SELECT * FROM students;
 id |     name      |                 address                 | graduated
----+---------------+-----------------------------------------+-----------
  1 | Juan De Sousa | Passeig de Fabra i Puig, 330. Barcelona | t
  2 | Alejandro Gil | Carrer de Lucà. Barcelona               | f
(2 filas)

INSERT INTO students (name, address, graduated) VALUES ('Ainhoa Gonzalez', 'Carrer de la Diputacio, 336. Barcelona', 'true');

INSERT INTO students (name, address, graduated) VALUES ('Enrique Luque', '8 Rue Garanciere, Paris. Francia', 'true');

INSERT INTO students (name, address, graduated) VALUES ('Jose Lopez', 'Avenida San Juan, Caracas. Venezuela', 'true');

INSERT INTO students (name, address, graduated) VALUES ('Anna Burgos', 'Via Favencia, Barcelona.', 'true');

INSERT INTO students (name, address, graduated) VALUES ('Peter Pan', '27 Rue Oudinot, Paris. Francia', 'false');

INSERT INTO students (name, address, graduated) VALUES ('Victoria Villegas', 'Calle Altamira, Caracas. Venezuela', 'true');

INSERT INTO students (name, address, graduated) VALUES ('Josefina Soria', 'Carrer Gaudi, 4. Barcelona', 'false');

INSERT INTO students (name, address, graduated) VALUES ('Carolina Elorza', 'Carrer de Jaume I, Viladecans. Barcelona', 'true');

--6.- Comprobación de los 10 estudiantes:
SELECT * FROM students;
 id |       name        |                 address                  | graduated
----+-------------------+------------------------------------------+-----------
  1 | Juan De Sousa     | Passeig de Fabra i Puig, 330. Barcelona  | t
  7 | Peter Pan         | 27 Rue Oudinot, Paris. Francia           | f
  8 | Victoria Villegas | Calle Altamira, Caracas. Venezuela       | t
 10 | Carolina Elorza   | Carrer de Jaume I, Viladecans. Barcelona | t
  5 | Jose Lopez        | Avenida San Juan, Caracas. Venezuela     | t
  3 | Ainhoa Gonzalez   | Carrer de la Diputacio, 336. Barcelona   | t
  2 | Alejandro Gil     | Carrer de Luca. Barcelona                | f
  6 | Anna Burgos       | Via Favencia, Barcelona.                 | t
  9 | Josefina Soria    | Carrer Gaudi, 4. Barcelona               | f
  4 | Enrique Luque     | 8 Rue Garanciere, Paris. Francia         | t
(10 filas)














