/* 
Actividad de aprendizaje.
Funciones almacenadas
Temario: A

Curso: Taller II
Catedrático: Jorge Pérez.

	Nombre alumno: Henry Donaldo Sanum Barrios
	Carné:	2021061
	Sección: IN5BM
    Grupo: 1
	Fecha: 10/02/2022
    
*/

DROP DATABASE IF EXISTS db_funciones_Henry_Sanum;
CREATE DATABASE db_funciones_Henry_Sanum;

USE db_funciones_Henry_Sanum;

CREATE TABLE resultados (
	id INT AUTO_INCREMENT NOT NULL,
    area DECIMAL(10,2),
    impares VARCHAR(45),
    menor INT,
    PRIMARY KEY pk_funciones_Id (id)
);

-- INSTRUCCIONES:

-- 1. Crear un procedimiento almacenado para insertar registros en la tabla Resultados
delimiter $$
drop procedure if exists sp_resultados_create $$
create procedure sp_resultados_create (
    in _area decimal (10,2),
    in _impares varchar (45),
    in _menor int
)
begin
	insert into resultados (
        area,
        impares,
        menor
)
	values (
        _area,
        _impares,
        _menor
);
end $$
delimiter ;


-- 2. Crear una función para calcular el área de un triangulo.
delimiter $$
drop function if exists fn_area_triangulo $$
create function fn_area_triangulo(base int, altura int)
returns decimal
reads SQL data deterministic
begin
	declare area decimal;
    set area = base * altura /2;
    return area;
end $$
delimiter ;

-- 3. Crear una función que acumule en una variable todos los números impares del 1 al N.
DELIMITER $$
DROP FUNCTION IF EXISTS fn_numero_imp $$
CREATE FUNCTION fn_numero_imp(limite INT)
RETURNS VARCHAR(45)
READS SQL DATA DETERMINISTIC
BEGIN
	DECLARE cadena VARCHAR(45) DEFAULT "";
    DECLARE i INT DEFAULT 0;
    bucle: REPEAT
		SET i=i+1;
        IF i%2!=0 THEN
			SET cadena=CONCAT(cadena , " | " , i);
        END IF;
		UNTIL i=limite
    END REPEAT bucle;
    RETURN cadena;
END$$
DELIMITER ;

-- 4. Crear una función para calcular el número menor de 4 números enteros.
DELIMITER $$
DROP FUNCTION IF EXISTS fn_num_men $$
CREATE FUNCTION fn_num_men(
	a INT, 
    b INT, 
    c INT, 
    d INT)
RETURNS INT
READS SQL DATA DETERMINISTIC
BEGIN
	DECLARE menor INT DEFAULT 0;  
	IF ((a<b) AND (a<c) AND (a<d)) THEN
		SET menor=a;
	ELSEIF ((b<a) AND (b<c) AND (b<d)) THEN
		SET menor=b;
	ELSEIF ((c<a) AND (c<b) AND (c<d)) THEN
		SET menor=c;
	ELSEIF ((d<a) AND (d<b) AND (d<c)) THEN
		SET menor=d;
    END IF;
    RETURN menor;
END$$
DELIMITER ;

-- 5. Llamar al procedimiento almacenado creado anteriormente para insertar el resultado de las funciones en la tabla Resultados
CALL sp_resultados_create(fn_area_triangulo(100,4), 
fn_numero_imp(9),
fn_num_men(1,10,15,20));

-- 6. Crear un procedimiento almacenado para listar todos los registros de la tabla resultados
delimiter $$
drop procedure if exists sp_resultados_read $$ 
create procedure sp_resultados_read()
begin 
	select
		id,
        area,
        impares,
        menor
	from
		resultados;
end $$
delimiter ;

call sp_resultados_read ();