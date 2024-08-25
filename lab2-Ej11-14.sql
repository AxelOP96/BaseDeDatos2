--11. Agregar la cultura llamada “nn” – “Cultura Moderna”. 
INSERT INTO Production.Culture (CultureId, Name, ModifiedDate) VALUES ('nn', 'Cultura Moderna', '2008-04-30 00:00:00.000')


--12. Cambiar la fecha de modificación de las culturas Spanish, 
--French y Thai para indicar que fueron modificadas hoy. 
UPDATE Production.Culture
SET ModifiedDate = GETDATE()
WHERE CultureID IN ('en', 'fr', 'th')


--13. En la tabla Production.CultureHis agregar todas las culturas 
--que fueron modificadas hoy. (Insert/Select). 
CREATE TABLE Production.CultureHis(
	 CulturasModificadas nvarchar(50)
	)
INSERT INTO Production.CultureHis (CulturasModificadas) 
	SELECT CultureID FROM Production.Culture
	WHERE DAY(ModifiedDate) = DAY(GETDATE())


--14. Al contacto con ID 10 colocarle como nombre “Juan Perez”.
UPDATE Person.Person
SET FirstName = 'Juan', LastName = 'Perez'
WHERE BusinessEntityID = 10