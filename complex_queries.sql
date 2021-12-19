--****PLEASE ENTER YOUR DETAILS BELOW****
--Q2-tds-queries.sql
--Student ID: 31187366
--Student Name: PRASHANT JAJORIA
--Tutorial No: ASSIGNMENT 2

/* Comments for your marker:

Comments specific to Questions are added before the start of each Query.


*/


/*
2(i) Query 1
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE

SELECT DEM_POINTS "Demerit Points", DEM_DESCRIPTION "Demerit Description" FROM DEMERIT
WHERE 
DEM_DESCRIPTION LIKE '%Heavy%'
OR DEM_DESCRIPTION LIKE '%heavy%'
OR DEM_DESCRIPTION LIKE 'Exceed%'
ORDER BY DEM_POINTS, DEM_DESCRIPTION;




/*
2(ii) Query 2
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE

SELECT veh_maincolor "Main Colour", veh_vin "VIN", EXTRACT(YEAR FROM veh_yrmanuf) "Year Manufactured" FROM VEHICLE
WHERE 
( VEH_MODNAME = 'Range Rover' OR VEH_MODNAME = 'Range Rover Sport' )
AND
EXTRACT(YEAR FROM veh_yrmanuf) IN (2012,2013,2014)
ORDER BY veh_yrmanuf DESC, veh_maincolor;




/*
2(iii) Query 3
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE

SELECT D.LIC_NO "Licence No.", LIC_FNAME || ' ' || LIC_LNAME "Driver Fullname", to_char(LIC_DOB,'dd-Mon-yyyy') "DOB", 
lic_street || ' ' || lic_town || ' ' || lic_postcode "Driver Address",
to_char(SUS_DATE,'dd/Mon/yyyy') "Suspended On", to_char(SUS_ENDDATE,'dd/Mon/yyyy') "Suspended Till"
FROM DRIVER D JOIN SUSPENSION S ON D.LIC_NO = S.LIC_NO
WHERE MONTHS_BETWEEN(CURRENT_DATE,SUS_DATE) <= 30;



/*
2(iv) Query 4
*/

SELECT CODE_ALL "Demerit Code",DEM_DESCRIPTION "Demerit Description","Total Offences (All Months)",
nvl("Jan",0) "Jan",nvl("Feb",0) "Feb",nvl("Mar",0) "Mar",nvl("Apr",0) "Apr",nvl("May",0)"May",nvl("Jun",0) "Jun",
nvl("Jul",0) "Jul",nvl("Aug",0) "Aug",nvl("Sep",0) "Sep",nvl("Oct",0) "Oct",nvl("Nov",0) "Nov",nvl("Dec",0) "Dec"
FROM
    (SELECT d.dem_code "CODE_ALL",d.dem_description, COUNT(O.DEM_CODE) "Total Offences (All Months)"
    FROM DEMERIT D 
    LEFT JOIN OFFENCE O
    ON D.DEM_CODE = O.DEM_CODE
    GROUP BY d.dem_code,d.dem_description)
    
    left JOIN 

    (select D.dem_code "CODE_JAN",count(*) "Jan"
    FROM DEMERIT D
    JOIN OFFENCE O ON D.DEM_CODE = O.DEM_CODE
    where TO_CHAR(O.OFF_DATETIME,'mon') = 'jan'
    group by d.dem_code)
ON CODE_ALL = CODE_JAN

    LEFT JOIN 
    
    (select D.dem_code "CODE_FEB",count(*) "Feb"
    FROM DEMERIT D
    JOIN OFFENCE O ON D.DEM_CODE = O.DEM_CODE
    where TO_CHAR(O.OFF_DATETIME,'mon') = 'feb'
    group by d.dem_code) 
