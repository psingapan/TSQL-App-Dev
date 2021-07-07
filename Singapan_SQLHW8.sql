
SELECT SUM(W.qty) AS qty_sum
FROM Sales.OrderDetails AS W
JOIN Sales.Orders AS O
ON W.orderid= O.orderid
WHERE O.orderdate BETWEEN '2008-01-01' AND '2008-12-31'
