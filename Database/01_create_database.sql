CREATE DATABASE -- Se usa para crear una base de datos
-- DATABASE y SCHEMA suele referirse a lo mismo
-- Normalmente el nombre de una base de datos se escribe en minúsculas y si tiene más de una palabra, con guión_bajo

CREATE DATABASE test;

/*
Conexión en MySQL Workbench
Cuando creamos una conexión en Workbench (en MySQL Connections, al pulsar +), nos abre una ventana con los siguientes campos:
Connection name: 
    - Es el nombre que le queramos dar a la conexión.
    - Solo sirve para nosotros, como una etiqueta.
Connection Method:
    - Método de conexión.
    - Normalmente es estandard (TCP/IP). Es el método más común para conectar al servidor MySQL en nuestro ordenador.
Hostname:
    - Dirección donde está el servidor MySQL.
    - 127.0.0.1 o localhost significa que está en nuestro ordenador.
Port:
    - Puerto por el que conecta MySQL.
    - Por defecto es 3306
Username:   
    - Usuario con el que te conectas a MySQL.
    - El típico es root (el administrador principal)
Password
    - La contraseña que pusimos para la conexión
Default Schema:
    - Es la base de datos (schema) que se abrirá automáticamente al conectarnos.
    - Se puede dejar en blanco y luego elegir la base de datos con el comando:
    USE nombre_base_datos
*/