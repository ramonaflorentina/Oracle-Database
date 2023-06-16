/* DropCourse */

/*
-- @C:\Users\ramon\OneDrive\Documents\CSY2038\dropCourse_78.sql 

*/

DROP TABLE invoices;
DROP TABLE attendance;
DROP TABLE offerings;
DROP TABLE courses;
DROP TABLE instructors;
DROP TABLE subject_areas;
DROP TABLE students;
DROP TABLE sites;
DROP TABLE addresses;
DROP TABLE companies;

DROP TYPE address_type;
DROP TYPE invoice_item_table_type;
DROP TYPE invoice_item_type;
DROP TYPE classroom_varray_type;
DROP TYPE classroom_type;

PURGE RECYCLEBIN;
COLUMN object_name FORMAT A30;
COLUMN object_type FORMAT A12;
SELECT object_name, object_type FROM user_objects;

--SELECT * FROM tab;
--SELECT * FROM user_types;
--SELECT * FROM user_constraints;
