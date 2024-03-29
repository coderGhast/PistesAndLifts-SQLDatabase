/*
	CS27020 Pistes and Lifts Assignment
	PostgreSQL commands for inserting sample data into the database.
	Author: James Euesden (jee22@aber.ac.uk)
	Date: 20/2/14
*/

-- For Sample Testing purposes, DELETE all current data
DELETE FROM connections CASCADE;
DELETE FROM piste CASCADE;
DELETE FROM lift CASCADE;
ALTER SEQUENCE piste_uid_seq RESTART WITH 1;
ALTER SEQUENCE lift_uid_seq RESTART WITH 1;

-- INSERT INTO the piste relation.
INSERT INTO piste (piste_name, grade, length_km, fall_m, open_piste) VALUES
	('Zwischenholzabfahrt', 'MEDIUM', 3, 440, true),
	('Moeseralmabfahrt', 'MEDIUM', 2.5, 400, false),
	('Schoenjochabfahrt', 'MEDIUM', 4, 510, true),
	('Sattelkopf-Suedabfahrt', 'MEDIUM', 4, 350, true),
	('Sattelkopf-Nordabfahrt', 'DIFFICULT', 1.5, 220, true),
	('Moeserabfahrt', 'EASY', 0.5, 80, true),
	('Wonneabfahrt', 'MEDIUM', 1.5, 280, false),
	('Rastabfahrt', 'MEDIUM', 1, 150, false),
	('Waldabfahrt', 'HARD', 3, 420, true),
	('Ladisabfahrt', 'EASY', 3.5, 290, true),
	('Verbindungsabfahrt', 'EASY', 2, 70, true),
	('Plazoerabfahrt', 'MEDIUM', 3, 360, false),
	('Schoengampabfahrt', 'MEDIUM', 3.5, 420, true),
	('Schoenjochpiste', 'EASY', 1, 70, true),
	('Almabfahrt', 'MEDIUM', 4, 370, false);
	
-- INSERT INTO the lift relation.
INSERT INTO lift (lift_name, lift_type, summit_m, rise_m, length_m, operating) VALUES
	('Schoenjochbahn I', 'GONDOLA', 1920, 440, 1600, true),
	('ESL-Fiss-Moeseralm', 'CHAIR', 1850, 400, 1700, false),
	('ESL-Ladis-Fiss', 'CHAIR', 1510, 290, 2700, false),
	('Waldlift', 'TOW', 1850, 420, 1200, true),
	('Rastlift', 'TOW', 1900, 150, 400, true),
	('Schoenjochbahn II', 'GONDOLA', 2436, 516, 1350, true),
	('Sattelkopflift', 'TOW', 2100, 220, 1000, false),
	('Moeserlift', 'TOW', 1930, 80, 400, true),
	('Wonnelift', 'TOW', 2080, 280, 1000, true),
	('Plazoerlift', 'TOW', 2450, 360, 1350, true),
	('Schoenjochlift', 'TOW', 2509, 70, 420, false),
	('Schoengamplift', 'TOW', 2509, 420, 1340, true),
	('Almlift', 'TOW', 2250, 370, 1180, false);

-- INSERT INTO the connections relation
	-----
INSERT INTO connections
	SELECT piste_uid, lift_uid
	FROM piste, lift
	WHERE piste_name='Zwischenholzabfahrt'
	AND lift_name='Schoenjochbahn I';
	
INSERT INTO connections
	SELECT piste_uid, lift_uid
	FROM piste, lift
	WHERE piste_name='Zwischenholzabfahrt'
	AND lift_name='ESL-Fiss-Moeseralm';
	
	-----
	
INSERT INTO connections
	SELECT piste_uid, lift_uid
	FROM piste, lift
	WHERE piste_name='Moeseralmabfahrt'
	AND lift_name='ESL-Fiss-Moeseralm';
	
INSERT INTO connections
	SELECT piste_uid, lift_uid
	FROM piste, lift
	WHERE piste_name='Moeseralmabfahrt'
	AND lift_name='Rastlift';
	
	-----
	
INSERT INTO connections
	SELECT piste_uid, lift_uid
	FROM piste, lift
	WHERE piste_name='Schoenjochabfahrt'
	AND lift_name='Schoenjochbahn II';

