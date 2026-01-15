USE jardineria;
-- 1 Obtener la ciudad y el teléfono de las oficinas de EEUU
SELECT ciudad, telefono FROM oficina WHERE pais = 'EEUU'
ORDER BY telefono;

-- 2 Obtener el cargo, nombre, apellidos e email del jefe de la empresa.
SELECT puesto, nombre, apellido1, apellido2, email, codigo_jefe
FROM empleado WHERE puesto = 'Director General'
ORDER BY puesto;

-- 3 Obtener el nombre, apellidos y cargo de aquellos que no sean representantes de ventas.
SELECT nombre, apellido1, apellido2, puesto
FROM empleado WHERE puesto != 'Representante Ventas';

-- 4 Obtener el número de clientes que tiene la empresa.
SELECT nombre "Numero de clientes" FROM cliente;

-- 5  Obtener el nombre de los clientes españoles
SELECT nombre_cliente FROM cliente  WHERE pais = 'Spain'; 

-- 6 Obtener cuántos clientes tiene la empresa en cada pais
SELECT COUNT(*) "Numero Clientes", pais FROM cliente
GROUP BY pais
ORDER BY pais;

-- 7 Obtener cuántos clientes tiene la empresa en la ciudad de Madrid.
SELECT COUNT(*) "numero de clientes en la ciudad de Madrid" FROM cliente WHERE ciudad = 'Madrid'
ORDER BY nombre_cliente;

-- 8 Obtener el código de empleado y el número de clientes al que atiende cada representante de ventas.
SELECT codigo_empleado, codigo_empleado_rep_ventas , COUNT(*) "Nº Clientes atendidos" FROM empleado,cliente
GROUP BY codigo_empleado, codigo_empleado_rep_ventas;
