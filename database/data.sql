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


INSERT INTO landmark (landmark_name, landmark_picture, landmark_rating, latitude, longitude, state, city, zip_code, address, description, history, website, top_pick) VALUES ('Franklin Park Conservatory and Botanical Gardens', 'FPC.jpg', 5, '39.965910', '-82.953862', 'OH', 'Columbus', '43206', '1777 E Broad St, Columbus, OH 43203', 'Franklin Park Conservatory and Botanical Gardens offers enriching and memorable experiences inspired by art, culture and the botanical world.','In 1852, the Franklin County Agriculture Society purchased 88 acres located two miles east of downtown Columbus as a site for the first Franklin County Fair. In 1874, that land was made the official grounds of the Ohio State Fair. Ohio Legislature passed a resolution declaring the site as Franklin Park and open for public use in 1884.

Influenced by the success of Chicago’s World Fair and Columbian Exposition in 1893 and inspired by the City Beautiful movement, the city of Columbus built a grand Victorian-style glass greenhouse in the park. Known today as the Palm House, it opened to the public in 1895 as Franklin Park Conservatory. The park was a popular destination for the surrounding community who enjoyed its carriage paths, lake and boathouse.

Columbus Recreation and Parks Department owned and operated the Conservatory until 1989. During that time, the facility developed a reputation for horticultural excellence with the display of rare and unusual plants. The Conservatory also became a popular location for family gatherings, weddings, and events.', 'http://www.fpconservatory.org/', true);
INSERT INTO landmark (landmark_name, landmark_picture, landmark_rating, latitude, longitude, state, city, zip_code, address, description, top_pick) VALUES ('Columbus Museum of Art', 'museum.jpg', 3, '39.964207', '-82.987897', 'OH', 'Columbus', '43215', '480 E Broad St, Columbus, OH 43215', 'Recently renovated and expanded, the museums hosts permanent & traveling art collections plus an American cafe & a gift shop.', false);
INSERT INTO landmark (landmark_name, landmark_picture, landmark_rating, latitude, longitude, state, city, zip_code, address, description, history, website, top_pick) VALUES ('COSI', 'COSI.jpg', 4, '39.959836', '-83.007020', 'OH', 'Columbus', '43215', '333 West Broad St, Columbus, OH 43215', 'COSI (Center of Science and Industry) is a science museum and research center. Originally opened in 1964, COSI was relocated to a 320,000 square foot state-of-the-art facility designed by Japanese architect Arata Isozaki along a bend in the Scioto River in 1999. COSI features more than 300 interactive exhibits throughout themed exhibition areas', 'The original idea for COSI was born during a business trip to Chicago in 1957 by Sanford N. (Sandy) Hallock ll, who worked as an account executive for the Byer and Bowman advertising agency. While there, he visited the Museum of Science and Industry which he had visited as a boy with this father. Something must have clicked on this visit, however, for when Sandy returned home, he said to his wife Peggy, “Do you know what Columbus needs? It needs a Museum of Science and Industry!” Sandy’s lifelong interest in science and technology led him to pursue the dream of creating such an institution in Columbus, and in 1958 he wrote the original proposal for a Center of Science and Industry.

The actual creation of COSI resulted from a fortuitous coming together of personalities and circumstances. The inspiration and idea for the Center, of course, came from Sandy Hallock who took the idea to a business acquaintance, Herschel Stephan. Mr. Stephan was the President of the Franklin County Historical Society which was housed in the county’s old Memorial Hall building at 280 E. Broad Street, Columbus Ohio. He took the idea of creating a science museum to the Historical Society’s board of Trustees. In November of 1961, the Board presented a formal plan to establish a Center of Science and Industry to the Franklin County Commissioners, who, at the time, were trying to preserve Memorial Hall which had fallen into considerable disrepair.

COSI opened to the public on March 29,1964. That first day, an Easter Sunday, COSI welcomed more than 5,000 guests, who paid 50 cents for an adult and 25 cents for a youth admission.

After 35 years in Memorial Hall, COSI moved to its current location in downtown Columbus at 333 West Broad Street on November 6, 1999. Internationally renowned architect Arata Isozaki designed the 320,000 square foot building to showcase the future of COSI. Since 1964, COSI has welcomed more than 33 million visitors from all 50 states and numerous foreign countries.', 'https://cosi.org/',true);
INSERT INTO landmark (landmark_name, landmark_picture, landmark_rating, latitude, longitude, state, city, zip_code, address, description, history, website, top_pick) VALUES ('Columbus Zoo', 'ColumbusZoo.jpg', 4, '40.156079', '-83.118304', 'OH', 'Powell', '43065', '4850 W Powell Rd, Powell, OH 43065', 'The Columbus Zoo and Aquarium is a non-profit zoo located near Powell in Liberty Township, Delaware County, Ohio, United States, north of the city of Columbus.', 'The first zoo in Columbus, the Columbus Zoological Company (not affiliated with the Columbus Zoo today), was located in the north Riverview neighborhood of Beechwold in Clintonville. The zoo opened in May 1905 but closed for unknown reasons only five months later in October 1905. The former monkey house can still be seen on the property of 150 West Beechwold Boulevard where it is used as a barn. The original brick entrance can also be seen on North High Street at Beechwold Road.

The present Columbus Zoo opened in 1927 as the Columbus Zoological Gardens. The city of Columbus took over management of the zoo in 1951, but later gave up ownership to the Zoological Park Association, Inc., a non-profit organization, in 1970. The city continued providing funds from the city general fund, however, until 1986.

On December 22, 1956, Colo, a western lowland gorilla, became the world''s first captive-born gorilla at the Columbus Zoo. At the age of 60, she was the oldest gorilla in human care worldwide. Colo died on January 17th, 2017. Colo''s extended family includes 1 child, 10 grandchildren, 4 great grandchildren, and 2 great great grandchildren living in zoos throughout the country. The Columbus Zoo currently houses 15 gorillas, 6 of which are related to Colo. The Columbus Zoo has a gorrilla breeding program, with 31 gorillas born at the zoo since 1956. Colo was named after Columbus, the city of her birth.

Jack Hanna became the director of the Columbus Zoo in 1978 and remained director until 1993. The zoo benefited greatly from his oversight, rising to national recognition during his tenure. Prior to his arrival, the zoo saw an average annual attendance of about 360,000. In addition, the animal facilities were in need of renovation. Hanna put an extensive amount of effort into turning the Columbus Zoo into a model facility, including personally picking up trash after hours. Cage enclosures were also removed during his time and replaced with more natural looking habitats. His enthusiasm, along with his national television recognition, helped attract more visitors to the zoo, with over 1.4 million visitors annually by 1992. Hanna was named director emeritus of the zoo in 1993, and continues to be the public face for the zoo in its marketing campaigns.', 'https://www.columbuszoo.org/', true);
INSERT INTO landmark (landmark_name, landmark_picture, landmark_rating, latitude, longitude, state, city, zip_code, address, description, top_pick) VALUES ('Ohio Statehouse', 'OSH.jpg', 5, '39.961633', '-82.998954', 'OH', 'Columbus', '43215', '1 Capitol Square, Columbus, OH 43215', 'The Ohio Statehouse in Columbus is a Greek Revival style building. It is open to the public for guided or self guided tours, along with Capitol Square and the Senate building and atrium. Visitors are welcome to wander around the statehouse at their leisure and audio tour wands are available for free. The building underwent much needed, extensive renovations in the 1990s which returned it to its former glory. The ground floor offers educational displays, along with a cafe and gift shop.', true);
INSERT INTO landmark (landmark_name, landmark_picture, landmark_rating, latitude, longitude, state, city, zip_code, address, description, top_pick) VALUES ('North Market', 'NorthMarket.jpg', 4, '39.971912', '-83.004316', 'OH', 'Columbus', '43215', ' 59 Spruce St, Columbus, OH 43215', 'Established in 1876, the North Market is Columbus’ only remaining true public market. More than 30 merchants vend a wide variety of fresh, local, authentic food.', true);
INSERT INTO landmark (landmark_name, landmark_picture, landmark_rating, latitude, longitude, state, city, zip_code, address, description, top_pick) VALUES ('Easton Town Center', 'ETC.jpg', 5, '40.050725', '-82.915374', 'OH', 'Columbus', '43219', '4160 Easton Town Center, Columbus, OH 43219', 'East Town Center, one of Columbus biggest malls', false);
INSERT INTO landmark (landmark_name, landmark_picture, landmark_rating, latitude, longitude, state, city, zip_code, address, description, top_pick) VALUES ('Ohio Stadium', 'OS.jpg', 5, '40.004160', '-83.019691', 'OH', 'Columbus', '43210', '410 Woody Hayes Dr., Columbus, OH, 43210', 'The Ohio State University Football Stadium', false);
INSERT INTO landmark (landmark_name, landmark_picture, landmark_rating, latitude, longitude, state, city, zip_code, address, description, top_pick) VALUES ('German Village', 'GV.jpg', 5, '39.950364', '-82.995385', 'OH', 'Columbus', '43215', '588 S Third St., Columbus, OH 43215', 'German Village is a historic neighborhood in Ohio just south of downtown Columbus', false);
INSERT INTO landmark (landmark_name, landmark_picture, landmark_rating, latitude, longitude, state, city, zip_code, address, description, top_pick) VALUES ('Short North Arts District', 'SNAD.jpg', 5, '39.975383', '-83.004769', 'OH', 'Columbus', '43215', '120 W Goodale St., Columbus, OH 43215', 'As the art and soul of Columbus, the Short North is a vibrant cultural and business community.', false);
INSERT INTO landmark (landmark_name, landmark_picture, landmark_rating, latitude, longitude, state, city, zip_code, address, description, top_pick) VALUES ('Nationwide Arena', 'NWA.jpg', 5, '39.969351', '-83.006385', 'OH', 'Columbus', '43215', '200 W. Nationwide Blvd., Columbus, OH 43215', 'Nationwide Arena is a large multi-purpose arena, in Columbus, Ohio.', false);
INSERT INTO landmark (landmark_name, landmark_picture, landmark_rating, latitude, longitude, state, city, zip_code, address, description, top_pick) VALUES ('Audubon Center', 'Audubon.jpg', 4, '39.946310', '-83.009829', 'OH', 'Columbus', '43215', ' 505 W Whittier St, Columbus, OH 43215', 'A wonderful place for the general public to connect with nature. Their mission is to conserve and restore natural ecosystems, focusing on birds, other wildlife, and their habitats for the benefit of humanity and the earth’s biological diversity.', false);
INSERT INTO landmark (landmark_name, landmark_picture, landmark_rating, latitude, longitude, state, city, zip_code, address, description, top_pick) VALUES ('St.Josephs Cathedral', 'StJoseph.jpg', 4, '39.963344', '-82.994712', 'OH', 'Columbus', '43215', '212 East Broad Street, Columbus, OH 43215', 'Within walking distance from City Center, this church is one of the most beautiful in the country. As seen in the picture the arches are magnificent and the alter to rival anything in Europe.', false);
INSERT INTO landmark (landmark_name, landmark_picture, landmark_rating, latitude, longitude, state, city, zip_code, address, description, top_pick) VALUES ('Ohio Theater', 'OhioTheater.jpg', 4, '39.960068', '-82.998890', 'OH', 'Columbus', '43215', '39 E State St, Columbus, OH 43215', 'The Ohio Theatre is a performing arts center known as the "Official Theatre of the State of Ohio", the historic 1928 movie palace was saved from demolition in 1969 and completely restored', false);
INSERT INTO landmark (landmark_name, landmark_picture, landmark_rating, latitude, longitude, state, city, zip_code, address, description, top_pick) VALUES ('Scioto Mile Park', 'SciotoMile.jpg', 4, '39.958138', '-83.003485', 'OH', 'Columbus', '43215', ' 233 S Civic Center Dr, Columbus, OH 43215', 'Riverfront park system featuring interactive fountains, a 3D installation & a cultural arts center.', false);
INSERT INTO landmark (landmark_name, landmark_picture, landmark_rating, latitude, longitude, state, city, zip_code, address, description, top_pick) VALUES ('The Ohio Expo Center and State Fair', 'StateFair.jpg', 4, '40.002566', '-83.009829', 'OH', 'Columbus', '43211', '717 E 17th Ave, Columbus, OH 43211', 'Home to the annual Ohio State Fair and the Columbus Crew, a Major League Soccer team, more than 175 year-round events are proud to call the Ohio Expo Center home.', false);
INSERT INTO landmark (landmark_name, landmark_picture, landmark_rating, latitude, longitude, state, city, zip_code, address, description, top_pick) VALUES ('Ohio Craft Museum', 'ohio-craft-museum.jpg', 4, '39.988827', '-83.050846', 'OH', 'Columbus', '43212', '1665 W 5th Ave, Columbus, OH 43212', 'The Ohio Craft Museum is a program of Ohio Designer Craftsmen, presenting five major exhibitions each year, as well as focus exhibits and a rotating display of the permanent collection.', false);
INSERT INTO landmark (landmark_name, landmark_picture, landmark_rating, latitude, longitude, state, city, zip_code, address, description, top_pick) VALUES ('Cafe Brioso', 'CafeBrioso.jpg', 4, '39.963788', '-83.000574', 'OH', 'Columbus', '43215', '14 E Gay St, Columbus, OH 43215', 'Easygoing cafe vending premium espresso drinks, custom brews, abundant pastries & lunchtime fare.', false);
INSERT INTO landmark (landmark_name, landmark_picture, landmark_rating, latitude, longitude, state, city, zip_code, address, description, top_pick) VALUES ('Jennis Ice cream', 'JennisIceCream.jpg','4', '39.976968', '-83.009829', 'OH', 'Columbus', '43215', '714 N. High Stret, Columbus, OH 43215', 'Jenis Splendid Ice Creams is an artisan ice-cream company with national distribution. Known for its creative flavors and its high-quality ingredients.', false);
INSERT INTO landmark (landmark_name, landmark_picture, landmark_rating, latitude, longitude, state, city, zip_code, address, description, top_pick) VALUES ('Topiary Park', 'topiary.jpg', 5, '39.961149', '-82.987617', 'OH', 'Columbus', '43215', '480 E town St, Columbus, OH 43215', 'Quiet park featuring landscape plants artistically trimmed to recreate a famous Seurat painting.', false);



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
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (1, 4, 'We take all our out of town friends here when thy visit Columbus.', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (2, 2, 'great place', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (2, 1, 'great place', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (2, 3, 'What a nice park', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (3, 4, 'Great place to take kids along. Expect to spend all day.', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (3, 1, 'COSI is mainly for school aged children, except for one Thursday a month, they keep the kids out and let the grown ups play! COSI After Dark is a ton of fun. Cash bar, snacks, and lots of science to try out. Everything is hands on and way more fun a bit tipsy.', 4);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (3, 2, 'When we talked to people about what to do on our short trip, this was highly recommended. We were highly disappointed in the lack of exhibits and hands on activities and really thought that the museum would have more to offer. Wish we would have saved our $$$.', 3);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (4, 4, 'We loved the Moose, Bears and Manatees. We got to watch the Manatees eat their lettuce, it was a crack up. The Bears were amazing especially the Black and Brown Bears. Aquarium was a bit disappointing....', 4);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (4, 1, 'The attractions are great and in the summer months you have the water park that you can go to. You can pay for the water park and get into the zoo for free. The horse back ride the petting zoo and also the train ride are great for young kids age 5 and up the boat ride is great for all ages', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (4, 2, 'Wildlights at Columbus Zoo and Aquarium was a wonderful event. We went with a 2 year old. It was so fun watching the wonder and excitement on her little face. So much joy! The crowd was quite large but very respectful. This is a must see event.', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (5, 4, 'awesome', 3);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (5, 1, 'Highly recommended.', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (5, 2, 'Very nice visit', 4);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (6, 3, 'Look for the outside farmer''s market during the warm months', 4);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (6, 1, 'Great old fashionable market.', 3);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (6, 2, 'Wow, it was awsome to have so many vendors in one place.', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (7, 4, 'Highly recommended.', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (7, 1, 'Lots of shopping and restaurant options.', 4);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (7, 2, 'You can find any store you want here!', 4);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (8, 3, 'The city stops during a buckeye game, plan accordingly.', 4);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (8, 1, 'Go Bucks!', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (8, 2, 'The famous buckeye stadium was pretty cool.', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (9, 3, 'Hard to find parking.', 3);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (9, 1, 'Great neighborhood.', 4);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (9, 2, 'Stop by Schmmit''s for some german food', 4);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (10, 4, 'Go on a Saturday night, lots of fun.', 4);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (10, 1, 'Trendy area of Columbus', 4);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (10, 2, 'Great restaurants along North High St.', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (11, 4, 'It was ok.', 3);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (11, 1, 'Fun with friends!', 4);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (11, 2, 'Can''t wait to come again', 4);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (12, 4, 'Wonderful trails right in the city.', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (12, 1, 'Bird migration path, take your camera.', 4);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (12, 2, 'Went for a walk in the fall, beautiful meadow..', 3);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (13, 4, 'Beautiful church!', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (13, 1, 'The choir is awesome!', 4);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (14, 2, 'Highly recommended.', 4);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (14, 4, 'Awesome concert. Will return.', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (14, 1, 'great place', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (14, 4, 'Beautiful theater.', 4);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (15, 1, 'Great during the Arts Festival in June.', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (15, 4, 'Take your time and enjoy the downtown walking by the riverfront.', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (15, 1, 'great place for an evening walk', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (16, 2, 'Lots of fun for the family.', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (16, 4, 'The fair is a summer tradition, and it did not disappoint!', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (17, 1, 'Make sure you stop by for a quick visit.', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (17, 2, 'Hidden gem for art lovers', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (17, 4, 'Outstanding', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (18, 1, 'Had a great time there with friends.', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (18, 2, 'will stop by again', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (18, 4, 'Awesome atmosphere, delicious coffee.', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (19, 1, 'Great but expensive.', 4);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (19, 2, 'Must stop while in Columbus, delicious icecream.', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (20, 4, 'Will visit again in the winter. Must be beautiful with snow.', 4);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (20, 1, 'Loved it.', 5);
INSERT INTO review (landmark_id, user_id, review, rating) VALUES (20, 2, 'Perfect visit for gardeners and artists!', 5);

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