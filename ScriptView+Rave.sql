

-- VIEW para visualizar las habilitaciones de vehiculos --

CREATE OR REPLACE VIEW View_Habilitacion_Vehiculos AS
SELECT
    v.Numero_habilitacion AS numero_habilitacion,
    v.Patente AS patente,
    v.Razon_social AS razon_social,
    rv.Rubros AS Rubros,
    i.apellido AS inspector_apellido,
    hv.fecha,
    CASE
        WHEN hv.id_segundo_control IS NOT NULL
        THEN sc.Acta_vehiculo
        ELSE NULL
    END AS Acta_vehiculo,
     CASE
        WHEN hv.id_segundo_control IS NOT NULL
        THEN sc.Fecha_control
        ELSE NULL
    END AS Fecha_control,
     CASE
        WHEN hv.id_segundo_control IS NOT NULL
        THEN sc.Acta_infraccion
        ELSE NULL
    END AS Acta_infraccion
FROM
    Habilitacion_vehiculos hv
JOIN
    Vehiculos v ON hv.id_vehiculo = v.id_vehiculo
JOIN
    Rubros_vehiculos rv ON hv.id_rubro_vehiculo = rv.id_rubro_vehiculo
JOIN
    Inspectores i ON hv.id_inspector = i.id_inspector
LEFT JOIN
    Segundo_control sc ON hv.id_segundo_control = sc.id_segundo_control;
    
-- VIEW visualizacion habilitacion de comercios --


CREATE OR REPLACE VIEW View_Habilitacion_comercios AS
SELECT
    c.Expediente_habilitacion AS Expediente_habilitacion,
    c.Direccion AS Direccion,
    c.Razon_social AS razon_social,
	c.Numero_cuenta AS Numero_cuenta,
    rc.Rubros AS Rubros,
    gi.id_inspectores AS id_inspectores,
    a.Acta_inspeccion AS Acta_inspeccion,
    hc.fecha
FROM
    Habilitacion_comercios hc
JOIN
    Comercios c ON hc.id_comercio = c.id_comercio
JOIN
    Actas a ON hc.id_acta = a.id_acta
JOIN
    Rubros_comercio rc ON c.id_rubro_comercio = rc.id_rubro_comercio
JOIN
    Grupo_inspectores gi ON hc.id_inspectores = gi.id_inspectores;

-- VIEW Inspecciones --


CREATE OR REPLACE VIEW View_Comercio AS
SELECT
    c.Expediente_habilitacion AS Expediente_habilitacion,
    c.Direccion AS Direccion,
    c.Razon_social AS razon_social,
	c.Numero_cuenta AS Numero_cuenta,
    rc.Rubros AS Rubros,
    gi.id_inspectores AS id_inspectores,
    a.Acta_inspeccion AS Acta_inspeccion,
    a.Acta_constatacion AS Acta_constatacion,
    a.Acta_comiso AS Acta_comiso,
    a.Acta_clausura AS Acta_clausura,
    a.Acta_secuentro_intervencion AS Acta_secuentro_intervencion,
    a.Descripcion AS Descripcion,
    i.fecha,
	CASE
        WHEN i.id_denuncia IS NOT NULL
        THEN d.Numero_orden
        ELSE NULL
    END AS Numero_orden
FROM
    Inspecciones i
JOIN
    Comercios c ON i.id_comercio = c.id_comercio
JOIN
    Actas a ON i.id_acta = a.id_acta
JOIN
    Rubros_comercio rc ON c.id_rubro_comercio = rc.id_rubro_comercio
JOIN
    Grupo_inspectores gi ON i.id_inspectores = gi.id_inspectores
LEFT JOIN
    Denuncias d ON i.id_denuncia = d.id_denuncia;

-- VIEW Cursos --

CREATE OR REPLACE VIEW View_Curso_manipulacion AS
SELECT
    p.id_profesor AS id_profesor,
	a.Nombre AS Nombre_alumno,
    a.Apellido AS Apellido_alumno,
    a.DNI AS DNI,
    cm.Fecha_inicio AS Fecha_inicio,
    cm.Fecha_final AS Fecha_final,
    CASE
        WHEN n.id_nota IS NOT NULL
        THEN n.Calificacion
        ELSE NULL
    END AS Calificacion
FROM
    Curso_manipulacion cm
JOIN
    Alumnos a ON cm.id_alumno = a.id_alumno
JOIN
    Profesores p ON cm.id_profesor = p.id_profesor
LEFT JOIN
    Notas n ON cm.id_nota = n.id_nota;

-- VIEW Grupo-inspectores --

CREATE OR REPLACE VIEW View_grupo_inspectores AS
SELECT
	i.Nombre AS Nombre,
    i.Apellido As Apellido,
    i.Legajo AS Legajo,
    i.Turno AS Turno,
    g.Nombre_grupo AS Nombre_grupo
FROM
	Grupo_inspectores gi
JOIN
	Inspectores i ON gi.id_inspector = i.id_inspector
JOIN
	Grupos g ON gi.id_grupo = g.id_grupo;