MAX -- Devuelve el valor máximo

SELECT MAX(age) FROM users;
/*
    37
*/

MIN -- Devuelve el valor mínimo

SELECT MIN(age) FROM users;
/*
    29
*/

-- MAX y MIN devuelven únicamente la columna del dato que estamos buscando, no toda la fila
-- Para obtener toda la fila completa habría que combinarlo con WHERE

SELECT * FROM users WHERE age = (SELECT MAX(age) FROM users);
/*
    1	Jorge	Abalo	    37	2024-01-01	jorge@hotmail.com
    2	Irene	González	37	2025-01-01	irene@hotmail.com
*/

SELECT * FROM users WHERE age = (SELECT MIN(age) FROM users);
/*
    3	Carlos	Abalo	29		carlos@gmail.com
*/