--======================================================================
-- 00_drop_all.sql
-- Cedar Table Kitchen database - drop everything so the scripts can be rerun
-- Written By: Nour
--
-- Drops the daily_sales view (Q8) and every table in reverse dependency
-- order (children before parents). Each DROP is wrapped so a missing object
-- (first run on a clean schema) is skipped instead of showing an error.
-- The Q12 trigger is dropped automatically with ORDER_ITEM.
--======================================================================

BEGIN
    EXECUTE IMMEDIATE 'DROP VIEW daily_sales';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN RAISE; END IF;   -- -942 = view does not exist
END;
/

DECLARE
    TYPE name_list IS TABLE OF VARCHAR2(30);
    v_tables name_list := name_list(
        'RECIPE', 'ORDER_ITEM', 'ORDERS', 'INVENTORY', 'SUPPLIER',
        'MENU_ITEM', 'MENU_CATEGORY', 'SHIFT', 'CUSTOMER',
        'DELIVERY_PLATFORM', 'EMPLOYEE'
    );
BEGIN
    FOR i IN 1 .. v_tables.COUNT LOOP
        BEGIN
            EXECUTE IMMEDIATE 'DROP TABLE ' || v_tables(i) || ' CASCADE CONSTRAINTS PURGE';
        EXCEPTION
            WHEN OTHERS THEN
                IF SQLCODE != -942 THEN RAISE; END IF;   -- -942 = table does not exist
        END;
    END LOOP;
END;
/
