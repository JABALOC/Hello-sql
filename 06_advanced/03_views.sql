VIEWS -- Representación visual de una tabla

CREATE VIEW v_adult_users AS
SELECT name, age
FROM users
WHERE age >= 18;

SELECT * FROM v_adult_users;
/*
    Jorge	37
    Irene	37
    Carlos	29
    Miguel	30
    Jorge	36
    Carla	18
    Tomás	20
*/

-- Para eliminar una vista 
DROP VIEW v_adult_users;