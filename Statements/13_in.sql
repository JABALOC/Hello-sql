IN -- Permite filtrar filas donde una columna coincide con los valores indicados
-- Siempre tiene que ir con WHERE

-- Selecciona todas las filas de users cuyo 'name' esté en el conjunto de valores dado ('jorge')
SELECT * FROM users WHERE name IN ('jorge'); 
/*
    1	Jorge	Abalo	37	2024-01-01	jorge@hotmail.com
    7	Jorge	Abalo	36		
*/

SELECT * FROM users WHERE name IN ('jorge', 'irene');
/*
    1	Jorge	Abalo	    37	2024-01-01	jorge@hotmail.com
    2	Irene	González	37	2025-01-01	irene@hotmail.com
    7	Jorge	Abalo	    36		
*/

-- IN es equivalente a escribir varios OR