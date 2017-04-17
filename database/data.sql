-- *****************************************************************************
-- This script contains INSERT statements for populating tables with seed data
-- *****************************************************************************

BEGIN;


INSERT INTO users (email_address, state, city, zip_code, phone_number, username, first_name, last_name, home_address, salt, hash, is_admin) VALUES 
('traveler1@yahoo.com', 'OH', 'Columbus', '43064', '6141234567', 'traveler1', 'bob', 'jones', '123 street street', 'XCAGsmD/u9poOK9Kv2flcxY3CN71lpaP3k5kWqe5EIxgzm5OYpQOIewTppaPmveiQFn+ak5durD3mFSsrFBmVJ8h8p+uKAqRmZnouX8RvqvAdEJOP7IMAr0MGitzd5HFZCwpWoN4jG9rB+RFdeMLXbuq5eL5Ju6wRwZ31v1aVqk=', 'k53ZchPGscnwkRvIgGFC2g==', false);
-- traveler1@yahoo.com Password1!
INSERT INTO users (email_address, state, city, zip_code, phone_number, username, first_name, last_name, home_address, salt, hash, is_admin) VALUES 
('charlie@lola.com',  'OH', 'Columbus', '43210', '123', 'admin', 'Charlie',  'Lola', '123 street street', 'myRRyv7lSsgWA6r0gs9Rl/Ki0VlI5wl7b43nio0ADLN/U2wf+UOlWbTUrb1Oj/ETm/KT202nMyujBC/J0HP66ZXUglQQGWtlmHKR4xx2HDi9UhZLs6hFw4MN/JkuqeDlA7BrE0IvPMKYDrKy3jOm9gZMk03eOqO7FkAL94Ev88k=', '5ibzhLzIqTrBQv+Huzluiw==', true);
-- admin password is Yom Huledet 120
INSERT INTO users (email_address, state, city, zip_code, phone_number, username, first_name, last_name, home_address, salt, hash, is_admin) VALUES 
('devin@yahoo.com', 'OH', 'Columbus', '43064', '6141234567', 'traveler1', 'bob', 'jones', '123 street street', 'XCAGsmD/u9poOK9Kv2flcxY3CN71lpaP3k5kWqe5EIxgzm5OYpQOIewTppaPmveiQFn+ak5durD3mFSsrFBmVJ8h8p+uKAqRmZnouX8RvqvAdEJOP7IMAr0MGitzd5HFZCwpWoN4jG9rB+RFdeMLXbuq5eL5Ju6wRwZ31v1aVqk=', 'k53ZchPGscnwkRvIgGFC2g==', false);
-- Password1!
INSERT INTO users (email_address, state, city, zip_code, phone_number, username, first_name, last_name, home_address, salt, hash, is_admin) VALUES 
('m@yahoo.com', 'OH', 'Columbus', '43064', '6141234567', 'traveler1', 'bob', 'jones', '123 street street', 'XCAGsmD/u9poOK9Kv2flcxY3CN71lpaP3k5kWqe5EIxgzm5OYpQOIewTppaPmveiQFn+ak5durD3mFSsrFBmVJ8h8p+uKAqRmZnouX8RvqvAdEJOP7IMAr0MGitzd5HFZCwpWoN4jG9rB+RFdeMLXbuq5eL5Ju6wRwZ31v1aVqk=', 'k53ZchPGscnwkRvIgGFC2g==', false);
-- traveler1@yahoo.com Password1!


