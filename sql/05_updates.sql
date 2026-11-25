--======================================================================
-- 05_updates.sql
-- Cedar Table Kitchen database - Updates Q9-Q12
-- Written By: Nour
--
-- Each update shows a SELECT of the affected rows before and after.
-- Run after 01_create_tables.sql and 02_insert_data.sql.
--======================================================================


-- ----------------------------------------------------------------------
-- Q9: Raise prices 5% for every item in one category
-- Author: Nour
-- Purpose: Menu price increase for the Plates category. Past orders keep
--          their old price because ORDER_ITEM stores unit_price separately.
-- ----------------------------------------------------------------------

-- Before
SELECT mi.item_id, mi.name, mi.price
FROM   menu_item mi
       JOIN menu_category mc ON mc.category_id = mi.category_id
WHERE  mc.name = 'Plates'
ORDER  BY mi.item_id;

UPDATE menu_item
SET    price = ROUND(price * 1.05, 2)
WHERE  category_id = (SELECT category_id
                      FROM   menu_category
                      WHERE  name = 'Plates');

-- After
SELECT mi.item_id, mi.name, mi.price
FROM   menu_item mi
       JOIN menu_category mc ON mc.category_id = mi.category_id
WHERE  mc.name = 'Plates'
ORDER  BY mi.item_id;

-- End Of Q9 -------------------------------------------------------------


-- ----------------------------------------------------------------------
-- Q10: Delete cancelled orders older than 30 days
-- Author: Nour
-- Purpose: Clean out old cancelled orders. Their order lines are removed
--          automatically by ON DELETE CASCADE on fk_order_item_order.
--          With the sample data, the two October cancellations (orders 1
--          and 3) are deleted; the November ones (39 and 46) are kept.
-- ----------------------------------------------------------------------

-- Before: every cancelled order, its age and how many lines it has
SELECT o.order_id,
       TO_CHAR(o.order_time, 'YYYY-MM-DD HH24:MI') AS order_time,
       TRUNC(SYSDATE - o.order_time)               AS days_old,
       (SELECT COUNT(*) FROM order_item oi
        WHERE  oi.order_id = o.order_id)           AS order_lines
FROM   orders o
WHERE  o.status = 'CANCELLED'
ORDER  BY o.order_time;

DELETE FROM orders
WHERE  status = 'CANCELLED'
AND    order_time < SYSDATE - 30;

-- After: remaining cancelled orders
SELECT o.order_id,
       TO_CHAR(o.order_time, 'YYYY-MM-DD HH24:MI') AS order_time,
       TRUNC(SYSDATE - o.order_time)               AS days_old
FROM   orders o
WHERE  o.status = 'CANCELLED'
ORDER  BY o.order_time;

-- After: the deleted orders' lines are gone too (should return no rows)
SELECT * FROM order_item WHERE order_id IN (1, 3);

-- End Of Q10 ------------------------------------------------------------


-- ----------------------------------------------------------------------
-- Q11: Subtract the ingredients a completed order used from inventory
-- Author: Nour
-- Purpose: Order 53 (2 Chicken Shawarma Plates, 1 Hummus, 2 Mint Lemonades)
--          is still PLACED. Mark it COMPLETED, then subtract
--          qty_needed (per serving) * quantity ordered for every ingredient
--          the order used.
-- ----------------------------------------------------------------------

-- Before: the order and the stock of every ingredient it uses
SELECT order_id, status FROM orders WHERE order_id = 53;

SELECT inv.inventory_id, inv.item_name, inv.unit, inv.quantity_left
FROM   inventory inv
WHERE  inv.inventory_id IN (SELECT r.inventory_id
                            FROM   recipe r
                                   JOIN order_item oi ON oi.item_id = r.item_id
                            WHERE  oi.order_id = 53)
ORDER  BY inv.inventory_id;

UPDATE orders
SET    status = 'COMPLETED'
WHERE  order_id = 53
AND    status = 'PLACED';

