
DROP DATABASE IF EXISTS  Bromatologia;
CREATE DATABASE Bromatologia;
USE Bromatologia;

-- CURSO MANIPULACION ALIMENTOS --

CREATE TABLE Datos_Personales (
  id_datos_personales INT NOT NULL AUTO_INCREMENT,
  Telefono VARCHAR (20) DEFAULT NULL,
  Email VARCHAR (130) UNIQUE,
  Direccion VARCHAR (50) DEFAULT NULL,
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
  id_nota INT DEFAULT NULL,
  Fecha_inicio DATE NOT NULL,
  Fecha_final DATE DEFAULT NULL,
  CONSTRAINT PK_CURSO PRIMARY KEY (id_curso),
  FOREIGN KEY (id_profesor) REFERENCES Profesores(id_profesor) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Alumnos (
	id_alumno INT NOT NULL AUTO_INCREMENT UNIQUE,
    id_curso INT DEFAULT NULL,
    id_nota INT DEFAULT NULL,
    Nombre  VARCHAR (50) NOT NULL,
	Apellido VARCHAR (50) NOT NULL,
	DNI VARCHAR (20) NOT NULL,
    Telefono VARCHAR (20 ),
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
    Acta_infraccion  VARCHAR (20) UNIQUE DEFAULT NULL,
    Fecha_control  DATE DEFAULT NULL,
    id_vehiculo INT NOT NULL,
	CONSTRAINT PK_SEGUNDO_CONTROL PRIMARY KEY (id_segundo_control),
    FOREIGN KEY (id_vehiculo) REFERENCES Vehiculos(id_vehiculo) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Habilitacion_vehiculos (
	id_registro INT NOT NULL AUTO_INCREMENT UNIQUE,
	id_vehiculo INT NOT NULL,
    id_rubro_vehiculo INT NOT NULL,
    id_segundo_control INT DEFAULT NULL,
    id_inspector INT NOT NULL,
	Fecha  DATE NOT NULL,
    Observaciones VARCHAR(100) DEFAULT NULL, 
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
    Numero_cuenta  VARCHAR (20) DEFAULT NULL,
	CONSTRAINT PK_COMERCIOS PRIMARY KEY (id_comercio),
    FOREIGN KEY (id_rubro_comercio) REFERENCES Rubros_comercio(id_rubro_comercio) ON DELETE RESTRICT ON UPDATE CASCADE,
	INDEX idx_expediente_habilitacion (Expediente_habilitacion)
);

CREATE TABLE Actas (
	id_acta INT NOT NULL AUTO_INCREMENT UNIQUE,
    Acta_inspeccion VARCHAR (20) NOT NULL UNIQUE,
    Acta_constatacion VARCHAR (20) UNIQUE,
    Acta_comiso VARCHAR (20) DEFAULT NULL,
    Acta_clausura VARCHAR (20) DEFAULT NULL,
    Acta_secuentro_intervencion VARCHAR (20) DEFAULT NULL,
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
	id_denuncia INT DEFAULT NULL,
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

ALTER TABLE Curso_Manipulacion ADD CONSTRAINT fk_curso_manipulacion_alumno FOREIGN KEY (id_alumno) REFERENCES Alumnos(id_alumno) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE Curso_Manipulacion ADD CONSTRAINT fk_curso_manipulacion_nota FOREIGN KEY (id_nota) REFERENCES Notas(id_nota) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE Alumnos ADD CONSTRAINT fk_Alumnos_nota FOREIGN KEY (id_nota) REFERENCES Notas(id_nota) ON DELETE RESTRICT ON UPDATE CASCADE;
