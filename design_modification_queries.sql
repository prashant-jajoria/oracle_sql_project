--****PLEASE ENTER YOUR DETAILS BELOW****
--Q3-tds-mods.sql
--Student ID: 31187366
--Student Name: PRASHANT JAJORIA
--Tutorial No: ASSIGNMENT 2

/* Comments for your marker:




*/


/*
3(i) Changes to live database 1
*/
--PLEASE PLACE REQUIRED SQL STATEMENTS FOR THIS PART HERE
ALTER TABLE OFFICER
  ADD (OFFICER_DRIVERS_BOOKED NUMBER(5,0) DEFAULT 0
  );

UPDATE OFFICER OFF1
SET officer_drivers_booked = 
                            NVL((
                                SELECT COUNT(*)
                                    FROM OFFENCE OFFF JOIN OFFICER OFFR ON OFFF.OFFICER_ID = OFFR.OFFICER_ID
                                GROUP BY offf.officer_id
                                HAVING offf.officer_id = OFF1.officer_id
                            
                            ),0); 




/*
3(ii) Changes to live database 2
*/
--PLEASE PLACE REQUIRED SQL STATEMENTS FOR THIS PART HERE

-- Drop table 'REVOKE_REASON' if already exists in database
DROP table REVOKE_REASON cascade constraints purge;

-- Creating new table to store the Reason for revoke
CREATE TABLE REVOKE_REASON(
    REV_CODE CHAR(3) NOT NULL,
    REV_DESCRIPTION VARCHAR2(100) NOT NULL
);

-- Add primary key for REVOKE_REASON
ALTER TABLE REVOKE_REASON ADD CONSTRAINT pk_REVOKE_REASON PRIMARY KEY (REV_CODE);

-- Inserting data for Revoke reason
INSERT INTO REVOKE_REASON VALUES('FOS', 'First offence exceeding the speed limit by less than 10km/h');
INSERT INTO REVOKE_REASON VALUES('FEU', 'Faulty equipment used');
INSERT INTO REVOKE_REASON VALUES('DOU', 'Driver objection upheld');
INSERT INTO REVOKE_REASON VALUES('EIP', 'Error in proceedings');

-- Add OFF_REVOKED with value 'No'
ALTER TABLE OFFENCE
  ADD (OFF_REVOKED VARCHAR2(3) DEFAULT 'No'
  );

-- Drop table 'REVOKE_DETAILS' if already exists in database
DROP table REVOKE_DETAILS cascade constraints purge;

-- Table that connects OFFENCE and REVOKE_REASON tables
CREATE TABLE REVOKE_DETAILS
(
    REV_CODE char(3),
    REV_OFFICER_ID NUMBER(8,0),
    REV_DATE date
);

-- Add primary key for REVOKE_DETAILS
ALTER TABLE REVOKE_DETAILS ADD CONSTRAINT pk_REVOKE_DETAILS PRIMARY KEY (REV_CODE,REV_OFFICER_ID,REV_DATE);

-- Add Foreign keys for REVOKE_DETAILS
ALTER TABLE REVOKE_DETAILS ADD CONSTRAINT fk_REV_CODE FOREIGN KEY (REV_CODE) references REVOKE_REASON(REV_CODE);
ALTER TABLE REVOKE_DETAILS ADD CONSTRAINT fk_REV_OFFICER_ID FOREIGN KEY (REV_OFFICER_ID) references OFFICER(OFFICER_ID);




/*
3(iii) Changes to live database 3
*/
--PLEASE PLACE REQUIRED SQL STATEMENTS FOR THIS PART HERE

-- Drop table 'VEHICLE_PART' if already exists in database
DROP table VEHICLE_PART cascade constraints purge;

-- Create a new table to store the details of vehicle parts
CREATE TABLE VEHICLE_PART
(
    PART_CODE CHAR(2) NOT NULL,
    PART_NAME VARCHAR2(20) NOT NULL
);

-- Add primary key for VEHICLE_PART
ALTER TABLE VEHICLE_PART ADD CONSTRAINT pk_VEHICLE_PART PRIMARY KEY (PART_CODE);

