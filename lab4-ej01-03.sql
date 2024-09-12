--Ejercicio 1

CREATE DATABASE MusicaDB ON PRIMARY 
( NAME = 'Musica', 
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Musica.mdf' , 
SIZE = 4096KB , 
MAXSIZE = 20480KB , 
FILEGROWTH = 1024KB 
) 
 LOG ON 
( NAME = 'Musica_log', 
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Musica_log.ldf' , 
SIZE = 2048KB , 
MAXSIZE = 10240KB , 
FILEGROWTH = 10% 
) 


--Ejercicio 2. Responder la siguientes preguntas verificando cómo ha quedado la base de datos creada: 
--2.1. ¿Qué se ha definido como política de retención de log? 
--Establece un archivo log, su ubicación, el tamaño inicial de este archivo, el tamaño máximo y el crecimiento del archivo.


--2.2. ¿Se crearán estadísticas automáticamente? 
--No, se podrian haber hecho con este ejemplo
--CREATE STATISTICS stats_name ON table_name (column_name);


--2.3. ¿Será compatible con una base de datos de SQL Server 2000? 
--No es directamente compatible por su sintaxis


--2.4. ¿Cuál es el juego de caracteres que se utilizará y qué significa? 
--Null
SELECT DATABASEPROPERTYEX('MusicaDB', 'Collation') AS DatabaseCollation;

--3. Crear el esquema discos. 
CREATE SCHEMA Discos;
