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
	Emaila varchar(60),
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

CREATE TABLE Kantak.Saioak (
	ID_saioa integer identity primary key,
	izenburua varchar(69),
	letra varchar(1000),
	id_kategoria integer FOREIGN KEY REFERENCES Kantak.Generoa(id_Generoa),
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

	/*
	ID_erabiltzailea integer IDENTITY PRIMARY KEY,
	Erabiltzailea varchar(20),
	Pasahitza varchar(20),
	Izena varchar(30),Abizenak varchar(60), emaila varchar(60), telefonoa varchar(20), egoera integer */

INSERT INTO Kantak.Erabiltzaileak VALUES ('Olentzero','MariDomingi','Tartalo', 'Barandiarena', 'tartalo@euskaldunak.eus','', 1);
GO

Insert into Kantak.Generoa values ('Kalejira',1);
Insert into Kantak.Generoa values ('Fandango',1);
Insert into Kantak.Generoa values ('Arin Arin',1);
Insert into Kantak.Generoa values ('Rock',1);
Insert into Kantak.Generoa values ('Herrikoia',1);
Insert into Kantak.Generoa values ('Instrumentala',1);

select * from Kantak.Erabiltzaileak