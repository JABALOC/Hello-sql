COUNT -- Cuenta el número de filas que cumplen una condición

-- Cuenta todas las filas de la tabla
SELECT COUNT(*) FROM users;
/*
    7
*/

-- Nos devuelve cuantos usuarios tienen un valor en age
SELECT COUNT(age) FROM users;
/*
    5
*/

-- Número de usuarios mayores de 35 años
SELECT COUNT(*) FROM users WHERE age > 35;
/*
    3
*/
