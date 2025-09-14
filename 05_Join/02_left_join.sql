LEFT JOIN -- Devuelve todos los datos de la tabla de la izquierda, tengan o no coincidencia con la tabla de la derecha

SELECT * FROM users
LEFT JOIN dni
ON users.user_id = dni.user_id;
/*
    1	Jorge	Abalo	    37	2024-01-01	jorge@hotmail.com	1	1	11111111	1
    2	Irene	González	37	2025-01-01	irene@hotmail.com	3	2	22222222	2
    3	Carlos	Abalo	    29		        carlos@gmail.com	2			
    4	Paco	Paco			            paco@gmail.com				
    5	Miguel	Abalo	    30		        miguel@hotmail.com				
    6	Daniel	Abalo			            daniel@gmail.com	1			
    7	Jorge	Abalo	    36						
    8	Carla	Abalo	    18	2022-05-19					
    12	Tomás	Carapato	20	2022-04-17					
*/
-- Los campos que no tengan datos, los rellena con NULL

SELECT users.name, dni.dni_number FROM users
LEFT JOIN dni
ON users.user_id = dni.user_id;
-- Devuelve todos los usuarios, aunque no tengan DNI
/*
name    dni_number
Jorge	11111111
Irene	22222222
Carlos	NULL
Paco	NULL
Miguel	NULL
Daniel	NULL
Jorge	NULL
Carla	NULL
Tomás	NULL
*/

