HAVING -- Filtra los resultados después de un GROUP BY

-- Se usa para aplicar condiciones a funciones de agregación
-- Por ejemplo:
SELECT age, COUNT(*) AS cantidad FROM users GROUP BY age;
/*
    37	    2
    29	    1
    NULL    2
    30	    1
    36	    1
*/

-- Mismo ejemplo con HAVING
-- Le pedimos que nos devuelva solo los que estén agrupados por edad que sean mayores que 1
SELECT age, COUNT(*) AS cantidad FROM users GROUP BY age HAVING COUNT(*) > 1;
/*
    37	    2
	NULL    2
*/

-- Diferencia clave con WHERE
    -- WHERE filtra filas antes de agrupar
    -- Having filtra después de aplicar GROUP BY

-- Ejemplo con WHERE
SELECT age, COUNT(*) FROM users WHERE age IS NOT NULL GROUP BY age;
/* WHERE elimina las filas antes de agrupar
    37	2
    29	1
    30	1
    36	1
*/
SELECT age, COUNT(*) FROM users GROUP BY age HAVING age IS NOT NULL;
/* HAVING elimina las filas después de agrupar
    37	2
    29	1
    30	1
    36	1
*/