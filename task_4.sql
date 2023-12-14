SELECT 
	CONCAT(DATENAME('month', payment_date), ' ', DATENAME('year', payment_date)) as `period`, 
	SUM(value) AS `revenue_by_month`,
	(SUM(revenue_by_month) OVER (ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)) AS `revenue_cumulative`
FROM payments
GROUP BY period