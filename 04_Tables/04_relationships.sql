-- La forma de declara una FOREIGN KEY es de la siguiente manera:
-- Dentro de CREATE TABLE
CREATE TABLE dni (
    id int PRIMARY KEY,
    id_number int NOT NULL,
    user_id int UNIQUE, -- añadimos la columna que es PK de la tabla users y lo ponemos como UNIQUE
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
-- Añadiendo la columna FK a una tabla ya creada
-- Primero añadios la columna
ALTER TABLE dni 
ADD user_id int UNIQUE;
--Después modificamos la columna para poner la FK
ALTER TABLE dni
ADD CONSTRAINT fk_dni_user -- Es opcional poner nombre a la restricción, pero recomendable
FOREIGN KEY (user_id) REFERENCES users(user_id); 

-- NOTA: Es recomendable a la hora de crear una FOREIGN KEY, poner un nombre mediante el comando
CONSTRAINT fk_nombre_foreign_key

-- Relación 1:1 - Persona <-> DNI

-- Tenemos, por ejemplo, la tabla users y la tabla dni
CREATE TABLE users (
    user_id int PRIMARY KEY,
    name VARCHAR(50) NOT NULL 
);

CREATE TABLE dni(
    dni_id int PRIMARY KEY,
    dni_number int NOT NULL,
    user_id int UNIQUE, -- marcamos como UNIQUE para que no se pueda repetir dentro de la tabla dni
    CONSTRAINT fk_dni FOREIGN KEY(user_id) REFERENCES users(user_id) -- conecta con users.users_id.
);

-- Relación 1:N - Empresa <-> Empleado

-- Creamos una nueva tabla a la que añadimos dos columnas, company_id y name
CREATE TABLE companies (
    company_id int PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

-- Tenemos que añadir una nueva columna a la tabla users para poder relacionarla con esta tabla
-- y lo hacemos de la siguiente manera:
ALTER TABLE users 
ADD company_id int, -- Columna que será FK
ADD FOREIGN KEY (company_id) REFERENCES companies(company_id);

-- Al no poner la restricción UNIQUE, muchos empleados pueden compartir el mismo company_id, esto hace 
-- que 1 empresa -> N empleados

-- Relación N:M

-- Primero creamos una tabla de languajes
CREATE TABLE languages (
    language_id int PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

-- Ahora tenemos que crear una tabla intermedia que relacione a las dos tablas, para ello, en el nombre, usamos el 
-- nombre unido de _ de las dos tablas que vamos a relacionar
CREATE TABLE users_languages (
    users_languages_id int AUTO_INCREMENT PRIMARY KEY,
    user_id int,
    language_id int,
    CONSTRAINT fk_users FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT fk_language FOREIGN KEY (language_id) REFERENCES languages(language_id),
    UNIQUE (user_id, laguage_id)
);
-- La restircción UNIQUE, en el caso de las relaciones N:M se ponen conjuntas, de esta manera impedimos que 
-- un usuario repita el mismo lenguaje, pero no que un usuario conozca varios lenguajes
-- Lo único que debe ser único es la combinación de user_id + language_id



-- Regla general de los FOREIGN KEYS
-- 1. La FK siempre apunta a una PK o columna UNIQUE en la tabla padre
    -- Esto asegura que la FK se conecta a un valor único en la otra tabla y no se pueden repetir referencias
-- 2. Relación 1:1 
    --La columna en la tabla hija suele ser UNIQUE
    -- Garantiza que un registro del padre solo tenga un registro hijo y viceversa
-- 3. Relación 1:N
    -- La columna en la tabla hija puede repetirse
    -- Permite que muchos registros apuntan al mismo padre
-- 4. Relación N:M
    -- Se crea una tabla intermedia (tabla puente o junction table)
    -- Esta tabla contiene dos FOREIGN KEYS, una a cada tabla que se quiere relacionar
    -- Ambas columnas de FK suelen formar PRIMARY KEY compuesta (o se les pone UNIQUE combinada) para evitar duplicados




    -- INSERT --

    -- Añadimos números de DNI a la tabla de dni
    INSERT INTO dni (dni_number, user_id) VALUES (11111111, 1);
    -- Se me olvidó poner dni_id como AUTO_INCREMENT, por lo que no puedo saltar ese campo, vamos a añadir la restricción a dni_id
    ALTER TABLE dni MODIFY dni_id int AUTO_INCREMENT;
    -- Ya puedo saltar este campo porque ahora aunque no ponga dni_id este autoincrementa y no se va a repetir
    INSERT INTO dni (dni_number, user_id) VALUES (22222222, 2);
    INSERT INTO dni (dni_number) VALUES (33333333);

    -- Añadimos nombres de compañies en las tablas companies
    INSERT INTO companies (name) VALUES ('mouredev');
    -- Me he equivocado y lo quiero poner en mayusculas
    UPDATE companies SET name = 'MoureDev' WHERE company_id = 1;
    -- Seguimos añadiendo
    INSERT INTO companies (name) VALUES ('Apple');
    INSERT INTO companies (name) VALUES ('Google');

    -- En la tabla users vemos que tenemos la columna company_id, pero ningún usuario trabaja para ninguna empresa
/* 
user_id name    surname     age init_date   email                   company_id
    1	Jorge	Abalo	    37	2024-01-01	jorge@hotmail.com	
    2	Irene	González	37	2025-01-01	irene@hotmail.com	
    3	Carlos	Abalo	    29	        	carlos@gmail.com	
    4	Paco	Paco			            paco@gmail.com	
    5	Miguel	Abalo	    30	        	miguel@hotmail.com	
    6	Daniel	Abalo			            daniel@gmail.com	
    7	Jorge	Abalo	    36			
    8	Carla	Abalo	    18	2022-05-19		
    12	Tomás	Carapato	20	2022-04-17		
*/						

    -- Vamos a modificarlo
    UPDATE users SET company_id = 1 WHERE id = 1;
    UPDATE users SET company_id = 3 WHERE id = 2;
    UPDATE users SET company_id = 2 WHERE id = 3;
    UPDATE users SET company_id = 1 WHERE id = 6; 
/* 
user_id name    surname     age init_date   email                   company_id
    1	Jorge	Abalo	    37	2024-01-01	jorge@hotmail.com	    1
    2	Irene	González	37	2025-01-01	irene@hotmail.com	    3
    3	Carlos	Abalo	    29	        	carlos@gmail.com	    2
    4	Paco	Paco			            paco@gmail.com	
    5	Miguel	Abalo	    30	        	miguel@hotmail.com	
    6	Daniel	Abalo			            daniel@gmail.com	    1
    7	Jorge	Abalo	    36			
    8	Carla	Abalo	    18	2022-05-19		
    12	Tomás	Carapato	20	2022-04-17		
*/				

-- Seguimos con la tabla languages
INSERT INTO languages (name) VALUES ('Java');
INSERT INTO languages (name) VALUES ('JavaScript');
INSERT INTO languages (name) VALUES ('C#');
INSERT INTO languages (name) VALUES ('Python');
INSERT INTO languages (name) VALUES ('Cobol');

-- Tenemos que añadir en la tabla intermedia de users_languages quien sabe qué lenguajes
INSERT INTO users_languages (user_id, language_id) VALUES (1, 1);
INSERT INTO users_languages (user_id, language_id) VALUES (1, 2);
INSERT INTO users_languages (user_id, language_id) VALUES (2, 1);
INSERT INTO users_languages (user_id, language_id) VALUES (3, 1);
INSERT INTO users_languages (user_id, language_id) VALUES (3, 5);
INSERT INTO users_languages (user_id, language_id) VALUES (6, 4);
-- De esta manera se quedaría así
/*
user_language_id    user_id     language_id
    1	                1           1
    2	                1	        2
    3	                2	        1
    4	                3	        1
    5	                3	        5
    6	                6	        4
*/
-- Pero al no poner la columna user_id ni language_id como NOT NULL podemos hacer cosas como esta:
INSER INTO users_languages (user_id) VALUES (5);
-- Lo que nos da como resultado 
/*
user_language_id    user_id     language_id
    1	                1           1
    2	                1	        2
    3	                2	        1
    4	                3	        1
    5	                3	        5
    6	                6	        4
    7                   5           NULL
*/
-- Cosa que no tiene sentido. Por lo que vamos a modificar y a poner como NOT NULL esos campos
-- Primero modificamos el campo de user_id
ALTER TABLE users_languages
MODIFY user_id int NOT NULL
-- Esto nos deja sin problema. Lo intentamos con language_id
ALTER TABLE users_languages
MODIFY languages_id int NOT NULL
-- Sin embargo esto nos da fallo, ya que anteriormente metimos un resgistro nulo. Por lo que tenemos que modificar primero
-- ese registro y despues modificar la columna
UPDATE users_languages SET languages_id = 3 WHERE user_id = 5;
/*
user_language_id    user_id     language_id
    1	                1           1
    2	                1	        2
    3	                2	        1
    4	                3	        1
    5	                3	        5
    6	                6	        4
    7                   5           3
*/
-- Y ahora sí
ALTER TABLE users_languages 
MODIFY language_id int NOT NULL;
-- De esta manera ya no se pueden poner usuarios sin lenguaje ni viceversa.
