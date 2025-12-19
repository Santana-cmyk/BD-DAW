-- Creamos la base de datos --
DROP DATABASE IF EXISTS instituto;
CREATE DATABASE instituto;
USE instituto;

-- Creamos la tabla Profesores --
CREATE TABLE Profesores (
DNI CHAR(9) PRIMARY KEY,
Nombre VARCHAR(40)NOT NULL,
Direccion VARCHAR(50) NOT NULL,
Telefono varchar(15) NOT NULL);

-- Creamos la tabla Módulos --
CREATE TABLE Modulos (
Codigo VARCHAR(10) PRIMARY KEY,
Nombre VARCHAR(40)NOT NULL,
Curso VARCHAR(10) NOT NULL,
Dni_profesor char(9),
FOREIGN KEY (Dni_profesor) REFERENCES Profesores(DNI));

-- Creamos la tabla Alumnos --
CREATE TABLE Alumnos (
Nº_exp VARCHAR(10) PRIMARY KEY,
Nombre VARCHAR(40)NOT NULL,
Apellidos VARCHAR(50)NOT NULL,
Curso VARCHAR(10) NOT NULL,
Fecha_Nac DATE NOT NULL,
Nº_exp_delegado VARCHAR(10),
Grupo VARCHAR(10) NOT NULL,
FOREIGN KEY (Nº_exp_delegado) REFERENCES Alumnos(Nº_exp));

-- Creamos la tabla matriculaciones --
CREATE TABLE Matriculaciones (
Nº_exp_alumno VARCHAR(10),
Codigo_modulo VARCHAR(10),
PRIMARY KEY (Nº_exp_alumno,Codigo_modulo),
FOREIGN KEY (Nº_exp_alumno) REFERENCES Alumnos(Nº_exp),
FOREIGN KEY (Codigo_modulo) REFERENCES Modulos(Codigo));


