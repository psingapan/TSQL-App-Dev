SELECT
C.contactname,
C.fax,
S.orderdate
FROM Sales.Customers AS C WITH (NOLOCK)
JOIN Sales.Orders AS S WITH (NOLOCK)
ON C.custid= S.custid
WHERE C.city = 'London'
ORDER BY S.orderdate ASC