WHERE -- Filtra las filas de una tabla según una condición.

SELECT * FROM users WHERE age = 37;
/*Esta ejecución dice 
    Devuleve todas las filas de la tabla 'users' donde la columna
    'age' es igual a 37

    1	Jorge	Abalo	    37	2024-01-01	correo@hotmail.com
    2	Irene	González	37	2025-01-01	correo@hotmail.com
*/

-- De esta manera le pedimos que nos devuelva la columna name de la tabla users y únicamente los que tengan age = 37
SELECT name FROM users WHERE age = 37;
--  Jorge
--  Irene

-- Pero si lo hacemos de esta manera
SELECT DISTINCT age FROM users WHERE age = 37;
-- Le estamos pidiendo que nos devuelva de la tabla users la columna age sin duplicados y solo los valores que sean igual a 37
--  37

