CREATE DATABASE Golfcup;

USE Golfcup;

CREATE TABLE Players(
	PersonNr VARCHAR(15) NOT NULL,
    Name VARCHAR(30) NOT NULL,
    Age INT NOT NULL,
    PRIMARY KEY (PersonNr)
);

CREATE TABLE Jackets(
	PersonNr VARCHAR(15) NOT NULL,
    Size CHAR NOT NULL,
	Model VARCHAR(15) NOT NULL,
    Material VARCHAR(15) NOT NULL,
    PRIMARY KEY (PersonNr, Model),
    FOREIGN KEY (PersonNr) REFERENCES Players(PersonNr)
);

CREATE TABLE Competitions(
	CompetitionName VARCHAR(20) NOT NULL,
    CompetitionDate DATE NOT NULL,
    PRIMARY KEY (CompetitionName)
);

CREATE TABLE Players_Competitions(
	PersonNr VARCHAR(15) NOT NULL,
    CompetitionName VARCHAR(20) NOT NULL,
    CONSTRAINT PK_Players_Competitions PRIMARY KEY
    (
        PersonNr,
        CompetitionName
    ),
    FOREIGN KEY (PersonNr) REFERENCES Players(PersonNr),
    FOREIGN KEY (CompetitionName) REFERENCES Competitions(CompetitionName)
);

CREATE TABLE Competitions_Rains(
	CompetitionName VARCHAR(20) NOT NULL,
	RainType VARCHAR(20) NOT NULL,
    RainTime TIME NOT NULL,
    CONSTRAINT PK_Competitions_Rains PRIMARY KEY
    (
        CompetitionName,
        RainType
    ),
    FOREIGN KEY (CompetitionName) REFERENCES Competitions(CompetitionName),
    FOREIGN KEY (RainType) REFERENCES Rains(RainType)
);

CREATE TABLE Rains(
	RainType VARCHAR(20) NOT NULL,
    WindForce VARCHAR(20) NOT NULL,
    PRIMARY KEY (RainType)
);

CREATE TABLE Clubs(
	PersonNr VARCHAR(15) NOT NULL,
    Material VARCHAR(20) NOT NULL,
    SerialNr INT NOT NULL,
    PRIMARY KEY (PersonNr, Material),
    FOREIGN KEY (PersonNr) REFERENCES Players(PersonNr),
    FOREIGN KEY (SerialNr) REFERENCES Constructions(SerialNr)
);

CREATE TABLE Constructions(
	SerialNr INT NOT NULL,
	Hardness INT NOT NULL,
    PRIMARY KEY (SerialNr)
);

INSERT INTO Players (PersonNr, Name, Age) VALUES ('1996-03-23', 'Johan Andersson', 25);
INSERT INTO Players (PersonNr, Name, Age) VALUES ('1993-04-02', 'Nicklas Jansson', 28);
INSERT INTO Players (PersonNr, Name, Age) VALUES ('1988-07-14', 'Annika Persson', 32);

INSERT INTO Competitions (CompetitionName, CompetitionDate) VALUES ('Big Golf Cup Skövde', '2021-06-10');

INSERT INTO Players_Competitions (PersonNr, CompetitionName) VALUES ('1996-03-23', 'Big Golf Cup Skövde');
INSERT INTO Players_Competitions (PersonNr, CompetitionName) VALUES ('1993-04-02', 'Big Golf Cup Skövde');
INSERT INTO Players_Competitions (PersonNr, CompetitionName) VALUES ('1988-07-14', 'Big Golf Cup Skövde');

INSERT INTO Rains (RainType, WindForce) VALUES ('Hail', '10m/s');

INSERT INTO Competitions_Rains (CompetitionName, RainType, RainTime) VALUES ('Big Golf Cup Skövde', 'Hail', '12:00:00');

INSERT INTO Jackets (PersonNr, Size, Model, Material) VALUES ('1996-03-23', 'M', 'Model1', 'Fleece');
INSERT INTO Jackets (PersonNr, Size, Model, Material) VALUES ('1996-03-23', 'M', 'Model2', 'Goretex');

INSERT INTO Constructions (SerialNr, Hardness) VALUES (1, 10);
INSERT INTO Constructions (SerialNr, Hardness) VALUES (2, 5);
INSERT INTO Constructions (SerialNr, Hardness) VALUES (3, 7);

INSERT INTO Clubs (PersonNr, Material, SerialNr) VALUES ('1993-04-02', 'Wood', 1);
INSERT INTO Clubs (PersonNr, Material, SerialNr) VALUES ('1988-07-14', 'Wood', 2);
INSERT INTO Clubs (PersonNr, Material, SerialNr) VALUES ('1996-03-23', 'Wood', 3);



SELECT Players.Age FROM Players WHERE Players.PersonNr = '1996-03-23';

SELECT Competitions.CompetitionDate FROM Competitions WHERE Competitions.CompetitionName = 'Big Golf Cup Skövde';

SELECT Clubs.Material FROM Clubs WHERE Clubs.PersonNR = '1996-03-23';

SELECT * FROM Jackets WHERE Jackets.PersonNr = '1996-03-23';

SELECT * FROM Players_Competitions WHERE Players_Competitions.CompetitionName = 'Big Golf Cup Skövde';

SELECT WindForce FROM Competitions_Rains INNER JOIN Rains Where Competitions_Rains.CompetitionName = 'Big Golf Cup Skövde';

SELECT * FROM PLAYERS WHERE Players.Age < 30;

DELETE FROM Jackets WHERE Jackets.PersonNr = '1996-03-23';

DELETE FROM Clubs WHERE Clubs.PersonNr = '1993-04-02';
DELETE FROM Players_Competitions WHERE Players_Competitions.PersonNr = '1993-04-02';
DELETE FROM Players WHERE Players.PersonNr = '1993-04-02';

SELECT AVG(Players.Age) FROM Players;