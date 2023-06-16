
-- QUERYING USING UNION

SELECT s.address.city, s.address.country
FROM sites s
WHERE s.address.country = 'USA'
UNION
SELECT i.address.city, i.address.country
FROM instructors i
WHERE i.address.country  = 'USA';



-- QUERYING USING INTERSECT


SELECT s.address.city, s.address.country
FROM sites s
WHERE s.address.country = 'USA'
INTERSECT
SELECT i.address.city, i.address.country
FROM instructors i
WHERE i.address.country  = 'USA';


-- QUERYING USING MINUS

SELECT city, country
FROM addresses 
MINUS
SELECT i.address.city, i.address.country
FROM instructors  i;


-- QUERYING USING MORE THAN ONE

SELECT city, country
FROM addresses 
MINUS
SELECT i.address.city, i.address.country
FROM instructors  i
UNION
SELECT s.address.city, s.address.country
FROM sites s;


-- USING FUNCTIONS, GROUP BY AND HAVING COMMANDS 

-- first form

SELECT instructor_id, instructor_name, salary
FROM instructors 
WHERE salary = 2000
OR salary = 2500
OR salary = 3000;

-- second form 

SELECT instructor_id, instructor_name, salary
FROM instructors 
WHERE salary IN(2000, 2500, 3000);


SELECT instructor_id, instructor_name
FROM instructors 
WHERE instructor_name LIKE 'S%';


SELECT instructor_id, instructor_name, salary
FROM instructors 
WHERE salary
BETWEEN 2000 AND 2999;


-- USING FUNCTIONS, GROUP BY AND HAVING COMMANDS 


SELECT student_id, COUNT(student_id)
FROM attendance a
WHERE student_id > 6000
GROUP BY student_id;


SELECT student_id
FROM students s
WHERE student_id > 6000;


SELECT AVG(evaluation), student_id
FROM attendance 
GROUP BY student_id
HAVING AVG(evaluation)>=4;


SELECT student_id, SUM(amount_paid)
FROM attendance 
GROUP BY student_id;


----

SELECT offering_id, SUM(amount_paid)
FROM attendance
GROUP BY offering_id;


SELECT MIN(evaluation), MAX(evaluation), AVG(evaluation), offering_id
FROM attendance 
GROUP BY offering_id
HAVING MIN(evaluation)<2.5;