--6. Devolver cuál es el usuario que se encuentra conectado a la base de datos 
SELECT SUSER_NAME() AS Usuario


--7. Realizar una consulta que permita conocer la edad de cada empleado (Ayuda: HumanResources.Employee)
SELECT JobTitle, BirthDate, DATEDIFF(YEAR, BirthDate, GETDATE()) AS Edad 
FROM HumanResources.Employee


--8. Realizar una consulta que retorne la longitud de cada apellido de los Contactos, ordenados por apellido. En el 
--caso que se repita el apellido devolver únicamente uno de ellos. Por ejemplo, 
--Apellido Longitud 
--    Abel        4 
SELECT DISTINCT LastName AS Apellido, len(LastName) AS Longitud
FROM Person.Person
ORDER BY LastName ASC


--9. Realizar una consulta que permita encontrar el apellido con mayor longitud. 
SELECT MAX(len(LastName)) AS Apellido
FROM Person.Person


--10.Realizar una consulta que devuelva los nombres y apellidos de los contactos que hayan sido modificados en los 
--últimos 3 años. 
SELECT FirstName, LastName, ModifiedDate
FROM Person.Person
WHERE DATEDIFF(YEAR, ModifiedDate, GETDATE()) < 3
