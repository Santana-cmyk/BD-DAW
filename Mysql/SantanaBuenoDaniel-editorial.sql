-- Creamos la base de datos --
DROP DATABASE IF EXISTS Editorial;
CREATE DATABASE Editorial;
USE Editorial;

CREATE TABLE Sucursales (
  Codigo CHAR(4) PRIMARY KEY,
  Domicilio VARCHAR(40) NOT NULL,
  Telefono VARCHAR(50) NOT NULL
);

CREATE TABLE Periodistas (
  NIF CHAR(9) PRIMARY KEY,
  Nombre VARCHAR(40) NOT NULL,
  Apellidos VARCHAR(50) NOT NULL,
  Telefono VARCHAR(15) NOT NULL
);

CREATE TABLE Empleados (
  NIF CHAR(9) PRIMARY KEY,
  Nombre VARCHAR(40) NOT NULL,
  Apellidos VARCHAR(50) NOT NULL,
  Telefono VARCHAR(15) NOT NULL,
  Especialidad VARCHAR(50) NOT NULL,
  Cod_sucursal CHAR(4),
  FOREIGN KEY (Cod_sucursal) REFERENCES Sucursales(Codigo)
);

CREATE TABLE Revistas (
  Num_Registro CHAR(4) PRIMARY KEY,
  Titulo VARCHAR(30) NOT NULL,
  Periodicidad VARCHAR(20) NOT NULL, -- cambiado a texto
  Tipo VARCHAR(30) NOT NULL
);

CREATE TABLE Publican (
  Num_Registro CHAR(4) NOT NULL,
  Codigo_sucursal CHAR(4) NOT NULL,
  PRIMARY KEY (Codigo_sucursal, Num_Registro),
  FOREIGN KEY (Codigo_sucursal) REFERENCES Sucursales(Codigo),
  FOREIGN KEY (Num_Registro) REFERENCES Revistas(Num_Registro)
);

CREATE TABLE Ejemplares (
  Num_registro CHAR(4) NOT NULL,
  Fecha DATE NOT NULL,
  num_pag INT NOT NULL,
  num_ejemplares INT NOT NULL,
  PRIMARY KEY (Num_registro, Fecha),
  FOREIGN KEY (Num_Registro) REFERENCES Revistas(Num_Registro)
);

CREATE TABLE Secciones (
  Titulo VARCHAR(30) NOT NULL,
  Num_registro CHAR(4) NOT NULL,
  Extension INT NOT NULL,
  PRIMARY KEY (Num_registro, Titulo),
  FOREIGN KEY (Num_Registro) REFERENCES Revistas(Num_Registro)
);

CREATE TABLE Escriben (
  Num_registro CHAR(4) NOT NULL,
  NIF_Periodista CHAR(9) NOT NULL,
  PRIMARY KEY (Num_registro, NIF_Periodista),
  FOREIGN KEY (Num_Registro) REFERENCES Revistas(Num_Registro),
  FOREIGN KEY (NIF_Periodista) REFERENCES Periodistas(NIF)
);