-- @C:\Users\ramon\OneDrive\Documents\CSY2038\loop_prac.sql


SET SERVEROUTPUT ON

-- anonymous block displaying the name

DECLARE
vn_counter NUMBER(10)  := 1;
vc_firstname VARCHAR(20)  := 'ramona';
vc_surname  VARCHAR(20)  := 'crap';
vn_length NUMBER(10)  := LENGTH(vc_firstname);
vn_length NUMBER(10)  := LENGTH(vc_surname);
BEGIN

LOOP
	IF vn_counter> LENGTH(vc_firstname) THEN
		EXIT; 
	END IF;
	DBMS_OUTPUT.PUT_LINE(SUBSTR(vc_firstname, vn_counter, 1));
	vn_counter  :=  vn_counter +1 ;
	
END LOOP;

DBMS_OUTPUT.PUT_LINE(SUBSTR(vc_surname, 1));
END;
/


-- WHILE & FOR LOOPS/not working


DECLARE
vn_counter NUMBER(10)  := 1;
vc_firstname VARCHAR(20)  := 'ramona';
vc_surname  VARCHAR(20)  := 'crap';
vc_middlename  VARCHAR(20)  := 'florentina';
vn_length NUMBER(10)  := LENGTH(vc_firstname);
vn_length NUMBER(10)  := LENGTH(vc_surname);
BEGIN

LOOP
	IF vn_counter> LENGTH(vc_firstname) THEN
		EXIT; 
	END IF;
	DBMS_OUTPUT.PUT_LINE(SUBSTR(vc_firstname, vn_counter, 1));
	vn_counter  :=  vn_counter +1 ;
	
END LOOP;

WHILE vn_counter> LENGTH(vc_surname) LOOP

DBMS_OUTPUT.PUT_LINE(SUBSTR(vc_surname, vn_counter, 1));
	vn_counter  :=  vn_counter +1 ;
END LOOP;

FOR vn_counter IN 0 .. 1 LOOP

DBMS_OUTPUT.PUT_LINE(SUBSTR(vc_middlename, vn_counter, 1));
	vn_counter  :=  vn_counter +1 ;

END LOOP;


END;
/