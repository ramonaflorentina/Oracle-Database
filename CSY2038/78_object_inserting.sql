-- @C:\Users\ramon\OneDrive\Documents\CSY2038\78_object_inserting.sql

INSERT INTO bill_addresses (street, city, country)
VALUES  ('54 FESTIVE ROAD','NORTHAMPTON','UK');
INSERT INTO bill_addresses (street, city, country)
VALUES  ('30 ENGLISH STREET','BEDFORD','UK');



INSERT INTO customers (customer_id, customer_name, invoice_address)
SELECT 1,'MANDY MORRELL', REF(ba)
FROM bill_addresses  ba
WHERE ba.street = '54 FESTIVE ROAD';


INSERT INTO states
VALUES ('BIHAR', 'INDIA'); 

UPDATE sites  s1
SET s1.state_ref =(	
	SELECT REF (s2)
	FROM  states  s2
	WHERE s2.state = 'BIHAR')
WHERE s1.site_id = 1;


INSERT INTO customers
VALUES (2, 'CAROLE MORRELL', invoice_address_type('1 MY WAY','UK','LUTON'));


INSERT INTO states
VALUES ('ALBERTA', 'CANADA');
INSERT INTO states
VALUES ('VICTORIA', 'AUSTRALIA');
INSERT INTO states
VALUES ('QUEENSLAND', 'AUSTRALIA');
INSERT INTO states
VALUES ('DELHI', 'INDIA'); 


-- INSERTING INTO TABLES WITH VARRAY TYPES

INSERT INTO prospective_customers(prospective_customer_id, social_media_avalable)
VALUES (80000, 
social_media_varray_type (
	social_media_type ('MEDIA NAME A', 'PHONE NUMBER'),
	social_media_type ('MEDIA NAME A', 'PHONE NUMBER'),
	social_media_type ('MEDIA NAME A', 'PHONE NUMBER'))
         );


INSERT INTO prospective_customers (prospective_customer_id, social_media_avalable)
VALUES (80001 , 
social_media_varray_type (
	social_media_type ('MEDIA NAME B', 'PHONE NUMBER'),
	social_media_type ('MEDIA NAME B', 'PHONE NUMBER'),
	social_media_type ('MEDIA NAME B', 'PHONE NUMBER'))
         );




-- INSERTING INTO TABLES WITH NESTED TABLES


INSERT INTO adverts (advert_id, advert_title, description, social_media_used)
VALUES (90000, 'ADVT', 'DESC4',
social_media_table_type (
	social_media_type('ADV1', 'DESCR1'),
	social_media_type('ADV2', 'DESCR2'),
	social_media_type('ADV2', 'DESCR2'))
         );



INSERT INTO sites (site_id, address, location, classroom, state_ref)
SELECT 11, address_type('STREET 1', 'BEDFORD', 'UK'), 'WATERSIDE', 
classroom_varray_type(
classroom_type('NO123', 200, 'DESC4'),
classroom_type('NO1235',111, 'DESC7')),
REF (s)
	FROM  states  s
	WHERE s.state = 'VICTORIA';










-- View Table
-- SELECT * FROM table name;