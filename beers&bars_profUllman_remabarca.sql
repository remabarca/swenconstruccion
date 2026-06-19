/*
 * SQL script used to create beers & bars Ullman's DB.
 */
DROP TABLE IF EXISTS Frequents;
DROP TABLE IF EXISTS Serves;
DROP TABLE IF EXISTS Likes;
DROP TABLE IF EXISTS Bar; 
DROP TABLE IF EXISTS Beer;
DROP TABLE IF EXISTS Drinker;

CREATE TABLE Bar(
  name VARCHAR(20) NOT NULL PRIMARY KEY,
  address VARCHAR(20));

CREATE TABLE Beer(
  name VARCHAR(20) NOT NULL PRIMARY KEY,
  brewer VARCHAR(20));

CREATE TABLE Drinker(
  name VARCHAR(20) NOT NULL PRIMARY KEY,
  address VARCHAR(20));

CREATE TABLE Frequents(
  drinker VARCHAR(20) NOT NULL REFERENCES Drinker(name),
  bar VARCHAR(20) NOT NULL REFERENCES Bar(name),
  times_a_week SMALLINT CHECK(times_a_week > 0),
  PRIMARY KEY(drinker, bar));

CREATE TABLE Serves(
  bar VARCHAR(20) NOT NULL REFERENCES Bar(name),
  beer VARCHAR(20) NOT NULL REFERENCES Beer(name),
  price DECIMAL(5,2) CHECK(price > 0),
  PRIMARY KEY(bar, beer));

CREATE TABLE Likes(
  drinker VARCHAR(20) NOT NULL REFERENCES Drinker(name),
  beer VARCHAR(20) NOT NULL REFERENCES Beer(name),
  PRIMARY KEY(drinker, beer));
  
INSERT INTO Bar VALUES('Down Under Pub', '802 W. Main Street');
INSERT INTO Bar VALUES('The Edge', '108 Morris Street');
INSERT INTO Bar VALUES('James Joyce Pub', '912 W. Main Street');
INSERT INTO Bar VALUES('Satisfaction', '905 W. Main Street');
INSERT INTO Bar VALUES('Talk of the Town', '108 E. Main Street');
INSERT INTO Bar VALUES('Moe''s Tavern', '100 Walnut Street, Springfield');
INSERT INTO Bar VALUES('Leaky Cauldron', 'Number 1, Diagon Alley and Charing Cross Road');
INSERT INTO Bar VALUES('Mos Eisley Cantina', 'Inner Curved Street');
INSERT INTO Bar VALUES('The Garrison Tavern', 'Garrison Lane and Witton Street');

INSERT INTO Beer VALUES('Amstel', 'Amstel Brewery');
INSERT INTO Beer VALUES('Budweiser', 'Anheuser-Busch Inc.');
INSERT INTO Beer VALUES('Corona', 'Grupo Modelo');
INSERT INTO Beer VALUES('Dixie', 'Dixie Brewing');
INSERT INTO Beer VALUES('Erdinger', 'Erdinger Weissbrau');
INSERT INTO Beer VALUES('Full Sail', 'Full Sail Brewing');
INSERT INTO Beer VALUES('Duff', 'Duff Industries');
INSERT INTO Beer VALUES('Butterbeer', 'Universal Parks & Resorts');
INSERT INTO Beer VALUES('Shelby Beer', 'Thornbridge Brewery');
INSERT INTO Beer Values('Gamorrean Ale', 'New Belgium Brew Co');

INSERT INTO Drinker VALUES('Amy', '100 W. Main Street');
INSERT INTO Drinker VALUES('Ben', '101 W. Main Street');
INSERT INTO Drinker VALUES('Coy', '200 S. Duke Street');
INSERT INTO Drinker VALUES('Dan', '300 N. Duke Street');
INSERT INTO Drinker VALUES('Eve', '100 W. Main Street');
INSERT INTO Drinker VALUES('Homero', '742 Evergreen T.');
INSERT INTO Drinker VALUES('Barney', 'Above Moe''s Tavern');
INSERT INTO Drinker VALUES('Hermione', '8 Heathgate Hampstead');
INSERT INTO Drinker VALUES('Arthur', 'Rostherne Tatton P');
INSERT INTO Drinker VALUES('Chewbacca', 'Wroshyr t., Rwookrrorro');

