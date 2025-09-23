STORED PROCEDURE -- Procedimiento almacenado, es una función guardada en la base de datos
-- Parámetros 
    -- IN -> Pasas un valor al procedimiento
    -- OUT -> El procedimiento devuelve un valor (como una variable de salida)
    -- INOUT -> Puedes pasar un valor y también modificarlo dentro

-- Sintaxis
DELIMITER $$
CREATE PROCEDURE p_all_users()
BEGIN
    SELECT * FROM users;
END$$

DELIMITER ;

-- Para llamar a nuestro procedimiento almacenado

CALL p_all_users;

-- Vamos a crear otro procedimiento, pasando un parámetro
DELIMITER &&

CREATE PROCEDURE p_age_users(IN age_param INT)
BEGIN   
    SELECT * FROM users WHERE age = age_param;
END&&

DELIMITER ;

-- Para llamar a este procedimiento, tenemos que añadir el parametro que queremos buscar

CALL p_age_users(37);

-- Ahora que nos devuelve un parámetro
DELIMITER //

CREATE PROCEDURE p_total_users(OUT num_total INT)
BEGIN
    SELECT COUNT(*) INTO num_total FROM users;
END//

DELIMITER ;

-- Para mostrar num_total necesitamos crear una variable donde almacenar el dato devuelto 
-- Y luego mostrar la variable
CALL p_total_users(@count); -- ejecuta el procedimiento y guarda el resultado en variable
SELECT @count; -- muestra el valor almacenado en esa variable