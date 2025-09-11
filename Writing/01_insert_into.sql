INSERT INTO -- Inserta filas nuevas en una tabla

INSERT INTO (user_id, name, surname) VALUES (8, 'Carla', 'Abalo');
/*
   1	Jorge	Abalo	    37	2024-01-01	jorge@hotmail.com
    2	Irene	González	37	2025-01-01	irene@hotmail.com
    3	Carlos	Abalo	    29		        carlos@gmail.com
    4	Paco	Paco			            paco@gmail.com
    5	Miguel	Abalo	    30		        miguel@hotmail.com
    6	Daniel	Abalo			            daniel@gmail.com
    7	Jorge	Abalo	    36		
    8	Carla	Abalo			
*/
-- Si intentamos poner un identificador (PK) que ya existe, nos dirá:
-- Error Code: 1062. Duplicate entry '7' for key 'users.PRIMARY'	0.000 sec

-- Si no lo ponemos user_id le asigna automáticamente el siguiente valor disponible (AUTO_INCREMENT).
-- Si el último user_id insertado fue el 11, esta fila tendrá user_id = 12.

INSERT INTO users (user_id, name, surname) VALUES (11, 'Leo', 'Abalo');
/*
    1	Jorge	Abalo	37	2024-01-01	jorge@hotmail.com
    2	Irene	González	37	2025-01-01	irene@hotmail.com
    3	Carlos	Abalo	29		carlos@gmail.com
    4	Paco	Paco			paco@gmail.com
    5	Miguel	Abalo	30		miguel@hotmail.com
    6	Daniel	Abalo			daniel@gmail.com
    7	Jorge	Abalo	36		
    8	Carla	Abalo			
    11	Leo	    Abalo			
*/
-- También podemos saltarnos la númeración de user_id y poner un número mayor. 
