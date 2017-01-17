/*
USE MASTER
DROP DATABASE KANTAK
GO
*/

USE MASTER
GO

CREATE DATABASE KANTAK
GO

USE KANTAK
GO

CREATE SCHEMA Kantak
GO

CREATE TABLE Kantak.Erabiltzaileak (
	ID_erabiltzailea integer IDENTITY PRIMARY KEY,
	Erabiltzailea varchar(20),
	Pasahitza varchar(20),
	Izena varchar(30),
	Abizenak varchar(60),
	emaila varchar(60),
	telefonoa varchar(20),
	egoera integer
	)

CREATE TABLE Kantak.Generoa (
	ID_Generoa integer identity primary key,
	Izena varchar(20),
	id_erabiltzailea integer FOREIGN KEY REFERENCES Kantak.Erabiltzaileak(id_erabiltzailea)
	)

CREATE TABLE Kantak.Rolak (
	ID_rola integer identity primary key,
	Izena varchar(20),
	id_erabiltzailea integer FOREIGN KEY REFERENCES Kantak.Erabiltzaileak(id_erabiltzailea)
	)

CREATE TABLE Kantak.Artistak (
	ID_artista integer IDENTITY PRIMARY KEY,
	Izena varchar(30),
	Abizenak varchar(60),
	Jaiotza date,
	Heriotza date,
	id_erabiltzailea integer FOREIGN KEY REFERENCES Kantak.Erabiltzaileak(id_erabiltzailea)
	)

CREATE TABLE Kantak.Dokumentuak (
	ID_dokumentua integer identity primary key,
	Izena varchar(20),
	DokMota Varchar(20),
	ruta varchar (255),
	id_erabiltzailea integer FOREIGN KEY REFERENCES Kantak.Erabiltzaileak(id_erabiltzailea)
	)	 

CREATE TABLE Kantak.Saio_Motak (
	ID_saio_mota integer identity primary key,
	Saio_Mota VARCHAR(20),
	)

CREATE TABLE Kantak.Saioak (
	ID_saioa integer identity primary key,
	izenburua varchar(69),
	id_saio_mota integer FOREIGN KEY REFERENCES Kantak.Saio_Motak(ID_saio_mota),
	sortze_data date,
	id_erabiltzailea integer FOREIGN KEY REFERENCES Kantak.Erabiltzaileak(id_erabiltzailea)
	)

CREATE TABLE Kantak.ParteHartzeak (
	ID_ParteHartze integer identity primary key,
	id_saioa integer FOREIGN KEY REFERENCES Kantak.Saioak(id_saioa),
	id_artista integer FOREIGN KEY REFERENCES Kantak.Artistak(id_artista),
	id_rola varchar(69),
	id_dokumentua integer FOREIGN KEY REFERENCES Kantak.Dokumentuak(id_dokumentua),
	id_erabiltzailea integer FOREIGN KEY REFERENCES Kantak.Erabiltzaileak(id_erabiltzailea)
	)

INSERT INTO Kantak.Erabiltzaileak VALUES ('Olentzero','MariDomingi','Tartalo', 'Barandiarena', 'tartalo@euskaldunak.eus','666777888', 1);
GO

INSERT INTO Kantak.Generoa VALUES ('Kalejira',1);
INSERT INTO Kantak.Generoa VALUES ('Fandango',1);
INSERT INTO Kantak.Generoa VALUES ('Arin Arin',1);
INSERT INTO Kantak.Generoa VALUES ('Rock',1);
INSERT INTO Kantak.Generoa VALUES ('Herrikoia',1);
INSERT INTO Kantak.Generoa VALUES ('Instrumentala',1);
GO

INSERT INTO Kantak.Rolak VALUES ('Jolea-Interpretea',1)
INSERT INTO Kantak.Rolak VALUES ('Sortzailea',1)
INSERT INTO Kantak.Rolak VALUES ('Teknikaria',1)
INSERT INTO Kantak.Rolak VALUES ('Idazlea',1)
INSERT INTO Kantak.Rolak VALUES ('Musikagilea',1)
GO

INSERT INTO Kantak.Artistak VALUES ('Fito','Cabrales','','',1)
INSERT INTO Kantak.Artistak VALUES ('Mikel','Urdangarin','','',1)
INSERT INTO Kantak.Artistak VALUES ('Roberto','Iniesta','','',1)
INSERT INTO Kantak.Artistak VALUES ('Mikel','Laboa','','',1)
GO

INSERT INTO Kantak.Dokumentuak VALUES ('Abestiaren Letra','Letra','http://tokirenbat.com/1',1)
INSERT INTO Kantak.Dokumentuak VALUES ('Abestiaren Partitura','Partitura','http://tokirenbat.com/2',1)
INSERT INTO Kantak.Dokumentuak VALUES ('Argazkia','Letra','http://tokirenbat.com/3',1)
INSERT INTO Kantak.Dokumentuak VALUES ('Abestiaren Partitura','Partitura','http://tokirenbat.com/4',1)

INSERT INTO Kantak.Saio_Motak VALUES ('Kontzertua')
INSERT INTO Kantak.Saio_Motak VALUES ('Diska')
INSERT INTO Kantak.Saio_Motak VALUES ('Bideoklipa')
INSERT INTO Kantak.Saio_Motak VALUES ('Irratsailoa')
INSERT INTO Kantak.Saio_Motak VALUES ('Telebista saioa')
INSERT INTO Kantak.Saio_Motak VALUES ('In-fraganti')

INSERT INTO Kantak.Saioak VALUES ('Saioaren Izena',2,'',1)
INSERT INTO Kantak.Saioak VALUES ('Saioaren Izena',3,'',1)
INSERT INTO Kantak.Saioak VALUES ('Saioaren Izena',1,'',1)
INSERT INTO Kantak.Saioak VALUES ('Saioaren Izena',1,'',1)



SELECT * FROM Kantak.Erabiltzaileak
SELECT * FROM Kantak.Generoa
SELECT * FROM Kantak.Rolak
SELECT * FROM Kantak.Artistak
SELECT * FROM Kantak.Dokumentuak
SELECT * FROM Kantak.Saio_Motak
SELECT * FROM Kantak.Saioak
SELECT * FROM Kantak.ParteHartzeak