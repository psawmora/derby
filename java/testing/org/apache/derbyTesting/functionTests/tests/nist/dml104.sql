AUTOCOMMIT OFF;

-- MODULE  DML104  

-- SQL Test Suite, V6.0, Interactive SQL, dml104.sql
-- 59-byte ID
-- TEd Version #

-- AUTHORIZATION FLATER            
   set schema FLATER;

--O   SELECT USER FROM HU.ECCO;
  VALUES USER;
-- RERUN if USER value does not match preceding AUTHORIZATION comment
   ROLLBACK WORK;

-- date_time print

-- TEST:0591 NATURAL JOIN (feature 4) (static)!

   CREATE TABLE GROUPS1
  (EMPNUM INT, GRP INT);
-- PASS:0591 If table is created?

   CREATE TABLE NAMES1
  (EMPNUM INT, NAME CHAR(5));
-- PASS:0591 If table is created?

  SELECT * FROM NAMES1 JOIN GROUPS1 ON (NAMES1.EMPNUM=GROUPS1.EMPNUM);

   CREATE VIEW NAMGRP1 (EMPNUM, NAME, NEMPNUM, GRP) AS
--O  SELECT * FROM NAMES1 NATURAL JOIN GROUPS1;
  SELECT * FROM NAMES1 JOIN GROUPS1 ON (NAMES1.EMPNUM=GROUPS1.EMPNUM);
-- PASS:0591 If view is created?

   COMMIT WORK;

   INSERT INTO GROUPS1 VALUES (0, 10);
-- PASS:0591 If 1 row is inserted?

   INSERT INTO GROUPS1 VALUES (1, 20);
-- PASS:0591 If 1 row is inserted?

   INSERT INTO GROUPS1 VALUES (2, 30);
-- PASS:0591 If 1 row is inserted?

   INSERT INTO GROUPS1 VALUES (3, 40);
-- PASS:0591 If 1 row is inserted?

   INSERT INTO NAMES1 VALUES (5, 'HARRY');
-- PASS:0591 If 1 row is inserted?

   INSERT INTO NAMES1 VALUES (1, 'MARY');
-- PASS:0591 If 1 row is inserted?

   INSERT INTO NAMES1 VALUES (7, 'LARRY');
-- PASS:0591 If 1 row is inserted?

   INSERT INTO NAMES1 VALUES (0, 'KERI');
-- PASS:0591 If 1 row is inserted?

   INSERT INTO NAMES1 VALUES (9, 'BARRY');
-- PASS:0591 If 1 row is inserted?

   SELECT EMPNUM
  FROM NAMGRP1
  WHERE NAME = 'KERI'
  AND GRP = 10;
-- PASS:0591 If 1 row is selected and EMPNUM = 0?

   SELECT EMPNUM
  FROM NAMGRP1
  WHERE NAME = 'MARY'
  AND GRP = 20;
-- PASS:0591 If 1 row is selected and EMPNUM = 1?

   SELECT COUNT(*)
  FROM NAMGRP1
  WHERE (NAME <> 'MARY'
  AND NAME <> 'KERI')
  OR GRP <> 20
  AND GRP <> 10
  OR EMPNUM <> 0
  AND EMPNUM <> 1
  OR NAME IS NULL
  OR GRP IS NULL
  OR EMPNUM IS NULL;
-- PASS:0591 If count = 0?

   ROLLBACK WORK;

--O   DROP TABLE NAMES1 CASCADE;
   DROP VIEW NAMGRP1 ;
   DROP TABLE NAMES1 ;
-- PASS:0591 If table and view are dropped?

--O   DROP TABLE GROUPS1 CASCADE;
   DROP TABLE GROUPS1 ;
-- PASS:0591 If table is dropped?

   COMMIT WORK;

-- END TEST >>> 0591 <<< END TEST
-- *********************************************

-- TEST:0592 INNER JOIN (feature 4) (static)!

   CREATE TABLE GROUPS2
  (EMPNUM SMALLINT, GRP INT);
