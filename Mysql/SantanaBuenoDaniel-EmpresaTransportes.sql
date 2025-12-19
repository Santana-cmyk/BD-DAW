CREATE DATABASE Empresa_Transportes CHARSET utf8mb4;
USE Empresa_Transportes;

CREATE TABLE Camioneros ( 
	DNI CHAR(9) PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
    telf INT NOT NULL,
    Direccion VARCHAR(100),
    Salario FLOAT
);

CREATE TABLE Camiones( 
	Matrícula CHAR(7) PRIMARY KEY,
	Modelo VARCHAR(100),
    Tipo VARCHAR(100),
    Potencia INT
);

CREATE TABLE Provincias ( 
	Código INT PRIMARY KEY,
	Descripción VARCHAR(100),
	Destinatario VARCHAR(100),
    Direccion VARCHAR(100)
);

CREATE TABLE Paquetes ( 
	Código INT PRIMARY KEY,
	Destinatario VARCHAR(100),
    Direccion VARCHAR(100),
    Dni_Camionero CHAR(9),
    Codigo_Provincia INT,
    FOREIGN KEY (Dni_Camionero) REFERENCES Camioneros(DNI),
	FOREIGN KEY (Codigo_Provincia) REFERENCES Provincias(Código)
);

CREATE TABLE Conduce ( 
	Dni CHAR(9),
    Fecha DATE,
    Matrícula CHAR(7),
    PRIMARY KEY (Dni, Matrícula, Fecha),
    FOREIGN KEY (Dni) REFERENCES Camioneros(DNI),
	FOREIGN KEY (Matrícula) REFERENCES Camiones(Matrícula)
);


SELECT * FROM Camiones;
SELECT * FROM Provincias;
SELECT * FROM Paquetes;
SELECT * FROM Conduce;