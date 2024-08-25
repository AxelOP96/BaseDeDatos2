--6. Contar la cantidad de Productos que poseen asignado un 
--modelo valido, es decir, que se encuentre cargado en la tabla 
--de modelos. Realizar este ejercicio de 3 formas posibles: 
--“exists” / “in” / “inner join”. 
--EXISTS =1764
SELECT COUNT(pm.Name) AS Cantidad_Productos_validos FROM Production.Product AS P
INNER JOIN Production.ProductModelProductDescriptionCulture AS pmpdc ON P.ProductModelID = pmpdc.ProductModelID
INNER JOIN Production.ProductModel AS pm ON pmpdc.ProductModelID = pm.ProductModelID
WHERE EXISTS (SELECT pm.Name FROM Production.ProductModel WHERE pm.Name IS NOT NULL);

--IN = 294
--INNER JOIN Production.ProductModelProductDescriptionCulture AS pmpdc ON P.ProductModelID = pmpdc.ProductModelID
SELECT COUNT(pm.Name) AS Cantidad_Productos_validos FROM Production.Product AS P
INNER JOIN Production.ProductModel AS pm ON P.ProductModelID = pm.ProductModelID
WHERE P.ProductModelID IN(SELECT pmpdc.ProductModelID FROM Production.ProductModelProductDescriptionCulture AS pmpdc )

--INNER JOIN =1764
SELECT COUNT(P.Name) FROM Production.Product AS P
INNER JOIN Production.ProductModelProductDescriptionCulture AS pmpdc ON P.ProductModelID = pmpdc.ProductModelID
INNER JOIN Production.ProductModel AS pm ON pmpdc.ProductModelID=pm.ProductModelID
WHERE pm.Name IS NOT NULL


--7. Contar cuantos productos poseen asignado cada uno de los 
--modelos, es decir, se quiere visualizar el nombre del modelo y 
--la cantidad de productos asignados. Si algún modelo no posee 
--asignado ningún producto, se quiere visualizar 0 (cero). 
SELECT COUNT(P.Name) AS Cantidad_Productos_Asignados, --pm.Name AS Modelo  
	CASE 
		WHEN pm.Name IS NULL THEN '0'
		ELSE pm.Name
	END AS Modelo
FROM Production.Product AS P
INNER JOIN Production.ProductModelProductDescriptionCulture AS pmpdc ON P.ProductModelID = pmpdc.ProductModelID
INNER JOIN Production.ProductModel AS pm ON pmpdc.ProductModelID = pm.ProductModelID
GROUP BY pm.Name


--8. Se quiere visualizar, el nombre del producto, el nombre 
--modelo que posee asignado, la ilustración que posee asignada 
--y la fecha de última modificación de dicha ilustración y el 
--diagrama que tiene asignado la ilustración. Solo nos interesan 
--los productos que cuesten más de $150 y que posean algún color asignado. 
--SELECT * FROM Production.Illustration
--SELECT * FROM Production.ProductModelIllustration
SELECT P.Name AS Nombre_Producto, pm.Name AS Modelo,I.IllustrationID AS Ilustracion, I.ModifiedDate AS Fecha_mod, I.Diagram AS Diagrama 
FROM Production.Product AS P
INNER JOIN Production.ProductModelProductDescriptionCulture AS pmpdc ON P.ProductModelID = pmpdc.ProductModelID
INNER JOIN Production.ProductModel AS pm ON pmpdc.ProductModelID = pm.ProductModelID
INNER JOIN Production.ProductModelIllustration AS pmi ON pmpdc.ProductModelID = pmi.ProductModelID
INNER JOIN Production.Illustration AS I ON pmi.IllustrationID = I.IllustrationID
WHERE P.Color IS NOT NULL AND P.StandardCost > 150

--9. Mostrar aquellas culturas que no están asignadas a ningún producto/modelo. 
--(Production.ProductModelProductDescriptionCulture) 
--Select * from Production.Culture
--Select * from Production.ProductModelProductDescriptionCulture

SELECT DISTINCT C.CultureID, pmpdc.ProductModelID FROM Production.Product as P
FULL JOIN Production.ProductModelProductDescriptionCulture AS pmpdc ON P.ProductModelID = pmpdc.ProductModelID
FULL JOIN Production.Culture AS C ON pmpdc.CultureID = C.CultureID
WHERE pmpdc.ProductModelID IS  NULL


--10. Agregar a la base de datos el tipo de contacto “Ejecutivo de Cuentas” (Person.ContactType) 
INSERT INTO Person.ContactType (Name, ModifiedDate) VALUES ('Ejecutivo de Cuentas', '2008-04-30 00:00:00.000')