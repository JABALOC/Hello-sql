-- Relación 1:1

CREATE TABLE dni(
    dni_id int PRIMARY KEY,
    dni_number int NOT NULL,
    user_id int UNIQUE, 
    FOREIGN KEY(user_id) REFERENCES users(user_id)
)

-- Relación 1:N

-- Creamos una nueva tabla a la que añadimos dos columnas, company_id y name
CREATE TABLE companies (
    company_id int PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
)
-- Tenemos que añadir una nueva columna a la tabla users para poder relacionarla con esta tabla
-- y lo hacemos de la siguiente manera:
ALTER TABLE users 
ADD company_id int,
ADD FOREIGN KEY (company_id) REFERENCES companies(company_id)

-- Ahora modificamos la tabla users y añadimos una clave foranea