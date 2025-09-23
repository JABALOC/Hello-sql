INDEX -- Es como el índice de un libro
    -- Si no tiene índice, para buscar una palabra, tendra que leer todo el libro
    -- Si lo tiene va directo al capítulo/página donde está lo que buscamos
-- En base de datos
    -- Sin índice revisa fila por fila
    -- con índice va directamente a las filas donde puede estar el dato

-- VENTAJAS
    -- El índice acelera las consultas SELECT, sobre todo con WHERE; JOIN; ORDER BY; GROUP BY
    -- Reduce el tiempo de busqueda en tablas grandes
-- DESVENTAjAS
    -- Ocupa espacio extra
    -- Hace que INSERT, UPDATE y DELETE vayan más lentos, porque hay que mantener actualizado el índice
    -- Por eso no conviene poner índices en todas las columnas, solo en las que realmente se buscan o relacionan mucho.


-- Tipos principales de índices
-- índice normal
CREATE INDEX idx_name ON users(name);
-- Acelera la busqueda por nombre

-- índice único
CREATE UNIQUE INDEX idx_email ON users(email);
-- Igual que el normal, pero se garantiza que no se repitan valores

-- índice compuesto
CREATE INDEX idx_name_surname ON users(name, surname);
-- Útil cuando consultamos varias columnas juntas
-- Ejemplo WHERE name = 'Jorge' AND surname = 'Abalo'

-- CUANDO USAR LOS índiceS
    -- Columnas que usemos mucho en WHERE
    -- Columnas que participen en JOIN
    -- Columnas que uses en ORDER BY o GROUP BY
-- CUANDO EVITARLOS
    -- Columnas con pocos valores distintos(ej: sexo, activo = si/no)
    -- Tablas pequeñas
    -- Columnas que cambian todo el rato

-- Para ver lo índices creados
SHOW INDEX FROM users;
/*
    users	0	PRIMARY	    1	user_id	    A	9				BTREE			YES	
    users	1	idx_name	1	name	    A	8				BTREE			YES	
*/

-- Si queremos borrar un índice hacemos 
DROP INDEX idx_name ON users;

-- Ejemplo práctico
-- Tenemos una tabla con un millón de registros
SELECT * FROM users WHERE email = 'jorge@hotmail.es'
-- Sin índice MySQL revisa el millón de registros
-- Con índice en email MySQL busca en el índice 

-- En el archivo alter_table usamos 
ALTER TABLE users DROP INDEX email;
-- Para borrar la restricció UNIQUE de email y es que siempre que definimos una PRIMARY KEY o un UNIQUE 
-- MySQL automáticamente crea un índice.