-- PASS:0592 If table is created?

   CREATE TABLE NAMES2
  (EMPNUM INT, NAME CHAR(5));
-- PASS:0592 If table is created?

   CREATE VIEW NAMGRP2 (EMPNUM, NAME, NEMPNUM, GRP) AS
  SELECT * FROM NAMES2 INNER JOIN GROUPS2 ON (NAMES2.EMPNUM=GROUPS2.EMPNUM);
-- PASS:0592 If view is created?

   CREATE VIEW NMGRP2 (EMPNUM, NAME, NEMPNUM, GRP) AS
  SELECT * FROM NAMES2 JOIN GROUPS2 
    ON (NAMES2.EMPNUM=GROUPS2.EMPNUM) WHERE NAMES2.EMPNUM > 0;
-- PASS:0592 If view is created?

   COMMIT WORK;

   INSERT INTO GROUPS2 VALUES (0, 10);
-- PASS:0592 If 1 row is inserted?

   INSERT INTO GROUPS2 VALUES (1, 20);
-- PASS:0592 If 1 row is inserted?

   INSERT INTO GROUPS2 VALUES (2, 30);
-- PASS:0592 If 1 row is inserted?

   INSERT INTO GROUPS2 VALUES (3, 40);
-- PASS:0592 If 1 row is inserted?

   INSERT INTO NAMES2 VALUES (5, 'HARRY');
-- PASS:0592 If 1 row is inserted?

   INSERT INTO NAMES2 VALUES (1, 'MARY');
-- PASS:0592 If 1 row is inserted?

   INSERT INTO NAMES2 VALUES (7, 'LARRY');
-- PASS:0592 If 1 row is inserted?

   INSERT INTO NAMES2 VALUES (0, 'KERI');
-- PASS:0592 If 1 row is inserted?

   INSERT INTO NAMES2 VALUES (9, 'BARRY');
-- PASS:0592 If 1 row is inserted?

   SELECT EMPNUM
  FROM NAMGRP2
  WHERE NAME = 'KERI'
  AND GRP = 10;
-- PASS:0592 If 1 row is selected and EMPNUM = 0?

   SELECT EMPNUM
  FROM NAMGRP2
  WHERE NAME = 'MARY'
  AND GRP = 20;
-- PASS:0592 If 1 row is selected and EMPNUM = 1?

   SELECT COUNT(*)
  FROM NAMGRP2
  WHERE NAME <> 'MARY'
  AND NAME <> 'KERI'
  OR GRP <> 20
  AND GRP <> 10
  OR EMPNUM <> 0
  AND EMPNUM <> 1
  OR NAME IS NULL
  OR GRP IS NULL
  OR EMPNUM IS NULL;
-- PASS:0592 If count = 0?

   SELECT EMPNUM
  FROM NMGRP2
  WHERE NAME = 'MARY'
  AND GRP = 20;
-- PASS:0592 If 1 row is selected and EMPNUM = 1?

   SELECT COUNT(*)
  FROM NMGRP2
  WHERE NAME <> 'MARY'
  OR GRP <> 20
  OR EMPNUM <> 1
  OR NAME IS NULL
  OR GRP IS NULL
  OR EMPNUM IS NULL;
-- PASS:0592 If count = 0?

   ROLLBACK WORK;

--O   DROP TABLE NAMES2 CASCADE;
   DROP VIEW NMGRP2 ;
   DROP VIEW NAMGRP2 ;
   DROP TABLE NAMES2 ;
-- PASS:0592 If table and 2 views are dropped?

--O   DROP TABLE GROUPS2 CASCADE;
   DROP TABLE GROUPS2 ;
-- PASS:0592 If table is dropped?

   COMMIT WORK;

-- END TEST >>> 0592 <<< END TEST
-- *********************************************

-- TEST:0593 LEFT OUTER JOIN (feature 4) (static)!

   CREATE TABLE GROUPS3
  (EMPNUM INT, GRP INT);
