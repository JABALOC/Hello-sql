CASE -- Permite evaluar condiciones y devolver valores según el resultado de esas condiciones
-- Podemos usar CASE dentro de SELECT, WHERE; ORDER BY

-- Sintáxis básica
CASE 
WHEN condición1 THEN valor1
WHEN condición2 THEN valor2
...
ELSE valor por defecto
END AS 'nombre_columna'

SELECT *,
CASE 
WHEN age > 18 THEN 'Es mayor de edad'
WHEN age = 18 THEN 'Acaba de cumplir la mayoría de edad'
ELSE 'Es menor de edad'
END AS '¿Es mayor de edad?'
FROM users; 
/*
    1	Jorge	Abalo	    37	2024-01-01	jorge@hotmail.com	Es mayor de edad
    2	Irene	González	37	2025-01-01	irene@hotmail.com	Es mayor de edad
    3	Carlos	Abalo	    29		        carlos@gmail.com	Es mayor de edad
    4	Paco	Paco			            paco@gmail.com	    Es menor de edad
    5	Miguel	Abalo	    30		        miguel@hotmail.com	Es mayor de edad
    6	Daniel	Abalo			            daniel@gmail.com	Es menor de edad
    7	Jorge	Abalo	    36		                        	Es mayor de edad
*/

SELECT *,
CASE 
WHEN age >= 18 THEN TRUE
ELSE FALSE
END AS '¿Es mayor de edad?'
/*
    1	Jorge	Abalo	    37	2024-01-01	jorge@hotmail.com	1
    2	Irene	González	37	2025-01-01	irene@hotmail.com	1
    3	Carlos	Abalo	    29		        carlos@gmail.com	1
    4	Paco	Paco			            paco@gmail.com	    0
    5	Miguel	Abalo	    30		        miguel@hotmail.com	1
    6	Daniel	Abalo			            daniel@gmail.com	0
    7	Jorge	Abalo	    36			                        1
*/

-- CASE se puede usar dentro de SELECT, WHERE, ORDER BY o en funciones de agregación

-- En SELECT
SELECT *,
CASE 
WHEN age > 30 THEN 'Empiezas a estar mayor'
WHEN age IS NULL THEN '¿Tienes miedo de decir tu edad?'
ELSE 'Eres joven'
END AS '¿Eres joven o viejo?'
FROM users;
/*
    1	Jorge	Abalo	    37	2024-01-01	jorge@hotmail.com	Empiezas a estar mayor
    2	Irene	González	37	2025-01-01	irene@hotmail.com	Empiezas a estar mayor
    3	Carlos	Abalo	    29		        carlos@gmail.com	Eres joven
    4	Paco	Paco			            paco@gmail.com	    ¿Tienes miedo de decir tu edad?
    5	Miguel	Abalo	    30		        miguel@hotmail.com	Eres joven
    6	Daniel	Abalo			            daniel@gmail.com	¿Tienes miedo de decir tu edad?
    7	Jorge	Abalo	    36		                           	Empiezas a estar mayor
*/

-- En WHERE si el nombre es 'Jorge' filtra por los de 37 años, si no filtra por los de 30
SELECT * FROM users
WHERE age =
CASE
WHEN name = 'Jorge' THEN 37
ELSE 30
END;
/*
    1	Jorge	Abalo	    37	2024-01-01	jorge@hotmail.com
    5	Miguel	Abalo	    30		        miguel@hotmail.com
*/

-- En ORDER BY primero nombre 'Jorge' después 'Daniel' por ultimo, el resto
SELECT * FROM users
ORDER BY
CASE 
WHEN name = 'Jorge' THEN 1
WHEN name = 'Daniel' THEN 2
ELSE 3
END;
/*
    1	Jorge	Abalo	    37	2024-01-01	jorge@hotmail.com
    7	Jorge	Abalo	    36		
    6	Daniel	Abalo			            daniel@gmail.com
    2	Irene	González	37	2025-01-01	irene@hotmail.com
    3	Carlos	Abalo	    29		        carlos@gmail.com
    4	Paco	Paco			            paco@gmail.com
    5	Miguel	Abalo	    30		        miguel@hotmail.com
*/

-- En funciones de agregación. Contamos cuantos 'Jorge' y cuántos 'Miguel' hay
SELECT
COUNT(CASE WHEN name = 'Jorge' THEN 1 END) AS total_Jorge,
COUNT(CASE WHEN name = 'Miguel' THEN 1 END) AS total_Miguel
FROM users;
/*
total_Jorge     total_Miguel
    2	            1
*/