﻿CREATE TABLE Aeroporto
(
	Citta VARCHAR(20) NOT NULL PRIMARY KEY,
	Nazione VARCHAR(3) NOT NULL,
	NumPiste INT
)

CREATE TABLE VOLO
(
	IdVolo INT NOT NULL PRIMARY KEY IDENTITY,
	GiornoSett VARCHAR(20) NOT NULL,
	CittaPart VARCHAR(20) NOT NULL,
	OraPart DATE NOT NULL,
	CittaArr VARCHAR(20) NOT NULL,
	OraArr DATE NOT NULL,
	TipoAereo INT NOT NULL
)

CREATE TABLE Aereo
(
	TipoAereo INT NOT NULL PRIMARY KEY,
	NumPass INT NOT NULL,
	QtaMerci INT
)