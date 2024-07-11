CREATE TABLE IF NOT EXISTS order1(
	order_id INT PRIMARY KEY,
	order_date DATE,
	order_amount INT
);
DELETE FROM order1;
INSERT INTO order1 (order_id, order_date, order_amount) VALUES (1, '2024-05-07', 4);
INSERT INTO order1 (order_id, order_date, order_amount) VALUES (2, '2023-06-18', 3);
INSERT INTO order1 (order_id, order_date, order_amount) VALUES (3, '2021-10-14', 1);

SELECT 
	COUNT(order_id) AS total_number,
	ROUND(AVG(order_amount), 2) AS avg_order_amount
FROM order1;
