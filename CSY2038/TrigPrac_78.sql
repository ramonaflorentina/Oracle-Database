-- @C:\Users\ramon\OneDrive\Documents\CSY2038\createCourse_78.sql 


-- TRIGGER 1


CREATE OR REPLACE TRIGGER trig_dob_ck
BEFORE INSERT OR UPDATE OF date_of_birth ON students
FOR EACH ROW 
WHEN (NEW.date_of_birth > SYSDATE)

BEGIN

RAISE_APPLICATION_ERROR(-20000, 'BILLING_DATE MUST BE BEFORE CURRENT DATE'); 

END trig_dob_ck;
/

-- TESTING

SELECT student_id, student_firstname, student_surname, date_of_birth FROM students;

INSERT INTO students(student_id, student_firstname, student_surname, date_of_birth)
VALUES (1234, 'RAMONA', 'FLO', '13-dec-2022');

SELECT student_id, student_firstname, student_surname, date_of_birth FROM students;

INSERT INTO students(student_id, student_firstname, student_surname, date_of_birth)
VALUES (1234, 'RAMONA', 'FLO', '11-dec-2022');

SELECT student_id, student_firstname, student_surname, date_of_birth FROM students;


-- TRIGGER 2
	
CREATE OR REPLACE TRIGGER trig_dob_ck
BEFORE INSERT OR UPDATE OF date_of_birth ON students
FOR EACH ROW 
WHEN (NEW.date_of_birth IS NOT NULL)

DECLARE

vn_age NUMBER(3);

BEGIN

vn_age := MONTHS_BETWEEN(SYSDATE,:NEW.date_of_birth)/12;

DBMS_OUTPUT.PUT_LINE(vn_age);

IF vn_age <= 18 THEN 

DBMS_OUTPUT.PUT_LINE('STUDENT IS A CHILD');

ELSE
DBMS_OUTPUT.PUT_LINE('STUDENT IS NOT A CHILD');


END IF;
END trig_dob_ck;
/



-- TESTING

SELECT student_id, student_firstname, student_surname, date_of_birth FROM students;

INSERT INTO students(student_id, student_firstname, student_surname, date_of_birth)
VALUES (1256, 'RAMONA', 'FLO', NULL);

SELECT student_id, student_firstname, student_surname, date_of_birth FROM students;

INSERT INTO students(student_id, student_firstname, student_surname, date_of_birth)
VALUES (1476, 'RAMONA', 'FLO', '11-dec-2020');

SELECT student_id, student_firstname, student_surname, date_of_birth FROM students;

INSERT INTO students(student_id, student_firstname, student_surname, date_of_birth)
VALUES (1268, 'RAMONA', 'FLO', '11-dec-2000');

DROP TRIGGER trig_dob_ck;


-- DELETE INSERTS

DELETE FROM students WHERE student_firstname = 'RAMONA';