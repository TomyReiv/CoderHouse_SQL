USE mysql;

-- Creacion del primer usuario con privilegios de solo lectura.  --

DROP USER IF exists 'Pablo'@'localhost';
CREATE USER 'Pablo'@'localhost' IDENTIFIED BY '123456';

GRANT SELECT ON *.* TO 'Pablo'@'localhost'; -- Se le otorga el privilegio de lectura de los datos --

-- Creacion del segundo usuario que tiene los permisos de leer, insertar y actualizar --

DROP USER IF exists 'Facundo'@'localhost';
CREATE USER 'Facundo'@'localhost' IDENTIFIED BY '31467';

GRANT SELECT, UPDATE, INSERT ON *.* TO 'Facundo'@'localhost'; -- Se le otorga el privilegio de lectura, insercion y actualizacion de los datos --

SELECT * FROM USER;