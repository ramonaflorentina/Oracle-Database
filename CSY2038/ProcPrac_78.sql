-- @C:\Users\ramon\OneDrive\Documents\CSY2038\ProcPrac_78.sql


-- CREATING PROCEDURES IN SQL*PLUS

SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE proc_username IS

vc_username VARCHAR(25);
vc_firstname students.student_firstname%TYPE;
vc_surname students.student_surname%TYPE;

BEGIN

SELECT student_firstname, student_surname
INTO vc_firstname, vc_surname
FROM students
WHERE student_id = 6901;

vc_username :=SUBSTR(vc_firstname, 1, 2) || SUBSTR(vc_surname, 1, 5);

DBMS_OUTPUT.PUT_LINE('The username is ' || vc_username);

END proc_username;  
/

SHOW ERROR

execute proc_username;


-- TESTING

SELECT student_firstname, student_surname
FROM students
WHERE student_id = 6901;


-- PART 2

SET SERVEROUTPUT ON


CREATE OR REPLACE PROCEDURE proc_delete_company IS

vn_company_id companies.company_id%TYPE;

BEGIN

SELECT MAX(company_id)
INTO vn_company_id
FROM companies;

DELETE FROM companies
WHERE company_id = vn_company_id;

DBMS_OUTPUT.PUT_LINE('Record deleted');


END proc_delete_company;  
/

SHOW ERRORS

execute proc_delete_company;

-- TESTING

SELECT MAX(company_id)
FROM companies;


-- USING PARAMETERS IN PROCEDURES

SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE proc_param_username
(in_student_id IN students.student_id%TYPE) IS

vc_username VARCHAR(25);
vc_firstname students.student_firstname%TYPE;
vc_surname students.student_surname%TYPE;


BEGIN

SELECT student_firstname, student_surname
INTO vc_firstname, vc_surname
FROM students
WHERE student_id = in_student_id;


vc_username :=SUBSTR(vc_firstname, 1, 2) || SUBSTR(vc_surname, 1, 5);

DBMS_OUTPUT.PUT_LINE('The username is ' || vc_username);

END proc_param_username;  
/

execute proc_param_username(6901);





