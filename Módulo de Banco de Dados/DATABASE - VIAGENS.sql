CREATE DATABASE Bootcamp_aula;

USE Bootcamp_aula;

CREATE TABLE Usuarios (
    ID_Usuario INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Sobrenome VARCHAR(255) NOT NULL,
    Data_nascimeto DATE NOT NULL,
    CPF VARCHAR(11) NOT NULL UNIQUE
);

CREATE TABLE Contatos_Usuarios (
	ID_Contato INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    ID_FK_Usuario INT NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    Cod_pais CHAR(3) NOT NULL,
    Cod_area CHAR(3) NULL,
    Telefone VARCHAR(10) NOT NULL UNIQUE,
    FOREIGN KEY (ID_FK_Usuario) REFERENCES Usuarios(ID_Usuario)
);

CREATE TABLE Enderecos (
	ID_Endereco INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    ID_FK_Usuario INT NOT NULL,
    Logradouro VARCHAR(150) NOT NULL,
	Numero VARCHAR(10) NULL,
	Complemento VARCHAR(100) NULL,
	Bairro VARCHAR(100) NULL,
	Cidade VARCHAR(100) NOT NULL,
	Estado VARCHAR(100) NULL,
	Codigo_postal VARCHAR(12) NULL,
	Pais VARCHAR(100) NOT NULL,
    FOREIGN KEY (ID_FK_Usuario) REFERENCES Usuarios(ID_Usuario)    
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
    Data_reserva DATE NOT NULL,
    Status VARCHAR(255) DEFAULT "Pendente",
    FOREIGN KEY (ID_FK_Usuario) REFERENCES Usuarios(ID_Usuario),
    FOREIGN KEY (ID_FK_Destino) REFERENCES Destinos(ID_Destino)
);
