-- Comandos adicionais

USE Northwind;



-- Contando os territ�rios em cada regi�o

SELECT RegionID, COUNT(DISTINCT(TerritoryID)) AS QuantidadeTerritorios
FROM Territories
GROUP BY RegionID
ORDER BY RegionID;


-- Pesquisando as ordens com o m�nimo de 50 pedidos

SELECT *
FROM [Order Details]
WHERE Quantity >= 50;


-- Calculando o tempo m�dio de envio

SELECT * FROM Orders;

	
/*SELECT AVG(OrderDate), (RequiredDate)
FROM Orders;

N�o poss�vel tirar a m�dia de datas com o operador AVG! */

SELECT ShipAddress AS Endere�o,
DATEDIFF(DAY, ShippedDate, RequiredDate) AS tempoMedEstimado
FROM Orders


SELECT ShipAddress AS Endere�o,
DATEDIFF(DAY, OrderDate, RequiredDate) AS tempoMedEstimado
FROM Orders


--Total de vendas por funcion�rio em cada pa�s.

SELECT EmployeeID, ShipCountry, COUNT(OrderID) AS TotalProducts
FROM Orders
GROUP BY EmployeeID, ShipCountry 
ORDER BY EmployeeID, ShipCountry;


-- Pre�o de cada pedido apos os descontos serem aplicados.

SELECT orde.OrderID,[Order Details].UnitPrice * ( 1 - [Order Details].Discount) AS ValorTotal
FROM Orders AS orde
 JOIN [Order Details] ON orde.OrderID = [Order Details].OrderID 
 JOIN Products ON [Order Details].ProductID = Products.ProductID;

-- View chamada ProductDetails que mostra ProductID, Company-name, 
--CategoryName, Description, QuantityPerUnit, UnitPrice, UnitsIntStock, UnitOnOrder, 
--ReorderLevel, Discontinued das tabelas Supplier, Products a Categories

CREATE VIEW ProductDetails AS (
SELECT p.ProductID, s.CompanyName, c.CategoryName,c.Description, p.QuantityPerUnit, 
       p.UnitPrice, p.UnitsInStock, p.UnitsOnOrder, p.ReorderLevel, p.Discontinued
FROM Products p
JOIN Suppliers s ON p.SupplierID = s.SupplierID
JOIN Categories c ON p.CategoryID = c.CategoryID);