INSERT INTO landmark (landmark_name, landmark_picture, landmark_rating, latitude, longitude, state, city, zip_code, address, description, top_pick) VALUES ('Franklin Park Conservatory and Botanical Gardens', 'FPC.jpg', 5, '39.965910', '-82.953862', 'OH', 'Columbus', '43206', '1777 E Broad St, Columbus, OH 43203', 'Franklin Park Conservatory and Botanical Gardens offers enriching and memorable experiences inspired by art, culture and the botanical world.', true);
INSERT INTO landmark (landmark_name, landmark_picture, landmark_rating, latitude, longitude, state, city, zip_code, address, description, top_pick) VALUES ('Columbus Museum of Art', 'museum.jpg', 3, '39.964207', '-82.987897', 'OH', 'Columbus', '43215', '480 E Broad St, Columbus, OH 43215', 'Recently renovated and expanded, the museums hosts permanent & traveling art collections plus an American cafe & a gift shop.', true);
INSERT INTO landmark (landmark_name, landmark_picture, landmark_rating, latitude, longitude, state, city, zip_code, address, description, top_pick) VALUES ('Topiary Park', 'topiary.jpg', 5, '39.961149', '-82.987617', 'OH', 'Columbus', '43215', '480 E town St, Columbus, OH 43215', 'Quiet park featuring landscape plants artistically trimmed to recreate a famous Seurat painting.', true);
INSERT INTO landmark (landmark_name, landmark_picture, landmark_rating, latitude, longitude, state, city, zip_code, address, description, top_pick) VALUES ('Easton Town Center', 'ETC.jpg', 5, '40.050725', '-82.915374', 'OH', 'Columbus', '43219', '4160 Easton Town Center, Columbus, OH 43219', 'East Town Center, one of Columbus biggest malls', true);
INSERT INTO landmark (landmark_name, landmark_picture, landmark_rating, latitude, longitude, state, city, zip_code, address, description, top_pick) VALUES ('Ohio Stadium', 'OS.jpg', 5, '40.004160', '-83.019691', 'OH', 'Columbus', '43210', '410 Woody Hayes Dr., Columbus, OH, 43210', 'The Ohio State University Football Stadium', true);
INSERT INTO landmark (landmark_name, landmark_picture, landmark_rating, latitude, longitude, state, city, zip_code, address, description, top_pick) VALUES ('German Village', 'GV.jpg', 5, '39.950364', '-82.995385', 'OH', 'Columbus', '43215', '588 S Third St., Columbus, OH 43215', 'German Village is a historic neighborhood in Ohio just south of downtown Columbus', false);
INSERT INTO landmark (landmark_name, landmark_picture, landmark_rating, latitude, longitude, state, city, zip_code, address, description, top_pick) VALUES ('Short North Arts District', 'SNAD.jpg', 5, '39.975383', '-83.004769', 'OH', 'Columbus', '43215', '120 W Goodale St., Columbus, OH 43215', 'As the art and soul of Columbus, the Short North is a vibrant cultural and business community.', false);
INSERT INTO landmark (landmark_name, landmark_picture, landmark_rating, latitude, longitude, state, city, zip_code, address, description, top_pick) VALUES ('Nationwide Arena', 'NWA.jpg', 5, '39.969351', '-83.006385', 'OH', 'Columbus', '43215', '200 W. Nationwide Blvd., Columbus, OH 43215', 'Nationwide Arena is a large multi-purpose arena, in Columbus, Ohio.', false);
INSERT INTO landmark (landmark_name, landmark_picture, landmark_rating, latitude, longitude, state, city, zip_code, address, description, top_pick) VALUES ('Ohio Statehouse', 'OSH.jpg', 5, '39.961633', '-82.998954', 'OH', 'Columbus', '43215', '1 Capitol Square, Columbus, OH 43215', 'The Ohio Statehouse, located in Columbus, Ohio, is the house of government for the state of Ohio. ', false);
INSERT INTO landmark (landmark_name, landmark_picture, landmark_rating, latitude, longitude, state, city, zip_code, address, description, top_pick) VALUES ('Audubon Center', 'Audubon.jpg', 4, '39.946310', '-83.009829', 'OH', 'Columbus', '43215', ' 505 W Whittier St, Columbus, OH 43215', 'A wonderful place for the general public to connect with nature. Their mission is to conserve and restore natural ecosystems, focusing on birds, other wildlife, and their habitats for the benefit of humanity and the earth’s biological diversity.', false);
INSERT INTO landmark (landmark_name, landmark_picture, landmark_rating, latitude, longitude, state, city, zip_code, address, description, top_pick) VALUES ('St.Josephs Cathedral', 'StJoseph.jpg', 4, '39.963344', '-82.994712', 'OH', 'Columbus', '43215', '212 East Broad Street, Columbus, OH 43215', 'Within walking distance from City Center, this church is one of the most beautiful in the country. As seen in the picture the arches are magnificent and the alter to rival anything in Europe.', false);
INSERT INTO landmark (landmark_name, landmark_picture, landmark_rating, latitude, longitude, state, city, zip_code, address, description, top_pick) VALUES ('Ohio Theater', 'OhioTheater.jpg', 4, '39.960068', '-82.998890', 'OH', 'Columbus', '43215', '39 E State St, Columbus, OH 43215', 'The Ohio Theatre is a performing arts center known as the "Official Theatre of the State of Ohio", the historic 1928 movie palace was saved from demolition in 1969 and completely restored', false);
INSERT INTO landmark (landmark_name, landmark_picture, landmark_rating, latitude, longitude, state, city, zip_code, address, description, top_pick) VALUES ('COSI', 'COSI.jpg', 4, '39.959836', '-83.007020', 'OH', 'Columbus', '43215', '333 West Broad St, Columbus, OH 43215', 'COSI (Center of Science and Industry) is a science museum and research center. Originally opened in 1964, COSI was relocated to a 320,000 square foot state-of-the-art facility designed by Japanese architect Arata Isozaki along a bend in the Scioto River in 1999. COSI features more than 300 interactive exhibits throughout themed exhibition areas', false);
INSERT INTO landmark (landmark_name, landmark_picture, landmark_rating, latitude, longitude, state, city, zip_code, address, description, top_pick) VALUES ('North Market', 'NorthMarket.jpg', 4, '39.971912', '-83.004316', 'OH', 'Columbus', '43215', ' 59 Spruce St, Columbus, OH 43215', 'Established in 1876, the North Market is Columbus’ only remaining true public market. More than 30 merchants vend a wide variety of fresh, local, authentic food.', false);
INSERT INTO landmark (landmark_name, landmark_picture, landmark_rating, latitude, longitude, state, city, zip_code, address, description, top_pick) VALUES ('Scioto Mile Park', 'SciotoMile.jpg', 4, '39.958138', '-83.003485', 'OH', 'Columbus', '43215', ' 233 S Civic Center Dr, Columbus, OH 43215', 'Riverfront park system featuring interactive fountains, a 3D installation & a cultural arts center.', false);
INSERT INTO landmark (landmark_name, landmark_picture, landmark_rating, latitude, longitude, state, city, zip_code, address, description, top_pick) VALUES ('Columbus Zoo', 'ColumbusZoo.jpg', 4, '40.156079', '-83.118304', 'OH', 'Powell', '43065', '4850 W Powell Rd, Powell, OH 43065', 'The Columbus Zoo and Aquarium is a non-profit zoo located near Powell in Liberty Township, Delaware County, Ohio, United States, north of the city of Columbus.', false);
INSERT INTO landmark (landmark_name, landmark_picture, landmark_rating, latitude, longitude, state, city, zip_code, address, description, top_pick) VALUES ('The Ohio Expo Center and State Fair', 'StateFair.jpg', 4, '40.002566', '-83.009829', 'OH', 'Columbus', '43211', '717 E 17th Ave, Columbus, OH 43211', 'Home to the annual Ohio State Fair and the Columbus Crew, a Major League Soccer team, more than 175 year-round events are proud to call the Ohio Expo Center home.', false);
INSERT INTO landmark (landmark_name, landmark_picture, landmark_rating, latitude, longitude, state, city, zip_code, address, description, top_pick) VALUES ('Ohio Craft Museum', 'ohio-craft-museum.jpg', 4, '39.988827', '-83.050846', 'OH', 'Columbus', '43212', '1665 W 5th Ave, Columbus, OH 43212', 'The Ohio Craft Museum is a program of Ohio Designer Craftsmen, presenting five major exhibitions each year, as well as focus exhibits and a rotating display of the permanent collection.', false);
INSERT INTO landmark (landmark_name, landmark_picture, landmark_rating, latitude, longitude, state, city, zip_code, address, description, top_pick) VALUES ('Cafe Brioso', 'CafeBrioso.jpg', 4, '39.963788', '-83.000574', 'OH', 'Columbus', '43215', '14 E Gay St, Columbus, OH 43215', 'Easygoing cafe vending premium espresso drinks, custom brews, abundant pastries & lunchtime fare.', false);
INSERT INTO landmark (landmark_name, landmark_picture, landmark_rating, latitude, longitude, state, city, zip_code, address, description, top_pick) VALUES ('Jennis Ice cream', 'JennisIceCream.jpg','4', '39.976968', '-83.009829', 'OH', 'Columbus', '43215', '714 N. High Stret, Columbus, OH 43215', 'Jenis Splendid Ice Creams is an artisan ice-cream company with national distribution. Known for its creative flavors and its high-quality ingredients.', false);


