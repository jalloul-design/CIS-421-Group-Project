--======================================================================
-- 02_insert_data.sql
-- Cedar Table Kitchen database - sample data
-- Written By: Nour
--
-- IDs are given explicitly (1, 2, 3, ...) so rows are easy to reference.
-- The identity columns start at 1001, so new rows never collide with these.
-- Run after 01_create_tables.sql.
--======================================================================

-- --------------------------------------------------------------------
-- MENU_CATEGORY (6 rows): Menu categories
-- --------------------------------------------------------------------
INSERT INTO menu_category (category_id, name) VALUES (1, 'Appetizers');
INSERT INTO menu_category (category_id, name) VALUES (2, 'Wraps');
INSERT INTO menu_category (category_id, name) VALUES (3, 'Plates');
INSERT INTO menu_category (category_id, name) VALUES (4, 'Sides');
INSERT INTO menu_category (category_id, name) VALUES (5, 'Desserts');
INSERT INTO menu_category (category_id, name) VALUES (6, 'Drinks');

-- --------------------------------------------------------------------
-- MENU_ITEM (26 rows): Menu items. Item 16 (Mansaf) is inactive; item 26 (Jallab) is active but never ordered (Q7).
-- --------------------------------------------------------------------
INSERT INTO menu_item (item_id, category_id, name, price, is_active) VALUES (1, 1, 'Hummus', 6.99, 'Y');
INSERT INTO menu_item (item_id, category_id, name, price, is_active) VALUES (2, 1, 'Baba Ghanoush', 7.49, 'Y');
INSERT INTO menu_item (item_id, category_id, name, price, is_active) VALUES (3, 1, 'Falafel (6 pc)', 6.49, 'Y');
INSERT INTO menu_item (item_id, category_id, name, price, is_active) VALUES (4, 1, 'Stuffed Grape Leaves', 7.99, 'Y');
INSERT INTO menu_item (item_id, category_id, name, price, is_active) VALUES (5, 1, 'Lentil Soup', 4.99, 'Y');
INSERT INTO menu_item (item_id, category_id, name, price, is_active) VALUES (6, 2, 'Chicken Shawarma Wrap', 9.49, 'Y');
INSERT INTO menu_item (item_id, category_id, name, price, is_active) VALUES (7, 2, 'Beef Shawarma Wrap', 9.99, 'Y');
INSERT INTO menu_item (item_id, category_id, name, price, is_active) VALUES (8, 2, 'Falafel Wrap', 8.49, 'Y');
INSERT INTO menu_item (item_id, category_id, name, price, is_active) VALUES (9, 2, 'Kafta Wrap', 9.99, 'Y');
INSERT INTO menu_item (item_id, category_id, name, price, is_active) VALUES (10, 3, 'Chicken Shawarma Plate', 15.99, 'Y');
INSERT INTO menu_item (item_id, category_id, name, price, is_active) VALUES (11, 3, 'Beef Shawarma Plate', 16.99, 'Y');
INSERT INTO menu_item (item_id, category_id, name, price, is_active) VALUES (12, 3, 'Shish Tawook Plate', 16.49, 'Y');
INSERT INTO menu_item (item_id, category_id, name, price, is_active) VALUES (13, 3, 'Kafta Kabob Plate', 16.99, 'Y');
INSERT INTO menu_item (item_id, category_id, name, price, is_active) VALUES (14, 3, 'Lamb Chops Plate', 26.99, 'Y');
INSERT INTO menu_item (item_id, category_id, name, price, is_active) VALUES (15, 3, 'Mixed Grill Platter', 29.99, 'Y');
INSERT INTO menu_item (item_id, category_id, name, price, is_active) VALUES (16, 3, 'Mansaf (Seasonal)', 24.99, 'N');
INSERT INTO menu_item (item_id, category_id, name, price, is_active) VALUES (17, 4, 'Fattoush Salad', 8.49, 'Y');
INSERT INTO menu_item (item_id, category_id, name, price, is_active) VALUES (18, 4, 'Tabbouleh', 7.99, 'Y');
INSERT INTO menu_item (item_id, category_id, name, price, is_active) VALUES (19, 4, 'Seasoned Rice', 3.99, 'Y');
INSERT INTO menu_item (item_id, category_id, name, price, is_active) VALUES (20, 4, 'Garlic Potatoes', 4.99, 'Y');
INSERT INTO menu_item (item_id, category_id, name, price, is_active) VALUES (21, 5, 'Baklava', 4.99, 'Y');
INSERT INTO menu_item (item_id, category_id, name, price, is_active) VALUES (22, 5, 'Knafeh', 7.99, 'Y');
INSERT INTO menu_item (item_id, category_id, name, price, is_active) VALUES (23, 5, 'Rice Pudding', 4.49, 'Y');
INSERT INTO menu_item (item_id, category_id, name, price, is_active) VALUES (24, 6, 'Mint Lemonade', 3.99, 'Y');
INSERT INTO menu_item (item_id, category_id, name, price, is_active) VALUES (25, 6, 'Turkish Coffee', 3.49, 'Y');
INSERT INTO menu_item (item_id, category_id, name, price, is_active) VALUES (26, 6, 'Jallab', 4.49, 'Y');