INSERT INTO Frequents VALUES('Amy', 'James Joyce Pub', 2);
INSERT INTO Frequents VALUES('Ben', 'James Joyce Pub', 1);
INSERT INTO Frequents VALUES('Ben', 'Satisfaction', 2);
INSERT INTO Frequents VALUES('Ben', 'Talk of the Town', 1);
INSERT INTO Frequents VALUES('Coy', 'Down Under Pub', 1);
INSERT INTO Frequents VALUES('Coy', 'The Edge', 1);
INSERT INTO Frequents VALUES('Coy', 'Joe''s', 1);
INSERT INTO Frequents VALUES('Dan', 'Down Under Pub', 2);
INSERT INTO Frequents VALUES('Dan', 'The Edge', 1);
INSERT INTO Frequents VALUES('Dan', 'James Joyce Pub', 1);
INSERT INTO Frequents VALUES('Dan', 'Satisfaction', 2);
INSERT INTO Frequents VALUES('Dan', 'Talk of the Town', 2);
INSERT INTO Frequents VALUES('Eve', 'James Joyce Pub', 2);
INSERT INTO Frequents VALUES('Arthur', 'The Garrison Tavern', 2);
INSERT INTO Frequents VALUES('Hermione', 'Leaky Cauldron', 1);
INSERT INTO Frequents VALUES('Homero', 'Moe''s Tavern', 1);
INSERT INTO Frequents VALUES('Barney', 'Moe''s Tavern', 2);
INSERT INTO Frequents VALUES('Chewbacca', 'Mos Eisley Cantina', 2);

INSERT INTO Likes VALUES('Amy', 'Amstel');
INSERT INTO Likes VALUES('Amy', 'Corona');
INSERT INTO Likes VALUES('Ben', 'Amstel');
INSERT INTO Likes VALUES('Ben', 'Budweiser');
INSERT INTO Likes VALUES('Coy', 'Dixie');
INSERT INTO Likes VALUES('Dan', 'Amstel');
INSERT INTO Likes VALUES('Dan', 'Budweiser');
INSERT INTO Likes VALUES('Dan', 'Corona');
INSERT INTO Likes VALUES('Dan', 'Dixie');
INSERT INTO Likes VALUES('Dan', 'Erdinger');
INSERT INTO Likes VALUES('Eve', 'Amstel');
INSERT INTO Likes VALUES('Eve', 'Corona');
INSERT INTO Likes VALUES('Hermione', 'Butterbeer');
INSERT INTO Likes VALUES('Arthur', 'Shelby Beer');
INSERT INTO Likes VALUES('Arthur', 'Erdinger');
INSERT INTO Likes VALUES('Homero', 'Duff');
INSERT INTO Likes VALUES('Barney', 'Duff');
INSERT INTO Likes VALUES('Barney', 'Corona');
INSERT INTO Likes VALUES('Barney', 'Budweiser');
INSERT INTO Likes VALUES('Barney', 'Amstel');
INSERT INTO Likes VALUES('Chewbacca', 'Gamorrean Ale');

INSERT INTO Serves VALUES('Down Under Pub', 'Amstel', 2.75);
INSERT INTO Serves VALUES('Down Under Pub', 'Budweiser', 2.25);
INSERT INTO Serves VALUES('Down Under Pub', 'Corona', 3.00);
INSERT INTO Serves VALUES('The Edge', 'Amstel', 2.75);
INSERT INTO Serves VALUES('The Edge', 'Budweiser', 2.50);
INSERT INTO Serves VALUES('The Edge', 'Corona', 3.00);
INSERT INTO Serves VALUES('James Joyce Pub', 'Amstel', 3.00);
INSERT INTO Serves VALUES('James Joyce Pub', 'Corona', 3.25);
INSERT INTO Serves VALUES('James Joyce Pub', 'Dixie', 3.00);
INSERT INTO Serves VALUES('James Joyce Pub', 'Erdinger', 3.50);
INSERT INTO Serves VALUES('Satisfaction', 'Amstel', 2.75);
INSERT INTO Serves VALUES('Satisfaction', 'Budweiser', 2.25);
INSERT INTO Serves VALUES('Satisfaction', 'Corona', 2.75);
INSERT INTO Serves VALUES('Satisfaction', 'Dixie', 2.75);
INSERT INTO Serves VALUES('Satisfaction', 'Full Sail', 2.75);
INSERT INTO Serves VALUES('Talk of the Town', 'Amstel', 2.50);
INSERT INTO Serves VALUES('Talk of the Town', 'Budweiser', 2.20);
INSERT INTO Serves VALUES('The Garrison Tavern', 'Shelby Beer', 0.50);
INSERT INTO Serves VALUES('The Garrison Tavern', 'Erdinger', 0.50);
INSERT INTO Serves VALUES('Leaky Cauldron', 'Butterbeer', 1.25);
INSERT INTO Serves VALUES('Moe''s Tavern', 'Duff', 2.50);


