--11- Listar la cantidad de productos que existan por cada uno de los 
--colores. 
SELECT Product.Color, COUNT(Product.Name) AS Cantidad_Productos
FROM Production.Product
GROUP BY  Color
HAVING Color IS NOT NULL


--12- Sumar todos los niveles de stocks aceptables que deben existir 
--para los productos con color Black. (Ayuda: sum) 
SELECT SUM(SafetyStockLevel) as Suma_Stock_Necesario FROM Production.Product
where Color LIKE 'Black'


--13- Calcular el promedio de stock que se debe tener de todos los 
--productos cuyo código se encuentre entre el 316 y 320. (Ayuda: avg) 
SELECT AVG(SafetyStockLevel) AS Promedio_Stock FROM Production.Product
WHERE ProductID BETWEEN 316 AND 320


--14- Listar el nombre del producto y descripción de la subcategoría 
--que posea asignada. (Ayuda: inner join) 
SELECT P.Name AS Nombre_producto, psc.Name AS Descripcion_subcategoria FROM Production.Product AS P
INNER JOIN Production.ProductSubcategory AS psc ON P.ProductSubcategoryID = psc.ProductSubcategoryID
--INNER JOIN Production.ProductModelProductDescriptionCulture AS pmpdc ON P.ProductModelID = P.ProductModelID
--INNER JOIN Production.ProductDescription AS descr ON pmpdc.ProductDescriptionID = descr.ProductDescriptionID


--15- Listar todas las categorías que poseen asignado al menos una 
--subcategoría. Se deberán excluir aquellas que no posean ninguna.
SELECT PC.Name AS Categoria
FROM Production.ProductCategory PC
INNER JOIN Production.ProductSubcategory AS psc ON PC.ProductCategoryID = psc.ProductCategoryID
GROUP BY PC.Name
Having COUNT(PC.Name) >=1