-- PASS:0593 If table is created?

   CREATE TABLE NAMES3
  (EMPNUM INT, NAME CHAR(5));
-- PASS:0593 If table is created?

   CREATE VIEW NAMGRP3 (EMPNUM, NAME, NEMPNUM, GRP) AS
  SELECT * FROM NAMES3 LEFT OUTER JOIN GROUPS3 ON (NAMES3.EMPNUM=GROUPS3.EMPNUM);
-- PASS:0593 If view is created?

   CREATE VIEW NMGRP3 (NAME, GRP) AS
  SELECT NAME, GRP FROM NAMES3 LEFT OUTER JOIN GROUPS3
  ON NAMES3.EMPNUM < GROUPS3.EMPNUM
  WHERE NAME <> 'KERI';
-- PASS:0593 If view is created?

   COMMIT WORK;

   INSERT INTO GROUPS3 VALUES (0, 10);
-- PASS:0593 If 1 row is inserted?

   INSERT INTO GROUPS3 VALUES (1, 20);
-- PASS:0593 If 1 row is inserted?

   INSERT INTO GROUPS3 VALUES (2, 30);
-- PASS:0593 If 1 row is inserted?

   INSERT INTO GROUPS3 VALUES (3, 40);
-- PASS:0593 If 1 row is inserted?

   INSERT INTO NAMES3 VALUES (5, 'HARRY');
-- PASS:0593 If 1 row is inserted?

   INSERT INTO NAMES3 VALUES (1, 'MARY');
-- PASS:0593 If 1 row is inserted?

   INSERT INTO NAMES3 VALUES (7, 'LARRY');
-- PASS:0593 If 1 row is inserted?

   INSERT INTO NAMES3 VALUES (0, 'KERI');
-- PASS:0593 If 1 row is inserted?

   INSERT INTO NAMES3 VALUES (9, 'BARRY');
-- PASS:0593 If 1 row is inserted?

   SELECT COUNT(*)
  FROM NAMGRP3
  WHERE EMPNUM = 0
  AND NAME = 'KERI'
  AND GRP = 10;
-- PASS:0593 If count = 1?

   SELECT COUNT(*)
  FROM NAMGRP3
  WHERE EMPNUM = 1
  AND NAME = 'MARY'
  AND GRP = 20;
-- PASS:0593 If count = 1?

   SELECT COUNT(*)
  FROM NAMGRP3
  WHERE EMPNUM = 5
  AND NAME = 'HARRY'
  AND GRP IS NULL;
-- PASS:0593 If count = 1?

   SELECT COUNT(*)
  FROM NAMGRP3
  WHERE EMPNUM = 7
  AND NAME = 'LARRY'
  AND GRP IS NULL;
-- PASS:0593 If count = 1?

   SELECT COUNT(*)
  FROM NAMGRP3
  WHERE EMPNUM = 9
  AND NAME = 'BARRY'
  AND GRP IS NULL;
-- PASS:0593 If count = 1?

   SELECT COUNT(*)
  FROM NAMGRP3;
-- PASS:0593 If count = 5?

   SELECT COUNT(*)
  FROM NMGRP3
  WHERE NAME = 'HARRY'
  AND GRP IS NULL;
-- PASS:0593 If count = 1?

   SELECT COUNT(*)
  FROM NMGRP3
  WHERE NAME = 'MARY'
  AND GRP = 30;
-- PASS:0593 If count = 1?

   SELECT COUNT(*)
  FROM NMGRP3
  WHERE NAME = 'MARY'
  AND GRP = 40;
-- PASS:0593 If count = 1?

   SELECT COUNT(*)
  FROM NMGRP3
  WHERE NAME = 'BARRY'
  AND GRP IS NULL;
-- PASS:0593 If count = 1?

   SELECT COUNT(*)
  FROM NMGRP3
  WHERE NAME = 'LARRY'
  AND GRP IS NULL;