-- --------------------------------------------------------------------
-- EMPLOYEE (15 rows): Employees. Managers first so manager_id always points to an existing row.
-- --------------------------------------------------------------------
INSERT INTO employee (employee_id, first_name, last_name, role, hourly_rate, hire_date, manager_id) VALUES (1, 'Rami', 'Haddad', 'General Manager', 30, TO_DATE('2015-03-02', 'YYYY-MM-DD'), NULL);
INSERT INTO employee (employee_id, first_name, last_name, role, hourly_rate, hire_date, manager_id) VALUES (2, 'Lina', 'Haddad', 'Kitchen Manager', 26.5, TO_DATE('2016-06-13', 'YYYY-MM-DD'), 1);
INSERT INTO employee (employee_id, first_name, last_name, role, hourly_rate, hire_date, manager_id) VALUES (3, 'Omar', 'Khalil', 'Front of House Manager', 24, TO_DATE('2018-04-02', 'YYYY-MM-DD'), 1);
INSERT INTO employee (employee_id, first_name, last_name, role, hourly_rate, hire_date, manager_id) VALUES (4, 'Yousef', 'Nasser', 'Line Cook', 19, TO_DATE('2019-08-19', 'YYYY-MM-DD'), 2);
INSERT INTO employee (employee_id, first_name, last_name, role, hourly_rate, hire_date, manager_id) VALUES (5, 'Sara', 'Mansour', 'Line Cook', 18.5, TO_DATE('2021-01-11', 'YYYY-MM-DD'), 2);
INSERT INTO employee (employee_id, first_name, last_name, role, hourly_rate, hire_date, manager_id) VALUES (6, 'Hadi', 'Awad', 'Prep Cook', 16, TO_DATE('2023-05-08', 'YYYY-MM-DD'), 2);
INSERT INTO employee (employee_id, first_name, last_name, role, hourly_rate, hire_date, manager_id) VALUES (7, 'Maya', 'Saad', 'Server', 11, TO_DATE('2020-09-14', 'YYYY-MM-DD'), 3);
INSERT INTO employee (employee_id, first_name, last_name, role, hourly_rate, hire_date, manager_id) VALUES (8, 'Jad', 'Fares', 'Server', 11, TO_DATE('2022-02-01', 'YYYY-MM-DD'), 3);
INSERT INTO employee (employee_id, first_name, last_name, role, hourly_rate, hire_date, manager_id) VALUES (9, 'Nadia', 'Barakat', 'Server', 11, TO_DATE('2023-07-17', 'YYYY-MM-DD'), 3);
INSERT INTO employee (employee_id, first_name, last_name, role, hourly_rate, hire_date, manager_id) VALUES (10, 'Karim', 'Hamdan', 'Server', 11, TO_DATE('2024-03-04', 'YYYY-MM-DD'), 3);
INSERT INTO employee (employee_id, first_name, last_name, role, hourly_rate, hire_date, manager_id) VALUES (11, 'Leila', 'Toma', 'Cashier', 14.5, TO_DATE('2022-10-10', 'YYYY-MM-DD'), 3);
INSERT INTO employee (employee_id, first_name, last_name, role, hourly_rate, hire_date, manager_id) VALUES (12, 'Ali', 'Jaber', 'Cashier', 14.5, TO_DATE('2024-06-03', 'YYYY-MM-DD'), 3);
INSERT INTO employee (employee_id, first_name, last_name, role, hourly_rate, hire_date, manager_id) VALUES (13, 'Tony', 'Daher', 'Dishwasher', 13.75, TO_DATE('2023-11-20', 'YYYY-MM-DD'), 2);
INSERT INTO employee (employee_id, first_name, last_name, role, hourly_rate, hire_date, manager_id) VALUES (14, 'Rana', 'Zayed', 'Host', 13, TO_DATE('2025-01-06', 'YYYY-MM-DD'), 3);
INSERT INTO employee (employee_id, first_name, last_name, role, hourly_rate, hire_date, manager_id) VALUES (15, 'Sami', 'Ayoub', 'Line Cook', 18, TO_DATE('2025-08-18', 'YYYY-MM-DD'), 2);

