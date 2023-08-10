
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
(null, 1, 3, 1, 1, current_date, null),
(null, 2, 2, null, 1, current_date, null),
(null, 3, 2, null, 1, current_date, null),
(null, 4, 1, null, 1, current_date, null);

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

 
