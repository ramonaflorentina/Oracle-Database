-- @C:\Users\ramon\OneDrive\Documents\CSY2038\FuncPrac_78.sql

-- CREATING FUNCTIONS IN SQL*PLUS


SET SERVEROUTPUT ON

CREATE OR REPLACE FUNCTION func_voucher_ct RETURN NUMBER IS
vn_voucher_ct NUMBER(3);

BEGIN

SELECT COUNT(student_id)
INTO vn_voucher_ct
FROM students
WHERE voucher = 'Y';

RETURN vn_voucher_ct ;

END func_voucher_ct;
/

SHOW ERROR


-- PROCEDURE TO CALL FUNCTION

SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE proc_using_func IS
vn_no_of_vouchers NUMBER(3);

BEGIN

vn_no_of_vouchers := func_voucher_ct;

DBMS_OUTPUT.PUT_LINE ('There are ' || vn_no_of_vouchers || ' student(s) who have vouchers.');

END proc_using_func;  
/

SHOW ERROR

execute proc_using_func;


-- EXERCISE 2


SET SERVEROUTPUT ON

CREATE OR REPLACE FUNCTION func_param_ct
(in_date_of_birth students.date_of_birth%TYPE)
RETURN NUMBER IS 


vn_voucher_ct NUMBER(3);

BEGIN

SELECT COUNT(student_id)
INTO vn_voucher_ct
FROM students
WHERE voucher = 'Y'
AND date_of_birth > in_date_of_birth;

RETURN vn_voucher_ct ;

END func_param_ct;
/

SHOW ERROR




-- PROCEDURE TO CALL FUNCTION


CREATE OR REPLACE PROCEDURE proc_using_func
(in_date_of_birth students.date_of_birth%TYPE) IS

vn_no_of_vouchers NUMBER(3);


BEGIN

vn_no_of_vouchers := func_param_ct (in_date_of_birth);

DBMS_OUTPUT.PUT_LINE ('There are ' || vn_no_of_vouchers || ' student(s) who have vouchers.');

END proc_using_func;  
/

SHOW ERROR
SELECT student_id, date_of_birth, voucher FROM students;

execute proc_using_func('01-JAN-2004')