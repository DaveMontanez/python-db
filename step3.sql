CREATE DATABASE Final_Fantasy;

USE Final_Fantasy;

CREATE TABLE player (
	member_id INT,
	f_name VARCHAR(20),
	l_name VARCHAR(20),
	contact_phone VARCHAR(20),
	email VARCHAR(30),
	date_joined DATE,
	date_mod DATE,
	PRIMARY KEY (member_id));

CREATE TABLE servers (
	server_id INT,
	server_name VARCHAR(20),
	region VARCHAR(20),
	server_pop INT(20),
	server_status VARCHAR(10),
	date_created DATE,
	date_mod DATE, 
	PRIMARY KEY (server_id));

CREATE TABLE class (
	class VARCHAR(20),
	class_type VARCHAR(20),
	starting_city VARCHAR(20),
	date_created DATE,
	date_mod DATE,
	PRIMARY KEY (class));

CREATE TABLE characters (
	char_name VARCHAR(20),
	char_lvl VARCHAR(20),
	class VARCHAR(20),
	guild_name VARCHAR(20),
	server_id INT,
	member_id INT,
	date_created DATE,
	date_mod DATE,
	PRIMARY KEY (char_name, char_lvl),
	FOREIGN KEY (member_id) REFERENCES player(member_id),
	FOREIGN KEY (class) REFERENCES class(class),
	FOREIGN KEY (server_id) REFERENCES servers(server_id));

CREATE TABLE guild (
	guild_name VARCHAR(20),
	char_name VARCHAR(20),
	char_lvl INT,
	char_class VARCHAR(20),
	guild_rank VARCHAR(20),
	date_joined DATE,
	date_mod DATE,
	PRIMARY KEY (guild_name, char_name),
	FOREIGN KEY (char_name) REFERENCES Characters(char_name),
	FOREIGN KEY (char_class) REFERENCES Class(class));


INSERT INTO player VALUES (1, 'David', 'Montanez', 6512224444, 'dmoney@yahoo.com', '2012-01-10', '2017-04-05');
INSERT INTO player VALUES (2, 'Ralph', 'Olson', 6513331234, 'r.olson@gmail.com', '2012-01-12', '2016-02-01');
INSERT INTO player VALUES (3, 'Seth', 'Hartman', 6511223234, 'shartman@gmail.com', '2012-01-12', '2016-02-01');
INSERT INTO player VALUES (4, 'Billy', 'Miller', 6515675467, 'b.miller@hotmail.com', '2013-05-23', '2017-04-09');
INSERT INTO player VALUES (5, 'Sarah', 'Oneil', 6128479087, 's.oneill@gmail.com', '2012-03-11', '2017-04-04');
INSERT INTO player VALUES (6, 'Frank', 'Carlson', 6128746590, 'f.carlson@protonmail.com', '2012-05-21', '2017-04-04');
INSERT INTO player VALUES (7, 'Andy', 'Pinata', 6516478697, 'andyman1667@gmail.com', '2012-05-22', '2017-04-06');
INSERT INTO player VALUES (8, 'Emily', 'Kradke', 6125869705, 'e.k12@hotmail.com', '2012-04-23', '2017-01-01');
INSERT INTO player VALUES (9, 'Derek', 'Sanpellegrino', 9387550968, 'derek.san@gmail.com', '2012-01-23', '2017-02-22');
INSERT INTO player VALUES (10, 'Nathan', 'Jahnke', 1129028755, 'nate.yonke@yahoo.com', '2012-02-14', '2017-02-15');

INSERT INTO servers VALUES (101, 'Aegis', 'North America', 25123, 'Online', '2012-05-01', '2017-03-21');
INSERT INTO servers VALUES (102, 'Atomos', 'North America', 13401, 'Offline', '2012-05-01', '2017-02-13');
INSERT INTO servers VALUES (103, 'Carbuncle', 'North America', 4921, 'Online', '2012-05-01', '2017-03-20');
INSERT INTO servers VALUES (104, 'Garuda', 'North America', 9547, 'Online', '2012-05-01', '2017-01-12');
INSERT INTO servers VALUES (105, 'Bahamut', 'Europe', 192801, 'Online', '2013-01-010', '2017-03-14');
INSERT INTO servers VALUES (106, 'Kujata', 'Europe', 8210, 'Offline', '2013-01-010', '2017-03-13');
INSERT INTO servers VALUES (107, 'Ramuh', 'Europe', 14001, 'Offline', '2013-01-010', '2017-03-15');
INSERT INTO servers VALUES (108, 'Tonberry', 'Asia', 22677, 'Offline', '2013-05-15', '2017-02-22');
INSERT INTO servers VALUES (109, 'Typhon', 'Asia', 10192, 'Offline', '2013-05-15', '2017-02-23');
INSERT INTO servers VALUES (110, 'Fenrir', 'Asia', 9911, 'Online', '2013-05-15', '2017-02-24');

