ALTER TABLE -- Sirve para modificar la estructura de una tabla ya creada (añadir, cambiar o eliminar columnas, restricciones o el nombre de la tabla)

-- NOTA: Para poder ver las columnas de una tabla podemos usar el comando 
DESC persons5;
/*
Field       Type            Null    Key     Default             Extra
id	        int	            NO	    PRI		                    auto_increment
name	    varchar(50)	    NO			
age	        int	YES			
email	    varchar(100)	YES			
created	    datetime	    YES		        CURRENT_TIMESTAMP	DEFAULT_GENERATED
*/
-- También sirve para lo mismo:
 
SHOW COLUMNS FROM persons5;

-- ADD para añadir datos
ALTER TABLE persona5
ADD surname VARCHAR(150);
/*
Field       Type            Null    Key     Default             Extra
id	        int	            NO	    PRI		                    auto_increment
name	    varchar(50)	    NO			
age	        int	YES			
email	    varchar(100)	YES			
created	    datetime	    YES		        CURRENT_TIMESTAMP	DEFAULT_GENERATED
surname	    varchar(150)	YES			
*/

-- RENAME para cambiar el nombre de una columna
ALTER TABLE persons5
RENAME COLUMN surname TO descriptions;
/*
Field           Type            Null    Key     Default             Extra
id	            int	            NO	    PRI		                    auto_increment
name	        varchar(50)	    NO			
age	            int	YES			
email	        varchar(100)	YES			
created	        datetime	    YES		        CURRENT_TIMESTAMP	DEFAULT_GENERATED
description 	varchar(150)	YES			
*/
-- También se puede cambiar el nombre de la tabla con RENAME
ALTER TABLE users5 
RENAME TO usuarios5;

-- MODIFY Modifica datos de una columna
ALTER TABLE usuarios5
MODIFY COLUMN description VARCHAR(250); 
/*
Field           Type            Null    Key     Default             Extra
id	            int	            NO	    PRI		                    auto_increment
name	        varchar(50)	    NO			
age	            int	YES			
email	        varchar(100)	YES			
created	        datetime	    YES		        CURRENT_TIMESTAMP	DEFAULT_GENERATED
description 	varchar(250)	YES			
*/

-- DROP Elimina una columna
ALTER TABLE usuarios5
DROP COLUMN description;
/*
Field           Type            Null    Key     Default             Extra
id	            int	            NO	    PRI		                    auto_increment
name	        varchar(50)	    NO			
age	            int	YES			
email	        varchar(100)	YES			
created	        datetime	    YES		        CURRENT_TIMESTAMP	DEFAULT_GENERATED	
*/