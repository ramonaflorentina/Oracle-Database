-- @C:\Users\ramon\OneDrive\Documents\CSY2038\78_prac1.sql

SELECT  student_firstname, phone_number, gender FROM students;

COLUMN student_firstname HEADING 'First |Name'
COLUMN phone_number FORMAT A11; 
COLUMN gender FORMAT A30;
/* all three of them work separately and need a SELECT statement after the written line*/


COLUMN gender FORMAT A30;
SELECT gender FROM students WHERE gender = 'F';
/* retrieve only the female students */


SELECT student_firstname ||', '|| student_surname FROM students ORDER BY student_surname;
/* alphabetical order of the surnames  */
