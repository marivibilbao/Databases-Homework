--En el terminal se ejecutan los siguientes comandos:
--1.- Creamos tabla llamada cyf_classes:
CREATE DATABASE cyf_classes owner postgres;

\q

psql -U postgres cyf_hotels

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
INSERT INTO mentors (name, yearsinglasgow, address, favprogramlanguage) VALUES ('Maria Victoria Bilbao', 0, 'Barcelona, España', 'JavaScript');

-- Comprobación de si la información se cargo:
SELECT * FROM mentors;
 id |         name          | yearsinglasgow |      address      | favprogramlanguage
----+-----------------------+----------------+-------------------+--------------------
  1 | Maria Victoria Bilbao |              0 | Barcelona, España | JavaScript
(1 fila)

INSERT INTO mentors (name, yearsinglasgow, address, favprogramlanguage) VALUES ('Nancy Gonzalez', 1, 'Av. Rómulo Gallegos, Caracas. Venezuela', 'Ninguno');

INSERT INTO mentors (name, yearsinglasgow, address, favprogramlanguage) VALUES ('Jesús Cepeda', 20, '39 Dalmally St, Glasgow G20 6RY, Reino Unido', 'PHP');

INSERT INTO mentors (name, yearsinglasgow, address, favprogramlanguage) VALUES ('Ruvi Soria', 5, 'Calle de Hortensia 15, Barcelona. España', 'Python');

INSERT INTO mentors (name, yearsinglasgow, address, favprogramlanguage) VALUES ('Wendy Andrade', 12, '135 Cortmalaw Cres, Glasgow G33 1TD, Regne Unit', 'JavaScript');

-- Comprobación de los 5 mentores:
SELECT * FROM mentors;
 id |         name          | yearsinglasgow |                     address                     | favprogramlanguage
----+-----------------------+----------------+-------------------------------------------------+--------------------
  1 | Maria Victoria Bilbao |              0 | Barcelona, España                               | JavaScript
  2 | Nancy Gonzalez        |              1 | Av. Rómulo Gallegos, Caracas. Venezuela         | Ninguno
  3 | Jesús Cepeda          |             20 | 39 Dalmally St, Glasgow G20 6RY, Reino Unido    | PHP
  4 | Ruvi Soria            |              5 | Calle de Hortensia 15, Barcelona. España        | Python
  5 | Wendy Andrade         |             12 | 135 Cortmalaw Cres, Glasgow G33 1TD, Regne Unit | JavaScript
(5 filas)

INSERT INTO mentors (name, yearsinglasgow, address, favprogramlanguage) VALUES ('Pedro Bilbao', 60, '119 Cortmalaw Cres, Glasgow G33 1TD, Regne Unit', 'JavaScript, PHP, Python');

SELECT * FROM mentors;
 id |         name          | yearsinglasgow |                     address                     |   favprogramlanguage   
----+-----------------------+----------------+-------------------------------------------------+-------------------------
  1 | Maria Victoria Bilbao |              0 | Barcelona, España                               | JavaScript
  2 | Nancy Gonzalez        |              1 | Av. Rómulo Gallegos, Caracas. Venezuela         | Ninguno
  3 | Jesús Cepeda          |             20 | 39 Dalmally St, Glasgow G20 6RY, Reino Unido    | PHP
  4 | Ruvi Soria            |              5 | Calle de Hortensia 15, Barcelona. España        | Python
  5 | Wendy Andrade         |             12 | 135 Cortmalaw Cres, Glasgow G33 1TD, Regne Unit | JavaScript
  6 | Pedro Bilbao          |             60 | 119 Cortmalaw Cres, Glasgow G33 1TD, Regne Unit | JavaScript, PHP, Python
  (6 filas)








