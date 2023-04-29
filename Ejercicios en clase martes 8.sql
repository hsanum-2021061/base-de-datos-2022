create database ejemplo_while;
use ejemplo_while;


delimiter $$
drop procedure if exists sp_ejemplo_while $$
create procedure sp_ejemplo_while ()
begin
	declare i tinyint unsigned;
	set i = 0;
    while i < 5 do
		set i = i + 1;
        select i;
	end while;
end$$
delimiter ;

call sp_ejemplo_while()



#-----------------FUNCIONES--------------#
#-----ejemplo 1, crear una funcion que  permita multiplicar 2 numeros-----#
delimiter $$
drop function fn_multiplicar $$
create function fn_multiplicar ( valor1 int, valor2 int) 
returns int
reads SQL data deterministic
begin 
	return valor1*valor2;
end$$
delimiter ;

select fn_multiplicar(2,6);


#------------------Otra forma de hacer el anterior ejemplo---------------#

delimiter $$
drop function fn_multiplicar $$
create function fn_multiplicar ( valor1 int, valor2 int) 
returns int
reads SQL data deterministic
begin 
	declare resultado int default 0;
    set resultado = valor1*valor2;
	return resultado;
end$$
delimiter ;

set @result = fn_multiplicar(2,6);
select @result;




#-----ejercicio 2, crear una funcion que nos calcule el area de un circulo, este devolvera un numero real-----#
delimiter $$
drop function if exists fn_area_circulo $$
create function fn_area_circulo(radio int)
returns decimal(6,2)
reads SQL data deterministic
begin
	declare area decimal(6,2);
    set area = pi() * pow(radio,2);
    return area;
end $$
delimiter ;

select fn_area_circulo(4);




#-----Ejemplo 3, crear una funcion que calcule el area de un triangulo, este devolvera un numero real

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

select fn_area_triangulo(4,6);




#--------Ejemplo 4, crear una funcion que nos devuelva un numero entero aleatorio----------#
-- donde pasemos como parametros de donde empieza el numero y donde termina (valor inicial y final)


delimiter $$
drop function if exists fn_aleatorio $$
create function fn_aleatorio(inicial int, final int)
returns int
reads SQL data deterministic
begin
	declare resultado int;
    set resultado = rand()*(final-inicial)+inicial;
    return resultado;
end $$
delimiter ;

select fn_aleatorio(100,12);




#--------Ejemplo 5, devolver el mayor de N numeros aleatorios--------#

delimiter $$
drop function if exists fn_numero_n $$
create function fn_numero_n(limite int)
returns varchar(255)
reads SQL data deterministic
begin
	declare mayor, i, num int;
    declare resultado varchar(255) default '';
    set mayor = 0;
    set i = 0;
    repeat 
		set i = i + 1;
		set num = rand()*100;
        set resultado = concat(resultado, num, " - ");
        if(num > mayor) then
			set mayor = num;
		end if;
		until i = limite
    end repeat;
    set resultado = concat(resultado, " El Mayor es: ", mayor);
    return resultado;
end $$
delimiter ;

select fn_numero_n(5);