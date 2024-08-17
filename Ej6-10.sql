--6- Listar el c�digo y descripci�n de los productos de color Black 
--(Negro) y que posean el nivel de stock en 500. (Ayuda: 
--SafetyStockLevel = 500) 
SELECT ProductID, Description FROM Production.Product AS P
INNER JOIN Production.ProductModelProductDescriptionCulture AS pmpdc ON P.ProductModelID = pmpdc.ProductModelID
INNER JOIN  Production.ProductDescription AS descr ON pmpdc.ProductDescriptionID = descr.ProductDescriptionID
Where Color LIKE 'Black' and SafetyStockLevel = 500


--7- Listar los productos que sean de color Black (Negro) � Silver 
--(Plateado). 
SELECT ProductID, Product.Name , ProductNumber FROM Production.Product
WHERE Color LIKE 'Black' OR Color LIKE 'Silver';


--8- Listar los diferentes colores que posean asignados los 
--productos. S�lo se deben listar los colores. (Ayuda: distinct) 
SELECT DISTINCT Color
FROM Production.Product
WHERE Color IS NOT NULL


--9- Contar la cantidad de categor�as que se encuentren cargadas 
--en la base. (Ayuda: count) 
--Cantidad de categorias
SELECT COUNT(Name) as Cantidad_Categorias FROM Production.ProductCategory


--10- Contar la cantidad de subcategor�as que posee asignada la 
--categor�a 2. 
SELECT COUNT(Name) as Cantidad_Subcategorias FROM Production.ProductSubcategory
WHERE ProductCategoryID = 2