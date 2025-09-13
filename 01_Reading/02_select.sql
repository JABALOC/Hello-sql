-- SELECT sirve para consultar datos de una tabla en la base de datos

SELECT * FROM users; -- con * recupera todas las columnas y filas de la tabla users

SELECT name FROM users; -- recupera la columna con nombre 'name'

-- Si hay varias sentencias en Workbench leera la última
SELECT name FROM users;

SELECT user_id FROM users; -- En este caso solo leera la última

-- Ejecutar solo la sentencia donde está el cursor o la que seleccionemos: Ctrl + Enter
-- Ejecutar todas las sentencias del editor (script completo): Ctrl + Shift + Enter

SELECT name, user_id FROM users; -- Para consultar varias columnas, separamos los nombres con una coma