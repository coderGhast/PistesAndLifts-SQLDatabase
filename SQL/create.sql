/*
	CS27020 Pistes and Lifts Assignment
	PostgreSQL commands for creating the database.
	Author: James Euesden (jee22@aber.ac.uk)
	Date: 20/2/14
*/

/*
	Create the database:
	psql -h db.dcs.aber.ac.uk -U jee22 -d cs27020_13_14 
	< create.sql
	Also a script for removing all relations:
	drop_tables.sql
	And a script for adding sample data to the database:
	insert_sample.sql
	All required test queries contained in:
	test_queries.sql
*/


-- Create a sequence for incrementing the piste_uid
CREATE SEQUENCE piste_uid_seq;

-- Create a type for grading for Piste
CREATE TYPE grade_rank as 
	ENUM('EASY', 'MEDIUM', 'HARD', 'DIFFICULT');

-- Create the Piste table.
-- PK UID. Unique Names.
CREATE TABLE piste (
	piste_uid int DEFAULT nextval('piste_uid_seq')
		NOT NULL PRIMARY KEY,
	piste_name varchar(50) UNIQUE NOT NULL,
	grade grade_rank NOT NULL,
	length_km real NOT NULL
		CONSTRAINT length_must_be_positive
		CHECK (length_km > 0),
	fall_m integer NOT NULL
		CONSTRAINT fall_must_be_positive
		CHECK (fall_m > 0),
	open_piste boolean NOT NULL
);
ALTER SEQUENCE piste_uid_seq OWNED BY piste.piste_uid;
	
-- Create a sequence for incrementing the lift_uid	
CREATE SEQUENCE lift_uid_seq;

-- Create a type for the type of Lifts
CREATE TYPE type_lift as 
	ENUM('GONDOLA', 'CHAIR', 'TOW');
	
-- Create the Lift table.
-- PK UID. Unique Names.
CREATE TABLE lift (
	lift_uid int DEFAULT nextval('lift_uid_seq')
		NOT NULL PRIMARY KEY,
	lift_name varchar(60) UNIQUE NOT NULL,
	lift_type type_lift NOT NULL,
	summit_m integer NOT NULL 
		CONSTRAINT summit_must_be_positive
		CHECK (summit_m > 0),
	rise_m integer NOT NULL
		CONSTRAINT rise_must_be_positive
		CHECK (rise_m > 0),
	length_m integer NOT NULL
		CONSTRAINT length_must_be_positive
		CHECK (length_m > 0),
	operating boolean NOT NULL
);
ALTER SEQUENCE lift_uid_seq OWNED BY lift.lift_uid;

-- Create the table Connections (M-M).
-- PK is UIDs, Names for content.
CREATE TABLE connections (
	piste_uid integer NOT NULL,
	lift_uid integer NOT NULL,
	CONSTRAINT fkey_piste_uid
		FOREIGN KEY (piste_uid)
		REFERENCES piste (piste_uid),
	CONSTRAINT fkey_lift
		FOREIGN KEY (lift_uid)
		REFERENCES lift (lift_uid),
	PRIMARY KEY (piste_uid, lift_uid)
);