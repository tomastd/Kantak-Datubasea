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

CREATE TABLE Kantak.Generoak (
	ID_Generoa integer identity primary key,
	Izena varchar(20)
	)

CREATE TABLE Kantak.Rolak (
	ID_rola integer identity primary key,
	Izena varchar(20)
	)

CREATE TABLE Kantak.Artistak (
	ID_artista integer IDENTITY PRIMARY KEY,
	Izena varchar(30),
	Abizenak varchar(60),
	Jaiotza date,
	Heriotza date,
	id_jabea integer FOREIGN KEY REFERENCES Kantak.Erabiltzaileak(id_erabiltzailea),
	id_mantentzailea integer FOREIGN KEY REFERENCES Kantak.Erabiltzaileak(id_erabiltzailea)
	)

CREATE TABLE Kantak.Dokumentuak (
	ID_dokumentua integer identity primary key,
	Izena varchar(20),
	DokMota Varchar(20),
	ruta varchar (255),
	id_mantentzailea integer FOREIGN KEY REFERENCES Kantak.Erabiltzaileak(id_erabiltzailea)
	)	 

CREATE TABLE Kantak.Saio_Motak (
	ID_saio_mota integer identity primary key,
	Saio_Mota VARCHAR(20),
	id_jabea integer FOREIGN KEY REFERENCES Kantak.Erabiltzaileak(id_erabiltzailea),
	id_mantentzailea integer FOREIGN KEY REFERENCES Kantak.Erabiltzaileak(id_erabiltzailea)
	)

CREATE TABLE Kantak.Saioak (
	ID_saioa integer identity primary key,
	izenburua varchar(69),
	id_saio_mota integer FOREIGN KEY REFERENCES Kantak.Saio_Motak(ID_saio_mota),
	id_generoa integer FOREIGN KEY REFERENCES Kantak.Generoak(id_generoa),
	sortze_data date,
	id_jabea integer FOREIGN KEY REFERENCES Kantak.Erabiltzaileak(id_erabiltzailea),
	id_mantentzailea integer FOREIGN KEY REFERENCES Kantak.Erabiltzaileak(id_erabiltzailea)
	)

CREATE TABLE Kantak.ParteHartzeak (
	ID_ParteHartze integer identity primary key,
	id_saioa integer FOREIGN KEY REFERENCES Kantak.Saioak(id_saioa),
	id_artista integer FOREIGN KEY REFERENCES Kantak.Artistak(id_artista),
	id_rola varchar(69),
	id_jabea integer FOREIGN KEY REFERENCES Kantak.Erabiltzaileak(id_erabiltzailea),
	id_mantentzailea integer FOREIGN KEY REFERENCES Kantak.Erabiltzaileak(id_erabiltzailea)
	)

CREATE TABLE Kantak.Erregistroak (
	id_artista integer FOREIGN KEY REFERENCES Kantak.Artistak(id_artista),
	id_saioa integer FOREIGN KEY REFERENCES Kantak.Saioak(id_saioa),
	id_dokumentua integer FOREIGN KEY REFERENCES Kantak.Dokumentuak(id_dokumentua) not null,
	CONSTRAINT UK_Erregistroak UNIQUE (id_artista,id_saioa,id_dokumentua)
	)


INSERT INTO Kantak.Erabiltzaileak VALUES ('Olentzero','MariDomingi','Tartalo', 'Barandiarena', 'tartalo@euskaldunak.eus','666777888', 1);
GO

INSERT INTO Kantak.Generoak VALUES ('Kalejira');
INSERT INTO Kantak.Generoak VALUES ('Fandango');
INSERT INTO Kantak.Generoak VALUES ('Arin Arin');
INSERT INTO Kantak.Generoak VALUES ('Rock');
INSERT INTO Kantak.Generoak VALUES ('Herrikoia');
INSERT INTO Kantak.Generoak VALUES ('Instrumentala');
GO

INSERT INTO Kantak.Rolak VALUES ('Jolea-Interpretea')
INSERT INTO Kantak.Rolak VALUES ('Sortzailea')
INSERT INTO Kantak.Rolak VALUES ('Teknikaria')
INSERT INTO Kantak.Rolak VALUES ('Idazlea')
INSERT INTO Kantak.Rolak VALUES ('Musikagilea')
GO

INSERT INTO Kantak.Artistak VALUES ('Fito','Cabrales','','',1,1)
INSERT INTO Kantak.Artistak VALUES ('Mikel','Urdangarin','','',1,1)
INSERT INTO Kantak.Artistak VALUES ('Roberto','Iniesta','','',1,1)
INSERT INTO Kantak.Artistak VALUES ('Mikel','Laboa','','',1,1)
GO

INSERT INTO Kantak.Dokumentuak VALUES ('Abestiaren Letra','Letra','http://tokirenbat.com/1',1)
INSERT INTO Kantak.Dokumentuak VALUES ('Abestiaren Partitura','Partitura','http://tokirenbat.com/2',1)
INSERT INTO Kantak.Dokumentuak VALUES ('Argazkia','Letra','http://tokirenbat.com/3',1,1)
INSERT INTO Kantak.Dokumentuak VALUES ('Abestiaren Partitura','Partitura','http://tokirenbat.com/4',1)
GO

INSERT INTO Kantak.Saio_Motak VALUES ('Kontzertua',1,1)
INSERT INTO Kantak.Saio_Motak VALUES ('Diska',1,1)
INSERT INTO Kantak.Saio_Motak VALUES ('Bideoklipa',1,1)
INSERT INTO Kantak.Saio_Motak VALUES ('Irratsailoa',1,1)
INSERT INTO Kantak.Saio_Motak VALUES ('Telebista saioa',1,1)
INSERT INTO Kantak.Saio_Motak VALUES ('In-fraganti',1,1)
GO

INSERT INTO Kantak.Saioak VALUES ('Saioaren Izena',2,3,'',1,1)
INSERT INTO Kantak.Saioak VALUES ('Saioaren Izena',3,1,'',1,1)
INSERT INTO Kantak.Saioak VALUES ('Saioaren Izena',1,2,'',1,1)
INSERT INTO Kantak.Saioak VALUES ('Saioaren Izena',1,2,'',1,1)
GO

INSERT INTO Kantak.ParteHartzeak VALUES (1,1,1,1,1)
GO


/*
SELECT * FROM Kantak.Erabiltzaileak
SELECT * FROM Kantak.Generoak
SELECT * FROM Kantak.Rolak
SELECT * FROM Kantak.Artistak
SELECT * FROM Kantak.Dokumentuak
SELECT * FROM Kantak.Saio_Motak
SELECT * FROM Kantak.Saioak
SELECT * FROM Kantak.ParteHartzeak
GO
*/