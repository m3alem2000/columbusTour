DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS landmark;
DROP TABLE IF EXISTS review;
DROP TABLE IF EXISTS itenerary;

DROP SEQUENCE user_user_id_seq;
DROP SEQUENCE landmark_landmark_id_seq;



CREATE SEQUENCE user_user_id_seq
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;

CREATE TABLE user
(
	user_id SERIAL PRIMARY KEY,
	email_address VARCHAR(64)  NOT NULL,
	username VARCHAR(64) NOT NULL,
	first_name VARCHAR(64),
	last_name VARCHAR(64),
	home_address VARCHAR(64),
	salt TEXT NOT NULL,
	hash VARCHAR(64) NOT NULL,
);

CREATE SEQUENCE landmark_landmark_id_seq
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;

CREATE TABLE landmark
(
	landmark_id SERIAL PRIMARY KEY,
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
);


CREATE TABLE review
(
	landmark_id INTEGER NOT NULL,
	user_id INTEGER NOT NULL,
	review TEXT NOT NULL,
	rating INTEGER NOT NULL,
);

CREATE TABLE itenerary
(
	user_id INTEGER NOT NULL,
	landmark_id INTEGER NOT NULL,
);

INSERT INTO user (email_address, username, first_name, last_name, home_address, salt, hash, level_of_authority) VALUES ('traveler1@yahoo.com', 'traveler1', 'bob', 'jones', '123 street street', 'XRj4/q6qixYZo68P1BA87C8EpcuCZ3A88bY6vZ6y5EOpKWjgEzBAsYPBQVbRREMWNQm8fFwXuaTR5nzYhM7jr9FmERsLMZDlwnREHYOjzeyv6zxFln1AzuBXBn27Shd+jczS9N5dI9Pg8w23Ft4OVP90fl89odyQnufDXsPwsqs=', 'gjSSHt79W6d2twT+HsZvUg==');

INSERT INTO landmark (landmark_name, landmark_picture, landmark_rating, latitude, longitude, address, description) VALUES ('Franklin Park Conservatory and Botanical Gardens', 'FPC.jpq', 5, '39.965910', '-82.953862', 'OH', 'Columbus', '43206', '1777 E Broad St, Columbus, OH 43203', 'A park');
INSERT INTO landmark (landmark_name, landmark_picture, landmark_rating, latitude, longitude, address, description) VALUES ('Columbus Museum of Art', 'museum.jpg', 3, '39.964207', '-82.987897', 'OH', 'Columbus', '43215', '480 E Broad St, Columbus, OH 43215', 'An art museum');
INSERT INTO landmark (landmark_name, landmark_picture, landmark_rating, latitude, longitude, address, description) VALUES ('Topiary Park', 'topiary.jpg', 5, '39.961149', '-82.987617', 'OH', 'Columbus', '43215', '480 E town St, Columbus, OH 43215', 'Another park');

INSERT INTO review (landmark_id, user_id, review, rating) VALUES (1, 1, 'great place', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (1, 1, 'What a nice park', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (1, 1, 'awesome', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (2, 1, 'great place', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (3, 1, 'great place', 5);




