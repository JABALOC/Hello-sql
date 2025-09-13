CREATE TABLE -- Sirve para crear una tabla en la base de datos

CREATE TABLE persons (
    id int, --Ponemos un nombre a la columna y le asignamos el tipo de dato que va a almacenar
    name VARCHAR(50), -- En VARCHAR() tenemos que indicar el número máximo de caracteres que puede tener
    age int,
    email VARCHAR(100),
    created date -- date solo guarda fecha (YYYY-MM-DD)
);
-- Pero esta tabla sirve de poco sin resticciones (CONSTRAINT)

-- Creamos nuevas tablas con las principales restricciones
CREATE TABLE persons2 (
    id int, -- Al ser PRIMARY KEY no hace falta definirlo ni como NOT NULL ni como UNIQUE 
    name VARCHAR(50) NOT NULL, -- Quiere decir que este campo no puede estar vacío
    age int,
    email VARCHAR(100),
    created datetime, -- datetime guarda fecha y hora (YYYY-MM-DD-HH:MM:SS)
    UNIQUE(email), -- Con esto indicamos que el email tiene que ser un campo único, no se puede repetir.
    PRIMARY KEY(id), -- Con esto no solo indicamos que id va a ser único, sino que también va a ser 
    -- Es el campo que vamos a usar para relacionarlo con otras tablas.
    CHECK(age >= 18) -- No puede haber un usuario con menos de 18 años
);

-- Vemos unas restricciones más
CREATE TABLE persons3 (
    id int AUTO_INCREMENT, -- Si no indicamos id se asigna uno nuevo incrementando en uno el valor del anterior (solo puede haber uno por tabla)
    name VARCHAR(50) NOT NULL,
    age int,
    email VARCHAR(100) DEFAULT 'algo@gmail.com', -- indicamos que por defecto va a tener este email
    created datetime DEFAULT CURRENT_TIMESTAMP(), -- por defecto usará el método CURRENT_TIMESTAMP que coge fecha y hora actual
    PRIMARY KEY(id),
    CHECK(age >= 18)
);

-- TAmbién se pueden crear las columnas directamente con las restricciones
CREATE TABLE persons4 (
	id int PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    age int CHECK(age >= 18),
    job VARCHAR(50) DEFAULT 'Dedempleado',
    mail VARCHAR(100) UNIQUE,
    created datetime DEFAULT CURRENT_TIMESTAMP()
);