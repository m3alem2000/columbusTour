-- *************************************************************************************************
-- This script creates all of the database objects (tables, sequences, etc) for the database
-- *************************************************************************************************

BEGIN;

CREATE SEQUENCE user_user_id_seq
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;

CREATE TABLE users 
(
	user_id INTEGER DEFAULT NEXTVAL('user_user_id_seq'::regclass) NOT NULL,
	email_address VARCHAR(64)  NOT NULL,
	username VARCHAR(64) NOT NULL,
	first_name VARCHAR(64),
	last_name VARCHAR(64),
	home_address VARCHAR(64),
	salt TEXT NOT NULL,
	hash VARCHAR(64) NOT NULL,
	is_admin BOOLEAN NOT NULL,
	CONSTRAINT pk_user_user_id PRIMARY KEY (user_id)
);


CREATE SEQUENCE landmark_landmark_id_seq
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;

CREATE TABLE landmark 
(
	landmark_id INTEGER DEFAULT NEXTVAL('landmark_landmark_id_seq'::regclass) NOT NULL,
	landmark_name VARCHAR(64) NOT NULL,
	landmark_picture VARCHAR(64) NOT NULL,
	landmark_rating INTEGER NOT NULL,
	latitude REAL NOT NULL,
	longitude REAL NOT NULL,
	state VARCHAR(2) NOT NULL,
	city VARCHAR(64) NOT NULL,
	zip_code INTEGER NOT NULL,
	address VARCHAR(64),
	description TEXT NOT NULL,
	CONSTRAINT pk_landmark_landmark_id PRIMARY KEY (landmark_id)
	
);


CREATE TABLE review
(
	landmark_id INTEGER NOT NULL,
	user_id INTEGER NOT NULL,
	review TEXT NOT NULL,
	rating INTEGER NOT NULL,
	CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users (user_id),
	CONSTRAINT fk_landmark_id FOREIGN KEY (landmark_id) REFERENCES landmark (landmark_id)
);

CREATE TABLE itinerary
(
	user_id INTEGER NOT NULL,
	landmark_id INTEGER NOT NULL,
	starting_latitude REAL NOT NULL,
	starting_longitude REAL NOT NULL,
	CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users (user_id),
	CONSTRAINT fk_landmark_id FOREIGN KEY (landmark_id) REFERENCES landmark (landmark_id)
);

COMMIT;