-- PASS:0593 If count = 1?

   SELECT COUNT(*)
  FROM NMGRP3;
-- PASS:0593 If count = 5?

   ROLLBACK WORK;

--O   DROP TABLE NAMES3 CASCADE;
   DROP VIEW NMGRP3 ;
   DROP VIEW NAMGRP3 ;
   DROP TABLE NAMES3 ;
-- PASS:0593 If table and 2 views are dropped?

--O   DROP TABLE GROUPS3 CASCADE;
   DROP TABLE GROUPS3 ;
-- PASS:0593 If table is dropped?

   COMMIT WORK;

-- END TEST >>> 0593 <<< END TEST
-- *********************************************

-- TEST:0594 RIGHT OUTER JOIN (feature 4) (static)!

   CREATE TABLE GROUPS4
  (EMPNUM INT, GRP INT);
-- PASS:0594 If table is created?

   CREATE TABLE NAMES4
  (EMPNUM DECIMAL (4, 2), NAME CHAR(5));
-- PASS:0594 If table is created?

   CREATE VIEW NAMGRP4 (NEMPNUM, NAME, EMPNUM, GRP) AS
  SELECT * FROM NAMES4 RIGHT OUTER JOIN GROUPS4 ON (NAMES4.EMPNUM=GROUPS4.EMPNUM);
-- PASS:0594 If view is created?

   COMMIT WORK;

   INSERT INTO GROUPS4 VALUES (0, 10);
-- PASS:0594 If 1 row is inserted?

   INSERT INTO GROUPS4 VALUES (1, 20);
-- PASS:0594 If 1 row is inserted?

   INSERT INTO GROUPS4 VALUES (2, 30);
-- PASS:0594 If 1 row is inserted?

   INSERT INTO GROUPS4 VALUES (3, 40);
-- PASS:0594 If 1 row is inserted?

   INSERT INTO NAMES4 VALUES (5.0, 'HARRY');
-- PASS:0594 If 1 row is inserted?

   INSERT INTO NAMES4 VALUES (1.0, 'MARY');
-- PASS:0594 If 1 row is inserted?

   INSERT INTO NAMES4 VALUES (7.0, 'LARRY');
-- PASS:0594 If 1 row is inserted?

   INSERT INTO NAMES4 VALUES (0.0, 'KERI');
-- PASS:0594 If 1 row is inserted?

   INSERT INTO NAMES4 VALUES (9.0, 'BARRY');
-- PASS:0594 If 1 row is inserted?

   SELECT COUNT(*)
  FROM NAMGRP4
  WHERE EMPNUM = 0
  AND NAME = 'KERI'
  AND GRP = 10;
-- PASS:0594 If count = 1?

   SELECT COUNT(*)
  FROM NAMGRP4
  WHERE EMPNUM = 1
  AND NAME = 'MARY'
  AND GRP = 20;
-- PASS:0594 If count = 1?

   SELECT COUNT(*)
  FROM NAMGRP4
  WHERE EMPNUM = 2
  AND NAME IS NULL
  AND GRP = 30;
-- PASS:0594 If count = 1?

   SELECT COUNT(*)
  FROM NAMGRP4
  WHERE EMPNUM = 3
  AND NAME IS NULL
  AND GRP = 40;
-- PASS:0594 If count = 1?

   SELECT COUNT(*)
  FROM NAMGRP4;
-- PASS:0594 If count = 4?

   ROLLBACK WORK;

--O   DROP TABLE NAMES4 CASCADE;
   DROP VIEW NAMGRP4 ;
   DROP TABLE NAMES4 ;
-- PASS:0594 If table and view are dropped?

--O   DROP TABLE GROUPS4 CASCADE;
   DROP TABLE GROUPS4 ;
-- PASS:0594 If table is dropped?

   COMMIT WORK;

-- END TEST >>> 0594 <<< END TEST
-- *************************************************////END-OF-MODULE
