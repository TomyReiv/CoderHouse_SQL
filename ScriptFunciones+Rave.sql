DELIMITER $$
USE bromatologia $$

CREATE FUNCTION `contar_habilitacion_vehiculos` (fecha DATE) 
RETURNS INT
reads sql data
BEGIN
	declare resultado INT;
    SET resultado =  (SELECT COUNT(id_resgistro) AS Habilitaciones
		FROM bromatologia.habilitacion_vehiculos
        WHERE Fecha BETWEEN fecha AND current_date);
	RETURN resultado;
END$$

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
