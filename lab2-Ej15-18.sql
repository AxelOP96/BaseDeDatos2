--15. Agregar la moneda �Peso Argentino� con el c�digo �PAR� (Sales.Currency) 
--SELECT * FROM Sales.Currency
INSERT INTO Sales.Currency (CurrencyCode, Name, ModifiedDate) VALUES ('PAR', 'Peso Argentino', '2008-04-30 00:00:00.000')


--16. �Qu� sucede si tratamos de eliminar el c�digo ARS correspondiente al Peso Argentino? �Por qu�? 
DELETE FROM Sales.Currency
WHERE CurrencyCode LIKE 'ARS'
--Presenta un error de referencia, debe eliminar previamente la referencia a la foreign key asociada


--17. Realice los borrados necesarios para que nos permita eliminar el registro de la moneda con c�digo ARS. 
--SELECT * FROM Sales.CountryRegionCurrency
DELETE FROM Sales.CountryRegionCurrency
WHERE CurrencyCode LIKE 'ARS'
--SELECT * FROM Sales.CurrencyRate
DELETE FROM Sales.CurrencyRate
WHERE ToCurrencyCode LIKE 'ARS'
DELETE FROM Sales.Currency
WHERE CurrencyCode LIKE 'ARS'


--18. Eliminar aquellas culturas que no est�n asignadas a ning�n producto 
--(Production.ProductModelProductDescriptionCulture)
--SELECT * FROM Production.Culture AS C
--LEFT JOIN Production.ProductModelProductDescriptionCulture AS pmpdc ON C.CultureID = pmpdc.CultureID
--WHERE pmpdc.ProductModelID IS NULL
DELETE C FROM Production.Culture AS C
LEFT JOIN Production.ProductModelProductDescriptionCulture AS pmpdc ON C.CultureID = pmpdc.CultureID
WHERE pmpdc.ProductModelID IS NULL
