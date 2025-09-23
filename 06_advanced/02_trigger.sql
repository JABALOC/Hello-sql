TRIGGERS -- Es un disparador

-- Son instrucciones que se ejecutan automáticamente cuando ocurren eventos en la tabla
-- No necesitamos llamar al trigger. MySQL lo hace por nosotros
-- Se usan para automatizar tareas como auditoría, validaciones, actualizaciones automáticas, etc.
-- Por ejemplo, queremos que cuando un usuario actualice el email, el correo anterior se guarde en una nueva tabla

-- Tipos de eventos que activan un trigger
    -- INSERT -> Se ejecuta cuando se inserta un nuevo registro
    -- UPDATE -> Se ejecuta cuando se actualiza un registro
    -- DELETE -> Se ejecuta cuando se elimina un registro

-- Momento de ejecución
    -- BEFORE -> Antes de que ocurra la acción (útil para validar o modificar datos)
    -- AFTER -> Después de que ocurre la acción (útil para registrar cambios o actualizar otras tablas)

-- La sintaxis básica sería:
DELIMITER $$

CREATE TRIGGER nombre_trigger
AFTER|BEFORE INSERT|UPDATE|DELETE ON nombre_tabla
FOR EACH ROW
BEGIN   
    -- Código SQL a ejecutar
END$$

DELIMITER ; -- volvemos al delimitador normal

-- Notas importantes
    -- FOR EACH ROW -> Indica que el trigger se aplica fila por fila
    -- OLD.columna -> Valor anterior (solo en UPDATE o DELETE)
    -- NEW.columna -> Valor nuevo (solo en INSERT o UPDATE)
    -- Cada sentencia dentro de BEGIN ... END debe terminar con ;
    -- END IF; o cualquier bloque de control necesita el ; antes de cerrar END

-- En MySQL cuando creamos un trigger con BEGIN...END, necesitamos cambiar el delimitador porque MySQL inerpreta el ; 
-- dentro del trigger como el fin del comando. SI no lo hacemos, marcará error en END o END IF
DELIMITER $$
CREATE TRIGGER tg_email 
AFTER UPDATE ON users
FOR EACH ROW
BEGIN
    IF OLD.email <> NEW.email THEN 
        INSERT INTO email_history(user_id, email)
        VALUES (OLD.user_id, OLD.email);
    END IF;
END$$
DELIMITER ;

-- Delimiter $$ -> Cambiamos el delimitador temporal para que MySQL no cierre trigger al primer ;
-- END IF; -> Tenemos que acordarno de poner ; dentro del trigger
-- END$$ -> Terminamos el trigger con el delimitador que definimos
-- DELIMITER ; -> volvemos al delimitador normal

-- NOTA: usamos el delimitador $$ porque es raro que coincida con algo, pero se podría usar cualquier cadena, por ejemplo &&

-- Ahora vamos a cambiar un email del usuario con user_id = 1
UPDATE users SET email = 'jorge_luis@hotmail.com' WHERE user_id = 1;

-- Si ahora hacemos un SELECT de email_history veremos
/*
    email_history_id    user_id     email
    1	                 1	        jorge@hotmail.com
*/

-- Para ver lo TRIGGERS se hace de la siguiente manera:
SHOW TRIGGERS;  

-- Si queremos filtrar por una tabla concreata
SHOW TRIGGERS LIKE 'users';

-- Para eliminar un TRIGGER sería:
DROP TRIGGER tg_email;