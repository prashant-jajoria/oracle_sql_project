--****PLEASE ENTER YOUR DETAILS BELOW****
--Q1b-tds-dm.sql
--Student ID: 31187366
--Student Name: PRASHANT JAJORIA
--Tutorial No:  ASSIGNMENT 2

SET SERVEROUTPUT ON;


/* Comments for your marker:




*/


/*
1b(i) Create a sequence 
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) FOR THIS PART HERE

-- Drop if a sequence with name 'OFFENCE_offence_no_SEQ' already exists.
DROP SEQUENCE OFFENCE_offence_no_SEQ;

CREATE SEQUENCE OFFENCE_offence_no_SEQ START WITH 100 INCREMENT BY 1;


/*
1b(ii) Take the necessary steps in the database to record data.
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) FOR THIS PART HERE

INSERT INTO OFFENCE VALUES (OFFENCE_offence_no_SEQ.nextval,TO_DATE('10-Aug-2019 08:04:00 AM','dd-mon-yyyy hh:mi:ss PM'),'Center Road, Clayton VIC 3168',
(SELECT DEM_CODE FROM DEMERIT WHERE DEM_DESCRIPTION LIKE '%Blood alcohol charge%'),
10000011,
100389,
'JYA3HHE05RA070562');

INSERT INTO OFFENCE VALUES (OFFENCE_offence_no_SEQ.nextval,TO_DATE('16-Oct-2019 09:00:00 PM','dd-mon-yyyy hh:mi:ss PM'),'Thomas Street, Clayton VIC 3168',
(SELECT DEM_CODE FROM DEMERIT WHERE DEM_DESCRIPTION LIKE '%Level crossing offence%'),
10000015,
100389,
'JYA3HHE05RA070562');

INSERT INTO OFFENCE VALUES (OFFENCE_offence_no_SEQ.nextval,TO_DATE('07-Jan-2020 07:07:00 AM','dd-mon-yyyy hh:mi:ss PM'),'Bettina Street, Clayton VIC 3168',
(SELECT DEM_CODE FROM DEMERIT WHERE DEM_DESCRIPTION LIKE '%Exceeding the speed limit by 25 km/h or more%'),
10000015,
100389,
'JYA3HHE05RA070562');

/*
1b(iii) Take the necessary steps in the database to record changes. 
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) FOR THIS PART HERE

UPDATE OFFENCE 
SET DEM_CODE = (SELECT DEM_CODE FROM DEMERIT WHERE DEM_DESCRIPTION LIKE '%Exceeding the speed limit by 10 km/h or more but less than 25 km/h%')
WHERE LIC_NO = 100389 AND OFF_DATETIME = TO_DATE('07-Jan-2020 07:07:00 AM','dd-mon-yyyy hh:mi:ss PM');


