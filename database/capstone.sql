DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS landmark;
DROP TABLE IF EXISTS review;

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
	level_of_authority,
);

CREATE TABLE landmark
(
	landmark_id SERIAL PRIMARY KEY,
	landmark_name VARCHAR(64) NOT NULL,
	landmark_picture VARCHAR(64) NOT NULL,
	landmark_rating INTEGER NOT NULL,
	latitude REAL NOT NULL,
	longitude REAL NOT NULL,
	address VARCHAR(64) NOT NULL,
	description TEXT NOT NULL,
	
);


CREATE TABLE review
(
	landmark_id SERIAL PRIMARY KEY,
	review_id INTEGER NOT NULL,
	review TEXT NOT NULL,
	user_id INTEGER NOT NULL,
	rating INTEGER NOT NULL,
	
);

INSERT INTO user(user_id, email_address, username, first_name, last_name, home_address, salt, hash, level_of_authority) VALUES('traveler1@yahoo.com', 'traveler1', 'bob', 'jones', '123 street street', 'XRj4/q6qixYZo68P1BA87C8EpcuCZ3A88bY6vZ6y5EOpKWjgEzBAsYPBQVbRREMWNQm8fFwXuaTR5nzYhM7jr9FmERsLMZDlwnREHYOjzeyv6zxFln1AzuBXBn27Shd+jczS9N5dI9Pg8w23Ft4OVP90fl89odyQnufDXsPwsqs=', 'gjSSHt79W6d2twT+HsZvUg==');

