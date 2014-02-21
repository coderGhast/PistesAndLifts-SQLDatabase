/*
	CS27020 Pistes and Lifts Assignment
	PostgreSQL commands for querying a 'working database' for specific data.
	Author: James Euesden (jee22@aber.ac.uk)
	Date: 20/2/14
*/

-- SELECT the Pistes services by a particular Lift.
SELECT piste_name FROM piste WHERE piste_uid IN 
	(SELECT piste_uid FROM connections WHERE lift_uid IN 
	(SELECT lift_uid FROM lift WHERE lift_name='Rastlift'));
	
-- SELECT the Lifts that provide access to a given Piste.
SELECT lift_name FROM lift WHERE lift_uid IN 
	(SELECT lift_uid FROM connections WHERE piste_uid IN 
	(SELECT piste_uid FROM piste WHERE piste_name='Rastabfahrt'));
	
-- SELECT the Lifts that are currently operating.
SELECT lift_name, operating FROM lift WHERE operating='t';

-- SELECT the Pistes that are currently open, together with the lifts that are currently operating and that provide access to those pistes.
-- GETS ALL UIDS CORRECTLY
SELECT * FROM connections WHERE lift_uid IN
	(SELECT lift_uid FROM lift WHERE operating='t')
AND piste_uid IN
	(SELECT piste_uid FROM piste WHERE open_piste='t');
	
-- GETS ALL LIFT NAMES CORRECTLY FROM FIRST QUERY
SELECT lift_name FROM lift WHERE lift_uid IN(
	
SELECT lift_uid FROM connections WHERE lift_uid IN
	(SELECT lift_uid FROM lift WHERE operating='t')
	AND piste_uid IN
	(SELECT piste_uid FROM piste WHERE open_piste='t'));

-- GETS ALL PISTE NAMES CORRECTLY FROM FIRST QUERY
SELECT piste_name FROM piste WHERE piste_uid IN(
	
SELECT piste_uid FROM connections WHERE piste_uid IN
	(SELECT piste_uid FROM piste WHERE open_piste='t')
	AND lift_uid IN
	(SELECT lift_uid FROM lift WHERE operating='t'));
	