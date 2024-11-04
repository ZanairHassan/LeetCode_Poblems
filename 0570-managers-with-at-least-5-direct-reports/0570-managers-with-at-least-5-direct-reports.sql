SELECT 
    emp.name
FROM 
    Employee emp
JOIN 
    (SELECT managerId
     FROM Employee
     WHERE managerId IS NOT NULL
     GROUP BY managerId
     HAVING COUNT(id) >= 5) AS m
ON 
    emp.id = m.managerId;