INSERT INTO connections
	SELECT piste_uid, lift_uid
	FROM piste, lift
	WHERE piste_name='Schoenjochabfahrt'
	AND lift_name='Plazoerlift';
	
INSERT INTO connections
	SELECT piste_uid, lift_uid
	FROM piste, lift
	WHERE piste_name='Schoenjochabfahrt'
	AND lift_name='Schoenjochlift';

	-----
	
INSERT INTO connections
	SELECT piste_uid, lift_uid
	FROM piste, lift
	WHERE piste_name='Sattelkopf-Suedabfahrt'
	AND lift_name='Waldlift';
	
INSERT INTO connections
	SELECT piste_uid, lift_uid
	FROM piste, lift
	WHERE piste_name='Sattelkopf-Suedabfahrt'
	AND lift_name='Sattelkopflift';
	
	-----
	
INSERT INTO connections
	SELECT piste_uid, lift_uid
	FROM piste, lift
	WHERE piste_name='Sattelkopf-Nordabfahrt'
	AND lift_name='Sattelkopflift';

	-----
	
INSERT INTO connections
	SELECT piste_uid, lift_uid
	FROM piste, lift
	WHERE piste_name='Moeserabfahrt'
	AND lift_name='Moeserlift';

	-----
	
INSERT INTO connections
	SELECT piste_uid, lift_uid
	FROM piste, lift
	WHERE piste_name='Wonneabfahrt'
	AND lift_name='Schoenjochbahn I';
	
INSERT INTO connections
	SELECT piste_uid, lift_uid
	FROM piste, lift
	WHERE piste_name='Wonneabfahrt'
	AND lift_name='Wonnelift';

	-----
	
INSERT INTO connections
	SELECT piste_uid, lift_uid
	FROM piste, lift
	WHERE piste_name='Rastabfahrt'
	AND lift_name='Rastlift';

	-----
	
INSERT INTO connections
	SELECT piste_uid, lift_uid
	FROM piste, lift
	WHERE piste_name='Waldabfahrt'
	AND lift_name='Waldlift';

	-----
	
INSERT INTO connections
	SELECT piste_uid, lift_uid
	FROM piste, lift
	WHERE piste_name='Ladisabfahrt'
	AND lift_name='ESL-Ladis-Fiss';

	-----

INSERT INTO connections
	SELECT piste_uid, lift_uid
	FROM piste, lift
	WHERE piste_name='Verbindungsabfahrt'
	AND lift_name='Schoenjochbahn I';
	
INSERT INTO connections
	SELECT piste_uid, lift_uid
	FROM piste, lift
	WHERE piste_name='Verbindungsabfahrt'
	AND lift_name='Wonnelift';

	-----
	
INSERT INTO connections
	SELECT piste_uid, lift_uid
	FROM piste, lift
	WHERE piste_name='Plazoerabfahrt'
	AND lift_name='Schoenjochbahn II';
	
INSERT INTO connections
	SELECT piste_uid, lift_uid
	FROM piste, lift
	WHERE piste_name='Plazoerabfahrt'
	AND lift_name='Plazoerlift';

	-----
	
INSERT INTO connections
	SELECT piste_uid, lift_uid
	FROM piste, lift
	WHERE piste_name='Schoengampabfahrt'
	AND lift_name='Schoengamplift';

	-----

INSERT INTO connections
	SELECT piste_uid, lift_uid
	FROM piste, lift
	WHERE piste_name='Schoenjochpiste'
	AND lift_name='Schoenjochbahn II';
	
INSERT INTO connections
	SELECT piste_uid, lift_uid
	FROM piste, lift
	WHERE piste_name='Schoenjochpiste'
	AND lift_name='Plazoerlift';

	-----
	
INSERT INTO connections
	SELECT piste_uid, lift_uid
	FROM piste, lift
	WHERE piste_name='Almabfahrt'
	AND lift_name='Schoenjochbahn II';
	
INSERT INTO connections
	SELECT piste_uid, lift_uid
	FROM piste, lift
	WHERE piste_name='Almabfahrt'
	AND lift_name='Plazoerlift';
	
INSERT INTO connections
	SELECT piste_uid, lift_uid
	FROM piste, lift
	WHERE piste_name='Almabfahrt'
	AND lift_name='Almlift';