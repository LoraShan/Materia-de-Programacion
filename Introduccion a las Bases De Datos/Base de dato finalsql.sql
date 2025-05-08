-- PROYECTO FINAL - INTRODUCCIÓN A LAS BASES DE DATOS
-- Sistema de Gestión Académica Universitaria

-- -----------------------------------------------------
-- CONSULTAS BÁSICAS
-- -----------------------------------------------------

-- 1. Mostrar nombre y apellido de estudiantes ordenados por apellido
SELECT Nombre, Apellido 
FROM Estudiante 
ORDER BY Apellido ASC;

-- 2. Mostrar cursos con más de 3 créditos
SELECT CursoID, Nombre, Creditos 
FROM Curso 
WHERE Creditos > 3
ORDER BY Creditos DESC, Nombre;

-- -----------------------------------------------------
-- CONSULTAS CON JOINS
-- -----------------------------------------------------

-- 3. Estudiantes con sus cursos inscritos (INNER JOIN)
SELECT 
    e.EstudianteID,
    CONCAT(e.Nombre, ' ', e.Apellido) AS Estudiante,
    c.Nombre AS Curso,
    d.Nombre AS Departamento
FROM Estudiante e
INNER JOIN Inscripcion i ON e.EstudianteID = i.EstudianteID
INNER JOIN Clase cl ON i.ClaseID = cl.ClaseID
INNER JOIN Curso c ON cl.CursoID = c.CursoID
INNER JOIN Departamento d ON c.DepartamentoID = d.DepartamentoID
ORDER BY e.Apellido, e.Nombre;

-- 4. Todos los estudiantes con sus cursos (LEFT JOIN)
SELECT 
    e.EstudianteID,
    CONCAT(e.Nombre, ' ', e.Apellido) AS Estudiante,
    IFNULL(c.Nombre, 'No inscrito') AS Curso
FROM Estudiante e
LEFT JOIN Inscripcion i ON e.EstudianteID = i.EstudianteID
LEFT JOIN Clase cl ON i.ClaseID = cl.ClaseID
LEFT JOIN Curso c ON cl.CursoID = c.CursoID
ORDER BY e.Apellido, e.Nombre;

-- 5. Todos los cursos con estudiantes (RIGHT JOIN)
SELECT 
    c.CursoID,
    c.Nombre AS Curso,
    IFNULL(CONCAT(e.Nombre, ' ', e.Apellido), 'Sin estudiantes') AS Estudiante
FROM Estudiante e
RIGHT JOIN Inscripcion i ON e.EstudianteID = i.EstudianteID
RIGHT JOIN Clase cl ON i.ClaseID = cl.ClaseID
RIGHT JOIN Curso c ON cl.CursoID = c.CursoID
ORDER BY c.Nombre;

-- -----------------------------------------------------
-- CONSULTAS ESTADÍSTICAS
-- -----------------------------------------------------

-- 6. Cantidad de estudiantes por departamento
SELECT 
    d.DepartamentoID,
    d.Nombre AS Departamento,
    COUNT(e.EstudianteID) AS Cantidad_Estudiantes
FROM Departamento d
LEFT JOIN Estudiante e ON d.DepartamentoID = e.DepartamentoID
GROUP BY d.DepartamentoID, d.Nombre
ORDER BY Cantidad_Estudiantes DESC;

-- 7. Promedio de notas por estudiante
SELECT 
    e.EstudianteID,
    CONCAT(e.Nombre, ' ', e.Apellido) AS Estudiante,
    ROUND(AVG(c.Nota), 2) AS Promedio_Notas,
    COUNT(i.InscripcionID) AS Cursos_Inscritos
FROM Estudiante e
LEFT JOIN Inscripcion i ON e.EstudianteID = i.EstudianteID
LEFT JOIN Calificacion c ON i.InscripcionID = c.InscripcionID
GROUP BY e.EstudianteID, e.Nombre, e.Apellido
ORDER BY Promedio_Notas DESC;

-- 8. Notas máximas y mínimas por clase
SELECT 
    cl.ClaseID,
    c.Nombre AS Curso,
    CONCAT(p.Nombre, ' ', p.Apellido) AS Profesor,
    MAX(ca.Nota) AS Nota_Maxima,
    MIN(ca.Nota) AS Nota_Minima,
    ROUND(AVG(ca.Nota), 2) AS Nota_Promedio,
    COUNT(i.InscripcionID) AS Estudiantes_Inscritos
FROM Clase cl
JOIN Curso c ON cl.CursoID = c.CursoID
JOIN Profesor p ON cl.ProfesorID = p.ProfesorID
LEFT JOIN Inscripcion i ON cl.ClaseID = i.ClaseID
LEFT JOIN Calificacion ca ON i.InscripcionID = ca.InscripcionID
GROUP BY cl.ClaseID, c.Nombre, p.Nombre, p.Apellido
ORDER BY cl.ClaseID;

-- 9. Top 5 estudiantes con mejor promedio
SELECT 
    e.EstudianteID,
    CONCAT(e.Nombre, ' ', e.Apellido) AS Estudiante,
    ROUND(AVG(c.Nota), 2) AS Promedio_Notas,
    d.Nombre AS Departamento
FROM Estudiante e
JOIN Inscripcion i ON e.EstudianteID = i.EstudianteID
JOIN Calificacion c ON i.InscripcionID = c.InscripcionID
JOIN Departamento d ON e.DepartamentoID = d.DepartamentoID
GROUP BY e.EstudianteID, e.Nombre, e.Apellido, d.Nombre
ORDER BY Promedio_Notas DESC
LIMIT 5;

-- -----------------------------------------------------
-- OPERACIONES DE ACTUALIZACIÓN Y ELIMINACIÓN
-- -----------------------------------------------------

-- 10. Actualizar email de un estudiante
-- Mostrar datos actuales del estudiante 10
SELECT * FROM Estudiante WHERE EstudianteID = 10;

-- Actualizar email
UPDATE Estudiante 
SET Email = 'nuevo_email_estudiante10@universidad.edu' 
WHERE EstudianteID = 10;

-- Verificar cambio
SELECT * FROM Estudiante WHERE EstudianteID = 10;

-- 11. Eliminar una inscripción
-- Mostrar inscripciones del estudiante 15
SELECT 
    i.InscripcionID,
    CONCAT(e.Nombre, ' ', e.Apellido) AS Estudiante,
    c.Nombre AS Curso,
    cl.Año,
    cl.Semestre
FROM Inscripcion i
JOIN Estudiante e ON i.EstudianteID = e.EstudianteID
JOIN Clase cl ON i.ClaseID = cl.ClaseID
JOIN Curso c ON cl.CursoID = c.CursoID
WHERE e.EstudianteID = 15;

-- Eliminar una inscripción (usaremos el primer ID mostrado)
DELETE FROM Inscripcion 
WHERE EstudianteID = 15 AND ClaseID = (
    SELECT ClaseID FROM Inscripcion 
    WHERE EstudianteID = 15 
    LIMIT 1
);

-- Verificar que se eliminó
SELECT * FROM Inscripcion WHERE EstudianteID = 15;