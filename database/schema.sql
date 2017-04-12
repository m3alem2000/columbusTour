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
	username VARCHAR(64),
	first_name VARCHAR(64),
	last_name VARCHAR(64),
	home_address VARCHAR(64),
	salt VARCHAR(1028) NOT NULL,
	hash VARCHAR(1028) NOT NULL,
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
	top_pick BOOLEAN,
	CONSTRAINT pk_landmark_landmark_id PRIMARY KEY (landmark_id)
	
);

CREATE SEQUENCE landmark_picture_id_seq
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
  
CREATE TABLE landmark_picture
(
	landmark_picture_id INTEGER DEFAULT NEXTVAL('landmark_picture_id_seq'::regclass) NOT NULL,
	landmark_id INTEGER NOT NULL,
	landmark_picture VARCHAR(1028) NOT NULL,
	CONSTRAINT pk_landmark_picture_id PRIMARY KEY (landmark_picture_id),
	CONSTRAINT fk_landmark_id FOREIGN KEY (landmark_id) REFERENCES landmark (landmark_id)
	
);
  
CREATE SEQUENCE review_review_id_seq
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;

CREATE TABLE review
(
	review_id INTEGER DEFAULT NEXTVAL('review_review_id_seq'::regclass) NOT NULL,
	landmark_id INTEGER NOT NULL,
	user_id INTEGER NOT NULL,
	review TEXT NOT NULL,
	rating INTEGER NOT NULL,
	CONSTRAINT pk_review_review_id PRIMARY KEY (review_id),
	CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users (user_id),
	CONSTRAINT fk_landmark_id FOREIGN KEY (landmark_id) REFERENCES landmark (landmark_id)
);

CREATE SEQUENCE itinerary_itinerary_id_seq
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;

CREATE TABLE itinerary
(
	itinerary_id INTEGER DEFAULT NEXTVAL('itinerary_itinerary_id_seq'::regclass) NOT NULL,
	user_id INTEGER NOT NULL,
	start_point_id INTEGER NOT NULL,
	date_created TIMESTAMP DEFAULT NOW(),
	CONSTRAINT pk_itinerary_itinerary_id PRIMARY KEY (itinerary_id),
	CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users (user_id)
	
);

CREATE TABLE itinerary_landmark
(
	landmark_id INTEGER NOT NULL,
	itinerary_id INTEGER NOT NULL,
	CONSTRAINT fk_landmark_id FOREIGN KEY (landmark_id) REFERENCES landmark (landmark_id),
	CONSTRAINT fk_itinerary_id FOREIGN KEY (itinerary_id) REFERENCES itinerary (itinerary_id)
);

CREATE SEQUENCE user_starting_point_starting_id_seq
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;


CREATE TABLE user_starting_point
(
	starting_id INTEGER DEFAULT NEXTVAL('user_starting_point_starting_id_seq'::regclass) NOT NULL,
	user_id INTEGER NOT NULL,
	full_address VARCHAR(100) NOT NULL,
	starting_latitude REAL NOT NULL,
	starting_longitude REAL NOT NULL,
	CONSTRAINT pk_starting_id PRIMARY KEY (starting_id),
	CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users (user_id)
);

COMMIT;