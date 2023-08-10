-- Funcion para hacer un conteo rapido de todas las habilitaciones de vehiculos hechas en un periodo de tiempo --

DELIMITER $$
USE bromatologia $$

CREATE FUNCTION `contar_habilitacion_vehiculos` (fecha DATE) 
RETURNS INT
reads sql data
BEGIN
	declare resultado INT;
    SET resultado =  (SELECT COUNT(id_registro) AS Habilitaciones
		FROM bromatologia.habilitacion_vehiculos
        WHERE Fecha BETWEEN fecha AND current_date);
	RETURN resultado;
END$$

-- Funcion para hacer un conteo rapido de todas las habilitaciones de comercios hechas en un periodo de tiempo --

CREATE FUNCTION `contar_habilitacion_comercios` (fecha DATE) 
RETURNS INT
reads sql data
BEGIN
	declare resultado INT;
    SET resultado =  (SELECT COUNT(id_habilitacion) AS Habilitaciones
		FROM bromatologia.habilitacion_comercios
        WHERE Fecha BETWEEN fecha AND current_date);
	RETURN resultado;
END$$

-- Funcion para saber la cantidad de cursos dictados por cada profesor --

CREATE FUNCTION `cursos_profesor` (profesor INT) 
RETURNS INT
reads sql data
BEGIN
	declare resultado INT;
    SET resultado =  (SELECT COUNT(id_curso) AS Cursos_dictados
		FROM bromatologia.curso_manipulacion
        WHERE id_profesor = profesor);
	RETURN resultado;
END$$

-- Funcion creada para saber la cantidad de denuncias sin realizar --

CREATE FUNCTION `denuncias_pendientes` (fecha DATE) 
RETURNS INT
reads sql data
BEGIN
	declare resultado INT;
    SET resultado =  (SELECT COUNT(id_denuncia) AS Denuncias_pendientes
		FROM bromatologia.denuncias
        WHERE id_acta IS NULL AND Fecha BETWEEN fecha AND current_date);
	RETURN resultado;
END$$

DELIMITER ;
