--1. Realizar una consulta que permita devolver la fecha y hora actual 
SELECT GETDATE()


--2. Realizar una consulta que permita devolver �nicamente el a�o y mes actual: A�o Mes 2010 6 
SELECT FORMAT(GETDATE(),'yyyy M') Fecha;


--3. Realizar una consulta que permita saber cu�ntos d�as faltan para el d�a de la primavera (21-Sep) 
DECLARE @Primavera DATE = DATEFROMPARTS(YEAR(GETDATE()), 09, 21);
SELECT DATEDIFF(DAY,GETDATE(), @Primavera) as Dias_para_primavera


--4. Realizar una consulta que permita redondear el n�mero 385,86 con �nicamente 1 decimal. 
SELECT  ROUND(385.86, 1) AS Redondeo


--5. Realizar una consulta permita saber cu�nto es el mes actual al cuadrado. Por ejemplo, si estamos en Junio, ser�a 62SELECT MONTH(GETDATE()) * MONTH(GETDATE()) AS Mes_al_cuadrado