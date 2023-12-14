SELECT 
    client_name, 
    payment_date, 
    MAX(value) AS value FROM payments
GROUP BY client_name, payment_date
HAVING MONTH(payment_date) = 1 AND YEAR(payment_date) = 2023