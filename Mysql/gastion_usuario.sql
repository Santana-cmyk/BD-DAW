CREATE USER 'miguel'@'localhost' IDENTIFIED BY '1234';
CREATE USER IF NOT EXISTS 'miguel'@'localhost' IDENTIFIED BY '1234';

DROP USER 'miguel'@'localhost';
DROP USER IF EXISTS 'miguel'@'localhost';

GRANT ALL PRIVILEGES ON jardineria.* TO 'miguel'@'localhost';

DROP USER IF EXISTS 'antonio'@'localhost';
CREATE USER 'antonio'@'localhost' IDENTIFIED BY '1234';
GRANT SELECT,INSERT,UPDATE, DELETE ON jardineria.* TO 'antonio'@'localhost';

FLUSH PRIVILEGES;

DROP USER IF EXISTS 'pepe'@'localhost';
CREATE USER 'pepe'@'localhost' IDENTIFIED BY '1234';
GRANT SELECT ON jardineria.cliente TO 'pepe'@'localhost' WITH GRANT OPTION;

REVOKE SELECT, INSERT, UPDATE, DELETE ON jardineria.* FROM 'antonio'@'localhost';

SHOW GRANTS FOR 'pepe'@'localhost';
SHOW GRANTS FOR 'antonio'@'localhost';

SELECT user,host FROM mysql.user;