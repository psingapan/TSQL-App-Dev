SELECT DISTINCT
C.contactname,
C.custid,

--2007 Max Freight cost
(SELECT MAX (S.freight) 
FROM Sales.Orders AS S
WHERE S.custid= C.custid
AND YEAR(S.orderdate)= '2007') AS max_freight_cost_2007,

--2007 order ID with highest freight cost
(SELECT S.orderid 
FROM Sales.Orders AS S
WHERE S.freight=(
				SELECT MAX (SO.freight) 
				FROM Sales.Orders AS SO
				WHERE S.custid= SO.custid
				AND YEAR(SO.orderdate)= '2007') AND S.custid= C.custID) AS max_freight_orderid_2007,


--2007 orderdate with highest freight cost
(SELECT S.orderdate 
FROM Sales.Orders AS S
WHERE S.freight=(
				SELECT MAX (SO.freight) 
				FROM Sales.Orders AS SO
				WHERE S.custid= SO.custid
				AND YEAR(SO.orderdate)= '2007') AND S.custid= C.custID) AS max_freight_orderdate_2007,

--2006 with highest freight cost
(SELECT MAX (S.freight) 
FROM Sales.Orders AS S
WHERE S.custid= C.custid
AND YEAR(S.orderdate)= '2006')AS max_freight_cost_2006,

--2006 order ID with highest freight cost
(SELECT S.orderid
FROM Sales.Orders AS S
WHERE S.freight=(
				SELECT MAX (SO.freight) 
				FROM Sales.Orders AS SO
				WHERE S.custid= SO.custid
				AND YEAR(SO.orderdate)= '2006') AND S.custid= C.custID) AS max_freight_orderid_2006,

--2006 orderdate with highest freight cost
(SELECT S.orderdate 
FROM Sales.Orders AS S
WHERE S.freight=(
				SELECT MAX (SO.freight) 
				FROM Sales.Orders AS SO
				WHERE S.custid= SO.custid
				AND YEAR(SO.orderdate)= '2006') AND S.custid= C.custID) AS max_freight_orderdate_2006

FROM Sales.Customers AS C
GROUP BY C.custid, C.contactname
ORDER BY C.custid ASC
				
				

