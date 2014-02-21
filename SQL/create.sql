/*
	CS27020 Pistes and Lifts Assignment
	PostgreSQL commands for creating the database.
	Author: James Euesden (jee22@aber.ac.uk)
	Date: 20/2/14
*/

/*
	Create the database:
	psql -h db.dcs.aber.ac.uk -U jee22 -d cs27020_13_14 < create.sql
	Also a script for removing all relations:
	psql -h db.dcs.aber.ac.uk -U jee22 -d cs27020_13_14 < drop_tables.sql
	And a script for adding sample data to the database:
	psql -h db.dcs.aber.ac.uk -U jee22 -d cs27020_13_14 < insert_sample.sql
*/


-- Create a sequence for incrementing the piste_uid
CREATE SEQUENCE piste_uid_seq;

-- Create a type for grading for Piste
CREATE TYPE grade_rank as ENUM('EASY', 'MEDIUM', 'HARD', 'DIFFICULT');

-- Create the Piste table.
-- PK UID. Unique Names.
CREATE TABLE piste (
	piste_uid int DEFAULT nextval('piste_uid_seq')
		NOT NULL PRIMARY KEY,
	piste_name varchar(50) UNIQUE NOT NULL,
	grade grade_rank NOT NULL DEFAULT 'EASY',
	length_km real NOT NULL,
	fall_m integer NOT NULL,
	open_piste boolean
);
ALTER SEQUENCE piste_uid_seq OWNED BY piste.piste_uid;
	
-- Create a sequence for incrementing the lift_uid	
CREATE SEQUENCE lift_uid_seq;

-- Create a type for the type and operating Lifts
CREATE TYPE type_lift as ENUM('GONDOLA', 'CHAIR', 'TOW');
	
-- Create the Lift table.
-- PK UID. Unique Names.
CREATE TABLE lift (
	lift_uid int DEFAULT nextval('lift_uid_seq')
		NOT NULL PRIMARY KEY,
	lift_name varchar(60) UNIQUE NOT NULL,
	lift_type type_lift NOT NULL,
	summit_m integer NOT NULL,
	rise_m integer NOT NULL,
	length_m integer NOT NULL,
	operating boolean
);
ALTER SEQUENCE lift_uid_seq OWNED BY lift.lift_uid;

-- Create the table Connections (M-M).
-- PK is UIDs, Names for content.
CREATE TABLE connections (
	piste_uid integer NOT NULL,
	piste_name varchar(50) NOT NULL,
	lift_uid integer NOT NULL,
	lift_name varchar(60) NOT NULL,
	CONSTRAINT fkey_piste_uid
		FOREIGN KEY (piste_uid)
		REFERENCES piste (piste_uid),
	CONSTRAINT fkey_piste_name
		FOREIGN KEY (piste_name)
		REFERENCES piste (piste_name),
	CONSTRAINT fkey_lift
		FOREIGN KEY (lift_uid)
		REFERENCES lift (lift_uid),
	CONSTRAINT fkey_lift_name
		FOREIGN KEY (lift_name)
		REFERENCES lift (lift_name),
	PRIMARY KEY (piste_uid, lift_uid)
);

	