# Write your MySQL query statement below
WITH RankedSalaries AS (
    SELECT 
        emp.id,
        emp.name AS Employee,
        emp.salary AS Salary,
        emp.departmentId,
        DENSE_RANK() OVER (PARTITION BY emp.departmentId ORDER BY emp.salary DESC) AS salary_rank
    FROM 
        Employee emp
)

SELECT 
    dep.name AS Department,
    rs.Employee,
    rs.Salary
FROM 
    RankedSalaries rs
JOIN 
    Department dep ON rs.departmentId = dep.id
WHERE 
    rs.salary_rank <= 3
ORDER BY 
   dep.name,rs.Employee ;
