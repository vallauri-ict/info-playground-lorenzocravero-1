/* creazione tabelle */
CREATE TABLE Automobili
(
	Targa varchar(7) PRIMARY KEY NOT NULL,

	Marca varchar(30) NOT NULl,

	Cilindrata int NOT NULL,

	CodF int NOT NULL,

	CodAss int NOT NULL
)

CREATE TABLE Proprietari
(
	CodF int PRIMARY KEY,

	Nome varchar(30) NOT NULL,

	Residenza varchar(30) NOT NULL
)

CREATE TABLE Assicurazioni
(
	CodAss int PRIMARY KEY NOT NULL,

	Nome varchar(30) NOT NULL,

	Sede varchar(30) NOT NULL
)

CREATE TABLE Sinistro
(
	CodS int PRIMARY KEY NOT NULL,

	Localita varchar(30) NOT NULL,

	Giorno Date NOT NULL
)

CREATE TABLE Sinistro
(
	CodS int PRIMARY KEY NOT NULL,

	Targa varchar(7) NOT NULL,

	ImportoDelDanno int NOT NULL
)
