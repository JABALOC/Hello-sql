GROUP BY -- Agrupa filas según la columna que indiquemos
-- Dentro de cada grupo solo se puede:
    -- Usar funciones de agregación (COUNT, SUM, AVG, MAX, MIN...)
    -- Incluir en el SELECT las columnas que también estén en el GROUP BY
-- NOTA!! No podemos poner en el SELECT una columna que no está en el GROUP BY

-- Ejemplo
-- Selecciona la columna age y cuenta cuántas filas hay en cada grupo de age.
-- La columna COUNT(*) se renombra como 'cantidad'.
-- Los resultados se agrupan por cada valor distinto de age.
SELECT age, COUNT(*) AS 'cantidad' FROM users GROUP BY age;
/*
    age     cantidad
    37	    2
    29	    1
	NULL    2
    30	    1
    36	    1
*/
-- No se podría incluir name ya que no está en GROUP BY
SELECT name, age, COUNT(*) AS 'cantidad' FROM users GROUP BY age;
-- Pero si lo incluimos:
SELECT name, age, COUNT(*) AS 'cantidad' FROM users GROUP BY name, age;
/*
    name    age     cantidad
    Jorge	37	    1
    Irene	37	    1
    Carlos	29	    1
    Paco		    1
    Miguel	30	    1
    Daniel		    1
    Jorge	36	    1
*/

-- Selecciona todas las edades máximas de la tabla users y las agrupa por años
SELECT name, COUNT(*) AS 'Cantidad' FROM users GROUP BY age;

COUNT(*)    -- Cuenta todas las filas, sin importar si tienen NULL o no
COUNT(age)  -- Cuenta solo las filas donde esa columna no es NULL