-- Correlated subquery: for each inventory row, add up what the order used.
-- The WHERE limits the update to ingredients this order actually uses
-- (otherwise the subquery returns NULL and quantity_left would become NULL).
UPDATE inventory inv
SET    inv.quantity_left = inv.quantity_left -
       (SELECT SUM(r.qty_needed * oi.quantity)
        FROM   recipe r
               JOIN order_item oi ON oi.item_id = r.item_id
        WHERE  oi.order_id = 53
        AND    r.inventory_id = inv.inventory_id)
WHERE  inv.inventory_id IN (SELECT r.inventory_id
                            FROM   recipe r
                                   JOIN order_item oi ON oi.item_id = r.item_id
                            WHERE  oi.order_id = 53);

-- After
SELECT order_id, status FROM orders WHERE order_id = 53;

SELECT inv.inventory_id, inv.item_name, inv.unit, inv.quantity_left
FROM   inventory inv
WHERE  inv.inventory_id IN (SELECT r.inventory_id
                            FROM   recipe r
                                   JOIN order_item oi ON oi.item_id = r.item_id
                            WHERE  oi.order_id = 53)
ORDER  BY inv.inventory_id;

-- End Of Q11 ------------------------------------------------------------


-- ----------------------------------------------------------------------
-- Q12: Trigger - set an order line's price from the menu, block inactive items
-- Author: Nour
-- Purpose: Before a row goes into ORDER_ITEM, look up the menu item.
--          If it is inactive, reject the insert with an error.
--          Otherwise copy the current menu price into unit_price, so the
--          price is always correct even if the insert leaves it out or
--          gives the wrong one.
-- Created after the sample data is loaded, so the historical prices in
-- 02_insert_data.sql are not overwritten.
-- ----------------------------------------------------------------------

CREATE OR REPLACE TRIGGER trg_order_item_price
BEFORE INSERT ON order_item
FOR EACH ROW
DECLARE
    v_price   menu_item.price%TYPE;
    v_active  menu_item.is_active%TYPE;
BEGIN
    SELECT price, is_active
    INTO   v_price, v_active
    FROM   menu_item
    WHERE  item_id = :NEW.item_id;

    IF v_active = 'N' THEN
        RAISE_APPLICATION_ERROR(-20001,
            'Menu item ' || :NEW.item_id || ' is not active and cannot be ordered.');
    END IF;

    :NEW.unit_price := v_price;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20002,
            'Menu item ' || :NEW.item_id || ' does not exist.');
END;
/

-- Before: order 54 has one line (a Falafel Wrap)
SELECT oi.order_id, oi.item_id, mi.name, oi.quantity, oi.unit_price
FROM   order_item oi
       JOIN menu_item mi ON mi.item_id = oi.item_id
WHERE  oi.order_id = 54
ORDER  BY oi.item_id;

-- 1) No unit_price given: the trigger fills it in. Chicken Shawarma Plate
--    is a Plates item, so this should show the new price from Q9 (16.79).
INSERT INTO order_item (order_id, item_id, quantity)
VALUES (54, 10, 1);

-- 2) Wrong unit_price given: the trigger replaces 1.00 with the menu
--    price of Mint Lemonade (3.99).
INSERT INTO order_item (order_id, item_id, quantity, unit_price)
VALUES (54, 24, 2, 1.00);

-- 3) Inactive item (Mansaf, item 16): this insert is EXPECTED TO FAIL with
--    ORA-20001: Menu item 16 is not active and cannot be ordered.
INSERT INTO order_item (order_id, item_id, quantity)
VALUES (54, 16, 1);

-- After: two new lines with menu prices, no Mansaf line
SELECT oi.order_id, oi.item_id, mi.name, oi.quantity, oi.unit_price
FROM   order_item oi
       JOIN menu_item mi ON mi.item_id = oi.item_id
WHERE  oi.order_id = 54
ORDER  BY oi.item_id;

-- End Of Q12 ------------------------------------------------------------

COMMIT;
