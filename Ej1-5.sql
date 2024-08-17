--1- Listar los c�digos y descripciones de todos los productos
--(Ayuda: Production.Product)
SELECT ProductId, Name
FROM Production.Product;


--2- Listar los datos de la subcategor�a n�mero 17 (Ayuda:
--Production.ProductSubCategory)
SELECT *
FROM Production.ProductSubcategory
WHERE ProductSubcategoryID = 17;


--3- Listar los productos cuya descripci�n comience con D (Ayuda:
--like �D%�)
SELECT *
FROM Production.ProductModelProductDescriptionCulture
INNER JOIN Production.ProductDescription as pdesc ON pdesc.ProductDescriptionID = Production.ProductModelProductDescriptionCulture.ProductDescriptionID
WHERE Description LIKE 'D%';


--4- Listar las descripciones de los productos cuyo n�mero finalice
--con 8 (Ayuda: ProductNumber like �%8�)
Select * FROM Production.ProductDescription as pdesc
INNER JOIN Production.ProductModelProductDescriptionCulture as pmpdc ON pmpdc.ProductDescriptionID = pdesc.ProductDescriptionID
INNER JOIN Production.Product as p ON p.ProductModelID = pmpdc.ProductModelID
where p.ProductNumber LIKE '%8';


--5- Listar aquellos productos que posean un color asignado. Se
--deber�n excluir todos aquellos que no posean ning�n valor
--(Ayuda: is not null) 
SELECT * From Production.Product
WHERE Color IS NOT NULL