
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
	email_address VARCHAR(128)  NOT NULL,
	state VARCHAR(128),
	city VARCHAR(128),
	zip_code VARCHAR(32),
	phone_number VARCHAR(32),
	username VARCHAR(128),
	first_name VARCHAR(128),
	last_name VARCHAR(128),
	home_address VARCHAR(128),
	salt TEXT NOT NULL,
	hash VARCHAR(512) NOT NULL,
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
	landmark_name VARCHAR(128) NOT NULL,
	landmark_sub_name TEXT,
	landmark_picture VARCHAR(256),
	landmark_rating REAL,
	latitude REAL NOT NULL,
	longitude REAL NOT NULL,
	state VARCHAR(128) NOT NULL,
	city VARCHAR(128),
	zip_code INTEGER NOT NULL,
	address VARCHAR(256),
	description TEXT NOT NULL,
	history TEXT,
	website TEXT,
	top_pick BOOLEAN,
	active BOOLEAN DEFAULT TRUE,
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
	rating REAL,
	date_created TIMESTAMP DEFAULT NOW(),
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
	itinerary_name VARCHAR(32) NOT NULL,
	user_id INTEGER NOT NULL,
	start_lat REAL NOT NULL,
	start_lon REAL NOT NULL,
	start_address VARCHAR(256),
	date_created TIMESTAMP DEFAULT NOW(),
	CONSTRAINT pk_itinerary_itinerary_id PRIMARY KEY (itinerary_id)
);

CREATE TABLE itinerary_landmark
(
	landmark_id INTEGER NOT NULL,
	itinerary_id INTEGER NOT NULL,
	CONSTRAINT fk_landmark_id FOREIGN KEY (landmark_id) REFERENCES landmark (landmark_id),
	CONSTRAINT fk_itinerary_id FOREIGN KEY (itinerary_id) REFERENCES itinerary (itinerary_id)
);



COMMIT;