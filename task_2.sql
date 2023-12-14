SELECT 
    ifNull(department, 'Отдел не определен'), 
    SUM(value) AS sum
FROM manager_departments
JOIN payments 
    ON replaceOne(email, '.', '') = manager_email
GROUP BY department