DROP DATABASE IF EXISTS TiendaMoviles;
CREATE DATABASE TiendaMoviles;
USE TiendaMoviles;

CREATE TABLE Empleados (
  DNI CHAR(9) PRIMARY KEY,
  Nombre VARCHAR(40) NOT NULL,
  Apellidos VARCHAR(50) NOT NULL,
  fecha_alta DATE NOT NULL,
  Cuenta_ban VARCHAR(100) NOT NULL
);

CREATE TABLE Clientes (
  DNI CHAR(9) PRIMARY KEY,
  Nombre VARCHAR(40) NOT NULL,
  Apellidos VARCHAR(50) NOT NULL,
  Tarjeta_cred VARCHAR(100) NOT NULL
);

CREATE TABLE Ventas (
  Cod_venta CHAR(4) PRIMARY KEY,
  fecha DATETIME NOT NULL,
  DNI_emp CHAR(9) NOT NULL,
  DNI_cliente CHAR(9) NOT NULL,
  Apellidos VARCHAR(50) NOT NULL,
  Tarjeta_cred VARCHAR(100) NOT NULL,
    FOREIGN KEY (DNI_cliente) REFERENCES Clientes(DNI),
	FOREIGN KEY (DNI_emp) REFERENCES Empleados(DNI)
  );
  
  CREATE TABLE Moviles (
  Cod_movil CHAR(4) PRIMARY KEY,
  Fabricante VARCHAR(10) NOT NULL,
  Marca VARCHAR(10) NOT NULL,
  Modelo VARCHAR(10) NOT NULL,
  Precio_coste int NOT NULL,
  Precio_venta float(10,2)
);
  
  CREATE TABLE Moviles_ventas (
  Cod_movil CHAR(4) NOT NULL,
  Cod_venta CHAR(4) NOT NULL, 
  PRIMARY KEY (Cod_movil, Cod_venta),
  FOREIGN KEY (Cod_movil) REFERENCES Moviles(Cod_movil),
  FOREIGN KEY (Cod_venta) REFERENCES Ventas(Cod_venta)
  );

SELECT * FROM Moviles;
SELECT * FROM Moviles_ventas;
SELECT * FROM Ventas;
SELECT * FROM Clientes;
SELECT * FROM Empleados;
