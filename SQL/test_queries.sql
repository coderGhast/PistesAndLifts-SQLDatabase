/*
	CS27020 Pistes and Lifts Assignment
	PostgreSQL commands for querying a 'working database' for specific data.
	Author: James Euesden (jee22@aber.ac.uk)
	Date: 20/2/14
*/

-- SELECT the Pistes serviced by a particular Lift.
SELECT lifts.lift_name, pistes.*
	FROM piste pistes
		INNER JOIN connections conns
	ON pistes.piste_uid=conns.piste_uid
		INNER JOIN lift lifts
	ON lifts.lift_uid=conns.lift_uid
		AND lifts.lift_name='Schoenjochbahn I';
	
	
-- SELECT the Lifts that provide access to a given Piste.
SELECT pistes.piste_name, lifts.*
	FROM lift lifts
		INNER JOIN connections conns
	ON lifts.lift_uid=conns.lift_uid
		INNER JOIN piste pistes
	ON pistes.piste_uid=conns.piste_uid
		AND pistes.piste_name='Zwischenholzabfahrt';
	
-- SELECT the Lifts that are currently operating.
SELECT lift_name, operating
	FROM lift WHERE operating='t';

-- SELECT the Pistes that are currently open, together with the lifts that are currently operating and that provide access to those pistes.
SELECT pistes.piste_uid, pistes.piste_name, pistes.open_piste, lifts.lift_uid, lifts.lift_name, lifts.operating
FROM
	connections conns
		INNER JOIN piste pistes
	ON pistes.open_piste='t' 
		INNER JOIN lift lifts
	ON lifts.operating='t'
		AND pistes.piste_uid=conns.piste_uid
		AND lifts.lift_uid=conns.lift_uid;