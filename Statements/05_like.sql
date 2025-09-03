LIKE -- Se utiliza en la clausjula WHERE para buscar patrones de texto de una columna.
-- NOTA!! En el caso de LIKE no se usa un igual ya que no es una comparación exacta
-- Funciona con comodines:
-- % -> Reemplaza cualquier número de caracteres
SELECT * FROM users WHERE name LIKE 'jo%';
/*
    1	Jorge	Abalo	37	2024-01-01	jorge@hotmail.com
    7	Jorge	Abalo	36		
*/

-- _ (guión bajo) -> reemplaza exactamente un caracter
SELECT * FROM users WHERE age LIKE '3_'
/*
    1	Jorge	Abalo	    37	2024-01-01	jorge@hotmail.com
    2	Irene	González	37	2025-01-01	irene@hotmail.com
    5	Miguel	Abalo	    30		        miguel@hotmail.com
    7	Jorge	Abalo	    36		
*/

-- También se puede poner % al principio y al final
SELECT * FROM users WHERE name LIKE '%g%';
/*
    1	Jorge	Abalo	37	2024-01-01	jorge@hotmail.com
    5	Miguel	Abalo	30		        miguel@hotmail.com
    7	Jorge	Abalo	36		
*/