-- --------------------------------------------------------------------
-- SHIFT (128 rows): Shifts for two weeks: Mon Nov 2 - Sun Nov 15, 2026.
-- Over 30 h in a week (Q5): Rami, Lina, Omar, Yousef both weeks; Maya only in week 2.
-- Sara works exactly 30 h, so she should NOT show up in Q5.
-- --------------------------------------------------------------------
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (1, 6, TO_DATE('2026-11-02 08:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-02 13:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (2, 1, TO_DATE('2026-11-02 10:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-02 17:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (3, 4, TO_DATE('2026-11-02 10:30', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-02 17:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (4, 8, TO_DATE('2026-11-02 11:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-02 16:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (5, 11, TO_DATE('2026-11-02 11:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-02 16:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (6, 15, TO_DATE('2026-11-02 15:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-02 22:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (7, 9, TO_DATE('2026-11-02 16:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-02 22:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (8, 12, TO_DATE('2026-11-02 16:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-02 22:00', 'YYYY-MM-DD HH24:MI'));

INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (9, 6, TO_DATE('2026-11-03 08:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-03 13:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (10, 1, TO_DATE('2026-11-03 10:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-03 17:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (11, 2, TO_DATE('2026-11-03 10:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-03 17:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (12, 4, TO_DATE('2026-11-03 10:30', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-03 17:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (13, 8, TO_DATE('2026-11-03 11:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-03 16:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (14, 11, TO_DATE('2026-11-03 11:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-03 16:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (15, 15, TO_DATE('2026-11-03 15:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-03 22:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (16, 10, TO_DATE('2026-11-03 16:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-03 22:00', 'YYYY-MM-DD HH24:MI'));

INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (17, 6, TO_DATE('2026-11-04 08:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-04 13:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (18, 1, TO_DATE('2026-11-04 10:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-04 17:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (19, 2, TO_DATE('2026-11-04 10:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-04 17:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (20, 8, TO_DATE('2026-11-04 11:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-04 16:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (21, 11, TO_DATE('2026-11-04 11:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-04 16:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (22, 3, TO_DATE('2026-11-04 15:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-04 22:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (23, 15, TO_DATE('2026-11-04 15:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-04 22:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (24, 10, TO_DATE('2026-11-04 16:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-04 22:00', 'YYYY-MM-DD HH24:MI'));

INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (25, 6, TO_DATE('2026-11-05 08:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-05 13:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (26, 1, TO_DATE('2026-11-05 10:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-05 17:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (27, 2, TO_DATE('2026-11-05 10:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-05 17:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (28, 4, TO_DATE('2026-11-05 10:30', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-05 17:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (29, 11, TO_DATE('2026-11-05 11:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-05 16:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (30, 3, TO_DATE('2026-11-05 15:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-05 22:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (31, 5, TO_DATE('2026-11-05 15:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-05 22:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (32, 7, TO_DATE('2026-11-05 16:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-05 22:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (33, 13, TO_DATE('2026-11-05 16:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-05 22:30', 'YYYY-MM-DD HH24:MI'));

INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (34, 1, TO_DATE('2026-11-06 10:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-06 17:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (35, 2, TO_DATE('2026-11-06 10:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-06 17:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (36, 4, TO_DATE('2026-11-06 10:30', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-06 17:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (37, 9, TO_DATE('2026-11-06 11:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-06 17:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (38, 11, TO_DATE('2026-11-06 11:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-06 16:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (39, 3, TO_DATE('2026-11-06 15:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-06 22:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (40, 5, TO_DATE('2026-11-06 15:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-06 22:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (41, 7, TO_DATE('2026-11-06 16:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-06 22:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (42, 12, TO_DATE('2026-11-06 16:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-06 22:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (43, 13, TO_DATE('2026-11-06 16:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-06 22:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (44, 14, TO_DATE('2026-11-06 17:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-06 22:00', 'YYYY-MM-DD HH24:MI'));

INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (45, 2, TO_DATE('2026-11-07 10:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-07 17:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (46, 8, TO_DATE('2026-11-07 11:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-07 16:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (47, 9, TO_DATE('2026-11-07 11:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-07 17:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (48, 3, TO_DATE('2026-11-07 15:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-07 22:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (49, 4, TO_DATE('2026-11-07 15:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-07 22:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (50, 5, TO_DATE('2026-11-07 15:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-07 22:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (51, 7, TO_DATE('2026-11-07 16:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-07 22:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (52, 12, TO_DATE('2026-11-07 16:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-07 22:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (53, 13, TO_DATE('2026-11-07 16:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-07 22:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (54, 14, TO_DATE('2026-11-07 17:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-07 22:00', 'YYYY-MM-DD HH24:MI'));

INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (55, 15, TO_DATE('2026-11-08 10:30', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-08 15:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (56, 9, TO_DATE('2026-11-08 11:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-08 17:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (57, 14, TO_DATE('2026-11-08 11:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-08 17:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (58, 3, TO_DATE('2026-11-08 15:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-08 22:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (59, 5, TO_DATE('2026-11-08 15:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-08 22:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (60, 7, TO_DATE('2026-11-08 16:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-08 22:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (61, 10, TO_DATE('2026-11-08 16:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-08 22:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (62, 12, TO_DATE('2026-11-08 16:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-08 22:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (63, 13, TO_DATE('2026-11-08 16:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-08 22:30', 'YYYY-MM-DD HH24:MI'));

INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (64, 6, TO_DATE('2026-11-09 08:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-09 13:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (65, 1, TO_DATE('2026-11-09 10:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-09 17:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (66, 4, TO_DATE('2026-11-09 10:30', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-09 17:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (67, 8, TO_DATE('2026-11-09 11:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-09 16:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (68, 11, TO_DATE('2026-11-09 11:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-09 16:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (69, 15, TO_DATE('2026-11-09 15:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-09 22:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (70, 9, TO_DATE('2026-11-09 16:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-09 22:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (71, 12, TO_DATE('2026-11-09 16:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-09 22:00', 'YYYY-MM-DD HH24:MI'));

INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (72, 6, TO_DATE('2026-11-10 08:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-10 13:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (73, 1, TO_DATE('2026-11-10 10:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-10 17:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (74, 2, TO_DATE('2026-11-10 10:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-10 17:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (75, 4, TO_DATE('2026-11-10 10:30', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-10 17:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (76, 8, TO_DATE('2026-11-10 11:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-10 16:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (77, 11, TO_DATE('2026-11-10 11:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-10 16:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (78, 15, TO_DATE('2026-11-10 15:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-10 22:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (79, 7, TO_DATE('2026-11-10 16:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-10 22:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (80, 10, TO_DATE('2026-11-10 16:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-10 22:00', 'YYYY-MM-DD HH24:MI'));

INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (81, 6, TO_DATE('2026-11-11 08:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-11 13:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (82, 1, TO_DATE('2026-11-11 10:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-11 17:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (83, 2, TO_DATE('2026-11-11 10:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-11 17:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (84, 7, TO_DATE('2026-11-11 11:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-11 16:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (85, 8, TO_DATE('2026-11-11 11:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-11 16:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (86, 11, TO_DATE('2026-11-11 11:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-11 16:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (87, 3, TO_DATE('2026-11-11 15:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-11 22:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (88, 15, TO_DATE('2026-11-11 15:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-11 22:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (89, 10, TO_DATE('2026-11-11 16:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-11 22:00', 'YYYY-MM-DD HH24:MI'));

INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (90, 6, TO_DATE('2026-11-12 08:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-12 13:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (91, 1, TO_DATE('2026-11-12 10:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-12 17:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (92, 2, TO_DATE('2026-11-12 10:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-12 17:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (93, 4, TO_DATE('2026-11-12 10:30', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-12 17:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (94, 11, TO_DATE('2026-11-12 11:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-12 16:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (95, 3, TO_DATE('2026-11-12 15:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-12 22:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (96, 5, TO_DATE('2026-11-12 15:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-12 22:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (97, 7, TO_DATE('2026-11-12 16:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-12 22:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (98, 13, TO_DATE('2026-11-12 16:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-12 22:30', 'YYYY-MM-DD HH24:MI'));

INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (99, 1, TO_DATE('2026-11-13 10:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-13 17:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (100, 2, TO_DATE('2026-11-13 10:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-13 17:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (101, 4, TO_DATE('2026-11-13 10:30', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-13 17:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (102, 9, TO_DATE('2026-11-13 11:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-13 17:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (103, 11, TO_DATE('2026-11-13 11:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-13 16:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (104, 3, TO_DATE('2026-11-13 15:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-13 22:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (105, 5, TO_DATE('2026-11-13 15:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-13 22:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (106, 7, TO_DATE('2026-11-13 16:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-13 22:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (107, 12, TO_DATE('2026-11-13 16:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-13 22:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (108, 13, TO_DATE('2026-11-13 16:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-13 22:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (109, 14, TO_DATE('2026-11-13 17:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-13 22:00', 'YYYY-MM-DD HH24:MI'));

INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (110, 2, TO_DATE('2026-11-14 10:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-14 17:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (111, 8, TO_DATE('2026-11-14 11:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-14 16:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (112, 9, TO_DATE('2026-11-14 11:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-14 17:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (113, 3, TO_DATE('2026-11-14 15:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-14 22:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (114, 4, TO_DATE('2026-11-14 15:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-14 22:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (115, 5, TO_DATE('2026-11-14 15:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-14 22:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (116, 7, TO_DATE('2026-11-14 16:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-14 22:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (117, 12, TO_DATE('2026-11-14 16:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-14 22:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (118, 13, TO_DATE('2026-11-14 16:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-14 22:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (119, 14, TO_DATE('2026-11-14 17:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-14 22:00', 'YYYY-MM-DD HH24:MI'));

INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (120, 15, TO_DATE('2026-11-15 10:30', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-15 15:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (121, 9, TO_DATE('2026-11-15 11:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-15 17:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (122, 14, TO_DATE('2026-11-15 11:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-15 17:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (123, 3, TO_DATE('2026-11-15 15:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-15 22:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (124, 5, TO_DATE('2026-11-15 15:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-15 22:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (125, 7, TO_DATE('2026-11-15 16:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-15 22:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (126, 10, TO_DATE('2026-11-15 16:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-15 22:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (127, 12, TO_DATE('2026-11-15 16:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-15 22:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO shift (shift_id, employee_id, shift_start_time, shift_end_time) VALUES (128, 13, TO_DATE('2026-11-15 16:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-11-15 22:30', 'YYYY-MM-DD HH24:MI'));

-- --------------------------------------------------------------------
-- CUSTOMER (18 rows): Customers (555 numbers are fictional)
-- --------------------------------------------------------------------
INSERT INTO customer (customer_id, name, phone, email) VALUES (1, 'Ahmed Saleh', '313-555-0101', 'ahmed.saleh@example.com');
INSERT INTO customer (customer_id, name, phone, email) VALUES (2, 'Jessica Moore', '313-555-0102', 'jmoore@example.com');
INSERT INTO customer (customer_id, name, phone, email) VALUES (3, 'Hassan Berry', '313-555-0103', NULL);
INSERT INTO customer (customer_id, name, phone, email) VALUES (4, 'Emily Kowalski', '248-555-0104', 'emily.k@example.com');
INSERT INTO customer (customer_id, name, phone, email) VALUES (5, 'Fatima Hijazi', '313-555-0105', 'fhijazi@example.com');
INSERT INTO customer (customer_id, name, phone, email) VALUES (6, 'Marcus Green', '313-555-0106', NULL);
INSERT INTO customer (customer_id, name, phone, email) VALUES (7, 'Zainab Kassem', '734-555-0107', 'zkassem@example.com');
INSERT INTO customer (customer_id, name, phone, email) VALUES (8, 'Daniel Rivera', '313-555-0108', 'drivera@example.com');
INSERT INTO customer (customer_id, name, phone, email) VALUES (9, 'Noor Elias', '313-555-0109', NULL);
INSERT INTO customer (customer_id, name, phone, email) VALUES (10, 'Brian Walsh', '248-555-0110', 'bwalsh@example.com');
INSERT INTO customer (customer_id, name, phone, email) VALUES (11, 'Mariam Dabaja', '313-555-0111', 'mdabaja@example.com');
INSERT INTO customer (customer_id, name, phone, email) VALUES (12, 'Kevin Tran', '734-555-0112', NULL);
INSERT INTO customer (customer_id, name, phone, email) VALUES (13, 'Rasha Bazzi', '313-555-0113', 'rbazzi@example.com');
INSERT INTO customer (customer_id, name, phone, email) VALUES (14, 'Chris Johnson', '313-555-0114', 'cjohnson@example.com');
INSERT INTO customer (customer_id, name, phone, email) VALUES (15, 'Layla Fawaz', '313-555-0115', NULL);
INSERT INTO customer (customer_id, name, phone, email) VALUES (16, 'Steve Novak', '248-555-0116', 'snovak@example.com');
INSERT INTO customer (customer_id, name, phone, email) VALUES (17, 'Amira Chami', '313-555-0117', 'achami@example.com');
INSERT INTO customer (customer_id, name, phone, email) VALUES (18, 'Tyler Brooks', '734-555-0118', NULL);

-- --------------------------------------------------------------------
-- DELIVERY_PLATFORM (3 rows): Delivery platforms and the commission each takes
-- --------------------------------------------------------------------
INSERT INTO delivery_platform (delivery_platform_id, name, commission_rate) VALUES (1, 'DoorDash', 0.25);
INSERT INTO delivery_platform (delivery_platform_id, name, commission_rate) VALUES (2, 'Uber Eats', 0.3);
INSERT INTO delivery_platform (delivery_platform_id, name, commission_rate) VALUES (3, 'Grubhub', 0.2);

-- --------------------------------------------------------------------
-- SUPPLIER (6 rows): Suppliers
-- --------------------------------------------------------------------
INSERT INTO supplier (supplier_id, name, phone_number) VALUES (1, 'Dearborn Fresh Produce', '313-555-0201');
INSERT INTO supplier (supplier_id, name, phone_number) VALUES (2, 'Great Lakes Halal Meats', '313-555-0202');
INSERT INTO supplier (supplier_id, name, phone_number) VALUES (3, 'Levant Imports Co.', '313-555-0203');
INSERT INTO supplier (supplier_id, name, phone_number) VALUES (4, 'Motor City Dairy', '313-555-0204');
INSERT INTO supplier (supplier_id, name, phone_number) VALUES (5, 'Warren Ave Bakery', '313-555-0205');
INSERT INTO supplier (supplier_id, name, phone_number) VALUES (6, 'Metro Beverage Distributors', '248-555-0206');

-- --------------------------------------------------------------------
-- INVENTORY (27 rows): Inventory. At or below reorder threshold (Q4): Tahini, Beef Shawarma Meat (exactly at), Parsley,
-- Grape Leaves, Akkawi Cheese.
-- --------------------------------------------------------------------
INSERT INTO inventory (inventory_id, supplier_id, item_name, unit, quantity_left, reorder_threshold) VALUES (1, 3, 'Chickpeas', 'lb', 40, 15);
INSERT INTO inventory (inventory_id, supplier_id, item_name, unit, quantity_left, reorder_threshold) VALUES (2, 3, 'Tahini', 'oz', 48, 64);
INSERT INTO inventory (inventory_id, supplier_id, item_name, unit, quantity_left, reorder_threshold) VALUES (3, 5, 'Pita Bread', 'each', 140, 60);
INSERT INTO inventory (inventory_id, supplier_id, item_name, unit, quantity_left, reorder_threshold) VALUES (4, 2, 'Chicken Thigh', 'lb', 45, 20);
INSERT INTO inventory (inventory_id, supplier_id, item_name, unit, quantity_left, reorder_threshold) VALUES (5, 2, 'Beef Shawarma Meat', 'lb', 20, 20);
INSERT INTO inventory (inventory_id, supplier_id, item_name, unit, quantity_left, reorder_threshold) VALUES (6, 2, 'Ground Beef and Lamb', 'lb', 25, 12);
INSERT INTO inventory (inventory_id, supplier_id, item_name, unit, quantity_left, reorder_threshold) VALUES (7, 2, 'Lamb Chops', 'lb', 9, 6);
INSERT INTO inventory (inventory_id, supplier_id, item_name, unit, quantity_left, reorder_threshold) VALUES (8, 1, 'Eggplant', 'each', 12, 8);
INSERT INTO inventory (inventory_id, supplier_id, item_name, unit, quantity_left, reorder_threshold) VALUES (9, 1, 'Parsley', 'each', 5, 10);
INSERT INTO inventory (inventory_id, supplier_id, item_name, unit, quantity_left, reorder_threshold) VALUES (10, 1, 'Tomatoes', 'lb', 30, 15);
INSERT INTO inventory (inventory_id, supplier_id, item_name, unit, quantity_left, reorder_threshold) VALUES (11, 1, 'Cucumbers', 'each', 24, 12);
INSERT INTO inventory (inventory_id, supplier_id, item_name, unit, quantity_left, reorder_threshold) VALUES (12, 1, 'Romaine Lettuce', 'lb', 15, 8);
INSERT INTO inventory (inventory_id, supplier_id, item_name, unit, quantity_left, reorder_threshold) VALUES (13, 1, 'Lemons', 'each', 60, 30);
INSERT INTO inventory (inventory_id, supplier_id, item_name, unit, quantity_left, reorder_threshold) VALUES (14, 3, 'Olive Oil', 'oz', 300, 100);
INSERT INTO inventory (inventory_id, supplier_id, item_name, unit, quantity_left, reorder_threshold) VALUES (15, 1, 'Garlic', 'lb', 6, 3);
INSERT INTO inventory (inventory_id, supplier_id, item_name, unit, quantity_left, reorder_threshold) VALUES (16, 3, 'Grape Leaves', 'lb', 1.5, 3);
INSERT INTO inventory (inventory_id, supplier_id, item_name, unit, quantity_left, reorder_threshold) VALUES (17, 3, 'Basmati Rice', 'lb', 50, 20);
INSERT INTO inventory (inventory_id, supplier_id, item_name, unit, quantity_left, reorder_threshold) VALUES (18, 3, 'Red Lentils', 'lb', 20, 8);
INSERT INTO inventory (inventory_id, supplier_id, item_name, unit, quantity_left, reorder_threshold) VALUES (19, 4, 'Plain Yogurt', 'lb', 14, 6);
INSERT INTO inventory (inventory_id, supplier_id, item_name, unit, quantity_left, reorder_threshold) VALUES (20, 5, 'Phyllo Dough', 'lb', 6, 4);
INSERT INTO inventory (inventory_id, supplier_id, item_name, unit, quantity_left, reorder_threshold) VALUES (21, 4, 'Akkawi Cheese', 'lb', 3, 4);
INSERT INTO inventory (inventory_id, supplier_id, item_name, unit, quantity_left, reorder_threshold) VALUES (22, 4, 'Whole Milk', 'oz', 256, 128);
INSERT INTO inventory (inventory_id, supplier_id, item_name, unit, quantity_left, reorder_threshold) VALUES (23, 1, 'Fresh Mint', 'each', 8, 4);
INSERT INTO inventory (inventory_id, supplier_id, item_name, unit, quantity_left, reorder_threshold) VALUES (24, 3, 'Turkish Coffee', 'oz', 40, 16);
INSERT INTO inventory (inventory_id, supplier_id, item_name, unit, quantity_left, reorder_threshold) VALUES (25, 3, 'Sugar', 'lb', 25, 10);
INSERT INTO inventory (inventory_id, supplier_id, item_name, unit, quantity_left, reorder_threshold) VALUES (26, 1, 'Potatoes', 'lb', 40, 15);
INSERT INTO inventory (inventory_id, supplier_id, item_name, unit, quantity_left, reorder_threshold) VALUES (27, 3, 'Jallab Syrup', 'oz', 64, 32);

-- --------------------------------------------------------------------
-- RECIPE (96 rows): Recipes: how much of each inventory item ONE serving uses (in the inventory unit)
-- --------------------------------------------------------------------
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (1, 1, 0.25);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (1, 2, 2);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (1, 13, 1);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (1, 14, 1);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (1, 15, 0.02);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (1, 3, 1);

INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (2, 8, 1);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (2, 2, 1.5);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (2, 13, 1);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (2, 15, 0.02);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (2, 3, 1);

INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (3, 1, 0.3);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (3, 9, 0.2);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (3, 15, 0.02);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (3, 2, 1);

INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (4, 16, 0.25);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (4, 17, 0.15);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (4, 13, 1);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (4, 14, 1);

INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (5, 18, 0.2);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (5, 13, 1);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (5, 15, 0.01);

INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (6, 4, 0.3);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (6, 3, 1);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (6, 15, 0.02);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (6, 11, 0.5);

INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (7, 5, 0.3);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (7, 3, 1);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (7, 2, 1);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (7, 10, 0.1);

INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (8, 1, 0.2);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (8, 9, 0.1);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (8, 2, 1);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (8, 10, 0.1);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (8, 3, 1);

INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (9, 6, 0.3);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (9, 9, 0.05);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (9, 10, 0.1);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (9, 3, 1);

INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (10, 4, 0.5);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (10, 17, 0.3);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (10, 15, 0.02);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (10, 3, 1);

INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (11, 5, 0.5);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (11, 17, 0.3);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (11, 2, 1.5);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (11, 3, 1);

INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (12, 4, 0.5);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (12, 19, 0.1);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (12, 17, 0.3);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (12, 15, 0.02);

INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (13, 6, 0.45);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (13, 9, 0.1);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (13, 17, 0.3);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (13, 10, 0.2);

INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (14, 7, 0.75);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (14, 17, 0.3);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (14, 15, 0.02);

INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (15, 4, 0.3);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (15, 5, 0.3);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (15, 6, 0.3);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (15, 7, 0.4);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (15, 17, 0.3);

INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (16, 7, 0.6);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (16, 19, 0.3);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (16, 17, 0.4);

INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (17, 12, 0.3);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (17, 10, 0.2);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (17, 11, 1);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (17, 3, 0.5);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (17, 13, 1);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (17, 14, 1);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (17, 23, 0.1);

INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (18, 9, 0.5);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (18, 10, 0.2);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (18, 13, 1);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (18, 23, 0.1);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (18, 14, 1);

INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (19, 17, 0.25);

INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (20, 26, 0.5);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (20, 15, 0.02);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (20, 14, 1);

INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (21, 20, 0.1);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (21, 25, 0.05);

INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (22, 21, 0.2);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (22, 20, 0.1);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (22, 25, 0.05);

INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (23, 17, 0.1);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (23, 22, 6);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (23, 25, 0.05);

INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (24, 13, 2);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (24, 23, 0.1);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (24, 25, 0.1);

INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (25, 24, 0.5);
INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (25, 25, 0.02);

INSERT INTO recipe (item_id, inventory_id, qty_needed) VALUES (26, 27, 2);

-- --------------------------------------------------------------------
-- ORDERS (54 rows): Orders. 1-4 are from early October (orders 1 and 3 are cancelled and get deleted by Q10).
-- Recent cancelled orders are kept by Q10. Orders 53 and 54 are still PLACED (used by Q11 and Q12).
-- customer_id is NULL for walk-in dine-in orders.
-- --------------------------------------------------------------------
INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (1, 17, 7, NULL, TO_DATE('2026-10-02 12:15', 'YYYY-MM-DD HH24:MI'), 'TAKEOUT', 'CANCELLED');

INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (2, 13, 8, 1, TO_DATE('2026-10-03 18:40', 'YYYY-MM-DD HH24:MI'), 'DELIVERY', 'COMPLETED');

INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (3, 11, 11, NULL, TO_DATE('2026-10-04 19:05', 'YYYY-MM-DD HH24:MI'), 'DINE_IN', 'CANCELLED');

INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (4, 5, 8, NULL, TO_DATE('2026-10-05 13:30', 'YYYY-MM-DD HH24:MI'), 'DINE_IN', 'COMPLETED');

INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (5, 6, 11, 1, TO_DATE('2026-11-02 14:00', 'YYYY-MM-DD HH24:MI'), 'DELIVERY', 'COMPLETED');
INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (6, 8, 12, NULL, TO_DATE('2026-11-02 19:15', 'YYYY-MM-DD HH24:MI'), 'TAKEOUT', 'COMPLETED');
INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (7, 16, 12, NULL, TO_DATE('2026-11-02 20:00', 'YYYY-MM-DD HH24:MI'), 'TAKEOUT', 'COMPLETED');

INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (8, NULL, 8, NULL, TO_DATE('2026-11-03 13:45', 'YYYY-MM-DD HH24:MI'), 'DINE_IN', 'COMPLETED');
INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (9, 12, 11, NULL, TO_DATE('2026-11-03 16:15', 'YYYY-MM-DD HH24:MI'), 'TAKEOUT', 'COMPLETED');
INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (10, 16, 10, 1, TO_DATE('2026-11-03 21:00', 'YYYY-MM-DD HH24:MI'), 'DELIVERY', 'COMPLETED');

INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (11, 14, 8, NULL, TO_DATE('2026-11-04 12:45', 'YYYY-MM-DD HH24:MI'), 'DINE_IN', 'COMPLETED');
INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (12, 1, 11, NULL, TO_DATE('2026-11-04 14:45', 'YYYY-MM-DD HH24:MI'), 'TAKEOUT', 'COMPLETED');
INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (13, NULL, 10, NULL, TO_DATE('2026-11-04 19:30', 'YYYY-MM-DD HH24:MI'), 'DINE_IN', 'COMPLETED');

INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (14, 12, 11, NULL, TO_DATE('2026-11-05 11:15', 'YYYY-MM-DD HH24:MI'), 'TAKEOUT', 'COMPLETED');
INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (15, 12, 7, 3, TO_DATE('2026-11-05 16:45', 'YYYY-MM-DD HH24:MI'), 'DELIVERY', 'COMPLETED');
INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (16, 15, 7, NULL, TO_DATE('2026-11-05 21:00', 'YYYY-MM-DD HH24:MI'), 'TAKEOUT', 'COMPLETED');

INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (17, 11, 11, NULL, TO_DATE('2026-11-06 15:15', 'YYYY-MM-DD HH24:MI'), 'TAKEOUT', 'COMPLETED');
INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (18, 1, 12, 1, TO_DATE('2026-11-06 16:30', 'YYYY-MM-DD HH24:MI'), 'DELIVERY', 'COMPLETED');
INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (19, 10, 12, 1, TO_DATE('2026-11-06 17:45', 'YYYY-MM-DD HH24:MI'), 'DELIVERY', 'COMPLETED');
INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (20, 1, 12, NULL, TO_DATE('2026-11-06 20:45', 'YYYY-MM-DD HH24:MI'), 'TAKEOUT', 'COMPLETED');

INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (21, 8, 9, NULL, TO_DATE('2026-11-07 11:30', 'YYYY-MM-DD HH24:MI'), 'TAKEOUT', 'COMPLETED');
INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (22, 9, 8, NULL, TO_DATE('2026-11-07 14:30', 'YYYY-MM-DD HH24:MI'), 'TAKEOUT', 'COMPLETED');
INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (23, 11, 7, NULL, TO_DATE('2026-11-07 18:30', 'YYYY-MM-DD HH24:MI'), 'DINE_IN', 'COMPLETED');
INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (24, 14, 12, 3, TO_DATE('2026-11-07 19:30', 'YYYY-MM-DD HH24:MI'), 'DELIVERY', 'COMPLETED');

INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (25, 1, 9, 2, TO_DATE('2026-11-08 11:30', 'YYYY-MM-DD HH24:MI'), 'DELIVERY', 'COMPLETED');
INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (26, 16, 9, NULL, TO_DATE('2026-11-08 15:45', 'YYYY-MM-DD HH24:MI'), 'DINE_IN', 'COMPLETED');
INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (27, 17, 12, NULL, TO_DATE('2026-11-08 16:00', 'YYYY-MM-DD HH24:MI'), 'TAKEOUT', 'COMPLETED');
INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (28, 7, 12, 1, TO_DATE('2026-11-08 17:00', 'YYYY-MM-DD HH24:MI'), 'DELIVERY', 'COMPLETED');

INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (29, 4, 12, 1, TO_DATE('2026-11-09 17:45', 'YYYY-MM-DD HH24:MI'), 'DELIVERY', 'COMPLETED');
INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (30, 8, 12, 1, TO_DATE('2026-11-09 18:45', 'YYYY-MM-DD HH24:MI'), 'DELIVERY', 'COMPLETED');
INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (31, 11, 9, NULL, TO_DATE('2026-11-09 19:00', 'YYYY-MM-DD HH24:MI'), 'DINE_IN', 'COMPLETED');

INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (32, 11, 11, NULL, TO_DATE('2026-11-10 12:45', 'YYYY-MM-DD HH24:MI'), 'TAKEOUT', 'COMPLETED');
INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (33, NULL, 10, NULL, TO_DATE('2026-11-10 16:30', 'YYYY-MM-DD HH24:MI'), 'DINE_IN', 'COMPLETED');
INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (34, NULL, 10, NULL, TO_DATE('2026-11-10 18:00', 'YYYY-MM-DD HH24:MI'), 'DINE_IN', 'COMPLETED');

INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (35, 17, 10, 1, TO_DATE('2026-11-11 16:30', 'YYYY-MM-DD HH24:MI'), 'DELIVERY', 'COMPLETED');
INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (36, 5, 10, 2, TO_DATE('2026-11-11 17:00', 'YYYY-MM-DD HH24:MI'), 'DELIVERY', 'COMPLETED');
INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (37, 1, 10, 3, TO_DATE('2026-11-11 20:00', 'YYYY-MM-DD HH24:MI'), 'DELIVERY', 'COMPLETED');

INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (38, 7, 11, NULL, TO_DATE('2026-11-12 11:15', 'YYYY-MM-DD HH24:MI'), 'TAKEOUT', 'COMPLETED');
INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (39, 14, 7, NULL, TO_DATE('2026-11-12 18:00', 'YYYY-MM-DD HH24:MI'), 'TAKEOUT', 'CANCELLED');
INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (40, NULL, 7, NULL, TO_DATE('2026-11-12 21:00', 'YYYY-MM-DD HH24:MI'), 'DINE_IN', 'COMPLETED');

INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (41, 11, 11, 1, TO_DATE('2026-11-13 12:00', 'YYYY-MM-DD HH24:MI'), 'DELIVERY', 'COMPLETED');
INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (42, 15, 11, NULL, TO_DATE('2026-11-13 13:45', 'YYYY-MM-DD HH24:MI'), 'TAKEOUT', 'COMPLETED');
INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (43, 5, 7, NULL, TO_DATE('2026-11-13 17:15', 'YYYY-MM-DD HH24:MI'), 'DINE_IN', 'COMPLETED');
INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (44, 13, 12, 2, TO_DATE('2026-11-13 19:00', 'YYYY-MM-DD HH24:MI'), 'DELIVERY', 'COMPLETED');

INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (45, NULL, 9, NULL, TO_DATE('2026-11-14 12:00', 'YYYY-MM-DD HH24:MI'), 'DINE_IN', 'COMPLETED');
INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (46, NULL, 8, NULL, TO_DATE('2026-11-14 13:00', 'YYYY-MM-DD HH24:MI'), 'DINE_IN', 'CANCELLED');
INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (47, NULL, 9, NULL, TO_DATE('2026-11-14 15:30', 'YYYY-MM-DD HH24:MI'), 'DINE_IN', 'COMPLETED');
INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (48, 11, 12, NULL, TO_DATE('2026-11-14 19:30', 'YYYY-MM-DD HH24:MI'), 'TAKEOUT', 'COMPLETED');

INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (49, 3, 9, NULL, TO_DATE('2026-11-15 12:15', 'YYYY-MM-DD HH24:MI'), 'DINE_IN', 'COMPLETED');
INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (50, 1, 12, 1, TO_DATE('2026-11-15 17:00', 'YYYY-MM-DD HH24:MI'), 'DELIVERY', 'COMPLETED');
INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (51, 1, 12, NULL, TO_DATE('2026-11-15 21:00', 'YYYY-MM-DD HH24:MI'), 'TAKEOUT', 'COMPLETED');
INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (52, 1, 7, NULL, TO_DATE('2026-11-15 21:15', 'YYYY-MM-DD HH24:MI'), 'DINE_IN', 'COMPLETED');
INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (53, 5, 7, NULL, TO_DATE('2026-11-15 20:45', 'YYYY-MM-DD HH24:MI'), 'DINE_IN', 'PLACED');
INSERT INTO orders (order_id, customer_id, employee_id, delivery_platform_id, order_time, order_type, status) VALUES (54, 2, 12, NULL, TO_DATE('2026-11-15 21:10', 'YYYY-MM-DD HH24:MI'), 'TAKEOUT', 'PLACED');

-- --------------------------------------------------------------------
-- ORDER_ITEM (117 rows): Order lines. unit_price = menu price when the order was placed.
-- --------------------------------------------------------------------
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (1, 7, 1, 9.99);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (2, 6, 2, 9.49);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (2, 1, 3, 6.99);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (3, 10, 1, 15.99);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (3, 8, 2, 8.49);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (3, 24, 2, 3.99);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (4, 9, 1, 9.99);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (4, 22, 1, 7.99);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (4, 4, 1, 7.99);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (4, 6, 1, 9.49);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (5, 7, 1, 9.99);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (5, 25, 2, 3.49);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (5, 24, 2, 3.99);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (6, 10, 2, 15.99);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (6, 11, 2, 16.99);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (7, 24, 1, 3.99);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (7, 18, 1, 7.99);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (8, 20, 1, 4.99);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (8, 12, 1, 16.49);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (9, 24, 1, 3.99);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (9, 13, 2, 16.99);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (10, 14, 1, 26.99);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (11, 17, 1, 8.49);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (11, 1, 1, 6.99);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (12, 18, 1, 7.99);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (13, 11, 2, 16.99);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (13, 1, 1, 6.99);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (13, 12, 3, 16.49);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (14, 1, 2, 6.99);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (14, 10, 2, 15.99);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (15, 6, 1, 9.49);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (15, 15, 1, 29.99);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (16, 19, 1, 3.99);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (16, 10, 2, 15.99);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (17, 6, 1, 9.49);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (17, 3, 1, 6.49);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (17, 4, 3, 7.99);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (18, 2, 1, 7.49);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (19, 18, 1, 7.99);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (19, 3, 1, 6.49);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (20, 4, 1, 7.99);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (21, 23, 2, 4.49);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (21, 24, 1, 3.99);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (22, 24, 1, 3.99);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (22, 12, 1, 16.49);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (22, 15, 3, 29.99);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (23, 22, 1, 7.99);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (23, 9, 1, 9.99);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (24, 10, 1, 15.99);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (24, 5, 1, 4.99);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (25, 8, 2, 8.49);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (26, 2, 2, 7.49);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (27, 15, 2, 29.99);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (28, 8, 1, 8.49);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (29, 11, 2, 16.99);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (29, 17, 1, 8.49);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (30, 3, 2, 6.49);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (30, 9, 3, 9.99);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (30, 1, 2, 6.99);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (30, 2, 1, 7.49);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (31, 11, 1, 16.99);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (31, 3, 3, 6.49);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (32, 3, 3, 6.49);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (33, 12, 1, 16.49);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (33, 3, 1, 6.49);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (33, 10, 2, 15.99);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (34, 6, 1, 9.49);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (34, 18, 2, 7.99);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (35, 5, 1, 4.99);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (35, 20, 2, 4.99);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (36, 20, 2, 4.99);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (36, 1, 1, 6.99);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (36, 24, 2, 3.99);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (37, 24, 1, 3.99);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (37, 12, 1, 16.49);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (38, 5, 1, 4.99);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (38, 25, 1, 3.49);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (39, 10, 1, 15.99);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (39, 17, 1, 8.49);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (39, 7, 1, 9.99);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (40, 24, 1, 3.99);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (40, 25, 2, 3.49);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (40, 6, 2, 9.49);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (41, 25, 1, 3.49);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (41, 8, 1, 8.49);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (42, 3, 2, 6.49);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (42, 17, 1, 8.49);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (43, 8, 1, 8.49);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (43, 21, 1, 4.99);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (43, 2, 1, 7.49);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (44, 24, 1, 3.99);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (45, 6, 1, 9.49);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (45, 7, 2, 9.99);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (45, 8, 1, 8.49);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (46, 7, 2, 9.99);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (46, 2, 1, 7.49);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (46, 6, 1, 9.49);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (46, 5, 2, 4.99);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (47, 20, 2, 4.99);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (47, 7, 3, 9.99);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (48, 18, 2, 7.99);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (48, 22, 3, 7.99);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (48, 24, 1, 3.99);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (49, 2, 1, 7.49);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (49, 24, 1, 3.99);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (50, 22, 1, 7.99);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (50, 19, 2, 3.99);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (50, 10, 1, 15.99);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (50, 11, 1, 16.99);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (51, 10, 2, 15.99);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (51, 25, 1, 3.49);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (52, 6, 1, 9.49);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (52, 13, 1, 16.99);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (53, 10, 2, 15.99);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (53, 1, 1, 6.99);
INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (53, 24, 2, 3.99);

INSERT INTO order_item (order_id, item_id, quantity, unit_price) VALUES (54, 8, 1, 8.49);

COMMIT;
