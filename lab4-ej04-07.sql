--4. Se desea crear el siguiente modelo relacional. Recordar que se deben crear cada una de las tablas involucradas y de sus relaciones. 
CREATE TABLE Discos.Artista( 
 artno smallint NOT NULL, 
 nombre varchar(50) NULL, 
 clasificacion char(1) NULL, 
 bio text NULL, 
 foto image null, 
 CONSTRAINT PK_Artista PRIMARY KEY CLUSTERED (artno) 
) 
CREATE TABLE Discos.concierto( 
 artno smallint NOT NULL, 
 fecha datetime, 
 ciudad varchar(25), 
 CONSTRAINT FK_Discos FOREIGN KEY (artno) REFERENCES Discos.Artista(artno) 
) 
CREATE TABLE Discos.album
(
	itemno smallint NOT NULL PRIMARY KEY,
	Titulo VARCHAR(50) NOT NULL,
    artno smallint NOT NULL
);
ALTER TABLE Discos.album ADD CONSTRAINT FK_album 
FOREIGN KEY (artno) REFERENCES Discos.Artista (artno);
CREATE TABLE Discos.stock
(
	itemno smallint NOT NULL,
    tipo CHAR(1) NOT NULL,
    precio decimal(5,2) NOT NULL,
    cantidad int,
	CONSTRAINT FK_stock FOREIGN KEY  (itemno) REFERENCES Discos.album(itemno)
);
CREATE TABLE Discos.Orden
(
	itemno smallint NOT NULL,
    timestampa timestamp,
	CONSTRAINT FK_Orden FOREIGN KEY  (itemno) REFERENCES Discos.album(itemno)
);


--5. Crear un diagrama con el modelo relacional generado. 


--6. Realizar los siguientes cambios en el modelo: 
--6.1. Cambiar el tamaño de campo ciudad en la tabla ciudad para que sea de 30 en lugar de 25. 
ALTER TABLE Discos.concierto
ALTER COLUMN ciudad VARCHAR(30);


--6.2. En la tabla de Stock, colocar el precio con un valor por defecto en 0 (cero). 
ALTER TABLE Discos.stock
ADD CONSTRAINT precio_minimo
DEFAULT 0 FOR precio;


--6.3. En la tabla de álbumes el nombre del título no puede ser nulo. 
ALTER TABLE Discos.album
ALTER COLUMN Titulo VARCHAR(50) NOT NULL;


--7. Agregar los siguientes registros dentro de la base de datos creada: 
-- - 3 artistas 
-- - 2 conciertos por cada uno de los artistas en diferentes fechas y ciudades 
-- - 2 álbumes por cada uno de los artistas 
-- - Stock sólo de 2 álbumes de diferentes artistas
--artno smallint NOT NULL, -- nombre varchar(50) NULL, -- clasificacion char(1) NULL, -- bio text NULL, -- foto image null, 
INSERT INTO Discos.Artista(artno, nombre, clasificacion, bio) 
VALUES (1, 'James Blunt', 'R', 'Cantante y ex militar'), 
(2, 'Taylor Swift', 'x','The one and only'), 
(3, 'Edd Sheeran', 'a', 'Colorado');
--artno smallint NOT NULL,  fecha datetime, ciudad varchar(25)
INSERT INTO Discos.concierto (artno, fecha, ciudad) 
VALUES(1, '2024-12-25', 'New York'),
(1, '2024-12-25', 'New Jersey'),
(2, '2024-12-25', 'Londres'),
(2, '2024-12-25', 'Buenos Aires'),
(3, '2024-12-25', 'Rio de Janeiro'),
(3, '2024-12-25', 'Paris');
SELECT * FROM Discos.concierto;
--itemno smallint NOT NULL PRIMARY KEY,	Titulo VARCHAR(50) NOT NULL,    artno smallint NOT NULL
INSERT INTO Discos.album (itemno, Titulo, artno) 
VALUES (1,'You are beautiful',1),
(2,'Postcards',1),
(3,'Reputation',2),
(4,'The eras tour',2),
(5,'Divide',3),
(6,'Multiply',3);
--itemno smallint NOT NULL,    tipo CHAR(1) NOT NULL,    precio decimal(5,2) NOT NULL,--    cantidad int
INSERT INTO Discos.stock (itemno, tipo, precio, cantidad) 
VALUES (3, 'A', 20.5, 100),
(5,'B', 17.0, 58);