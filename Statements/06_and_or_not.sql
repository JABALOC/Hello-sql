NOT -- Operador lógico que niega una condición

SELECT * FROM users WHERE NOT name = 'jorge';
/*
    2	Irene	González	37	2025-01-01	irene@hotmail.com
    3	Carlos	Abalo	    29		        carlos@gmail.com
    4	Paco	Paco			            paco@gmail.com
    5	Miguel	Abalo	    30		        miguel@hotmail.com
    6	Daniel	Abalo			            daniel@gmail.com
*/

AND -- Operador lógico que permite combinar dos o más conciciones en un WHERE
-- Devuelve TRUE si todas la condiciones son verdaderas

SELECT * FROM users WHERE NOT name = 'jorge' AND email LIKE '%hotmail.com'; 
/*
    2	Irene	González	37	2025-01-01	irene@hotmail.com
    5	Miguel	Abalo	    30		        miguel@hotmail.com
*/

OR -- Operador lógico que permite combinar dos o más conciciones en un WHERE
-- Devuelve TRUE si al menos una condición es verdadera

-- Con OR basta con que una de las conciones sea verdadera para aparecer.
SELECT * FROM users WHERE NOT name = 'jorge' OR email LIKE '%hotmail.com';
/*
    1	Jorge	Abalo	    37	2024-01-01	jorge@hotmail.com
    2	Irene	González	37	2025-01-01	irene@hotmail.com
    3	Carlos	Abalo	    29		        carlos@gmail.com
    4	Paco	Paco			            paco@gmail.com
    5	Miguel	Abalo	    30		        miguel@hotmail.com
    6	Daniel	Abalo			            daniel@gmail.com
*/
--En este ejemplo excluye una de las filas con el nombre 'jorge'
/*
    1	Jorge	Abalo	37	2024-01-01	jorge@hotmail.com
        * name = 'Jorge' → NOT → FALSE
        * email LIKE '%hotmail.com' → TRUE
        * OR → TRUE, así que aparece.
    7	Jorge	Abalo	36		
        * name = 'Jorge' → NOT → FALSE
        * email LIKE '%hotmail.com' → FALSE
        * OR → FALSE, no aparece.
*/
