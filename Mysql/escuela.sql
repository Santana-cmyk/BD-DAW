Use escuela;
SELECT * FROM escuela.profesores_alumnos
INNER JOIN profesores ON profesores.id_profesor = profesores_alumnos.id_profesor
INNER JOIN alumnos ON alumnos.id_alumno = profesores_alumnos.id_alumno;