INSERT INTO itinerary (user_id, itinerary_name, start_lat, start_lon) VALUES (1, 'Day 1', 39.997339, -83.042371);
INSERT INTO itinerary (user_id, itinerary_name, start_lat, start_lon) VALUES (1, 'Day 2', 39.997339, -83.042371);
INSERT INTO itinerary (user_id, itinerary_name, start_lat, start_lon) VALUES (2, 'Day 3', 39.997339, -83.042371);
INSERT INTO itinerary (user_id, itinerary_name, start_lat, start_lon) VALUES (2, 'Day 4', 39.997339, -83.042371);
INSERT INTO itinerary (user_id, itinerary_name, start_lat, start_lon) VALUES (3, 'Day 5', 39.997339, -83.042371);
INSERT INTO itinerary (user_id, itinerary_name, start_lat, start_lon) VALUES (3, 'Day 6', 39.997339, -83.042371);
INSERT INTO itinerary (user_id, itinerary_name, start_lat, start_lon) VALUES (4, 'Day 7', 39.997339, -83.042371);
INSERT INTO itinerary (user_id, itinerary_name, start_lat, start_lon) VALUES (4, 'Day 8', 39.997339, -83.042371);


INSERT INTO review (landmark_id, user_id, review, rating) VALUES (1, 1, 'Beautiful park outside, outstanding indoor biomes. Need several hours to visit. Nice cafe and gift shop for unique gifts.', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (1, 2, 'What a nice park, several different gardens, a heaven for plant lovers!', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (1, 3, 'Awesome, check out the butterfly exhibit with the kids. Lots of educational events', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (1, 4, 'great place', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (2, 2, 'great place', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (2, 1, 'great place', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (2, 3, 'What a nice park', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (3, 4, 'awesome', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (3, 1, 'great place', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (3, 2, 'great place', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (4, 4, 'awesome', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (4, 1, 'great place', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (4, 2, 'great place', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (5, 4, 'awesome', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (5, 1, 'great place', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (5, 2, 'great place', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (6, 3, 'awesome', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (6, 1, 'great place', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (6, 2, 'great place', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (7, 4, 'awesome', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (7, 1, 'great place', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (7, 2, 'great place', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (8, 3, 'awesome', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (8, 1, 'great place', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (8, 2, 'great place', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (9, 3, 'awesome', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (9, 1, 'great place', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (9, 2, 'great place', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (10, 4, 'awesome', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (10, 1, 'great place', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (10, 2, 'great place', 5);



INSERT INTO "public"."itinerary_landmark" ("landmark_id", "itinerary_id") VALUES (1, 1);
INSERT INTO "public"."itinerary_landmark" ("landmark_id", "itinerary_id") VALUES (2, 1);
INSERT INTO "public"."itinerary_landmark" ("landmark_id", "itinerary_id") VALUES (3, 1);
INSERT INTO "public"."itinerary_landmark" ("landmark_id", "itinerary_id") VALUES (4, 1);
INSERT INTO "public"."itinerary_landmark" ("landmark_id", "itinerary_id") VALUES (4, 2);
INSERT INTO "public"."itinerary_landmark" ("landmark_id", "itinerary_id") VALUES (5, 2);
INSERT INTO "public"."itinerary_landmark" ("landmark_id", "itinerary_id") VALUES (6, 2);
INSERT INTO "public"."itinerary_landmark" ("landmark_id", "itinerary_id") VALUES (7, 2);
INSERT INTO "public"."itinerary_landmark" ("landmark_id", "itinerary_id") VALUES (5, 3);
INSERT INTO "public"."itinerary_landmark" ("landmark_id", "itinerary_id") VALUES (6, 3);
INSERT INTO "public"."itinerary_landmark" ("landmark_id", "itinerary_id") VALUES (7, 3);
INSERT INTO "public"."itinerary_landmark" ("landmark_id", "itinerary_id") VALUES (5, 4);
INSERT INTO "public"."itinerary_landmark" ("landmark_id", "itinerary_id") VALUES (6, 4);
INSERT INTO "public"."itinerary_landmark" ("landmark_id", "itinerary_id") VALUES (7, 4);

COMMIT;