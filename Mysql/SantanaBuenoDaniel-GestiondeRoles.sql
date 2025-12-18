DROP ROLE IF EXISTS 'rol_lectura_escritura', 'rol_lectura', 'rol_escritura';
CREATE ROLE 'rol_lectura_escritura', 'rol_lectura', 'rol_escritura';

GRANT ALL ON jardineria.* TO 'rol_lectura_escritura';
GRANT SELECT ON jardineria.* TO 'rol_lectura';
GRANT INSERT, UPDATE, DELETE ON jardineria.* TO 'rol_escritura';

DROP USER IF EXISTS 'admin'@'localhost';
CREATE USER 'admin'@'localhost' identified by 'password1';

DROP USER IF EXISTS 'admin'@'localhost';
CREATE USER 'admin'@'localhost' identified by 'password1';

DROP USER IF EXISTS 'usuario_lectura_1'@'localhost';
CREATE USER 'usuario_lectura_1'@'localhost' identified by 'password2';

DROP USER IF EXISTS 'usuario_lectura_2'@'localhost';
CREATE USER 'usuario_lectura_2'@'localhost' identified by 'password3';

DROP USER IF EXISTS 'usuario_lectura_3'@'localhost';
CREATE USER 'usuario_lectura_3'@'localhost' identified by 'password4';

DROP USER IF EXISTS 'usuario_escritura_1'@'localhost';
CREATE USER 'usuario_escritura_1'@'localhost' identified by 'password5';
DROP USER IF EXISTS 'usuario_escritura_2'@'localhost';
CREATE USER 'usuario_escritura_2'@'localhost' identified by 'password6';


GRANT 'rol_lectura_escritura' TO 'admin'@'localhost';
GRANT  'rol_lectura' TO 'usuario_lectura_1'@'localhost', 'usuario_lectura_2'@'localhost';
GRANT 'rol_escritura' TO 'usuario_escritura_1'@'localhost','usuario_escritura_2'@'localhost';

SET DEFAULT ROLE 'rol_lectura_escritura' to 'admin'@'localhost';
SET DEFAULT ROLE 'rol_lectura' to 'usuario_lectura_1'@'localhost','usuario_lectura_2'@'localhost';
SET DEFAULT ROLE  'rol_escritura' TO 'usuario_escritura_1'@'localhost','usuario_escritura_2'@'localhost';

