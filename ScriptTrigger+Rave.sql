-- Tablas para almacenar los datos anteriores tanto de UPDATE como DELETE --
DROP TABLE IF EXISTS log_vehiculos_evento_OLD;
CREATE TABLE log_vehiculos_evento_OLD (
	evento VARCHAR(50),
	id_vehiculo INT,
    Numero_habilitacion INT,
    Patente VARCHAR(50),
    Razon_social VARCHAR(50),
    Usuario VARCHAR(50),
    Fecha_hora DATETIME DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS log_denuncias_evento_OLD;
CREATE TABLE log_denuncias_evento_OLD (
	evento VARCHAR(50),
	id_denuncia INT,
    id_acta INT,
    Direccion VARCHAR(100),
    Descripcion VARCHAR(100),
    Fecha DATE,
    Numero_orden INT,
	Usuario VARCHAR(50),
    Fecha_hora DATETIME DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS log_alumnos_evento_OLD;
CREATE TABLE log_alumnos_evento_OLD (
	evento VARCHAR(50),
	id_alumno INT,
    id_curso INT,
    id_nota INT,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    DNI VARCHAR(50),
    Telefono VARCHAR(50),
    Email  VARCHAR(130),
    Usuario VARCHAR(50),
    Fecha_hora DATETIME DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS log_comercio_evento_OLD;
CREATE TABLE log_comercio_evento_OLD (
	evento VARCHAR(50),
    id_comercio INT,
    id_rubro_comercio INT,
    Razon_social VARCHAR(50),
    Direccion VARCHAR(50),
    Expediente_habilitacion VARCHAR(20),
    Numero_cuenta VARCHAR(20),
    Usuario VARCHAR(50),
    Fecha_hora DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- tablas para almacenar los datos nuevos generados en UPDATE e INSERT --

DROP TABLE IF EXISTS log_vehiculos_evento_NEW;
CREATE TABLE log_vehiculos_evento_NEW (
	evento VARCHAR(50),
	id_vehiculo INT,
    Numero_habilitacion INT,
    Patente VARCHAR(50),
    Razon_social VARCHAR(50),
    Usuario VARCHAR(50),
    Fecha_hora DATETIME DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS log_denuncias_evento_NEW;
CREATE TABLE log_denuncias_evento_NEW (
	evento VARCHAR(50),
	id_denuncia INT,
    id_acta INT,
    Direccion VARCHAR(100),
    Descripcion VARCHAR(100),
    Fecha DATE,
    Numero_orden INT,
	Usuario VARCHAR(50),
    Fecha_hora DATETIME DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS log_alumnos_evento_NEW;
CREATE TABLE log_alumnos_evento_NEW (
	evento VARCHAR(50),
	id_alumno INT,
    id_curso INT,
    id_nota INT,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    DNI VARCHAR(50),
    Telefono VARCHAR(50),
    Email  VARCHAR(130),
    Usuario VARCHAR(50),
    Fecha_hora DATETIME DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS log_comercio_evento_NEW;
CREATE TABLE log_comercio_evento_NEW (
	evento VARCHAR(50),
    id_comercio INT,
    id_rubro_comercio INT,
    Razon_social VARCHAR(50),
    Direccion VARCHAR(50),
    Expediente_habilitacion VARCHAR(20),
    Numero_cuenta VARCHAR(20),
    Usuario VARCHAR(50),
    Fecha_hora DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Creacion de TRIGGERS --



DELIMITER $$

-- Vehiculos trigger --

DROP trigger IF exists tr_vehiculos_update_OLD $$
CREATE TRIGGER tr_vehiculos_update_OLD
	AFTER UPDATE ON vehiculos
    FOR EACH ROW
    BEGIN
		INSERT INTO log_vehiculos_evento_OLD (evento, id_vehiculo, Numero_habilitacion, Patente, Razon_social, Usuario, Fecha_hora)
		VALUES ('UPDATE datos', OLD.id_vehiculo, OLD.Numero_habilitacion, OLD.Patente, OLD.Razon_social, USER(), NOW());
    END $$
    
DROP trigger IF exists tr_vehiculos_delete_OLD $$
CREATE TRIGGER tr_vehiculos_delete_OLD
	AFTER DELETE ON vehiculos
    FOR EACH ROW
    BEGIN
		INSERT INTO log_vehiculos_evento_OLD (evento, id_vehiculo, Numero_habilitacion, Patente, Razon_social, Usuario, Fecha_hora)
		VALUES ('DELETE datos', OLD.id_vehiculo, OLD.Numero_habilitacion, OLD.Patente, OLD.Razon_social, USER(), NOW());
    END $$
   
DROP trigger IF exists tr_vehiculos_update_NEW $$
CREATE TRIGGER tr_vehiculos_update_NEW
	BEFORE UPDATE ON vehiculos
    FOR EACH ROW
    BEGIN
		INSERT INTO log_vehiculos_evento_NEW (evento, id_vehiculo, Numero_habilitacion, Patente, Razon_social, Usuario, Fecha_hora)
		VALUES ('UPDATE datos', NEW.id_vehiculo, NEW.Numero_habilitacion, NEW.Patente, NEW.Razon_social, USER(), NOW());
    END $$

DROP trigger IF exists tr_vehiculos_insert_NEW $$
CREATE TRIGGER tr_vehiculos_insert_NEW
	BEFORE INSERT ON vehiculos
    FOR EACH ROW
    BEGIN
		INSERT INTO log_vehiculos_evento_NEW (evento, id_vehiculo, Numero_habilitacion, Patente, Razon_social, Usuario, Fecha_hora)
		VALUES ('INSERT datos', NEW.id_vehiculo, NEW.Numero_habilitacion, NEW.Patente, NEW.Razon_social, USER(), NOW());
    END $$

-- Comercios trigger --

DROP trigger IF exists tr_comercios_update_OLD $$
CREATE TRIGGER tr_comercios_update_OLD
	AFTER UPDATE ON comercios
    FOR EACH ROW
    BEGIN
		INSERT INTO log_comercio_evento_OLD (evento, id_comercio, id_rubro_comercio, Razon_social, Direccion, Expediente_habilitacion, Numero_cuenta, Usuario, Fecha_hora)
		VALUES ('Update datos', OLD.id_comercio, OLD.id_rubro_comercio, OLD.Razon_social, OLD.Direccion, OLD.Expediente_habilitacion, OLD.Numero_cuenta, USER(), NOW());
    END $$
    
DROP trigger IF exists tr_comercios_dalete_OLD $$
CREATE TRIGGER tr_comercios_dalete_OLD
	AFTER DELETE ON comercios
    FOR EACH ROW
    BEGIN
		INSERT INTO log_comercio_evento_OLD (evento, id_comercio, id_rubro_comercio, Razon_social, Direccion, Expediente_habilitacion, Numero_cuenta, Usuario, Fecha_hora)
		VALUES ('Delete datos', OLD.id_comercio, OLD.id_rubro_comercio, OLD.Razon_social, OLD.Direccion, OLD.Expediente_habilitacion, OLD.Numero_cuenta, USER(), NOW());
    END $$

DROP trigger IF exists tr_comercios_update_NEW $$
CREATE TRIGGER tr_comercios_update_NEW
	BEFORE UPDATE ON comercios
    FOR EACH ROW
    BEGIN
		INSERT INTO log_comercio_evento_NEW (evento, id_comercio, id_rubro_comercio, Razon_social, Direccion, Expediente_habilitacion, Numero_cuenta, Usuario, Fecha_hora)
		VALUES ('Update datos', NEW.id_comercio, NEW.id_rubro_comercio, NEW.Razon_social, NEW.Direccion, NEW.Expediente_habilitacion, NEW.Numero_cuenta, USER(), NOW());
    END $$
    
DROP trigger IF exists tr_comercios_insert_NEW $$
CREATE TRIGGER tr_comercios_insert_NEW
	BEFORE INSERT ON comercios
    FOR EACH ROW
    BEGIN
		INSERT INTO log_comercio_evento_NEW (evento, id_comercio, id_rubro_comercio, Razon_social, Direccion, Expediente_habilitacion, Numero_cuenta, Usuario, Fecha_hora)
		VALUES ('Insert datos', NEW.id_comercio, NEW.id_rubro_comercio, NEW.Razon_social, NEW.Direccion, NEW.Expediente_habilitacion, NEW.Numero_cuenta, USER(), NOW());
    END $$
    
-- Alumnos triggers --

DROP trigger IF exists tr_alumnos_update_OLD $$
CREATE TRIGGER tr_alumnos_update_OLD
	AFTER UPDATE ON alumnos
    FOR EACH ROW
    BEGIN
		INSERT INTO log_alumnos_evento_OLD (evento, id_alumno, id_curso, id_nota, Nombre, Apellido, DNI, Telefono, Email, Usuario, Fecha_hora)
		VALUES ('Update datos', OLD.id_alumno, OLD.id_curso, OLD.id_nota, OLD.Nombre, OLD.Apellido, OLD.DNI, OLD.Telefono, OLD.Email, USER(), NOW());
    END $$

DROP trigger IF exists tr_alumnos_delete_OLD $$
CREATE TRIGGER tr_alumnos_delete_OLD
	AFTER DELETE ON alumnos
    FOR EACH ROW
    BEGIN
		INSERT INTO log_alumnos_evento_OLD (evento, id_alumno, id_curso, id_nota, Nombre, Apellido, DNI, Telefono, Email, Usuario, Fecha_hora)
		VALUES ('Delete datos', OLD.id_alumno, OLD.id_curso, OLD.id_nota, OLD.Nombre, OLD.Apellido, OLD.DNI, OLD.Telefono, OLD.Email, USER(), NOW());
    END $$

DROP trigger IF exists tr_alumnos_update_New $$
CREATE TRIGGER tr_alumnos_update_New
	BEFORE UPDATE ON alumnos
    FOR EACH ROW
    BEGIN
		INSERT INTO log_alumnos_evento_New (evento, id_alumno, id_curso, id_nota, Nombre, Apellido, DNI, Telefono, Email, Usuario, Fecha_hora)
		VALUES ('Update datos', NEW.id_alumno, NEW.id_curso, NEW.id_nota, NEW.Nombre, NEW.Apellido, NEW.DNI, NEW.Telefono, NEW.Email, USER(), NOW());
    END $$

DROP trigger IF exists tr_alumnos_insert_New $$
CREATE TRIGGER tr_alumnos_insert_New
	BEFORE INSERT ON alumnos
    FOR EACH ROW
    BEGIN
		INSERT INTO log_alumnos_evento_New (evento, id_alumno, id_curso, id_nota, Nombre, Apellido, DNI, Telefono, Email, Usuario, Fecha_hora)
		VALUES ('Insert datos', NEW.id_alumno, NEW.id_curso, NEW.id_nota, NEW.Nombre, NEW.Apellido, NEW.DNI, NEW.Telefono, NEW.Email, USER(), NOW());
    END $$
    
-- Denuncias triggers --

DROP trigger IF exists tr_denuncias_update_OLD $$
CREATE TRIGGER tr_denuncias_update_OLD
	AFTER UPDATE ON denuncias
    FOR EACH ROW
    BEGIN
		INSERT INTO log_denuncias_evento_OLD (evento, id_denuncia, id_acta, Direccion, Descripcion, Fecha, Numero_orden, Usuario, Fecha_hora)
		VALUES ('Update datos', OLD.id_denuncia, OLD.id_acta, OLD.Direccion, OLD.Descripcion, OLD.Fecha, OLD.Numero_orden, USER(), NOW());
    END $$

DROP trigger IF exists tr_denuncias_delete_OLD $$
CREATE TRIGGER tr_denuncias_delete_OLD
	AFTER DELETE ON denuncias
    FOR EACH ROW
    BEGIN
		INSERT INTO log_denuncias_evento_OLD (evento, id_denuncia, id_acta, Direccion, Descripcion, Fecha, Numero_orden, Usuario, Fecha_hora)
		VALUES ('Delete datos', OLD.id_denuncia, OLD.id_acta, OLD.Direccion, OLD.Descripcion, OLD.Fecha, OLD.Numero_orden, USER(), NOW());
    END $$

DROP trigger IF exists tr_denuncias_update_New $$
CREATE TRIGGER tr_denuncias_update_New
	BEFORE UPDATE ON denuncias
    FOR EACH ROW
    BEGIN
		INSERT INTO log_denuncias_evento_OLD (evento, id_denuncia, id_acta, Direccion, Descripcion, Fecha, Numero_orden, Usuario, Fecha_hora)
		VALUES ('Update datos', NEW.id_denuncia, NEW.id_acta, NEW.Direccion, NEW.Descripcion, NEW.Fecha, NEW.Numero_orden, USER(), NOW());
    END $$

DROP trigger IF exists tr_denuncias_insert_New $$
CREATE TRIGGER tr_denuncias_insert_New
	BEFORE UPDATE ON denuncias
    FOR EACH ROW
    BEGIN
		INSERT INTO log_denuncias_evento_NEW (evento, id_denuncia, id_acta, Direccion, Descripcion, Fecha, Numero_orden, Usuario, Fecha_hora)
		VALUES ('Insert datos', NEW.id_denuncia, NEW.id_acta, NEW.Direccion, NEW.Descripcion, NEW.Fecha, NEW.Numero_orden, USER(), NOW());
    END $$
    


DELIMITER ;

-- UPDATES --

UPDATE vehiculos SET Numero_habilitacion = 150987 WHERE id_vehiculo = 1;
UPDATE comercios SET Expediente_habilitacion = '55/S/222' WHERE id_comercio = 1;
UPDATE alumnos SET Nombre = 'Juan' WHERE id_alumno = 1;
UPDATE denuncias SET Numero_orden = 58 WHERE id_denuncia = 2;

-- INSERTS --

INSERT INTO vehiculos VALUES (null, 10030, 'VPT100', 'Rabbione');
INSERT INTO denuncias VALUES  (null, null, 'Brown 1895', 'Presencia de cucarachas', current_date, 4323);
INSERT INTO comercios VALUES (null, 3, 'Los Reseros S.R.L.', 'Colon 3344', '1222/B/99', '12004');
INSERT INTO alumnos VALUES (null, null, null, 'Javier', 'Perez', '34500090', '2235678909', 'perez@gmail.com');

-- No puedo hacer un DELETE porque esta como RESTRICT --