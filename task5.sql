CREATE TABLE IF NOT EXISTS products(
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS orders(
    order_id INT PRIMARY KEY,
    order_date DATE
);

CREATE TABLE IF NOT EXISTS order_items(
    item_id INT PRIMARY KEY DEFAULT 1,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


DELETE FROM order_items;
DELETE FROM orders;
DELETE FROM products;


INSERT INTO products (product_id, product_name, category) VALUES
(200, 'Widget A', 'Gadgets'),
(201, 'Widget B', 'Gadgets'),
(202, 'Widget C', 'Accessories');


INSERT INTO orders (order_id, order_date) VALUES
(1, '2024-06-01'),
(2, '2024-06-02'),
(3, '2024-06-03');


INSERT INTO order_items (item_id, order_id, product_id, quantity, price) VALUES
(1, 1, 200, 2, 50.00),
(2, 1, 201, 1, 100.00),
(3, 2, 200, 1, 50.00),
(4, 2, 202, 3, 25.00),
(5, 3, 201, 2, 100.00);

SELECT
    orders.order_id,
    SUM(order_items.quantity * order_items.price) AS total_price,
    SUM(CASE WHEN products.category = 'Gadgets' THEN order_items.quantity ELSE 0 END) AS gadgets_quantity,
    SUM(CASE WHEN products.category = 'Accessories' THEN order_items.quantity ELSE 0 END) AS accessories_quantity
FROM orders
JOIN order_items ON orders.order_id = order_items.order_id
JOIN products ON products.product_id = order_items.product_id
WHERE orders.order_date BETWEEN '2024-06-01' AND '2024-06-30'
GROUP BY orders.order_id;
