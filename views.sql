CREATE VIEW customer_order_summary AS
SELECT
  customer_id,
  COUNT(order_id) AS total_orders,
  SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id;

CREATE VIEW seller_sales_summary AS
SELECT
  s.seller_id,
  s.shop_name,
  COUNT(oi.item_id) AS items_sold,
  SUM(oi.price * oi.quantity) AS total_earnings
FROM sellers s
JOIN items i ON s.seller_id = i.seller_id
JOIN order_item oi ON i.item_id = oi.item_id
GROUP BY s.seller_id;

CREATE VIEW coupon_usage_report AS
SELECT
  c.code,
  c.discount,
  COUNT(o.coupons_id) AS times_used
FROM coupons c
LEFT JOIN orders o ON c.coupons_id = o.coupons_id
GROUP BY c.coupons_id;

CREATE VIEW top_selling_items AS
SELECT
  i.item_id,
  i.name,
  SUM(oi.quantity) AS total_quantity_sold
FROM items i
JOIN order_item oi ON i.item_id = oi.item_id
GROUP BY i.item_id
ORDER BY total_quantity_sold DESC;

CREATE VIEW recent_logins AS
SELECT *
FROM user_logins
ORDER BY login_time DESC
LIMIT 100;


CREATE VIEW customer_cart_summary AS
SELECT
  ci.customer_id,
  ci.item_id,
  i.name,
  ci.quantity,
  (ci.quantity * i.cost) AS estimated_cost
FROM cart_items ci
JOIN items i ON ci.item_id = i.item_id;

CREATE VIEW inactive_customers AS
SELECT *
FROM customers
WHERE customer_id NOT IN (
  SELECT DISTINCT customer_id
  FROM orders
  WHERE order_date >= CURDATE() - INTERVAL 30 DAY
);