INSERT INTO class Values ('Warrior', 'Tank', 'Limsa Lominsa', '2012-05-01', '2012-05-01');
INSERT INTO class Values ('Paladin', 'Tank', 'Uldah', '2012-05-01', '2012-06-20');
INSERT INTO class Values ('Monk', 'Melee DPS', 'Uldah', '2012-05-01', '2012-06-20');
INSERT INTO class Values ('Dragoon', 'Melee DPS', 'Gridania', '2012-05-01', '2012-07-12');
INSERT INTO class Values ('Bard', 'Ranged Support', 'Gridania', '2012-05-01', '2012-07-12');
INSERT INTO class Values ('Ninja', 'Melee DPS', 'Limsa Lominsa', '2012-05-01', '2012-04-08');
INSERT INTO class Values ('White Mage', 'Healer', 'Gridania', '2012-05-01', '2012-04-08');
INSERT INTO class Values ('Black Mage', 'Ranged DPS', 'Uldah', '2012-05-01', '2012-04-08');
INSERT INTO class Values ('Summoner', 'Ranged DPS', 'Limsa Lominsa', '2012-05-01', '2012-04-08');
INSERT INTO class Values ('Scholar', 'Healer', 'Limsa Lominsa', '2012-05-01', '2012-04-08');

INSERT INTO characters Values ('Readymix', 60, 'Paladin', 'Wu-Tang Financial', 101, 10, '2012-02-14', '2017-02-15');
INSERT INTO characters Values ('Mesos', 70, 'Black Mage', 'Reign of Valor', 102, 9, '2012-03-15', '2016-12-25');
INSERT INTO characters Values ('Treehugger', 12, 'Bard', 'Heavensward', 103, 8, '2014-11-20', '2017-02-10');
INSERT INTO characters Values ('Solidsnake', 81, 'Warrior', 'Deathwings Wrath', 101, 7, '2013-09-09', '2017-03-13');
INSERT INTO characters Values ('Monty', 55, 'Monk', 'Armed Resistance', 105, 6, '2014-03-19', '2017-03-24');
INSERT INTO characters Values ('Pretzilla', 71, 'White Mage', 'Shoreview Killas', 109, 5, '2015-12-24', '2017-03-25');
INSERT INTO characters Values ('Enock', 22, 'Ninja', 'Nihongo', 107, 4, '2012-02-14', '2017-02-15');
INSERT INTO characters Values ('BeatTakeshi', 88, 'Summoner', 'TSM', 105, 3, '2015-04-16', '2017-01-17');
INSERT INTO characters Values ('Yosh', 100, 'Dragoon', 'Warriors of Light', 104, 2, '2012-03-20', '2017-01-15');
INSERT INTO characters Values ('Redrosid', 76, 'Paladin', 'Asian Ancients', 103, 1, '2015-04-04', '2017-03-28');

INSERT INTO guild Values ('Wu-Tang Financial', 'Readymix', 60, 'Paladin', 'Private', '2012-02-14', '2017-02-15');
INSERT INTO guild Values ('Reign of Valor', 'Mesos', 70, 'Black Mage', 'Private First Class', '2012-03-15', '2016-12-25');
INSERT INTO guild Values ('Heavensward', 'Treehugger', 12, 'Bard', 'Petty Officer', '2014-11-20', '2017-02-10');
INSERT INTO guild Values ('Deathwings Wrath', 'Alphamale', 81, 'Warrior', 'Lieutenant', '2013-09-09', '2017-03-13');
INSERT INTO guild Values ('Armed Resistance', 'Monty', 55, 'Monk', 'Colonel', '2014-03-19', '2017-03-24');
INSERT INTO guild Values ('Shoreview Killas', 'Pretzilla', 71, 'White Mage', 'Seaman', '2015-12-24', '2017-03-25');
INSERT INTO guild Values ('Nihongo', 'Enock', 22, 'Ninja', 'Alphadog', '2012-02-14', '2017-02-15');
INSERT INTO guild Values ('TSM', 'BeatTakesh', 88, 'Summoner', 'Captain', '2015-04-16', '2017-01-17');
INSERT INTO guild Values ('Warriors of Light', 'Yoshi', 100, 'Dragoon', 'Commander', '2012-03-20', '2017-01-15');
INSERT INTO guild Values ('Asian Ancients', 'Redrosid', 76, 'Paladin', 'Recruit', '2015-04-04', '2017-03-28');