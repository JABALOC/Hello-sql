INNER JOIN -- Nos retorna las filas de dos o más tablas cuando estas tienen coincidencias

-- Relación 1:1
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

-- Relación 1:N se hace igual
SELECT * FROM users
JOIN companies -- EN la mayoría de las bases de datos no es necesario poner INNER JOIN únicamente JOIN basta
ON users.company_id = companies.company_id;
/*
    1	Jorge	Abalo	    37	2024-01-01	jorge@hotmail.com	1	1	MoureDev
    2	Irene	González	37	2025-01-01	irene@hotmail.com	3	3	Google
    3	Carlos	Abalo	    29		        carlos@gmail.com	2	2	Apple
    6	Daniel	Abalo			            daniel@gmail.com	1	1	MoureDev
*/

-- Relación N:M
SELECT * FROM users_languages
JOIN users ON users.user_id = users_languages.user_id; 
-- Si solo hacemos esto nos saldrá la siguiente tabla
/*
    1	1	1	1	Jorge	Abalo	    37	2024-01-01	jorge@hotmail.com	1
    2	1	2	1	Jorge	Abalo	    37	2024-01-01	jorge@hotmail.com	1
    3	2	1	2	Irene	González	37	2025-01-01	irene@hotmail.com	3
    4	3	1	3	Carlos	Abalo	    29		        carlos@gmail.com	2
    5	3	5	3	Carlos	Abalo	    29		        carlos@gmail.com	2
    7	5	3	5	Miguel	Abalo   	30	        	miguel@hotmail.com	
    6	6	4	6	Daniel	Abalo			            daniel@gmail.com	1
*/
-- Pero nos faltarían los datos de la tabla languages, por lo que tenemos que hacer un segundo JOIN
-- Un JOIN de la tabla users con la tabla users_languages buscando la coincidencia user_id
-- Otro JOIN de la tabla languages con la tabla users_languages buscando la coincidencia user_id
SELECT * FROM users_languages
JOIN users ON users.user_id = users_languages.user_id
JOIN languages ON languages.language_id = users_languages.language_id;
/*
    1	1	1	1	Jorge	Abalo	    37	2024-01-01	jorge@hotmail.com	1	1	Java
    3	2	1	2	Irene	González	37	2025-01-01	irene@hotmail.com	3	1	Java
    4	3	1	3	Carlos	Abalo	    29	        	carlos@gmail.com	2	1	Java
    2	1	2	1	Jorge	Abalo	    37	2024-01-01	jorge@hotmail.com	1	2	JavaScript
    7	5	3	5	Miguel	Abalo	    30		        miguel@hotmail.com		3	C#
    6	6	4	6	Daniel	Abalo			            daniel@gmail.com	1	4	Python
    5	3	5	3	Carlos	Abalo	    29	        	carlos@gmail.com	2	5	Cobol
    */
-- Ahora podemos modificar lo que queramos, como por ejemplo, que solo nos salga users.name y languages.name
SELECT users.name, languages.name FROM users_languages
JOIN users ON users.user_id = users_languages.user_id
JOIN languages ON languages.language_id = users_languages.language_id;

    /*
    Jorge	Java
    Irene	Java
    Carlos	Java
    Jorge	JavaScript
    Miguel	C#
    Daniel	Python
    Carlos	Cobol
    */