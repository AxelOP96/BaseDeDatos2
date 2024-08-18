--16- Listar el c�digo y descripci�n de los productos que posean fotos 
--asignadas. (Ayuda: Production.ProductPhoto) 
SELECT P.ProductID as Codigo, descr.Description as Descripcion FROM Production.ProductProductPhoto AS ppfoto
INNER JOIN Production.Product AS P ON ppfoto.ProductID = P.ProductID
INNER JOIN Production.ProductModelProductDescriptionCulture AS pmpdc ON P.ProductModelID = pmpdc.ProductModelID
INNER JOIN Production.ProductDescription AS descr ON pmpdc.ProductDescriptionID = descr.ProductDescriptionID
WHERE ProductPhotoID IS NOT NULL;


--17- Listar la cantidad de productos que existan por cada una de las 
--Clases (Ayuda: campo Class) 
SELECT Class AS Clase, COUNT(Name) AS Cantidad_Productos 
FROM Production.Product
GROUP BY CLASS
HAVING Class IS NOT NULL;


--18- Listar la descripci�n de los productos y su respectivo color. S�lo nos interesa caracterizar al color con 
--los valores: Black, Silver u Otro. Por lo cual si no es ni silver ni black se debe indicar 
--Otro. (Ayuda: utilizar case)
SELECT descr.Description AS Descripcion, --P.Color 
	CASE 
		WHEN Color = 'silver' THEN 'Silver'
        WHEN Color = 'black' THEN 'Black'
        ELSE 'Otro'
	END AS Color
FROM Production.Product P
INNER JOIN Production.ProductModelProductDescriptionCulture AS pmpdc ON P.ProductModelID = pmpdc.ProductModelID
INNER JOIN Production.ProductDescription AS descr ON pmpdc.ProductDescriptionID = descr.ProductDescriptionID

--19- Listar el nombre de la categor�a, el nombre de la subcategor�a 
--y la descripci�n del producto. (Ayuda: join) 
SELECT pc.Name AS Categoria, psc.Name AS Subcategoria, descr.Description AS Descripcion From Production.Product P
INNER JOIN Production.ProductModelProductDescriptionCulture AS pmpdc ON P.ProductModelID = pmpdc.ProductModelID
INNER JOIN Production.ProductDescription AS descr ON pmpdc.ProductDescriptionID = descr.ProductDescriptionID
INNER JOIN Production.ProductSubcategory AS psc ON P.ProductSubcategoryID = psc.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS pc ON psc.ProductCategoryID = pc.ProductCategoryID;


--20- Listar la cantidad de subcategor�as que posean asignado los productos. (Ayuda: distinct).
	SELECT Count(P.ProductSubcategoryID) AS Cantidad_subcategorias, psc.ProductSubcategoryID
	FROM Production.Product P
	INNER JOIN Production.ProductSubcategory AS psc ON P.ProductSubcategoryID = psc.ProductSubcategoryID
	GROUP BY psc.ProductSubcategoryID