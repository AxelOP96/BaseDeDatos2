--11. Se quiere obtener los emails de todos los contactos, pero en mayúscula. 
SELECT UPPER(EmailAddress) AS Correos
FROM Person.EmailAddress


--12. Realizar una consulta que permita particionar el mail de cada contacto, obteniendo lo siguiente: 
--IDContacto email nombre Dominio 
--1 juanp@ibm.com juanp ibm 
SELECT EmailAddressID AS IDContacto, 
	   EmailAddress AS email, 
	   SUBSTRING(EmailAddress, 1, PATINDEX('%@%', EmailAddress)-1) AS nombre,
	   SUBSTRING(EmailAddress, PATINDEX('%@%', EmailAddress)+1 , len(EmailAddress)-4 - PATINDEX('%@%', EmailAddress)-1)  AS Dominio 
FROM Person.EmailAddress


--13. Devolver los últimos 3 dígitos del NationalIDNumber de cada empleado 
SELECT RIGHT(NationalIDNumber,3), LoginID AS NationalIDNumber
FROM HumanResources.Employee


--14. Se desea enmascarar el NationalIDNumbre de cada empleado, de la siguiente forma ###-####-##: 
--ID Numero Enmascarado 
--36 113695504 113-6955-04 
SELECT BusinessEntityID, NationalIDNumber AS Numero, 
	CASE 
		WHEN len(NationalIDNumber) = 9 THEN 
			STUFF(STUFF(NationalIDNumber,8 ,0 ,'-'),5,0,'-')  
		ELSE
			STUFF(STUFF(REPLICATE('0', 9 - LEN(NationalIDNumber)) + NationalIDNumber, 8, 0, '-'), 5, 0, '-')
	END	AS Enmascarado 
FROM HumanResources.Employee
--15. Listar la dirección de cada empleado “supervisor” que haya nacido hace más de 30 años. Listar todos los datos en 
--mayúscula. Los datos a visualizar son: nombre y apellido del empleado, dirección y ciudad. 
SELECT DISTINCT UPPER(FirstName) AS Nombre, UPPER(LastName) AS Apellido FROM HumanResources.Employee AS E
INNER JOIN Person.BusinessEntityContact AS bec ON E.BusinessEntityID = E.BusinessEntityID
INNER JOIN Person.Person P ON E.BusinessEntityID = P.BusinessEntityID
WHERE JobTitle LIKE '%Supervisor%' AND YEAR(GETDATE())-YEAR(BirthDate) >30
