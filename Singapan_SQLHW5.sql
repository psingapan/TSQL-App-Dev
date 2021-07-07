SELECT
C.contactname,
C.fax,
C.city,
C.country,
S.orderdate
FROM Sales.Customers AS C WITH (NOLOCK)
JOIN Sales.Orders AS S WITH (NOLOCK)
ON C.custid= S.custid
WHERE C.city IN ('Reims','Paris')
AND S.orderdate BETWEEN '2007-11-01' AND '2007-12-01'
ORDER BY S.orderdate ASC