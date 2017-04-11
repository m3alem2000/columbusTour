-- *****************************************************************************
-- This script contains INSERT statements for populating tables with seed data
-- *****************************************************************************

BEGIN;


INSERT INTO users (email_address, username, first_name, last_name, home_address, salt, hash, is_admin) VALUES 
('traveler1@yahoo.com', 'traveler1', 'bob', 'jones', '123 street street', 'XRj4/q6qixYZo68P1BA87C8EpcuCZ3A88bY6vZ6y5EOpKWjgEzBAsYPBQVbRREMWNQm8fFwXuaTR5nzYhM7jr9FmERsLMZDlwnREHYOjzeyv6zxFln1AzuBXBn27Shd+jczS9N5dI9Pg8w23Ft4OVP90fl89odyQnufDXsPwsqs=', 'gjSSHt79W6d2twT+HsZvUg==', false);
INSERT INTO users (email_address, username, first_name, last_name, home_address, salt, hash, is_admin) VALUES 
('admin@yahoo.com', 'admin', 'Alice', 'jones', '123 street street', 'XRj4/q6qixYZo68P1BA87C8EpcuCZ3A88bY6vZ6y5EOpKWjgEzBAsYPBQVbRREMWNQm8fFwXuaTR5nzYhM7jr9FmERsLMZDlwnREHYOjzeyv6zxFln1AzuBXBn27Shd+jczS9N5dI9Pg8w23Ft4OVP90fl89odyQnufDXsPwsqs=', 'gjSSHt79W6d2twT+HsZvUg==', true);



INSERT INTO landmark (landmark_name, landmark_picture, landmark_rating, latitude, longitude, state, city, zip_code, address, description) VALUES ('Franklin Park Conservatory and Botanical Gardens', 'FPC.jpq', 5, '39.965910', '-82.953862', 'OH', 'Columbus', '43206', '1777 E Broad St, Columbus, OH 43203', 'A park');
INSERT INTO landmark (landmark_name, landmark_picture, landmark_rating, latitude, longitude, state, city, zip_code, address, description) VALUES ('Columbus Museum of Art', 'museum.jpg', 3, '39.964207', '-82.987897', 'OH', 'Columbus', '43215', '480 E Broad St, Columbus, OH 43215', 'An art museum');
INSERT INTO landmark (landmark_name, landmark_picture, landmark_rating, latitude, longitude, state, city, zip_code, address, description) VALUES ('Topiary Park', 'topiary.jpg', 5, '39.961149', '-82.987617', 'OH', 'Columbus', '43215', '480 E town St, Columbus, OH 43215', 'Another park');
INSERT INTO landmark (landmark_name, landmark_picture, landmark_rating, latitude, longitude, state, city, zip_code, address, description) VALUES ('Easton Town Center', 'ETW.jpg', 5, '40.050725', '-82.915374', 'OH', 'Columbus', '43219', '4160 Easton Town Center, Columbus, OH 43219', 'Town Center, one of Columbus biggest malls');
INSERT INTO landmark (landmark_name, landmark_picture, landmark_rating, latitude, longitude, state, city, zip_code, address, description) VALUES ('Ohio Stadium', 'OS.jpg', 5, '40.004160', '-83.019691', 'OH', 'Columbus', '43210', '410 Woody Hayes Dr., Columbus, OH, 43210', 'The Ohio State University Football Stadium');
INSERT INTO landmark (landmark_name, landmark_picture, landmark_rating, latitude, longitude, state, city, zip_code, address, description) VALUES ('German Village', 'GV.jpg', 5, '39.950364', '-82.995385', 'OH', 'Columbus', '43215', '588 S Third St., Columbus, OH 43215', 'German Village is a historic neighborhood in Ohio just south of downtown Columbus');
INSERT INTO landmark (landmark_name, landmark_picture, landmark_rating, latitude, longitude, state, city, zip_code, address, description) VALUES ('Short North Arts District', 'SNAD.jpg', 5, '39.975383', '-83.004769', 'OH', 'Columbus', '43215', '120 W Goodale St., Columbus, OH 43215', 'As the art and soul of Columbus, the Short North is a vibrant cultural and business community.');
INSERT INTO landmark (landmark_name, landmark_picture, landmark_rating, latitude, longitude, state, city, zip_code, address, description) VALUES ('Nationwide Arena', 'NWA.jpg', 5, '39.969351', '-83.006385', 'OH', 'Columbus', '43215', '200 W. Nationwide Blvd., Columbus, OH 43215', 'Nationwide Arena is a large multi-purpose arena, in Columbus, Ohio.');
INSERT INTO landmark (landmark_name, landmark_picture, landmark_rating, latitude, longitude, state, city, zip_code, address, description) VALUES ('Ohio Statehouse', 'OSH.jpg', 5, '39.961633', '-82.998954', 'OH', 'Columbus', '43215', '1 Capitol Square, Columbus, OH 43215', 'The Ohio Statehouse, located in Columbus, Ohio, is the house of government for the state of Ohio. ');

INSERT INTO review (landmark_id, user_id, review, rating) VALUES (1, 1, 'great place', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (1, 1, 'What a nice park', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (1, 1, 'awesome', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (2, 1, 'great place', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (3, 1, 'great place', 5);


COMMIT;