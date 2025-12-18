-- Creamos la base de datos --
DROP DATABASE IF EXISTS instituto;
CREATE DATABASE instituto;
USE instituto;

-- Creamos la tabla Profesores --
CREATE TABLE Profesores (
  DNI CHAR(9) PRIMARY KEY,
  Nombre VARCHAR(40) NOT NULL,
  Direccion VARCHAR(50) NOT NULL,
  Telefono VARCHAR(15) NOT NULL
);

-- Creamos la tabla Modulos --
CREATE TABLE Modulos (
  Codigo VARCHAR(10) PRIMARY KEY,
  Nombre VARCHAR(40) NOT NULL,
  Curso VARCHAR(50) NOT NULL,
  Dni_profesor CHAR(9),
  CONSTRAINT Dni_profesor FOREIGN KEY (Dni_profesor) REFERENCES Profesores(DNI)
);

-- Creamos la tabla Alumnos --
CREATE TABLE Alumnos (
  Num_exp VARCHAR(10) PRIMARY KEY,
  Nombre VARCHAR(40) NOT NULL,
  Apellidos VARCHAR(50) NOT NULL,
  Curso VARCHAR(10) NOT NULL,
  Fecha_Nac DATE NOT NULL,
  Num_exp_delegado VARCHAR(10),
  Grupo VARCHAR(10) NOT NULL,
  FOREIGN KEY (Num_exp_delegado) REFERENCES Alumnos(Num_exp)
  ON DELETE CASCADE ON UPDATE CASCADE
);

-- Creamos la tabla Matriculaciones --
CREATE TABLE Matriculaciones (
  Num_exp_alumno VARCHAR(10),
  Codigo_modulo VARCHAR(10),
  PRIMARY KEY (Num_exp_alumno, Codigo_modulo),
  FOREIGN KEY (Num_exp_alumno) REFERENCES Alumnos(Num_exp)
    ON DELETE CASCADE ON UPDATE CASCADE

);

-- Eliminar clave foránea Dni_profesor de la tabla Modulos
ALTER TABLE Modulos DROP FOREIGN KEY Dni_profesor;

-- Eliminar la clave primaria de la tabla Modulos
ALTER TABLE Modulos DROP PRIMARY KEY;

-- Modificar el tipo de dato de la columna Codigo
ALTER TABLE Modulos MODIFY Codigo INT(4) ZEROFILL;
ALTER TABLE Modulos ADD PRIMARY KEY (Codigo);

-- Vuelve a crear la FOREIGN KEY DNI_profesor en la tabla modulos
ALTER TABLE Modulos ADD CONSTRAINT dni_profesor_fk
  FOREIGN KEY (Dni_profesor) REFERENCES Profesores(DNI);

ALTER TABLE Matriculaciones 
MODIFY Codigo_modulo INT(4) ZEROFILL;

ALTER TABLE Matriculaciones 
ADD CONSTRAINT Codigo_modulo_fk
FOREIGN KEY (Codigo_modulo) REFERENCES Modulos(Codigo);

-- Insertar filas en la tabla Profesores --
INSERT INTO Profesores (DNI, Nombre, Direccion, Telefono) 
VALUES 
  ('23556443Z','Antonio Muñoz', 'Av. Carlos Haya', '951345678'),
  ('23556443O','Luisa Leal', 'Av. Pacheco', '685235124');

-- Insertar filas en la tabla Modulos --
INSERT INTO Modulos (Codigo, Nombre, Curso, Dni_profesor)
VALUES (485, 'Programacion','1ºDAW','23556443O'),
	(484, 'Bases de datos', '1º DAW', '23556443Z');
		

-- Insertar filas en la tabla Alumnos --
INSERT INTO Alumnos (Num_exp, Nombre, Apellidos, Curso, Fecha_Nac,Num_exp_delegado,Grupo) 
VALUES 
  ('D456','Eustaquio', 'Paredes', 'DAW', '1998-05-25','D456','1º'),
  ('R548','Jose Maria', 'Cantero', 'DAW','1985-08-30','R548','2º');
  
-- Insertar filas en la tabla Matriculaciones --
INSERT INTO Matriculaciones (Num_exp_alumno, Codigo_modulo) 
VALUES 
  ('D456','485'),
  ('R548','485');

-- Elimina una fila  de la tabla alumnos
DELETE FROM alumnos WHERE Num_exp = 'D456';

-- Consultar tablas --
SELECT * FROM Modulos;
SELECT * FROM Profesores;
SELECT * FROM Alumnos;
SELECT * FROM Matriculaciones;

