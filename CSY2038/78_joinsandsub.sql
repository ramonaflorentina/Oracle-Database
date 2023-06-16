-- @C:\Users\ramon\OneDrive\Documents\CSY2038\78_joinsandsub.sql


-- INNER JOIN

SELECT sa.subject_id, sa.subject_name, c.course_id, c.title
FROM subject_areas  sa
JOIN courses  c
ON sa.subject_id  =  c.subject_id;


-- ERROR EXAMPLE
SELECT sa.subject_id, sa.subject_name, c.course_id, c.title
FROM subject_areas sa, courses  c;



-- COMPOUND INNER JOIN
	

SELECT c.course_id, c.title, o.offering_id, i.instructor_id, i.instructor_name 
FROM courses c 
JOIN offerings o
	ON c.course_id = o.course_id
JOIN  instructors i
	ON i.instructor_id =o.instructor_id;


-- COMPOUND INNER JOIN WITH FORMAT	
	
SELECT c.course_id, c.title, c.cost, i.instructor_name 
FROM courses c 
JOIN offerings o
	ON c.course_id = o.course_id
JOIN  instructors i
	ON i.instructor_id =o.instructor_id;
	
COLUMN title FORMAT A10;



-- LEFT OUTER JOIN 

SELECT s.student_id, s.student_firstname, a.offering_id
FROM students s
LEFT JOIN attendance a
ON s.student_id  =  a.student_id;



-- FULL OUTER JOIN


SELECT c.course_id, o.offering_id, s.site_id
FROM courses  c
FULL OUTER JOIN offerings  o
ON c.course_id  =  o.course_id
FULL OUTER JOIN sites  s
ON s.site_id  =  o.site_id;


-- USING SUB-QUERIES AND CORRELATED SUB-QUERIES


SELECT s.student_id, s.student_surname, company_id
FROM students s
WHERE company_id IN(
	SELECT company_id
	FROM companies c
	WHERE c.city = 'AMSTERDAM');


SELECT a.city
FROM addresses a
WHERE city IN(
	SELECT s.address.city
	FROM sites s)
	AND city IN(
	SELECT i.address.city
	FROM instructors i)
AND a.country = 'USA';


	
	
SELECT a.city
FROM addresses a
WHERE a.city NOT IN(
SELECT i.address.city 
FROM instructors i);



SELECT a.city
FROM addresses a
WHERE a.city NOT IN(
SELECT i.address.city 
FROM instructors i)
AND a.city NOT IN(
SELECT s.address.city 
FROM students s);

