--16. Listar la cantidad de empleados hombres y mujeres, de la siguiente forma: 
--Sexo Cantidad 
--Femenino 47 
--Masculino 56 
--Nota: Debe decir, Femenino y Masculino de la misma forma que se muestra. 
SELECT 
	CASE
		WHEN Gender = 'F' THEN 'Femenino'
        WHEN Gender = 'M' THEN 'Masculino'
    END AS Sexo,
    COUNT(*) AS Cantidad
FROM 
    HumanResources.Employee
GROUP BY 
    Gender;

--17.Categorizar a los empleados según la cantidad de horas de vacaciones, según el siguiente formato: 
--Alto = más de 50 / medio= entre 20 y 50 / bajo = menos de 20
SELECT 
CASE
	WHEN VacationHours > 50 THEN 'Alto'
	WHEN VacationHours <= 50  AND VacationHours>=20 THEN 'Medio'
	WHEN VacationHours < 20 THEN 'Bajo'
END AS Categoria

FROM HumanResources.Employee
GROUP BY VacationHours