

CREATE OR REPLACE TYPE invoice_address_type AS OBJECT(
street VARCHAR(25),
city VARCHAR(25),
country VARCHAR(25));
/


CREATE TABLE customers(
customer_id NUMBER(6),
customer_name VARCHAR(25),
invoice_address invoice_address_type);


CREATE TABLE bill_addresses OF invoice_address_type;

DROP TABLE customers;

CREATE TABLE customers(
customer_id NUMBER(6),
customer_name VARCHAR(25),
invoice_address REF invoice_address_type SCOPE IS bill_addresses);


CREATE OR REPLACE TYPE state_type AS OBJECT(
state VARCHAR(25),
country VARCHAR(25));
/

CREATE TABLE states OF state_type;


ALTER TABLE sites ADD 
(state_ref REF state_type SCOPE IS states);

DROP TABLE customers;
DROP TABLE bill_addresses;
DROP TYPE invoice_address_type;
DROP TYPE state_type;
DROP TABLE states;

-- PART TWO

CREATE OR REPLACE TYPE social_media_type AS OBJECT(
media_name VARCHAR2(50),
contact VARCHAR2(50));
/

CREATE TYPE social_media_varray_type AS VARRAY(50) OF social_media_type;
/

CREATE TABLE prospective_customers(
prospective_customer_id  NUMBER(6),
company_name      VARCHAR2(50),
contact_name      VARCHAR2(50),
social_media_avalable   social_media_varray_type);



CREATE TYPE social_media_table_type AS TABLE OF social_media_type;
/

CREATE TABLE adverts(
advert_id   NUMBER(6),
advert_title  VARCHAR2(50),
description   VARCHAR(50),
social_media_used   social_media_table_type)
NESTED TABLE social_media_used STORE AS social_media_table;


DROP TABLE adverts;
DROP TABLE prospective_customers;
DROP TYPE social_media_varray_type;
DROP TYPE social_media_table_type;
DROP TYPE social_media_type;