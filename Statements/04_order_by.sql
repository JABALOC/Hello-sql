ORDER BY -- Ordena los resultados de una consulta según una o varias columnas, de manera
-- ascendente (ASC) o desdencente (DESC) (ascendente por defecto)

SELECT * FROM users ORDER BY age;
/*
    4	Paco	Paco			
    6	Daniel	Abalo			
    3	Carlos	Abalo	    29		
    5	Miguel	Abalo	    30		        correo@hotmail.com
    7	Jorge	Abalo	    36		
    1	Jorge	Abalo	    37	2024-01-01	correo@hotmail.com
    2	Irene	González	37	2025-01-01	correo@hotmail.com		
*/ 

SELECT * FROM users ORDER BY age DESC;
/*
    1	Jorge	Abalo	    37	2024-01-01	correo@hotmail.com
    2	Irene	González	37	2025-01-01	correo@hotmail.com
    7	Jorge	Abalo	    36		
    5	Miguel	Abalo	    30		        correo@hotmail.com
    3	Carlos	Abalo	    29		
    4	Paco	Paco			
    6	Daniel	Abalo			
					
*/

SELECT * FROM users WHERE surname = 'abalo' ORDER BY age DESC;
/*
1	Jorge	Abalo	37	2024-01-01	correo@hotmail.com
7	Jorge	Abalo	36		
5	Miguel	Abalo	30		correo@hotmail.com
3	Carlos	Abalo	29		
6	Daniel	Abalo			
					
*/