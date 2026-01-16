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
SELECT codigo_empleado, COUNT(codigo_cliente) "Nº Clientes atendidos" FROM empleado,cliente
WHERE codigo_empleado = codigo_empleado_rep_ventas
GROUP BY codigo_empleado;

-- 9 Obtener cuál fue el primer y último pago que hizo el cliente cuyo código es el número 3
SELECT * FROM pago
WHERE codigo_cliente = 3
ORDER BY fecha_pago ASC
LIMIT 1;
SELECT * FROM pago
WHERE codigo_cliente = 3
ORDER BY fecha_pago DESC
LIMIT 1;

-- 10 Obtener el código de cliente de aquellos clientes que hicieron pagos en 2008.
SELECT * FROM pago
WHERE fecha_pago BETWEEN '2008-01-01' AND '2008-12-31'
ORDER BY fecha_pago;

-- 11 Obtener los distintos estados por los que puede pasar un pedido.
SELECT DISTINCT estado FROM pedido;

-- 12. Obtener el número de pedido, código de cliente, fecha requerida y fecha de entrega de los pedidos que no han sido entregados a tiempo.
SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega
FROM pedido WHERE (fecha_esperada < fecha_entrega);

--  13 Obtener cuántos productos existen en cada línea de pedido
SELECT codigo_pedido, COUNT(codigo_producto) "Productos por linea "FROM detalle_pedido
GROUP BY codigo_pedido;

-- 14 Obtener un listado de los 20 códigos de productos más pedidos ordenado por cantidad pedida.
SELECT codigo_producto,SUM(cantidad) "total_pedida"
FROM detalle_pedido
GROUP BY codigo_producto
ORDER BY total_pedida DESC
LIMIT 20;

-- 15 Obtener el número de pedido, código de cliente, fecha requerida y fecha de
-- entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes
-- de la fecha requerida. (Usar la función addDate)

SELECT codigo_pedido, codigo_cliente, fecha_entrega, fecha_esperada
FROM pedido
WHERE DATE_ADD(fecha_entrega, INTERVAL 2 DAY)  <= fecha_esperada;

-- 16 Obtener el nombre, apellidos, oficina y cargo de aquellos que no sean representantes de ventas.
SELECT nombre, apellido1, apellido2, codigo_oficina, puesto
FROM empleado
WHERE puesto != 'Representante Ventas';

-- 17 Obtener el número de clientes que tiene asignado cada representante de ventas.
SELECT empleado.codigo_empleado "ID Representante Ventas",COUNT(cliente.codigo_cliente) AS "Numero de clientes"
FROM empleado, cliente
WHERE empleado.puesto = 'Representante Ventas' AND empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas
GROUP BY empleado.codigo_empleado;

-- 18 Obtener un listado con el precio total de cada pedido.
SELECT codigo_pedido, SUM(precio_unidad * cantidad) "Precio Total" FROM detalle_pedido
GROUP BY codigo_pedido;

-- 19 Obtener cuántos pedidos tiene cada cliente en cada estado
SELECT codigo_cliente, COUNT(codigo_pedido) "Numero de pedido", estado
FROM pedido
GROUP BY codigo_cliente, estado;

-- 20 Obtener una lista con el código de oficina, ciudad, región y país de aquellas oficinas que estén en países que cuyo nombre empiece por “E”.
SELECT codigo_oficina, ciudad, region, pais 
FROM oficina 
WHERE pais LIKE 'E%';

-- 21 Obtener el nombre, gama, dimensiones, cantidad en stock y el precio de venta de los cinco productos más caros.
SELECT nombre, gama, dimensiones, cantidad_en_stock, precio_venta
FROM producto
ORDER BY precio_venta DESC
LIMIT 5;

-- 22 Obtener el código y la facturación de aquellos pedidos mayores de 2000 euros.
SELECT codigo_pedido , precio_unidad*cantidad "Facturacion"
FROM detalle_pedido
WHERE precio_unidad*cantidad > 2000;

-- 23 Obtener una lista de los productos mostrando el stock total, la gama y el proveedor.
SELECT codigo_producto, cantidad_en_stock, gama, proveedor
FROM producto;

-- 23 Obtener una lista de los productos mostrando el stock total, la gama y el proveedor. Otra interpretacion.
SELECT SUM(cantidad_en_stock), gama, proveedor
FROM producto
GROUP BY gama, proveedor;

-- 24 Obtener el número de pedidos y código de cliente de aquellos pedidos 
-- cuya fecha de pedido sea igual a la de la fecha de entrega.

SELECT codigo_cliente ,COUNT(codigo_pedido) "Numero de pedidos que se entregaron el mismo dia en el que se creó"
FROM pedido
WHERE fecha_pedido = fecha_entrega
GROUP BY codigo_cliente;
