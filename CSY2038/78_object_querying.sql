-- @C:\Users\ramon\OneDrive\Documents\CSY2038\78_object_querying.sql

-- QUERYING OBJECT COLUMNS AND TABLES

SELECT site_id, state_ref
FROM sites s;


SELECT DEREF(state_ref), site_id
FROM sites s
WHERE s.state_ref.state = 'VICTORIA';


SELECT s.state_ref.country, site_id
FROM sites s
WHERE s.state_ref.country = 'AUSTRALIA';



-- QUERYING VARRAY COLUMNS


SELECT s.site_id, c.room_number, c.capacity, c.description
FROM sites s, TABLE(s.classroom) c
WHERE s.site_id=1; 


-- QUERYING TABLES WITH NESTED TABLES

SELECT i.invoice_number, ii.student_surname, ii.course_title, ii.start_date, ii.end_date, ii.amount
FROM invoices i, TABLE(i.invoice_item) ii
WHERE i.invoice_number=10007;


-- QUERYING NESTED TABLES ONLY

SELECT VALUE(ii) 
FROM THE(
SELECT invoice_item
FROM invoices
WHERE invoice_number = 10007) ii;

