-- ============================================================
-- 04_queries_advanced.sql  (Q5-Q8)
-- Cedar Table Kitchen - CIS 421 group project
-- Author: Moe
-- Run after 01_create_tables.sql and 02_insert_data.sql
-- Column names match Nour's 01_create_tables.sql (employee_id, shift_start_time, ...)
-- ============================================================

-- Q5: Employees who worked more than 30 hours in a week
-- Author: Moe
-- Purpose: Spot full-time hours and overtime before payroll
-- SQL features: JOIN, GROUP BY, HAVING, date arithmetic
SELECT e.employee_id,
       e.first_name || ' ' || e.last_name               AS employee,
       TRUNC(s.shift_start_time, 'IW')                        AS week_start,
       ROUND(SUM((s.shift_end_time - s.shift_start_time) * 24), 2)  AS hours_worked
FROM   employee e
JOIN   shift s ON s.employee_id = e.employee_id
GROUP  BY e.employee_id, e.first_name, e.last_name, TRUNC(s.shift_start_time, 'IW')
HAVING SUM((s.shift_end_time - s.shift_start_time) * 24) > 30
ORDER  BY week_start, hours_worked DESC;

-- Q6: Customers whose total spending is above the average customer's total
-- Author: Moe
-- Purpose: Identify top-spending customers (completed orders only)
-- SQL features: multi-table JOIN, nested subquery, HAVING
SELECT c.customer_id,
       c.name,
       SUM(oi.quantity * oi.unit_price) AS total_spent
FROM   customer c
JOIN   orders o      ON o.customer_id = c.customer_id
JOIN   order_item oi ON oi.order_id   = o.order_id
WHERE  o.status = 'COMPLETED'
GROUP  BY c.customer_id, c.name
HAVING SUM(oi.quantity * oi.unit_price) >
       (SELECT AVG(t.total)
        FROM  (SELECT SUM(oi2.quantity * oi2.unit_price) AS total
               FROM   orders o2
               JOIN   order_item oi2 ON oi2.order_id = o2.order_id
               WHERE  o2.status = 'COMPLETED'
               AND    o2.customer_id IS NOT NULL
               GROUP  BY o2.customer_id) t)
ORDER  BY total_spent DESC;

-- Q7: Menu items that were never ordered
-- Author: Moe
-- Purpose: Find dishes to drop or promote
-- SQL features: NOT EXISTS (correlated subquery)
SELECT m.item_id,
       m.name,
       m.price
FROM   menu_item m
WHERE  NOT EXISTS (SELECT 1
                   FROM   order_item oi
                   WHERE  oi.item_id = m.item_id)
ORDER  BY m.name;

-- Q8: Top 5 sales days
-- Author: Moe
-- Purpose: See which days earn the most revenue (completed orders only)
-- SQL features: CREATE VIEW, aggregate, RANK() window function
CREATE OR REPLACE VIEW daily_sales AS
SELECT TRUNC(o.order_time)              AS sale_date,
       COUNT(DISTINCT o.order_id)       AS order_count,
       SUM(oi.quantity * oi.unit_price) AS revenue
FROM   orders o
JOIN   order_item oi ON oi.order_id = o.order_id
WHERE  o.status = 'COMPLETED'
GROUP  BY TRUNC(o.order_time);

SELECT sale_date, order_count, revenue, sales_rank
FROM  (SELECT sale_date,
              order_count,
              revenue,
              RANK() OVER (ORDER BY revenue DESC) AS sales_rank
       FROM   daily_sales)
WHERE  sales_rank <= 5
ORDER  BY sales_rank;
