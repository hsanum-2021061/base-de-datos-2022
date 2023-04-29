#--------------------------------------------HENRY DONALDO SANUM BARRIOS--------------------------------#
DROP DATABASE IF EXISTS control_academico_in5bm;
CREATE DATABASE control_academico_in5bm;
USE control_academico_in5bm;
#-------------------------------------------------------------------------------------------------------#
DROP TABLE IF EXISTS alumnos;
CREATE TABLE IF NOT EXISTS alumnos (	
	carne VARCHAR(16) NOT NULL,
	apellidos VARCHAR(45),
	nombres VARCHAR(45),
	email VARCHAR(32),
	PRIMARY KEY (carne)
);
#-------------------------------------------------------------------------------------------------------#
DROP TABLE IF EXISTS horarios;
CREATE TABLE IF NOT EXISTS horarios(
	id INT NOT NULL AUTO_INCREMENT,
	horario_final TIME,
	horario_inicio TIME,
	PRIMARY KEY (id)
);
#-------------------------------------------------------------------------------------------------------#
DROP TABLE IF EXISTS salones;
CREATE TABLE IF NOT EXISTS salones(
	id INT NOT NULL AUTO_INCREMENT,
	capacidad INT,
	descripcion VARCHAR(255),
	nombre_salon VARCHAR(255),
	PRIMARY KEY (id)
);
#-------------------------------------------------------------------------------------------------------#
DROP TABLE IF EXISTS carreras_tecnicas;
CREATE TABLE IF NOT EXISTS carreras_tecnicas (
	id VARCHAR(128),
	nombre VARCHAR(45),
	PRIMARY KEY (id)
);
#-------------------------------------------------------------------------------------------------------#
DROP TABLE IF EXISTS instructores;
CREATE TABLE IF NOT EXISTS instructores(
	id INT NOT NULL AUTO_INCREMENT,
	apellidos VARCHAR(45),
	nombres VARCHAR(45),
	direccion VARCHAR(45),
	telefono VARCHAR(45),
	PRIMARY KEY (id)
);
#-------------------------------------------------------------------------------------------------------#
DROP TABLE IF EXISTS cursos;
CREATE TABLE IF NOT EXISTS cursos(
	id INT NOT NULL AUTO_INCREMENT,
	ciclo YEAR,
	cupo_maximo INT,
	cupo_minimo INT,
	descripcion VARCHAR(255),
	carrera_tecnica_id VARCHAR(255),
	horario_id INT,
	instructor_id INT,
	salon_id INT,
	PRIMARY KEY (id),
	CONSTRAINT fk_cursos_carreras_tecnicas
		FOREIGN KEY (carrera_tecnica_id)
		REFERENCES carreras_tecnicas (id)
		ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_cursos_horarios
		FOREIGN KEY (horario_id)
        REFERENCES horarios(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_cursos_instructores
		FOREIGN KEY (instructor_id)
        REFERENCES instructores(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_cursos_salones
		FOREIGN KEY (salon_id)
        REFERENCES salones(id)
        ON DELETE CASCADE ON UPDATE CASCADE
);
#-------------------------------------------------------------------------------------------------------#
DROP TABLE IF EXISTS asignaciones_alumnos;
CREATE TABLE IF NOT EXISTS asignaciones_alumnos(
	id VARCHAR(45),
    fecha_asignacion DATETIME,
	alumno_carne VARCHAR(16) NOT NULL,
	curso_id INT NOT NULL,
	PRIMARY KEY(id),
	CONSTRAINT fk_asignaciones_alumnos_alumnos
		FOREIGN KEY (alumno_carne)
		REFERENCES alumnos(carne)
		ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_asignaciones_alumnos_cursos
		FOREIGN KEY(curso_id)
        REFERENCES cursos(id)
        ON DELETE CASCADE ON UPDATE CASCADE 
);
#-------------------------------------------------------------------------------------------------------#
INSERT INTO alumnos (carne, apellidos, nombres, email)
VALUES('202201', 'jimenez', 'alizon', 'jimenesa001@gmail.com');
INSERT INTO alumnos (carne, apellidos, nombres, email)
VALUES('202202', 'grajeda', 'marcia', 'marciaagisella59@hootmail.com');
INSERT INTO alumnos (carne, apellidos, nombres, email)
VALUES('202203', 'ajsivinac', 'diego', 'diegojoel02@gmail.com');
INSERT INTO alumnos (carne, apellidos, nombres, email)
VALUES('202204', 'coronado', 'maria', 'mariaaleja122@gmail.com');
INSERT INTO alumnos (carne, apellidos, nombres, email)
VALUES('202205', 'daniela', 'argueta', 'dani2@gmail.com');
INSERT INTO alumnos (carne, apellidos, nombres, email)
VALUES('202206', 'sanum', 'donaldo', 'donalsan12@gmail.com');
INSERT INTO alumnos (carne, apellidos, nombres, email)
VALUES('202207', 'sanum', 'oliver', 'oliversan43@edu.gt');
INSERT INTO alumnos (carne, apellidos, nombres, email)
VALUES('202208', 'esquit', 'amy', 'amyas@edu.gt');
UPDATE alumnos SET nombres = "henry donaldo" , apellidos = "sanum barrios", email = 'donalsan12@gmail.com' WHERE carne = "202205";
DELETE FROM alumnos WHERE carne = "202206";
SELECT alumnos.carne, alumnos.apellidos, alumnos.nombres, alumnos.email from alumnos;
#-------------------------------------------------------------------------------------------------------#
INSERT INTO horarios (id, horario_final, horario_inicio)
VALUES('1', '12:02:02', '02:01:02');
INSERT INTO horarios (id, horario_final, horario_inicio)
VALUES('2', '02:22:02', '03:00:00');     
INSERT INTO horarios (id, horario_final, horario_inicio)
VALUES('3', '03:20:12', '04:00:00');
INSERT INTO horarios (id, horario_final, horario_inicio)
VALUES('4', '05:50:50', '06:35:02');
INSERT INTO horarios (id, horario_final, horario_inicio)
VALUES('5', '09:09:29', '11:13:18');
INSERT INTO horarios (id, horario_final, horario_inicio)
VALUES('6', '07:03:23', '10:12:12');
UPDATE horarios SET horario_final = '20:02:02' , horario_inicio = '19:02:02' WHERE id = "5";
DELETE FROM horarios WHERE id = "6";
SELECT horarios.id, horarios.horario_final, horarios.horario_inicio from horarios;
#-------------------------------------------------------------------------------------------------------#
INSERT INTO salones (id, capacidad, descripcion, nombre_salon)
VALUES('7', '50', 'Tendran clases solo los jueves' , 'salon de quimica');
INSERT INTO salones (id, capacidad, descripcion, nombre_salon)
VALUES('8', '15', 'Tendran clases solo los lunes' , 'salon de matematicas');
INSERT INTO salones (id, capacidad, descripcion, nombre_salon)
VALUES('9', '20', 'no tendran clases' , 'salon de fisica');
INSERT INTO salones (id, capacidad, descripcion, nombre_salon)
VALUES('10', '55', 'Tendran solo medio dia' , 'salon de informatica');
INSERT INTO salones (id, capacidad, descripcion, nombre_salon)
VALUES('11', '67', 'no abra clases' , 'salon de vacio');
INSERT INTO salones (id, capacidad, descripcion, nombre_salon)
VALUES('12', '51', 'Tendran clases domingos' , 'salon de calculo');
UPDATE salones SET capacidad = '100' , descripcion = 'solo alumnos con promedio alto', nombre_salon = 'salon de robotica' WHERE id = "11";
DELETE FROM salones WHERE id = "12";
SELECT salones.id, salones.capacidad, salones.descripcion, salones.nombre_salon from salones;
#-------------------------------------------------------------------------------------------------------#
INSERT INTO carreras_tecnicas (id, nombre)
VALUES('0101', 'informarica');
INSERT INTO carreras_tecnicas (id, nombre)
VALUES('0202', 'electronica');
INSERT INTO carreras_tecnicas (id, nombre)
VALUES('0303', 'mecanica');
INSERT INTO carreras_tecnicas (id, nombre)
VALUES('0404', 'medicina');
INSERT INTO carreras_tecnicas (id, nombre)
VALUES('0505', 'pediatria');
INSERT INTO carreras_tecnicas (id, nombre)
VALUES('0606', 'computacion');
UPDATE carreras_tecnicas SET nombre = 'Lenguaje' WHERE id = '0505';
DELETE FROM carreras_tecnicas WHERE id = "0606";
SELECT carreras_tecnicas.id, carreras_tecnicas.nombre from carreras_tecnicas;
#-------------------------------------------------------------------------------------------------------#
INSERT INTO instructores (id, apellidos, nombres, direccion, telefono)
VALUES('01', 'sanabria', 'angel', '1ra avenida zona 12', '12746372');
INSERT INTO instructores (id, apellidos, nombres, direccion, telefono)
VALUES('02', 'sanum', 'henry', '1da avenida zona 13', '94857382');
INSERT INTO instructores (id, apellidos, nombres, direccion, telefono)
VALUES('03', 'xovin', 'ambrosio', 'colonia quinta samayoa', '95847321');
INSERT INTO instructores (id, apellidos, nombres, direccion, telefono)
VALUES('04', 'escobar', 'humberto', 'colonia la limonada', '77748372');
INSERT INTO instructores (id, apellidos, nombres, direccion, telefono)
VALUES('05', 'larios', 'marvin', 'chimaltenango', '0328462');
INSERT INTO instructores (id, apellidos, nombres, direccion, telefono)
VALUES('06', 'barrios', 'miguel', 'las majadas', '85553235');
UPDATE instructores SET apellidos = 'sanum', nombres = 'elias', direccion = 'Patzicia Chimaltenago', telefono = '99943267' WHERE id = '05';
DELETE FROM instructores WHERE id = "06";
SELECT instructores.id, instructores.apellidos, instructores.nombres, instructores.direccion, instructores.telefono from instructores;
#-------------------------------------------------------------------------------------------------------#
INSERT INTO cursos (id, ciclo, cupo_maximo, cupo_minimo, descripcion, carrera_tecnica_id, horario_id, instructor_id, salon_id)
VALUES('25', 1921, '500', '250', 'curso de informatica', '0101', '1', '01', '7');
INSERT INTO cursos (id, ciclo, cupo_maximo, cupo_minimo, descripcion, carrera_tecnica_id, horario_id, instructor_id, salon_id)
VALUES('26', 2021, '100', '90', 'curso de mecanicos', '0202', '2', '02', '8');
INSERT INTO cursos (id, ciclo, cupo_maximo, cupo_minimo, descripcion, carrera_tecnica_id, horario_id, instructor_id, salon_id)
VALUES('27', 2022, '25', '20', 'curso de electronicos', '0303', '3', '03', '9');
INSERT INTO cursos (id, ciclo, cupo_maximo, cupo_minimo, descripcion, carrera_tecnica_id, horario_id, instructor_id, salon_id)
VALUES('28', 2022, '200', '150', 'curso de medicina', '0404', '4', '04', '10');
INSERT INTO cursos (id, ciclo, cupo_maximo, cupo_minimo, descripcion, carrera_tecnica_id, horario_id, instructor_id, salon_id)
VALUES('29', 2021, '5', '3', 'curso de pediatria', '0505', '5', '05', '11');
UPDATE cursos SET ciclo = '2023', cupo_maximo = '200', cupo_minimo = '100', descripcion = 'Cursos para alumnos con bajo promedio' WHERE id = '29';
DELETE FROM cursos WHERE id = "30";
SELECT cursos.id, cursos.ciclo, cursos.cupo_maximo, cursos.cupo_minimo, cursos.descripcion, cursos.carrera_tecnica_id, cursos.horario_id, cursos.instructor_id, cursos.salon_id from cursos;
#-------------------------------------------------------------------------------------------------------#
INSERT INTO asignaciones_alumnos (id, alumno_carne, curso_id, fecha_asignacion)
VALUES('000', '202201', '25', '2020/12/01');
INSERT INTO asignaciones_alumnos (id, alumno_carne, curso_id, fecha_asignacion)
VALUES('0001', '202202', '26', '2021/11/02');
INSERT INTO asignaciones_alumnos (id, alumno_carne, curso_id, fecha_asignacion)
VALUES('0003', '202202', '27', '2023/02/02');
INSERT INTO asignaciones_alumnos (id, alumno_carne, curso_id, fecha_asignacion)
VALUES('0004', '202204', '28', '2024/05/01');
INSERT INTO asignaciones_alumnos (id, alumno_carne, curso_id, fecha_asignacion)
VALUES('0005', '202205', '29', '2025/08/18');
UPDATE asignaciones_alumnos SET alumno_carne = '202207', curso_id = '34', fecha_asignacion = '2027/12/12' WHERE id = '0006';
DELETE FROM asignaciones_alumnos WHERE id = "0005";
SELECT asignaciones_alumnos.id, asignaciones_alumnos.alumno_carne, asignaciones_alumnos.curso_id, asignaciones_alumnos.fecha_asignacion from asignaciones_alumnos;
#-------------------------------------------------------------------------------------------------------#