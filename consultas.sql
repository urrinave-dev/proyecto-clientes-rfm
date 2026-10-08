-- ============================================
-- PROYECTO: Análisis de Ventas y Clientes RFM
-- Autor: Darlyng Urribarri
-- Fecha: 2026
-- Herramienta: SQLite (sqliteonline.com)
-- ============================================

-- ============================================
-- PARTE 1: ANÁLISIS DE VENTAS
-- ============================================

-- Consulta 1: Ingresos totales por región
SELECT Region, SUM(Revenue) AS Total_Ingresos
FROM ventas
GROUP BY Region
ORDER BY Total_Ingresos DESC;

-- Consulta 2: Top 10 clientes que más gastaron
SELECT CustomerID, SUM(Revenue) AS Total_Gastado
FROM ventas
GROUP BY CustomerID
ORDER BY Total_Gastado DESC
LIMIT 10;

-- Consulta 3: Ventas por producto
SELECT Product, SUM(Revenue) AS Total_Ingresos
FROM ventas
GROUP BY Product
ORDER BY Total_Ingresos DESC;

-- Consulta 4: Ventas por categoría
SELECT Category, SUM(Revenue) AS Total_Ingresos
FROM ventas
GROUP BY Category
ORDER BY Total_Ingresos DESC;

-- Consulta 5: Ventas por vendedor (SalesRep)
SELECT SalesRep, SUM(Revenue) AS Total_Ingresos
FROM ventas
GROUP BY SalesRep
ORDER BY Total_Ingresos DESC;

-- ============================================
-- PARTE 2: ANÁLISIS RFM DE CLIENTES
-- ============================================

-- Consulta 6: Fecha de la última venta (para calcular Recencia)
SELECT MAX(Date) AS Ultima_Venta
FROM ventas;

-- Consulta 7: Recencia por cliente (días desde su última compra)
-- Nota: SQLite calcula fechas con julianday()
SELECT 
    CustomerID,
    MAX(Date) AS Ultima_Compra,
    CAST(julianday('now') - julianday(MAX(Date)) AS INTEGER) AS Recencia_Dias
FROM ventas
GROUP BY CustomerID
ORDER BY Recencia_Dias ASC;

-- Consulta 8: Frecuencia por cliente (número de compras)
SELECT 
    CustomerID,
    COUNT(*) AS Frecuencia
FROM ventas
GROUP BY CustomerID
ORDER BY Frecuencia DESC;

-- Consulta 9: Monetario por cliente (total gastado)
SELECT 
    CustomerID,
    SUM(Revenue) AS Monetario
FROM ventas
GROUP BY CustomerID
ORDER BY Monetario DESC;

-- Consulta 10: RFM completo (Recencia + Frecuencia + Monetario)
SELECT 
    CustomerID,
    CAST(julianday('now') - julianday(MAX(Date)) AS INTEGER) AS Recencia,
    COUNT(*) AS Frecuencia,
    SUM(Revenue) AS Monetario
FROM ventas
GROUP BY CustomerID
ORDER BY Monetario DESC
LIMIT 20;

RFM

-- ============================================
-- LIMPIEZA DE DATOS
-- ============================================
DELETE FROM ventas WHERE Date = 'Date' OR Date = 'date' OR Date IS NULL;

-- ============================================
-- ANÁLISIS RFM COMPLETO
-- ============================================
SELECT 
    CustomerID,
    CAST(julianday((SELECT MAX(Date) FROM ventas)) - julianday(MAX(Date)) AS INTEGER) AS Recencia,
    COUNT(*) AS Frecuencia,
    ROUND(SUM(Revenue), 2) AS Monetario
FROM ventas
GROUP BY CustomerID
ORDER BY Monetario DESC;



