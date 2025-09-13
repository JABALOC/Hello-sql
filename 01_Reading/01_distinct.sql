DISTINCT -- Devuelve solo los valores únicos de una columna o combinación de columnas, eliminando duplicados.

SELECT DISTINCT age FROM users;

/* Nos devuelve solo los valores únicos de la columna age
    age
    37
    36
    NULL
    29
*/

SELECT DISTINCT name, age FROM users;

/*Nos devuelve los valores únicos de la combinación de name + age
    Jorge	37
    Irene	37
    Daniel	NULL
    Jorge	36
    Miguel  29
*/