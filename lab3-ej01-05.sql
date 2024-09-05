--1. Realizar una consulta que permita devolver la fecha y hora actual 
SELECT GETDATE()


--2. Realizar una consulta que permita devolver únicamente el año y mes actual: Año Mes 2010 6 
SELECT FORMAT(GETDATE(),'yyyy M') Fecha;


--3. Realizar una consulta que permita saber cuántos días faltan para el día de la primavera (21-Sep) 
DECLARE @Primavera DATE = DATEFROMPARTS(YEAR(GETDATE()), 09, 21);
SELECT DATEDIFF(DAY,GETDATE(), @Primavera) as Dias_para_primavera


--4. Realizar una consulta que permita redondear el número 385,86 con únicamente 1 decimal. 
SELECT  ROUND(385.86, 1) AS Redondeo


--5. Realizar una consulta permita saber cuánto es el mes actual al cuadrado. Por ejemplo, si estamos en Junio, sería 62SELECT MONTH(GETDATE()) * MONTH(GETDATE()) AS Mes_al_cuadrado