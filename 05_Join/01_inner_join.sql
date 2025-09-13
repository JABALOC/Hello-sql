INNER JOIN -- Nos retorna las filas de dos o más tablas cuando estas tienen coincidencias

-- Montamos un JOIN entre la tabla usuario y dni
SELECT * FROM users
JOIN dni;
-- Sí hacemos esto, nos relaciona cada fila de users con cada fila de dni:
/*
    1	Jorge	Abalo	    37	2024-01-01	jorge@hotmail.com	1	3	33333333	
    1	Jorge	Abalo	    37	2024-01-01	jorge@hotmail.com	1	2	22222222	2
    1	Jorge	Abalo	    37	2024-01-01	jorge@hotmail.com	1	1	11111111	1
    2	Irene	González	37	2025-01-01	irene@hotmail.com	3	3	33333333	
    2	Irene	González	37	2025-01-01	irene@hotmail.com	3	2	22222222	2
    2	Irene	González	37	2025-01-01	irene@hotmail.com	3	1	11111111	1
    3	Carlos	Abalo	    29		        carlos@gmail.com	2	3	33333333	
    etc...
*/
-- Para que esto no ocurra tenemos que añadir la condición ON
-- De esta manera INNER JOIN devuelve solo los registros que coinciden en ambas tablas según  la condición ON
SELECT * FROM users
INNER JOIN dni
ON users.user_id = dni.user_id;
/*
    1	Jorge	Abalo	    37	2024-01-01	jorge@hotmail.com	1	1	11111111	1
    2	Irene	González	37	2025-01-01	irene@hotmail.com	3	2	22222222	2
*/
-- Tenemos una línea más en dni, pero al no tener asignado un user_id no aparece en la tabla.
/*
    dni_id      dni_number   user_id    
    1	        11111111	    1
    2	        22222222	    2
    3	        33333333	
*/