-- Inserting data for Vehicle parts
INSERT INTO VEHICLE_PART VALUES('SP','Spoiler');
INSERT INTO VEHICLE_PART VALUEs('BM','Bumper');
INSERT INTO VEHICLE_PART VALUES('GR','Grilles');

-- Drop sequence if already in database
DROP SEQUENCE COLOUR_SEQ;

-- Sequence for Colour code
CREATE SEQUENCE COLOUR_SEQ START WITH 1 INCREMENT BY 1;

-- Drop table 'COLOURS' if already exists in database
DROP table COLOURS cascade constraints purge;

-- Table to store colour data
CREATE TABLE COLOURS
(
    COLOUR_CODE NUMBER(10) NOT NULL,
    COLOUR_NAME VARCHAR2(10) NOT NULL
);

-- Add primary key for COLOURS
ALTER TABLE COLOURS ADD CONSTRAINT pk_COLOURS PRIMARY KEY (COLOUR_CODE);

-- Adding values of Colours
INSERT INTO COLOURS VALUES(COLOUR_SEQ.nextval,'Black');
INSERT INTO COLOURS VALUES(COLOUR_SEQ.nextval,'Grey');
INSERT INTO COLOURS VALUES(COLOUR_SEQ.nextval,'Magenta');
INSERT INTO COLOURS VALUES(COLOUR_SEQ.nextval,'Yellow');
INSERT INTO COLOURS VALUES(COLOUR_SEQ.nextval,'Blue');

-- Drop table 'VEHICLE_OUTER_INFO' if already exists in database
DROP table VEHICLE_OUTER_INFO cascade constraints purge;

-- Table that links VEHICLE_PART and COLOURS tables
CREATE TABLE VEHICLE_OUTER_INFO(
    VEH_VIN CHAR(17),
    PART_CODE CHAR(2),
    COLOUR_CODE NUMBER(10)
);

-- Add primary key for VEHICLE_OUTER_INFO
ALTER TABLE VEHICLE_OUTER_INFO ADD CONSTRAINT pk_VEHICLE_OUTER_INFO PRIMARY KEY (VEH_VIN,PART_CODE,COLOUR_CODE);

-- Add Foreign keys for VEHICLE_OUTER_INFO
ALTER TABLE VEHICLE_OUTER_INFO ADD CONSTRAINT fk_PART_CODE FOREIGN KEY (PART_CODE) references VEHICLE_PART(PART_CODE);
ALTER TABLE VEHICLE_OUTER_INFO ADD CONSTRAINT fk_COLOUR_CODE FOREIGN KEY (COLOUR_CODE) references COLOURS(COLOUR_CODE);


-- Outer Parts data for Vehicle 1
INSERT INTO VEHICLE_OUTER_INFO VALUES('ZHWEF4ZF2LLA13803',
    (Select PART_CODE from VEHICLE_PART where PART_NAME like 'Spoiler'),
    (Select COLOUR_CODE from COLOURS where COLOUR_NAME like 'Black'));
    
INSERT INTO VEHICLE_OUTER_INFO VALUES('ZHWEF4ZF2LLA13803',
    (Select PART_CODE from VEHICLE_PART where PART_NAME like 'Grilles'),
    (Select COLOUR_CODE from COLOURS where COLOUR_NAME like 'Magenta'));

-- Outer Parts data for Vehicle 2
INSERT INTO VEHICLE_OUTER_INFO VALUES('ZHWES4ZF8KLA12259',
    (Select PART_CODE from VEHICLE_PART where PART_NAME like 'Spoiler'),
    (Select COLOUR_CODE from COLOURS where COLOUR_NAME like 'Yellow'));
    
INSERT INTO VEHICLE_OUTER_INFO VALUES('ZHWES4ZF8KLA12259',
    (Select PART_CODE from VEHICLE_PART where PART_NAME like 'Bumper'),
    (Select COLOUR_CODE from COLOURS where COLOUR_NAME like 'Blue'));
