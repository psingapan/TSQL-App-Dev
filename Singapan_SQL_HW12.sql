WITH c2006 AS
(SELECT custid, MAX(freight) AS _max_freight
		 FROM Sales.Orders
		 WHERE YEAR(orderdate) = '2006'
		 GROUP BY custid),

	c2007 AS
		 (SELECT custid, MAX(freight) AS _max_freight
		 FROM Sales.Orders
		 WHERE YEAR(orderdate) = '2007'
		 GROUP BY custid)

SELECT C.contactname, 
C.custid, 
c_2006._max_freight, 

(SELECT S.orderid
FROM Sales.Orders AS S
WHERE freight = c_2006.[_max_freight] AND custid = c_2006.custid) AS '2006_maxfreight_orderid',

(SELECT S.orderdate
FROM Sales.Orders AS S
WHERE freight = c_2006.[_max_freight] AND custid = c_2006.custid) AS '2006_maxfreight_orderdate',

c_2007.[_max_freight],

(SELECT Sales.Orders.orderid
FROM Sales.Orders
WHERE freight = c_2007.[_max_freight] AND custid = c_2007.custid) AS '2007_maxfreight_orderid',

(SELECT Sales.Orders.orderdate
FROM Sales.Orders
WHERE freight = c_2007.[_max_freight] AND custid = c_2007.custid) AS '2007 MF orderdate'

FROM Sales.Customers AS C
OUTER APPLY 
	(SELECT * FROM c2006 
	WHERE c2006.custid= C.custid) AS c_2006
OUTER APPLY
	(SELECT * FROM c2007 
	WHERE c2007.custid= C.custid) AS c_2007

ORDER BY C.contactname
