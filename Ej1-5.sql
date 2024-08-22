--1- Listar los códigos y descripciones de todos los productos
--(Ayuda: Production.Product)
SELECT ProductId, Name, descr.Description
FROM Production.Product AS P
INNER JOIN Production.ProductModelProductDescriptionCulture AS pmpdc ON pmpdc.ProductModelID = P.ProductModelID
INNER JOIN Production.ProductDescription AS descr ON descr.ProductDescriptionID = pmpdc.ProductDescriptionID
Select * FROM Production.ProductDescription

--2- Listar los datos de la subcategoría número 17 (Ayuda:
--Production.ProductSubCategory)
SELECT *
FROM Production.ProductSubcategory
WHERE ProductSubcategoryID = 17;


--3- Listar los productos cuya descripción comience con D (Ayuda:
--like ‘D%’)
SELECT Description, P.Name
FROM Production.ProductModelProductDescriptionCulture AS pmpdc
INNER JOIN Production.ProductDescription as pdesc ON pdesc.ProductDescriptionID = pmpdc.ProductDescriptionID
INNER JOIN Production.Product AS P ON P.ProductModelID = pmpdc.ProductModelID
WHERE Description LIKE 'D%';


--4- Listar las descripciones de los productos cuyo número finalice
--con 8 (Ayuda: ProductNumber like ‘%8’)
Select * FROM Production.ProductDescription as pdesc
INNER JOIN Production.ProductModelProductDescriptionCulture as pmpdc ON pmpdc.ProductDescriptionID = pdesc.ProductDescriptionID
INNER JOIN Production.Product as p ON p.ProductModelID = pmpdc.ProductModelID
where p.ProductNumber LIKE '%8';


--5- Listar aquellos productos que posean un color asignado. Se
--deberán excluir todos aquellos que no posean ningún valor
--(Ayuda: is not null) 
SELECT * From Production.Product
WHERE Color IS NOT NULL