ON CODE_ALL = CODE_FEB

    LEFT JOIN 
    
    (select D.dem_code "CODE_MAR",count(*) "Mar"
    FROM DEMERIT D
    JOIN OFFENCE O ON D.DEM_CODE = O.DEM_CODE
    where TO_CHAR(O.OFF_DATETIME,'mon') = 'mar'
    group by d.dem_code) 
ON CODE_ALL = CODE_MAR

    LEFT JOIN 
    
    (select D.dem_code "CODE_APR",count(*) "Apr"
    FROM DEMERIT D
    JOIN OFFENCE O ON D.DEM_CODE = O.DEM_CODE
    where TO_CHAR(O.OFF_DATETIME,'mon') = 'apr'
    group by d.dem_code) 
ON CODE_ALL = CODE_APR

    LEFT JOIN 
    
    (select D.dem_code "CODE_MAY",count(*) "May"
    FROM DEMERIT D
    JOIN OFFENCE O ON D.DEM_CODE = O.DEM_CODE
    where TO_CHAR(O.OFF_DATETIME,'mon') = 'may'
    group by d.dem_code) 
ON CODE_ALL = CODE_MAY

    LEFT JOIN 
    
    (select D.dem_code "CODE_JUN",count(*) "Jun"
    FROM DEMERIT D
    JOIN OFFENCE O ON D.DEM_CODE = O.DEM_CODE
    where TO_CHAR(O.OFF_DATETIME,'mon') = 'jun'
    group by d.dem_code) 
ON CODE_ALL = CODE_JUN

    LEFT JOIN 
    
    (select D.dem_code "CODE_JUL",count(*) "Jul"
    FROM DEMERIT D
    JOIN OFFENCE O ON D.DEM_CODE = O.DEM_CODE
    where TO_CHAR(O.OFF_DATETIME,'mon') = 'jul'
    group by d.dem_code) 
ON CODE_ALL = CODE_JUL

    LEFT JOIN 
    
    (select D.dem_code "CODE_AUG",count(*) "Aug"
    FROM DEMERIT D
    JOIN OFFENCE O ON D.DEM_CODE = O.DEM_CODE
    where TO_CHAR(O.OFF_DATETIME,'mon') = 'aug'
    group by d.dem_code) 
ON CODE_ALL = CODE_AUG

    LEFT JOIN 
    
    (select D.dem_code "CODE_SEP",count(*) "Sep"
    FROM DEMERIT D
    JOIN OFFENCE O ON D.DEM_CODE = O.DEM_CODE
    where TO_CHAR(O.OFF_DATETIME,'mon') = 'sep'
    group by d.dem_code) 
ON CODE_ALL = CODE_SEP

    LEFT JOIN 
    
    (select D.dem_code "CODE_OCT",count(*) "Oct"
    FROM DEMERIT D
    JOIN OFFENCE O ON D.DEM_CODE = O.DEM_CODE
    where TO_CHAR(O.OFF_DATETIME,'mon') = 'oct'
    group by d.dem_code) 
ON CODE_ALL = CODE_OCT

    LEFT JOIN 
    
    (select D.dem_code "CODE_NOV",count(*) "Nov"
    FROM DEMERIT D
    JOIN OFFENCE O ON D.DEM_CODE = O.DEM_CODE
    where TO_CHAR(O.OFF_DATETIME,'mon') = 'nov'
    group by d.dem_code) 
ON CODE_ALL = CODE_NOV

    LEFT JOIN 
    
    (select D.dem_code "CODE_DEC",count(*) "Dec"
    FROM DEMERIT D
    JOIN OFFENCE O ON D.DEM_CODE = O.DEM_CODE
    where TO_CHAR(O.OFF_DATETIME,'mon') = 'dec'
    group by d.dem_code) 
ON CODE_ALL = CODE_DEC

order by "Total Offences (All Months)" DESC, "Demerit Code";

