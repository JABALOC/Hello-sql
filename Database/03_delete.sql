DELETE -- Borra los datos existentes de una base de datos
-- Se usa FROM

-- NOTA IMPORTANTE: Siempre que queramos eliminar algo de la base de datos, lo haremos con el filtro WHERE
-- Se puede eliminar sin filtro, pero puedes eliminar toda la tabla
DELETE FROM users WHERE user_id = 11;
/*
    1	Jorge	Abalo	    37	2024-01-01	jorge@hotmail.com
    2	Irene	González	37	2025-01-01	irene@hotmail.com
    3	Carlos	Abalo	    29		        carlos@gmail.com
    4	Paco	Paco			            paco@gmail.com
    5	Miguel	Abalo	    30		        miguel@hotmail.com
    6	Daniel	Abalo	    		        daniel@gmail.com
    7	Jorge	Abalo	    36		
    8	Carla	Abalo	    18	2022-05-19	
    12	Tomás	Carapato	20	2022-04-17	
*/