WITH first_payment AS(
	SELECT
		MIN(id) AS id, 
		client_id, 
		MIN(payment_date) AS payment_date, 
		'Новый' AS `client_state` FROM payments
	GROUP BY client_id
)
SELECT 
	payments.*, 
	ifNull(first_payment.client_state, 'Действующий') AS client_state 
FROM payments
LEFT JOIN first_payment 
	ON first_payment.id = payments.id 
		AND first_payment.payment_date = payments.payment_date
SETTINGS join_use_nulls = 1