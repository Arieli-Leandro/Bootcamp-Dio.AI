CREATE DATABASE Bootcamp_aula;

USE Bootcamp_aula;

CREATE TABLE Usuarios (
    ID_Usuario INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Endereco VARCHAR(50) NOT NULL,
    Data_nascimeto DATE NOT NULL
);

CREATE TABLE Destinos (
	ID_Destino INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    Nome Varchar(255) NOT NULL,
    Descricao VARCHAR(255) NOT NULL
);

CREATE TABLE Reservas (
	ID_Reserva INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    ID_FK_Usuario INT,
    ID_FK_Destino INT,
    Data_reserva DATE,
    Status VARCHAR(255) DEFAULT "Pendente",
    FOREIGN KEY (ID_FK_Usuario) REFERENCES Usuarios(ID_Usuario),
    FOREIGN KEY (ID_FK_Destino) REFERENCES Destinos(ID_Destino)
);