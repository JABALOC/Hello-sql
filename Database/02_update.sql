UPDATE -- Modifica datos existentes de una base de datos
-- Usamos SET para indicar que columnas y valores queremos cambiar

-- NOTA IMPORTANTE: Siempre que queramos modificar la base de datos, lo haremos con el filtro WHERE
-- Se puede modificar sin filtro, pero puedes modificar toda la tabla
UPDATE users SET age = 22 -- Modifica la edad de todos los usuarios a 22 años.
UPDATE users SET age = 22 WHERE user_id = 11 --Modifica la edad solo al usuario con user_id 11
/*
    11	Leo	Abalo	22		
*/

--Podemos modificar más de un campo
UPDATE users SET age = 22, init_date = '2022-04-17' WHERE user_id = 11;
/*
    11	Leo	Abalo	22	2022-04-17	
*/

--También podemos modificar más de un usuario a la vez
UPDATE users SET age = 18, init_date = '2022-05-19' WHERE user_id = 11 OR user_id = 8;
SELECT * FROM users WHERE user_id = 11 OR user_id = 8;
/*
    8	Carla	Abalo	18	2022-05-19	
    11	Leo	    Abalo	18	2022-05-19	
*/