/*
2(v) Query 5
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE

select v.veh_manufname "Manufacturer Name", count(*) "Total No. of Offences" from 
vehicle v join offence o on v.veh_vin = o.veh_vin
join demerit d on o.dem_code = d.dem_code
where d.dem_points >= 2
group by v.veh_manufname
having count(*) = 
                    (select count(*) from 
                    vehicle v join offence o on v.veh_vin = o.veh_vin
                    join demerit d on o.dem_code = d.dem_code
                    where d.dem_points >= 2
                    group by v.veh_manufname
                    order by count(*) desc
                    FETCH FIRST 1 ROWS ONLY);


/*
2(vi) Query 6
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE

-- Inserting data for Driver named 'Debbie Hedling' booked by officer named 'Dolley Hedling' to run this scenario. 
INSERT INTO offence VALUES (
    offence_offence_no_seq.NEXTVAL,
    TO_DATE('2019/12/31 01:01:01', 'yyyy/mm/dd hh24:mi:ss'),
    'Long Street, Noble park VIC 3174',
    109,
    10000011,
    100011,
    'JM0ER10L200236251'
);

SELECT D.LIC_NO "Licence No.",LIC_FNAME || ' ' || LIC_LNAME "Driver Name", OFC.OFFICER_ID "Officer ID", OFC.OFFICER_FNAME || ' ' || OFC.OFFICER_LNAME "Officer Name"
FROM
    OFFENCE O JOIN DRIVER D ON D.LIC_NO = O.LIC_NO
    JOIN OFFICER OFC ON OFC.OFFICER_ID = O.OFFICER_ID
WHERE LIC_LNAME = OFC.OFFICER_LNAME
GROUP BY D.LIC_NO, LIC_FNAME, LIC_LNAME, OFC.OFFICER_ID, OFC.OFFICER_FNAME, OFC.OFFICER_LNAME
HAVING count(*) >= 2;


/*
2(vii) Query 7
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE

-- Adding more data to Offence table to get higher number of Total Crimes. 

INSERT INTO offence VALUES (
    offence_offence_no_seq.NEXTVAL,
    TO_DATE('2018/02/02 02:02:02', 'yyyy/mm/dd hh24:mi:ss'),
    'New Street, Noble park VIC 3174',
    99,
    10000016,
    100051,
    '2T1FF22P01C442928'
);
COMMIT;

INSERT INTO offence VALUES (
    offence_offence_no_seq.NEXTVAL,
    TO_DATE('2018/03/02 02:02:02', 'yyyy/mm/dd hh24:mi:ss'),
    'New Long Street, Noble park VIC 3174',
    99,
    10000016,
    100051,
    '2T1FF22P01C442928'
);
COMMIT;

INSERT INTO offence VALUES (
    offence_offence_no_seq.NEXTVAL,
    TO_DATE('2018/04/02 02:02:02', 'yyyy/mm/dd hh24:mi:ss'),
    'New Long Street, Noble park VIC 3174',
    99,
    10000018,
    100051,
    '2T1FF22P01C442928'
);
COMMIT;



SELECT D1.DEM_CODE "Demerit code", D1.DEM_DESCRIPTION "Demerit Description", O.LIC_NO "Licence No.", LIC_FNAME || ' ' || LIC_LNAME "Driver Fullname", COUNT(*) "Total Times Booked"
FROM
    OFFENCE O JOIN DEMERIT D1 ON D1.DEM_CODE = O.DEM_CODE
    JOIN DRIVER D ON D.LIC_NO = O.LIC_NO
GROUP BY D1.DEM_CODE, D1.DEM_DESCRIPTION,O.LIC_NO, LIC_FNAME, LIC_LNAME
HAVING COUNT(*) = 
                    (SELECT COUNT(*)
                    FROM
                        OFFENCE O JOIN DEMERIT D2 ON D2.DEM_CODE = O.DEM_CODE
                        JOIN DRIVER D ON D.LIC_NO = O.LIC_NO
                    WHERE D1.DEM_CODE = d2.dem_code
                    GROUP BY D2.DEM_CODE, D2.DEM_DESCRIPTION,O.LIC_NO, LIC_FNAME, LIC_LNAME
                    ORDER BY COUNT(*) DESC
                    FETCH FIRST 1 ROWS ONLY)
ORDER BY D1.DEM_CODE, O.LIC_NO ;
/*
2(viii) Query 8
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE

SELECT
DECODE(GROUPING(
    CASE
        WHEN VEH_VIN LIKE 'A%' THEN 'Africa'
        WHEN VEH_VIN LIKE 'B%' THEN 'Africa'
        WHEN VEH_VIN LIKE 'C%' THEN 'Africa'
        
        WHEN VEH_VIN LIKE 'J%' THEN 'Asia'
        WHEN VEH_VIN LIKE 'K%' THEN 'Asia'
        WHEN VEH_VIN LIKE 'L%' THEN 'Asia'
        WHEN VEH_VIN LIKE 'M%' THEN 'Asia'
        WHEN VEH_VIN LIKE 'N%' THEN 'Asia'
        WHEN VEH_VIN LIKE 'O%' THEN 'Asia'
        WHEN VEH_VIN LIKE 'P%' THEN 'Asia'
        WHEN VEH_VIN LIKE 'Q%' THEN 'Asia'
        WHEN VEH_VIN LIKE 'R%' THEN 'Asia'
    
        WHEN VEH_VIN LIKE 'S%' THEN 'Europe'
        WHEN VEH_VIN LIKE 'T%' THEN 'Europe'
        WHEN VEH_VIN LIKE 'U%' THEN 'Europe'
        WHEN VEH_VIN LIKE 'V%' THEN 'Europe'
        WHEN VEH_VIN LIKE 'W%' THEN 'Europe'
        WHEN VEH_VIN LIKE 'X%' THEN 'Europe'
        WHEN VEH_VIN LIKE 'Y%' THEN 'Europe'
        WHEN VEH_VIN LIKE 'Z%' THEN 'Europe'
        
        WHEN VEH_VIN LIKE '1%' THEN 'North America'
        WHEN VEH_VIN LIKE '2%' THEN 'North America'
        WHEN VEH_VIN LIKE '3%' THEN 'North America'
        WHEN VEH_VIN LIKE '4%' THEN 'North America'
        WHEN VEH_VIN LIKE '5%' THEN 'North America'
        
        WHEN VEH_VIN LIKE '6%' THEN 'Oceania '
        WHEN VEH_VIN LIKE '7%' THEN 'Oceania '

        WHEN VEH_VIN LIKE '8%' THEN 'South America'
        WHEN VEH_VIN LIKE '9%' THEN 'South America'
        
        ELSE 'Unknown'
        END),
        1,lpad('TOTAL',13),
        0,
        CASE
            WHEN VEH_VIN LIKE 'A%' THEN 'Africa'
            WHEN VEH_VIN LIKE 'B%' THEN 'Africa'
            WHEN VEH_VIN LIKE 'C%' THEN 'Africa'
            
            WHEN VEH_VIN LIKE 'J%' THEN 'Asia'
            WHEN VEH_VIN LIKE 'K%' THEN 'Asia'
            WHEN VEH_VIN LIKE 'L%' THEN 'Asia'
            WHEN VEH_VIN LIKE 'M%' THEN 'Asia'
            WHEN VEH_VIN LIKE 'N%' THEN 'Asia'
            WHEN VEH_VIN LIKE 'O%' THEN 'Asia'
            WHEN VEH_VIN LIKE 'P%' THEN 'Asia'
            WHEN VEH_VIN LIKE 'Q%' THEN 'Asia'
            WHEN VEH_VIN LIKE 'R%' THEN 'Asia'
        
            WHEN VEH_VIN LIKE 'S%' THEN 'Europe'
            WHEN VEH_VIN LIKE 'T%' THEN 'Europe'
            WHEN VEH_VIN LIKE 'U%' THEN 'Europe'
            WHEN VEH_VIN LIKE 'V%' THEN 'Europe'
            WHEN VEH_VIN LIKE 'W%' THEN 'Europe'
            WHEN VEH_VIN LIKE 'X%' THEN 'Europe'
            WHEN VEH_VIN LIKE 'Y%' THEN 'Europe'
            WHEN VEH_VIN LIKE 'Z%' THEN 'Europe'
            
            WHEN VEH_VIN LIKE '1%' THEN 'North America'
            WHEN VEH_VIN LIKE '2%' THEN 'North America'
            WHEN VEH_VIN LIKE '3%' THEN 'North America'
            WHEN VEH_VIN LIKE '4%' THEN 'North America'
            WHEN VEH_VIN LIKE '5%' THEN 'North America'
            
            WHEN VEH_VIN LIKE '6%' THEN 'Oceania '
            WHEN VEH_VIN LIKE '7%' THEN 'Oceania '
    
            WHEN VEH_VIN LIKE '8%' THEN 'South America'
            WHEN VEH_VIN LIKE '9%' THEN 'South America'
            
            ELSE 'Unknown'
            END) "Region",
    COUNT(*) "Total Vehicles Manufactured",
    lpad(to_char(round((count(*)/(select count(*) from vehicle)) * 100,2),'990.00'),32) || '%' "Percentage of vehicles Manufactured"
FROM VEHICLE
GROUP BY ROLLUP(
(
CASE
        WHEN VEH_VIN LIKE 'A%' THEN 'Africa'
        WHEN VEH_VIN LIKE 'B%' THEN 'Africa'
        WHEN VEH_VIN LIKE 'C%' THEN 'Africa'
        
        WHEN VEH_VIN LIKE 'J%' THEN 'Asia'
        WHEN VEH_VIN LIKE 'K%' THEN 'Asia'
        WHEN VEH_VIN LIKE 'L%' THEN 'Asia'
        WHEN VEH_VIN LIKE 'M%' THEN 'Asia'
        WHEN VEH_VIN LIKE 'N%' THEN 'Asia'
        WHEN VEH_VIN LIKE 'O%' THEN 'Asia'
        WHEN VEH_VIN LIKE 'P%' THEN 'Asia'
        WHEN VEH_VIN LIKE 'Q%' THEN 'Asia'
        WHEN VEH_VIN LIKE 'R%' THEN 'Asia'
    
        WHEN VEH_VIN LIKE 'S%' THEN 'Europe'
        WHEN VEH_VIN LIKE 'T%' THEN 'Europe'
        WHEN VEH_VIN LIKE 'U%' THEN 'Europe'
        WHEN VEH_VIN LIKE 'V%' THEN 'Europe'
        WHEN VEH_VIN LIKE 'W%' THEN 'Europe'
        WHEN VEH_VIN LIKE 'X%' THEN 'Europe'
        WHEN VEH_VIN LIKE 'Y%' THEN 'Europe'
        WHEN VEH_VIN LIKE 'Z%' THEN 'Europe'
        
        WHEN VEH_VIN LIKE '1%' THEN 'North America'
        WHEN VEH_VIN LIKE '2%' THEN 'North America'
        WHEN VEH_VIN LIKE '3%' THEN 'North America'
        WHEN VEH_VIN LIKE '4%' THEN 'North America'
        WHEN VEH_VIN LIKE '5%' THEN 'North America'
        
        WHEN VEH_VIN LIKE '6%' THEN 'Oceania '
        WHEN VEH_VIN LIKE '7%' THEN 'Oceania '

        WHEN VEH_VIN LIKE '8%' THEN 'South America'
        WHEN VEH_VIN LIKE '9%' THEN 'South America'
        
        ELSE 'Unknown'
    END
))
order by COUNT(*),"Region";

