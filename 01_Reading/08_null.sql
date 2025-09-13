NULL -- Valor desconocido o no asignado
-- NO es 0 ni cadena vacía

-- No se puede usar = ni != con NULL, siempre IS NULL o IS NOT NULL
SELECT * FROM users WHERE age IS null; 
/*
    4	Paco	Paco			paco@gmail.com
    6	Daniel	Abalo			daniel@gmail.com	
*/
SELECT * FROM users WHERE age IS NOT null;
/*
    1	Jorge	Abalo	    37	2024-01-01	jorge@hotmail.com
    2	Irene	González	37	2025-01-01	irene@hotmail.com
    3	Carlos	Abalo	    29		        carlos@gmail.com
    5	Miguel	Abalo	    30		        miguel@hotmail.com
    7	Jorge	Abalo	    36		
*/