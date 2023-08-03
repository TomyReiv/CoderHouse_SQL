DELIMITER $$
-- Se debe usar uno de los campos precentes en el VIEW de comercios y la direccion en mayusculas (ASC o DESC) --
DROP PROCEDURE IF EXISTS `sp_vw_comercio_orden` $$
CREATE PROCEDURE `sp_vw_comercio_orden` (IN campo VARCHAR(30), IN direccion VARCHAR(4))
BEGIN
	IF campo IS NOT NULL THEN
		SET @comercio_orden = CONCAT(' ORDER BY ', campo,' ', direccion);
	ELSE 
		SET @comercio_orden = ' ';
	END IF;

	SET @consulta = CONCAT('SELECT * FROM bromatologia.view_comercio', @comercio_orden);
    PREPARE ejecutar FROM @consulta;
    EXECUTE ejecutar;
	DEALLOCATE PREPARE ejecutar;
END $$

-- Se debe usar un DNI de los insertados en alumnos y una nota INT --
DROP PROCEDURE IF EXISTS `sp_alumnos_nota` $$
CREATE PROCEDURE `sp_alumnos_nota`(IN nota INT, IN alumno_DNI VARCHAR(30))
BEGIN
    DECLARE alumno_variable INT;
    DECLARE curso_variable INT;
    DECLARE nuevo_id_nota INT;

    SELECT id_alumno INTO alumno_variable FROM bromatologia.alumnos WHERE DNI = alumno_DNI;

    SELECT id_curso INTO curso_variable FROM bromatologia.curso_manipulacion WHERE id_alumno = alumno_variable;

    IF nota IS NOT NULL THEN

        INSERT INTO bromatologia.notas (id_nota, id_alumno, id_curso, Calificacion) VALUES (null, alumno_variable, curso_variable, nota);
        SET nuevo_id_nota = LAST_INSERT_ID();
        
        UPDATE bromatologia.curso_manipulacion SET id_nota = nuevo_id_nota WHERE id_alumno = alumno_variable;
        UPDATE bromatologia.alumnos SET id_nota = nuevo_id_nota WHERE id_alumno = alumno_variable;
    END IF;
END $$

DELIMITER ;