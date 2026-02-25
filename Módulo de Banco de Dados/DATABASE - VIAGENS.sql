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
    Data_reserva DATE,
    Valor_reserva DECIMAL(10,2),
    Status_reserva VARCHAR(255) DEFAULT "Pendente",
    FOREIGN KEY (ID_FK_Usuario) REFERENCES Usuarios(ID_Usuario),
    FOREIGN KEY (ID_FK_Destino) REFERENCES Destinos(ID_Destino)
);

/* ADICIONANDO DADOS NAS TABELAS */
INSERT INTO Usuarios (ID_Usuario, Nome, Sobrenome, Data_nascimeto, CPF) VALUES
(NULL, 'Ana', 'Silva', '2007-07-10', '12345678901'),
(NULL, 'Bruno', 'Oliveira', '1998-03-22', '23456789012'),
(NULL, 'Carla', 'Souza', '2001-11-05', '34567890123'),
(NULL, 'Daniel', 'Costa', '1995-01-30', '45678901234'),
(NULL, 'Eduarda', 'Pereira', '2003-09-18', '56789012345');

INSERT INTO Contatos_Usuarios 
(ID_Contato, ID_FK_Usuario, Email, Cod_pais, Cod_area, Telefone) VALUES
(NULL, 1, 'ana.silva@email.com', '55', '41', '912345678'),
(NULL, 2, 'bruno.oliveira@email.com', '55', '11', '923456789'),
(NULL, 3, 'carla.souza@email.com', '55', '21', '934567890'),
(NULL, 4, 'daniel.costa@email.com', '55', '31', '945678901'),
(NULL, 5, 'eduarda.pereira@email.com', '55', '51', '956789012');

INSERT INTO Enderecos 
(ID_Endereco, ID_FK_Usuario, Logradouro, Numero, Complemento, Bairro, Cidade, Estado, Codigo_postal, Pais) VALUES
(NULL, 1, 'Rua das Flores', '123', 'Apto 101', 'Centro', 'Curitiba', 'PR', '80000-000', 'Brasil'),
(NULL, 2, 'Av Paulista', '1500', NULL, 'Bela Vista', 'São Paulo', 'SP', '01310-100', 'Brasil'),
(NULL, 3, 'Rua Atlântica', '200', 'Cobertura', 'Copacabana', 'Rio de Janeiro', 'RJ', '22010-000', 'Brasil'),
(NULL, 4, 'Rua da Bahia', '450', NULL, 'Centro', 'Belo Horizonte', 'MG', '30160-011', 'Brasil'),
(NULL, 5, 'Rua dos Andradas', '890', 'Sala 305', 'Centro Histórico', 'Porto Alegre', 'RS', '90020-005', 'Brasil');

INSERT INTO Destinos (ID_Destino, Nome, Descricao) VALUES
(NULL, 'Paris', 'Cidade luz e destino romântico na França'),
(NULL, 'Nova York', 'Metrópole famosa pelos arranha-céus'),
(NULL, 'Tóquio', 'Capital tecnológica e cultural do Japão'),
(NULL, 'Rio de Janeiro', 'Cidade brasileira com praias famosas'),
(NULL, 'Roma', 'Cidade histórica italiana');

INSERT INTO Reservas 
(ID_Reserva, ID_FK_Usuario, ID_FK_Destino, Data_reserva, Valor_reserva, Status_reserva) VALUES
(NULL, 1, 4, '2026-01-10', 1200.50, 'Confirmada'),
(NULL, 2, 1, '2026-02-05', 4500.00, 'Pendente'),
(NULL, 3, 3, '2026-03-12', 9800.99, 'Confirmada'),
(NULL, 4, 2, '2026-04-20', 3200.75, 'Cancelada'),
(NULL, 5, 5, '2026-05-15', 7600.00, 'Pendente');


/* Consultas */
SELECT * FROM Usuarios US
INNER JOIN Reservas RS ON US.ID_Usuario = RS.ID_FK_Usuario
INNER JOIN Destinos DS ON DS.ID_Destino = RS.ID_FK_Destino;

SELECT COUNT(*) AS Total_Usuarios FROM Usuarios;

SELECT MAX(TIMESTAMPDIFF(YEAR, Data_nascimeto, CURRENT_DATE()) ) AS Maior_idade FROM Usuarios;

SELECT COUNT(*), ID_FK_Destino FROM Reservas GROUP BY ID_FK_Destino;

SELECT COUNT(*) AS 	QTD_RESERVAS, ID_FK_Destino FROM Reservas
GROUP BY ID_FK_Destino ORDER BY QTD_RESERVAS DESC;

/* UTILIZANDO PLANO DE EXECUÇÃO */
EXPLAIN
	SELECT * FROM Usuarios WHERE Nome = "João";
    
CREATE INDEX IDX_nome ON Usuarios (Nome);
