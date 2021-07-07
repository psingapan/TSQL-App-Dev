USE TSQL
SELECT SUM (o.qty) AS sum_qty,
YEAR(s.orderdate) AS orderyear
FROM Sales.Orders AS S 
JOIN Sales.OrderDetails AS O
ON S.orderid= O.orderid
WHERE s.orderdate BETWEEN '20070101'AND'20081231'
GROUP BY YEAR(s.orderdate)
