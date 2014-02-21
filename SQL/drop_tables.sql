/*
	CS27020 Pistes and Lifts Assignment
	PostgreSQL commands for removing the tables.
	Author: James Euesden (jee22@aber.ac.uk)
	Date: 20/2/14
*/

-- CLEAR ALL TABLES AND TYPES

DROP TABLE piste CASCADE;
DROP TABLE lift CASCADE;
DROP TABLE connections CASCADE;
DROP TYPE grade_rank CASCADE;
DROP TYPE type_lift CASCADE;