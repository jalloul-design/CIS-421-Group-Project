--======================================================================
-- Business Queries
-- Cedar Table Kitchen database - Business Queries 1-4
-- Written By: Mira Jalloul
-- Date: 2026-11-12
 
-- Written for the Draft Schema of the Cedar Table Kitchen database (EMPLOYEE, SHIFT, MENU_ITEM, ORDERS, ORDER_ITEM, DELIVERY_PLATFORM, INVENTORY, SUPPLIER).
-- Remember to adjust when Moe does Final Schema.
--======================================================================
 
-- ----------------------------------------------------------------------------------------------------------
-- Query 1: Top Five Best Selling Menu Items
-- Purpose: Identify the top five best-selling menu items based on the total quantity sold,
--          and how much revenue each one brought in. Only completed orders count.
-- ----------------------------------------------------------------------------------------------------------
 
SELECT mi.item_id,
       mi.name,
       SUM(oi.quantity)                 AS total_quantity_sold,
       SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM   order_item oi
       JOIN menu_item mi ON mi.item_id  = oi.item_id
       JOIN orders os    ON os.order_id = oi.order_id
WHERE  os.status = 'COMPLETED'
GROUP  BY mi.item_id, mi.name
ORDER  BY total_quantity_sold DESC, total_revenue DESC
FETCH  FIRST 5 ROWS ONLY;
 
-- End Of Query 1-----------------------------------------------------------
 
 
-- ---------------------------------------------------------------------------------------------------------------------------
-- Query 2: Total Hours Worked by Each Employee and Cost per Employee per week
-- Purpose: Allows manager to check the payroll, shows how many shifts and how many hours each employee has worked in a week,
--          and how much each employee costs the business per week. The last row is the TOTAL for the whole restaurant.
-- Change the two dates to the week you want (start date included, end date not included).
-- ---------------------------------------------------------------------------------------------------------------------------
 
SELECT CASE WHEN GROUPING(emp.employee_id) = 1 THEN 'TOTAL'
            ELSE emp.first_name || ' ' || emp.last_name END AS employee_name,
       COUNT(s.shift_id) AS shifts,
       ROUND(SUM((s.shift_end_time - s.shift_start_time) * 24), 2) AS total_hours_worked,
       ROUND(SUM((s.shift_end_time - s.shift_start_time) * 24 * emp.hourly_rate), 2) AS total_labor_cost
FROM   employee emp
       JOIN shift s ON s.employee_id = emp.employee_id
WHERE  s.shift_start_time >= DATE '2026-11-02'
AND    s.shift_start_time <  DATE '2026-11-09'
GROUP  BY ROLLUP((emp.employee_id, emp.first_name, emp.last_name))
ORDER  BY GROUPING(emp.employee_id), total_hours_worked DESC;
 
-- End Of Query 2---------------------------------------------------------------------------------------------------------------
 
 
 
-- ---------------------------------------------------------------------------------------------------------------------------
-- Query 3: Revenue by order type and delivery platform after commission deductions
-- Purpose: Compares how much each sale channel brings to the business. Delivery platforms are known to take a commission fee
--          so the net revenue after commission deductions will be lower than the gross revenue.
--          Dine-in and takeout orders will show up as "In House Order" sales.
-- ---------------------------------------------------------------------------------------------------------------------------
WITH order_totals AS (
    SELECT os.order_id,
           os.order_type,
           os.delivery_platform_id,
           SUM(oi.quantity * oi.unit_price) AS order_total
    FROM   orders os
           JOIN order_item oi ON oi.order_id = os.order_id
    WHERE  os.status = 'COMPLETED'
    GROUP  BY os.order_id, os.order_type, os.delivery_platform_id
)
SELECT ot.order_type,
       COALESCE(dp.name, 'In House Order') AS channel,
       COUNT(*) AS number_of_orders,
       ROUND(SUM(ot.order_total), 2) AS gross_revenue,
       ROUND(SUM(ot.order_total * COALESCE(dp.commission_rate, 0)), 2) AS commission_deductions,
       ROUND(SUM(ot.order_total * (1 - COALESCE(dp.commission_rate, 0))), 2) AS net_revenue,
       ROUND(AVG(ot.order_total), 2) AS average_order_total
FROM   order_totals ot
       LEFT JOIN delivery_platform dp ON dp.delivery_platform_id = ot.delivery_platform_id
GROUP  BY ot.order_type, COALESCE(dp.name, 'In House Order')
ORDER  BY net_revenue DESC;
 
-- End Of Query 3-----------------------------------------------------------------------------------------------------------------
 
 
-- -------------------------------------------------------------------------------------------------------------------------------
-- Query 4: Inventory items that need restocking
-- Purpose: Identifies items in the inventory that are at or below their reorder threshold and need to be restocked,
--          and which supplier to call.
-- -------------------------------------------------------------------------------------------------------------------------------
SELECT inv.inventory_id,
       inv.item_name AS item,
       inv.quantity_left,
       inv.reorder_threshold,
       inv.unit,
       (inv.reorder_threshold - inv.quantity_left) AS quantity_to_reorder,
       supp.name AS supplier,
       supp.phone_number AS supplier_phone
FROM   inventory inv
       JOIN supplier supp ON supp.supplier_id = inv.supplier_id
WHERE  inv.quantity_left <= inv.reorder_threshold
ORDER  BY quantity_to_reorder DESC, inv.item_name;
 
-- End Of Query 4-----------------------------------------------------------------------------------------------------------------
 