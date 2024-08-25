--1. Listar los nombres de los productos y el nombre del modelo 
--que posee asignado. Solo listar aquellos que tengan asignado algún modelo. 
SELECT P.Name AS NOMBRE_PRODUCTO, pm.Name AS MODELO 
FROM Production.Product AS P
INNER JOIN Production.ProductModelProductDescriptionCulture AS pmpdc ON P.ProductModelID = pmpdc.ProductModelID
INNER JOIN Production.ProductModel AS pm ON pmpdc.ProductModelID = pm.ProductModelID
WHERE pm.Name IS NOT NULL


--2. Mostrar “todos” los productos junto con el modelo que tenga 
--asignado. En el caso que no tenga asignado ningún modelo, mostrar su nulidad. 
SELECT P.Name AS NOMBRE_PRODUCTO, pm.Name AS MODELO FROM Production.Product AS P
FULL JOIN Production.ProductModelProductDescriptionCulture AS pmpdc ON P.ProductModelID = pmpdc.ProductModelID
FULL JOIN Production.ProductModel AS pm ON pmpdc.ProductModelID = pm.ProductModelID 


--3. Ídem Ejercicio2, pero en lugar de mostrar nulidad, mostrar la 
--palabra “Sin Modelo” para indicar que el producto no posee un modelo asignado. 
SELECT P.Name AS NOMBRE_PRODUCTO, 
	CASE
		WHEN pm.Name IS NULL THEN 'Sin Modelo'
		ELSE pm.Name
		END AS Modelo
FROM Production.Product AS P
FULL JOIN Production.ProductModelProductDescriptionCulture AS pmpdc ON P.ProductModelID = pmpdc.ProductModelID
FULL JOIN Production.ProductModel AS pm ON pmpdc.ProductModelID = pm.ProductModelID 


--4. Contar la cantidad de Productos que poseen asignado cada uno de los modelos. 
SELECT COUNT(pm.Name) AS Cantidad_Productos_Por_Modelo, pm.Name as Modelo
FROM Production.Product AS P
INNER JOIN Production.ProductModelProductDescriptionCulture AS pmpdc ON pmpdc.ProductModelID = P.ProductModelID
INNER JOIN Production.ProductModel AS pm ON pmpdc.ProductModelID = pm.ProductModelID
GROUP BY pm.Name

--5. Contar la cantidad de Productos que poseen asignado cada 
--uno de los modelos, pero mostrar solo aquellos modelos que posean asignados 2 o más productos. 
SELECT COUNT(pm.Name) AS Cantidad_Productos_Por_Modelo, pm.Name as Modelo
FROM Production.Product AS P
INNER JOIN Production.ProductModelProductDescriptionCulture AS pmpdc ON pmpdc.ProductModelID = P.ProductModelID
INNER JOIN Production.ProductModel AS pm ON pmpdc.ProductModelID = pm.ProductModelID
GROUP BY pm.Name
HAVING Count(pm.Name) >= 2
--<>