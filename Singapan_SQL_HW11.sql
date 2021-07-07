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
c2006.[_max_freight], 

(SELECT S.orderid
FROM Sales.Orders AS S
WHERE freight = c2006.[_max_freight] AND custid = c2006.custid) AS '2006_maxfreight_orderid',

(SELECT S.orderdate
FROM Sales.Orders AS S
WHERE freight = c2006.[_max_freight] AND custid = c2006.custid) AS '2006_maxfreight_orderdate',

c2007.[_max_freight],

(SELECT Sales.Orders.orderid
FROM Sales.Orders
WHERE freight = c2007.[_max_freight] AND custid = c2007.custid) AS '2007_maxfreight_orderid',

(SELECT Sales.Orders.orderdate
FROM Sales.Orders
WHERE freight = c2007.[_max_freight] AND custid = c2007.custid) AS '2007 MF orderdate'

FROM Sales.Customers AS C
LEFT OUTER JOIN c2006 ON c2006.custid = C.custid
LEFT OUTER JOIN c2007 on C.custid = c2007.custid
ORDER BY C.contactname
