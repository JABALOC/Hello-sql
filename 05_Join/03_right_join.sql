-- RIGHT JOIN
-- Es lo mismo pero devuelve los datos de la tabla derecha
SELECT users.name, dni.dni_number FROM users
RIGHT JOIN dni
ON users.user_id = dni.user_id;
-- Devuelve todos los DNI, aunque no tengan usuario
/*
name    dni_number
Jorge	11111111
Irene	22222222
NULL    33333333

*/