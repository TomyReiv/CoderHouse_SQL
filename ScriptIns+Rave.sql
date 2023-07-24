CREATE DATABASE Bromatologia;
USE Bromatologia;

-- CURSO MANIPULACION ALIMENTOS --

CREATE TABLE Datos_Personales (
  id_datos_personales INT NOT NULL AUTO_INCREMENT,
  Telefono VARCHAR (20),
  Email VARCHAR (130) UNIQUE,
  Direccion VARCHAR (50),
  CONSTRAINT PK_DATOS_PERSONALES PRIMARY KEY (id_datos_personales)
);

CREATE TABLE Inspectores (
  id_inspector INT NOT NULL AUTO_INCREMENT UNIQUE,
  id_datos_personales INT NOT NULL UNIQUE,
  Legajo INT NOT NULL UNIQUE,
  Nombre  VARCHAR (50) NOT NULL,
  Apellido VARCHAR (50) NOT NULL,
  Turno  VARCHAR (10) NOT NULL,
  Cargo VARCHAR (50) NOT NULL,
  CONSTRAINT PK_INSPECTORES PRIMARY KEY (id_inspector),
  FOREIGN KEY (id_datos_personales) REFERENCES Datos_Personales(id_datos_personales) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Profesores (
  id_profesor INT NOT NULL AUTO_INCREMENT UNIQUE,
  id_inspector INT NOT NULL,
  CONSTRAINT PK_PROFESORES PRIMARY KEY (id_profesor),
  FOREIGN KEY (id_inspector) REFERENCES Inspectores(id_inspector) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Curso_Manipulacion (
  id_curso INT NOT NULL AUTO_INCREMENT UNIQUE,
  id_profesor INT NOT NULL,
  id_alumno INT NOT NULL UNIQUE,
  id_nota INT,
  Fecha_inicio DATE NOT NULL,
  Fecha_final DATE,
  CONSTRAINT PK_CURSO PRIMARY KEY (id_curso),
  FOREIGN KEY (id_profesor) REFERENCES Profesores(id_profesor) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Alumnos (
	id_alumno INT NOT NULL AUTO_INCREMENT UNIQUE,
    id_curso INT,
    id_nota INT,
    Nombre  VARCHAR (50) NOT NULL,
	Apellido VARCHAR (50) NOT NULL,
	DNI VARCHAR (20) NOT NULL UNIQUE,
    Telefono VARCHAR (20),
	Email VARCHAR (130),
    CONSTRAINT PK_ALUMNOS PRIMARY KEY (id_alumno),
	FOREIGN KEY (id_curso) REFERENCES Curso_Manipulacion(id_curso) ON DELETE RESTRICT ON UPDATE CASCADE,
	INDEX idx_dni (DNI)
);

CREATE TABLE Notas (
	id_nota INT NOT NULL AUTO_INCREMENT,
	id_alumno INT NOT NULL,
    id_curso INT NOT NULL,
    Calificacion INT NOT NULL,
    CONSTRAINT PK_NOTAS PRIMARY KEY (id_nota),
	FOREIGN KEY (id_curso) REFERENCES Curso_Manipulacion(id_curso) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (id_alumno) REFERENCES Alumnos(id_alumno) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- GRUPO DE INSPECTORES --

CREATE TABLE Grupos (
	id_grupo INT NOT NULL AUTO_INCREMENT UNIQUE,
	Nombre_grupo  VARCHAR (50) NOT NULL UNIQUE,
	CONSTRAINT PK_GRUPOS PRIMARY KEY (id_grupo)
);

CREATE TABLE Grupo_Inspectores (
	id_inspectores INT NOT NULL AUTO_INCREMENT UNIQUE,
    id_grupo INT NOT NULL,
	id_inspector INT NOT NULL,
	CONSTRAINT PK_GRUPO_INSPECTORES PRIMARY KEY (id_inspectores),
    FOREIGN KEY (id_grupo) REFERENCES Grupos(id_grupo) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (id_inspector) REFERENCES Inspectores(id_inspector) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- VEHICULOS --

CREATE TABLE Vehiculos (
	id_vehiculo INT NOT NULL AUTO_INCREMENT UNIQUE,
    Numero_habilitacion INT NOT NULL UNIQUE,
	Patente  VARCHAR (50) NOT NULL,
    Razon_social  VARCHAR (50) NOT NULL,
	CONSTRAINT PK_VEHICULOS PRIMARY KEY (id_vehiculo),
    INDEX idx_numero_habilitacion (Numero_habilitacion)
);

CREATE TABLE Rubros_vehiculos (
	id_rubro_vehiculo INT NOT NULL AUTO_INCREMENT UNIQUE,
	Rubros  VARCHAR (100) NOT NULL,
	CONSTRAINT PK_RUBROS_VEHICULOS PRIMARY KEY (id_rubro_vehiculo)
);

CREATE TABLE Segundo_control (
	id_segundo_control INT NOT NULL AUTO_INCREMENT UNIQUE,
	Acta_vehiculo  VARCHAR (20) NOT NULL UNIQUE,
    Acta_infraccion  VARCHAR (20) UNIQUE,
    Fecha_control  DATE,
    id_vehiculo INT NOT NULL,
	CONSTRAINT PK_SEGUNDO_CONTROL PRIMARY KEY (id_segundo_control),
    FOREIGN KEY (id_vehiculo) REFERENCES Vehiculos(id_vehiculo) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Habilitacion_vehiculos (
	id_registro INT NOT NULL AUTO_INCREMENT UNIQUE,
	id_vehiculo INT NOT NULL,
    id_rubro_vehiculo INT NOT NULL,
    id_segundo_control INT,
    id_inspector INT NOT NULL,
	Fecha  DATE NOT NULL,
	CONSTRAINT PK_SEGUNDO_CONTROL PRIMARY KEY (id_registro),
    FOREIGN KEY (id_inspector) REFERENCES Inspectores(id_inspector) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (id_segundo_control) REFERENCES Segundo_control(id_segundo_control) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (id_rubro_vehiculo) REFERENCES Rubros_vehiculos(id_rubro_vehiculo) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (id_vehiculo) REFERENCES Vehiculos(id_vehiculo) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- COMERCIOS --

CREATE TABLE Rubros_comercio (
	id_rubro_comercio INT NOT NULL AUTO_INCREMENT UNIQUE,
	Rubros  VARCHAR (100) NOT NULL,
	CONSTRAINT PK_RUBROS_COMERCIO PRIMARY KEY (id_rubro_comercio)
);

CREATE TABLE Comercios (
	id_comercio INT NOT NULL AUTO_INCREMENT UNIQUE,
    id_rubro_comercio INT NOT NULL,
    Razon_social  VARCHAR (50) NOT NULL,
    Direccion  VARCHAR (50) NOT NULL,
    Expediente_habilitacion  VARCHAR (20) UNIQUE,
    Numero_cuenta  VARCHAR (20),
	CONSTRAINT PK_COMERCIOS PRIMARY KEY (id_comercio),
    FOREIGN KEY (id_rubro_comercio) REFERENCES Rubros_comercio(id_rubro_comercio) ON DELETE RESTRICT ON UPDATE CASCADE,
	INDEX idx_expediente_habilitacion (Expediente_habilitacion)
);

CREATE TABLE Actas (
	id_acta INT NOT NULL AUTO_INCREMENT UNIQUE,
    Acta_inspeccion VARCHAR (20) NOT NULL UNIQUE,
    Acta_contatacion VARCHAR (20) UNIQUE,
    Acta_comiso VARCHAR (20),
    Acta_clausura VARCHAR (20),
    Acta_secuentro_intervencion VARCHAR (20),
	Descripcion  VARCHAR (100) NOT NULL,
	CONSTRAINT PK_ACTAS PRIMARY KEY (id_acta),
    INDEX idx_acta_inspeccion (Acta_inspeccion)
);

CREATE TABLE Denuncias (
	id_denuncia INT NOT NULL AUTO_INCREMENT UNIQUE,
    id_acta INT UNIQUE,
    Direccion VARCHAR (100) NOT NULL,
	Descripcion  VARCHAR (100) NOT NULL,
    Fecha DATE NOT NULL,
    Numero_orden INT NOT NULL UNIQUE,
	CONSTRAINT PK_DENUNCIAS PRIMARY KEY (id_denuncia),
    FOREIGN KEY (id_acta) REFERENCES Actas(id_acta) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Inspecciones (
	id_inspeccion INT NOT NULL AUTO_INCREMENT UNIQUE,
	id_denuncia INT,
    id_acta INT NOT NULL,
	id_comercio INT NOT NULL,
    id_inspectores INT NOT NULL,
    Fecha DATE NOT NULL,
	CONSTRAINT PK_INSPECCIONES PRIMARY KEY (id_inspeccion),
    FOREIGN KEY (id_denuncia) REFERENCES Denuncias(id_denuncia) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (id_acta) REFERENCES Actas(id_acta) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (id_comercio) REFERENCES Comercios(id_comercio) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (id_inspectores) REFERENCES Grupo_Inspectores(id_inspectores) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Habilitacion_comercios (
	id_habilitacion INT NOT NULL AUTO_INCREMENT UNIQUE,
    id_comercio INT NOT NULL,
    id_inspectores INT NOT NULL,
    id_acta INT NOT NULL,
    fecha DATE NOT NULL,
    CONSTRAINT PK_HABILITACIONES_COMERCIO PRIMARY KEY (id_habilitacion),
    FOREIGN KEY (id_acta) REFERENCES Actas(id_acta) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (id_comercio) REFERENCES Comercios(id_comercio) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (id_inspectores) REFERENCES Grupo_Inspectores(id_inspectores) ON DELETE RESTRICT ON UPDATE CASCADE
);

ALTER TABLE Curso_Manipulacion ADD CONSTRAINT fk_curso_manipulacion_alumno FOREIGN KEY (id_alumno) REFERENCES Alumnos(id_alumno);

ALTER TABLE Curso_Manipulacion ADD CONSTRAINT fk_curso_manipulacion_nota FOREIGN KEY (id_nota) REFERENCES Notas(id_nota);

ALTER TABLE Alumnos ADD CONSTRAINT fk_Alumnos_nota FOREIGN KEY (id_nota) REFERENCES Notas(id_nota);


-- CARGA DE DATOS --

-- Inspectores--

INSERT INTO datos_personales VALUES 
(null, '2236942265', 'prueba@prueba.com', 'Calle falsa 123'),
(null, '2234567865', 'prueba2@prueba.com', 'Calle falsa 234'),
(null, '2234343455', 'prueba3@prueba.com', 'Rivadavia 4435'),
(null, '2234567865', 'prueba4@prueba.com', 'Dorrego 13421'),
(null, '2234567865', 'prueba5@prueba.com', 'Castelli 66'),
(null, '2234562365', 'prueba6@prueba.com', 'Brown 66');


INSERT INTO inspectores VALUES 
(null, 1, 31468, 'Tomas', 'Rave', 'Mañana', 'Profesional'),
(null, 2, 31462, 'Facundo', 'Irazabal', 'Mañana', 'Profesional'),
(null, 3, 31461, 'Javier', 'Gherbi', 'Mañana', 'Profesional'),
(null, 4, 31469, 'Julian', 'Perez', 'Mañana', 'Profesional'),
(null, 5, 10897, 'Juan', 'Colombo', 'Tarde', 'Tecnico superior');

-- Curso --
INSERT INTO profesores VALUES 
(null, 2),
(null, 5);

INSERT INTO alumnos VALUES 
(null, null, null, 'Javier', 'Perez', '34567890', '2235678909', 'perez@gmail.com'),
(null, null, null, 'Pablo', 'Garcia', '43267890', '2235238769', 'garcia@gmail.com'),
(null, null, null, 'Horacio', 'Kan', '12367890', '2235612769', 'Kan@gmail.com'),
(null, null, null, 'Pepe', 'Lanzani', '42267890', '2235228769', 'Lanzani@gmail.com');


INSERT INTO curso_manipulacion VALUES 
(null, 1, 1, null, current_date, null),
(null, 2, 2, null, current_date, null),
(null, 1, 3, null, current_date, null),
(null, 2, 4, null, current_date, null);

INSERT INTO notas VALUES 
(null, 1, 1, 7),
(null, 2, 2, 4);


UPDATE alumnos SET id_nota = 1 WHERE id_alumno = 1;
UPDATE alumnos SET id_nota = 2 WHERE id_alumno = 2;

UPDATE curso_manipulacion SET id_nota = 1 WHERE id_curso = 1;
UPDATE curso_manipulacion SET id_nota = 2 WHERE id_curso = 2;

UPDATE curso_manipulacion SET Fecha_final = current_date + 1 WHERE id_curso = 1;
UPDATE curso_manipulacion SET Fecha_final = current_date + 1 WHERE id_curso = 2;

-- Vehiculos --

INSERT INTO vehiculos VALUES 
(null, 14560, 'VPT123', 'Rabbione'),
(null, 15678, 'AA234CC', 'Juan Perez'),
(null, 678, 'ASD456', 'Julian Massilla'),
(null, 13360, 'VPT153', 'Romagnoli');

INSERT INTO rubros_vehiculos VALUES 
(null, 'No perecederos, bebidas'),
(null, 'Alimentos congelados'),
(null, 'Carnes vacunas'),
(null, 'Articulos de limpieza');

INSERT INTO segundo_control VALUES 
(null, '32567B', null, null, 1);

INSERT INTO habilitacion_vehiculos VALUES 
(null, 1, 3, 1, 1, current_date),
(null, 2, 2, null, 1, current_date),
(null, 3, 2, null, 1, current_date),
(null, 4, 1, null, 1, current_date);

-- grupos de inspectores--
INSERT INTO grupos VALUES 
(null, 'grupo 1'),
(null, 'grupo 2'),
(null, 'grupo 3');

INSERT INTO grupo_inspectores VALUES 
(null, 2, 3),
(null, 2, 2),
(null, 2, 4);

-- comercios --

INSERT INTO denuncias VALUES 
(null, null, 'Brown 1234', 'Presencia de ratas', current_date, 55),
(null, null, 'Falucho 233', 'Presencia de cucarachas', current_date, 56);

INSERT INTO actas VALUES 
(null, '3466778B', '623345', null,  '345', null,'Presencia de ratas'),
(null, '3456783B', null, null, null, null, 'Habilitacion de comercio'),
(null, '3466997B', null, '997', null, null,'Inspeccion, comiso'),
(null, '3452223B', null, null, null, null, 'Habilitacion de comercio');

INSERT INTO rubros_comercio VALUES
(null, 'Despensa'),
(null, 'Fiambreria, panaderia, despensa'),
(null, 'Carniceria, granja'),
(null, 'Polleria, elaboracion de milanesas'),
(null, 'Fabrica de embutidos');

INSERT INTO comercios VALUES
(null, 3, 'Los Reseros S.R.L.', 'Colon 3344', '123/B/99', '12334'),
(null, 5, 'Los Abuelos S.A', 'Luro 33', '234521/B/08', '12312B'),
(null, 1, 'C.S.A S.A.', 'Gascon 2344', '1222/2/23', '32123'),
(null, 2, 'Los Reseros', 'Italia 222', '1234/2/22', '122312A');


INSERT INTO habilitacion_comercios VALUES
(null, 2, 1, 4, current_date),
(null, 4, 1, 3, current_date);

INSERT INTO inspecciones VALUES
(null, 1, 1, 3, 2, current_date),
(null, null, 3, 1, 2, current_date);

UPDATE denuncias SET id_acta = 1 WHERE id_denuncia = 1;
