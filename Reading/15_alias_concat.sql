ALIAS -- Permite dar un nombre alternativo a una columna o tabla en la consulta
-- Para usar este comando empleamos la palabra reservada AS

-- La busqueda normal sería:
SELECT name, surname, age, init_date FROM users WHERE init_date IS NOT NULL;
/*
    name    surname     age     init_date
    Jorge	Abalo	    37	    2024-01-01
    Irene	González	37	    2025-01-01
*/

-- Pero si queremos que, al mostrarnos los datos, cambie el nombre de la columna 'init_date' por 'fecha_inicio' sería así:
SELECT name, surname, age, init_date AS 'fecha_inicio' FROM users WHERE init_date IS NOT NULL;
/*
    name    surname     age     fecha_inicio
    Jorge	Abalo	    37	    2024-01-01
    Irene	González	37	    2025-01-01
*/ 

CONCAT -- Sirve para concatenar dos o más columnas

SELECT CONCAT(name, surname) FROM users LIMIT 3;
/* 
    CONCAT(name, surname)
    JorgeAbalo
    IreneGonzález
    CarlosAbalo
*/
-- Esto concatena las columnas como están y asignan el nombre a la columna de CONCAT(name, surname)
-- Por lo que podemos añadir espacios ' ' y el comando ALIAS para cambiar el nombre de la columna
SELECT CONCAT('Nombre: ', name, ' Apellido: ', surname) AS 'Nombre completo' FROM users LIMIT 3;
/*
    Nombre completo
    Nombre: Jorge Apellido: Abalo
    Nombre: Irene Apellido: González
    Nombre: Carlos Apellido: Abalo
*/



