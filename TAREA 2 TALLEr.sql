DROP DATABASE IF EXISTS Tarea_2_calculo;
CREATE DATABASE Tarea_2_calculo;
USE Tarea_2_calculo;


#-------------HENRY DONALDO SANUM BARRIOS-------------#
#-------------ELDRICK ALDAIR HERNANDEZ BAUTISTA-------------#
#-------------Codigo Tecnico IN5BM-------------#
#-------------GRUPO 1-------------#


create table if not exists tipos_empleados (
	id int,
    nombre_tipo_empleado varchar(45),
    sueldo_base decimal (10,0),
    bonificacion_ley decimal(45),
    bonificacion_empresa decimal(45),
    primary key (id)
);

create table if not exists regiones (
	id int,
    nombre_region varchar(45),
    primary key (id)
);

create table if not exists departamentos_empresas (
	id int,
	nombre_depto_emp varchar(45),
	primary key (id)
);

create table if not exists telefonos (
	id int,
    numero_telefono varchar(8),
    primary key (id)
);

create table if not exists departamentos_guate (
	id int,
    nombre_depto_guate varchar(45),
    region_id int,
    primary key (id),
    constraint fk_departamentos_guate_regiones
		foreign key (region_id)
		references regiones (id)
		on delete cascade on update cascade
);

create table if not exists oficinas (
	id int,
    direccion varchar(45),
    departamentos_guate_id int,
    primary key (id),
    constraint fk_oficinas_departamentos_guate
		foreign key (departamentos_guate_id)
        references departamentos_guate (id)
        on delete cascade on update cascade
);

create table if not exists depto_emp_oficinas (
id int,
departamento_empresa_id int,
oficina_id int,
telefono_id int,
primary key (id),
constraint fk_depto_emp_oficinas_departamentos_empresa
   foreign key (departamento_empresa_id)
   references departamentos_empresas (id)
   on delete cascade on update cascade,
constraint fk__depto_emp_oficinas_oficinas
   foreign key (oficina_id)
   references oficinas (id)
   on delete cascade on update cascade,
constraint fk_depto_emp_oficinas_telefonos
 foreign key (telefono_id)
 references telefonos (id)
 on delete cascade on update cascade
);

create table if not exists empleados (
id int,
nombre varchar (45),
apellido varchar (45),
fecha_nacimiento date,
fecha_contrataciones date,
telefono varchar (8),
tipo_empleado_id int,
depto_emp_oficina_id int,
primary key (id),
constraint fk_empleados_tipos_empleados
   foreign key (tipo_empleado_id)
   references tipos_empleados (id)
   on delete cascade on update cascade,
constraint fk_empleados_depto_emp_oficinas
   foreign key (depto_emp_oficina_id)
   references depto_emp_oficinas (id)
   on delete cascade on update cascade
);

insert into tipos_empleados (id,nombre_tipo_empleado, sueldo_base, bonificacion_ley, bonificacion_empresa)
values ('1', ' empleado multistak', 37000, 100, 200 );
insert into tipos_empleados (id,nombre_tipo_empleado, sueldo_base, bonificacion_ley, bonificacion_empresa)
values ('2', 'empleado eficiente', 150, 45.0, 1000 );
insert into tipos_empleados (id,nombre_tipo_empleado, sueldo_base, bonificacion_ley, bonificacion_empresa)
values ('3', 'lider', 2000, 50, 10.00 );
insert into tipos_empleados (id,nombre_tipo_empleado, sueldo_base, bonificacion_ley, bonificacion_empresa)
values ('4', 'empleado despistado', 1000, 1.0, 12 );
insert into tipos_empleados (id,nombre_tipo_empleado, sueldo_base, bonificacion_ley, bonificacion_empresa)
values ('5', 'empleado seductor', 1.00, 18, 122 );
insert into tipos_empleados (id,nombre_tipo_empleado, sueldo_base, bonificacion_ley, bonificacion_empresa)
values ('6', 'empleado flojo', 10.0, 12.00, 97);
insert into tipos_empleados (id,nombre_tipo_empleado, sueldo_base, bonificacion_ley, bonificacion_empresa)
values ('7', 'empleado altamente potenciado', 22, 34, 21 );
insert into tipos_empleados (id,nombre_tipo_empleado, sueldo_base, bonificacion_ley, bonificacion_empresa)
values ('8', 'empleado toxico', 10, 16.00, 100 );
insert into tipos_empleados (id,nombre_tipo_empleado, sueldo_base, bonificacion_ley, bonificacion_empresa)
values ('9', 'empleado de bajo desempeno', 5.00, 214, 653 );
insert into tipos_empleados (id,nombre_tipo_empleado, sueldo_base, bonificacion_ley, bonificacion_empresa)
values ('10', 'empleado perfeccionista', 12, 1.0, 21 );
select * from tipos_empleados;

insert into regiones (id, nombre_region)
values (001, 'Región I o Metropolitana' );
insert into regiones (id, nombre_region)
values (002, 'Región II o Verapaz' );
insert into regiones (id, nombre_region)
values (003, ' Región III o Nororiente' );
insert into regiones (id, nombre_region)
values (004, ' Región IV o Suroriente' );
insert into regiones (id, nombre_region)
values (005, ' Región V o Central:' );
insert into regiones (id, nombre_region)
values (006, 'Región VI o Suroccidente' );
insert into regiones (id, nombre_region)
values (007, 'Región VII o Noroccidente' );
insert into regiones (id, nombre_region)
values (008, 'Región VIII o Petén' );
insert into regiones (id, nombre_region)
values (009, 'Región I o Metropolitana' );
insert into regiones (id, nombre_region)
values (0010, ' Región V o Central:' );


insert into departamentos_empresas (id, nombre_depto_emp)
values(11, 'compras');
insert into departamentos_empresas (id, nombre_depto_emp)
values(12, 'Almacen');
insert into departamentos_empresas (id, nombre_depto_emp)
values(13, 'Logistica');
insert into departamentos_empresas (id, nombre_depto_emp)
values(14, 'Produccion');
insert into departamentos_empresas (id, nombre_depto_emp)
values(15, 'Marketing');
insert into departamentos_empresas (id, nombre_depto_emp)
values(16, 'calculo');
insert into departamentos_empresas (id, nombre_depto_emp)
values(17, 'I+D');
insert into departamentos_empresas (id, nombre_depto_emp)
values(18, 'Recursos Humanos');
insert into departamentos_empresas (id, nombre_depto_emp)
values(19, 'Finanzas');
insert into departamentos_empresas (id, nombre_depto_emp)
values(20, 'Administracion');



insert into telefonos (id, numero_telefono)
values (610, 57463789);
insert into telefonos (id, numero_telefono)
values (611, 80043843);
insert into telefonos (id, numero_telefono)
values (612, 84838311);
insert into telefonos (id, numero_telefono)
values (613, 11672734);
insert into telefonos (id, numero_telefono)
values (614, 98437232);
insert into telefonos (id, numero_telefono)
values (615, 76004302);
insert into telefonos (id, numero_telefono)
values (616, 47832121);
insert into telefonos (id, numero_telefono)
values (617, 84362384);
insert into telefonos (id, numero_telefono)
values (618, 98995472);
insert into telefonos (id, numero_telefono)
values (619, 94725321);



insert into departamentos_guate (id, nombre_depto_guate, region_id)
values (30, 'Alta Verapaz','002');
insert into departamentos_guate (id, nombre_depto_guate, region_id)
values (31, 'Baja Verapaz','002');
insert into departamentos_guate (id, nombre_depto_guate, region_id)
values (32, 'Chimaltenango','005');
insert into departamentos_guate (id, nombre_depto_guate, region_id)
values (33, 'Chiquimula','003');
insert into departamentos_guate (id, nombre_depto_guate, region_id)
values (34, 'El Progreso','003');
insert into departamentos_guate (id, nombre_depto_guate, region_id)
values (35, 'Escuintla','005');
insert into departamentos_guate (id, nombre_depto_guate, region_id)
values (36, 'Departamento de Guatemala','001');
insert into departamentos_guate (id, nombre_depto_guate, region_id)
values (37, 'Huehuetenango','007');
insert into departamentos_guate (id, nombre_depto_guate, region_id)
values (38, 'Izabal','003');
insert into departamentos_guate (id, nombre_depto_guate, region_id)
values (39, 'Jalapa','004');
insert into departamentos_guate (id, nombre_depto_guate, region_id)
values (40, 'Jutiapa','004');
insert into departamentos_guate (id, nombre_depto_guate, region_id)
values (41, 'Petén','008');
insert into departamentos_guate (id, nombre_depto_guate, region_id)
values (42, 'Quetzaltenango','006');
insert into departamentos_guate (id, nombre_depto_guate, region_id)
values (43, 'Quiché','007');
insert into departamentos_guate (id, nombre_depto_guate, region_id)
values (44, 'Retalhuleu','006');
insert into departamentos_guate (id, nombre_depto_guate, region_id)
values (45, 'Sacatepéquez','005');
insert into departamentos_guate (id, nombre_depto_guate, region_id)
values (46, 'San Marcos','006');
insert into departamentos_guate (id, nombre_depto_guate, region_id)
values (47, 'Santa Rosa',004);
insert into departamentos_guate (id, nombre_depto_guate, region_id)
values (48, 'Sololá','006');
insert into departamentos_guate (id, nombre_depto_guate, region_id)
values (49, 'Suchitepéquez',006);
insert into departamentos_guate (id, nombre_depto_guate, region_id)
values (50, 'Totonicapán','006');
insert into departamentos_guate (id, nombre_depto_guate, region_id)
values (51, 'Zacapa','003');



insert into oficinas (id, direccion, departamentos_guate_id)
values ('81', '3ra avenida Patzicia Chimaltenango','32');
insert into oficinas (id, direccion, departamentos_guate_id)
values ('82', 'Pradera Torre II, oficina 1108 Guatemala','36');
insert into oficinas (id, direccion, departamentos_guate_id)
values ('83', '9 Calle, Sololá','48');
insert into oficinas (id, direccion, departamentos_guate_id)
values ('84', '6 Avenida 2, Sololá','48');
insert into oficinas (id, direccion, departamentos_guate_id)
values ('85', '4 CALLE, Totonicapán','50');
insert into oficinas (id, direccion, departamentos_guate_id)
values ('86', '15 avenida 333, Totonicapán','50');
insert into oficinas (id, direccion, departamentos_guate_id)
values ('87', '8GCH+CQC, Huehuetenango','37');
insert into oficinas (id, direccion, departamentos_guate_id)
values ('88', 'RP49+9WC, El Progreso','34');
insert into oficinas (id, direccion, departamentos_guate_id)
values ('89', '5a Avenida B, San Marcos','46');
insert into oficinas (id, direccion, departamentos_guate_id)
values ('90', '5a Calle, Chiquimula','33');


insert into depto_emp_oficinas (id, departamento_empresa_id, oficina_id ,telefono_id)
values ('100','11','81','610');
insert into depto_emp_oficinas (id, departamento_empresa_id, oficina_id ,telefono_id)
values ('101','12','82','611');
insert into depto_emp_oficinas (id, departamento_empresa_id, oficina_id ,telefono_id)
values ('102','13','83','612');
insert into depto_emp_oficinas (id, departamento_empresa_id, oficina_id ,telefono_id)
values ('103','14','84','613');
insert into depto_emp_oficinas (id, departamento_empresa_id, oficina_id ,telefono_id)
values ('104','15','85','614');
insert into depto_emp_oficinas (id, departamento_empresa_id, oficina_id ,telefono_id)
values ('105','16','86','615');
insert into depto_emp_oficinas (id, departamento_empresa_id, oficina_id ,telefono_id)
values ('106','17','87','616');
insert into depto_emp_oficinas (id, departamento_empresa_id, oficina_id ,telefono_id)
values ('107','18','88','617');
insert into depto_emp_oficinas (id, departamento_empresa_id, oficina_id ,telefono_id)
values ('108','19','89','618');
insert into depto_emp_oficinas (id, departamento_empresa_id, oficina_id ,telefono_id)
values ('109','20','90','619');

insert into empleados (id, nombre, apellido, fecha_nacimiento, fecha_contrataciones, telefono, tipo_empleado_id, depto_emp_oficina_id)
values ('01010','Henry', 'Sanum','1985-06-02','2020-12-01','57463789','1','100');
insert into empleados (id, nombre, apellido, fecha_nacimiento, fecha_contrataciones, telefono, tipo_empleado_id, depto_emp_oficina_id)
values ('01011','Eldrick', 'Hernandez','2020-04-01','2022-01-30','80043843','2','101');
insert into empleados (id, nombre, apellido, fecha_nacimiento, fecha_contrataciones, telefono, tipo_empleado_id, depto_emp_oficina_id)
values ('01012','Ambrosio', 'Sanum','2003-02-11','1900-02-05','84838311','3','102');
insert into empleados (id, nombre, apellido, fecha_nacimiento, fecha_contrataciones, telefono, tipo_empleado_id, depto_emp_oficina_id)
values ('01013','Donaldo', 'Sanum','2005-12-09','2021-11-01','11672734','4','103');
insert into empleados (id, nombre, apellido, fecha_nacimiento, fecha_contrataciones, telefono, tipo_empleado_id, depto_emp_oficina_id)
values ('01014','Brenda', 'Barrios','1985-06-02','2020-12-01','98437232','5','104');
insert into empleados (id, nombre, apellido, fecha_nacimiento, fecha_contrataciones, telefono, tipo_empleado_id, depto_emp_oficina_id)
values ('01015','Marcia', 'Grajeda','2019-03-06','2020-09-05','76004302','6','105');
insert into empleados (id, nombre, apellido, fecha_nacimiento, fecha_contrataciones, telefono, tipo_empleado_id, depto_emp_oficina_id)
values ('01016','Melany', 'Sanabria','2000-08-08','2005-07-12','47832121','7','106');
insert into empleados (id, nombre, apellido, fecha_nacimiento, fecha_contrataciones, telefono, tipo_empleado_id, depto_emp_oficina_id)
values ('01017','Guillermo', 'Miculax','1999-12-12','2022-08-01','84362384','8','107');
insert into empleados (id, nombre, apellido, fecha_nacimiento, fecha_contrataciones, telefono, tipo_empleado_id, depto_emp_oficina_id)
values ('01018','Diego', 'Ajsivinac','1802-05-03','2021-11-29','98995472','9','108');
insert into empleados (id, nombre, apellido, fecha_nacimiento, fecha_contrataciones, telefono, tipo_empleado_id, depto_emp_oficina_id)
values ('01019','Cayu', 'Maczul','2013-02-26','2013-11-01','94725321','10','109');


#-----Consultas

#-----1)Nombre y edad de los empleados
select e.nombre, timestampdiff(year, fecha_nacimiento,curdate())as edad
from empleados as e;

#-----2)Fecha de contratación de cada empleado
select e.nombre, e.fecha_contrataciones
from empleados as e;

#-----3)Edades de los empleados
select timestampdiff(year, e.fecha_nacimiento,curdate()) as edades
from empleados as e;

#-----4)Número de empleados que hay para cada una de las edades
select timestampdiff(year, e.fecha_nacimiento,curdate()) as edades, count(e.fecha_nacimiento) as numero_empleados
from empleados as e
group by year (e.fecha_nacimiento); 

#-----5)Edad media de los empleados por departamento
select avg (timestampdiff(year,e.fecha_nacimiento,curdate())) as edad_media, de.nombre_depto_emp as departamento_empresa
from empleados as e
inner join depto_emp_oficinas as d
inner join departamentos_empresas as de
on e.depto_emp_oficina_id=d.departamento_empresa_id and d.departamento_empresa_id=de.id
group by e.depto_emp_oficina_id
order by depto_emp_oficina_id;


#------6)Tipos de Empleados que superan las 35.000 de salario
select tipos_empleados.nombre_tipo_empleado, tipos_empleados.sueldo_base
from tipos_empleados
where tipos_empleados.sueldo_base >= 35000;

#-----7)Datos del empleado número X
select *
from empleados as e
where e.id = 01010;

#-----8)Empleados del departamento de empresa X
select e.id, e.nombre, te.nombre_tipo_empleado, de.nombre_depto_emp
from empleados as e 
join tipos_empleados as te
join depto_emp_oficinas as deo
join departamentos_empresas as de
on e.tipo_empleado_id = te.id
and e.depto_emp_oficina_id = deo.id
and deo.departamento_empresa_id = de.id
order by e.id;

#-----9)Empleados cuya contratación se produjo en el año X
select e.nombre, e.apellido, year(e.fecha_contrataciones) as año_contratacion
from empleados as e
where year(e.fecha_contrataciones) = "2021";

#-----10)Empleados que no sean jefe de Departamento (atributo nombre tipoempleado dentro de la entidad Tipos Empleados) X
select e.nombre, t.nombre_tipo_empleado, d.nombre_depto_emp
from empleados as e
join tipos_empleados as t
join depto_emp_oficinas as deo
join departamentos_empresas as d
on t.id != '01010'
and e.tipo_empleado_id = t.id
and e.depto_emp_oficina_id = deo.id
and deo.departamento_empresa_id = d.id
group by e.id;

#-----11) Empleados contratados entre los años X y X
select e.nombre, e.apellido, year(e.fecha_contrataciones) as año_contratacion
from empleados as e
where year(e.fecha_contrataciones) = "2020"
or year(e.fecha_contrataciones) = "2021"
group by e.id;

#-----12)Tipos de Empleado que tienen un salario superior a 35.000 e inferior a 40.000
select t.nombre_tipo_empleado, t.sueldo_base
from tipos_empleados as t
where t.sueldo_base >= 35000
and t.sueldo_base <= 40000;

#-----13)Empleados cuyo tipo de empleado es director o jefe de sección 
select e.nombre, e.apellido, t.nombre_tipo_empleado, d.nombre_depto_emp
from empleados as e
join tipos_empleados as t
join depto_emp_oficinas as deo
join departamentos_empresas as d
on t.id = '01011'
and e.tipo_empleado_id = t.id
and e.depto_emp_oficina_id = deo.id
and deo.departamento_empresa_id = d.id
group by e.id;

#-----14)Empleados de nombre 'Jose
select e.id, e.nombre, count(e.id) as cantidad_empleados
from empleados as e
where e.nombre = 'Donaldo';

#-----15) Empleados que pertenecen al departamento administrativo y que tienen una edad mayor a 35 años
select e.nombre, d.nombre_depto_emp, timestampdiff(year, e.fecha_nacimiento, curdate()) as edad
from empleados as e
join depto_emp_oficinas as deo
join departamentos_empresas as d
on e.depto_emp_oficina_id = deo.id
and deo.departamento_empresa_id = d.id
and d.nombre_depto_emp = "Administracion"
and year(e.fecha_nacimiento) >= 35;

#-----16) Empleados que no pertenecen al departamento de la empresa X
select e.id, e.nombre, d.nombre_depto_emp
from empleados as e
join depto_emp_oficinas as deo
join departamentos_empresas as d
on e.depto_emp_oficina_id = deo.id
and deo.departamento_empresa_id = d.id
and d.nombre_depto_emp != "Marketing"
order by e.id;

#-----17) Nombre y edad de los empleados ordenados de menor a mayor edad
select e.nombre, timestampdiff(year, e.fecha_nacimiento, curdate()) as edad
from empleados as e
order by e.fecha_nacimiento asc;

#-----18)Nombre y edad de los empleados ordenados por nombre de forma descendente
select e.nombre, timestampdiff(year, e.fecha_nacimiento, curdate()) as edad
from empleados as e
order by e.nombre desc;

#-----19) Nombre del empleado y el departamento de la empresa en la que trabaja
select e.nombre, d.nombre_depto_emp
from empleados as e
join depto_emp_oficinas as deo
join departamentos_empresas as d
on e.id = e.depto_emp_oficina_id
and e.depto_emp_oficina_id = deo.id
and deo.departamento_empresa_id = d.id
order by e.nombre;

#-----20) Código y teléfonos de los departamentos de las oficinas de la región 'Centro'
select deo.id, d.nombre_depto_emp, tel.numero_telefono, r.nombre_region
from depto_emp_oficinas as deo
join telefonos as tel 
join oficinas as o
join departamentos_guate as dg
join regiones as r
join departamentos_empresas as d
on deo.telefono_id = tel.id
and deo.oficina_id = o.id
and deo.departamento_empresa_id = d.id
and o.departamentos_guate_id = dg.id
and dg.region_id = r.id
and r.nombre_region = "Región V o Central:"
group by deo.id;

#-----21) Nombre del empleado y departamento de Guatemala en el que trabaja
select e.nombre, dg.nombre_depto_guate
from empleados as e
join depto_emp_oficinas as deo
join oficinas as o
join departamentos_guate as dg
on e.id = e.depto_emp_oficina_id
and e.depto_emp_oficina_id= deo.id
and deo.oficina_id = o.id
and o.departamentos_guate_id = dg.id;

#-----22)Sueldo de cada empleado y sus bonificaciones
select e.nombre, te.sueldo_base, te.bonificacion_ley, te.bonificacion_empresa
from empleados as e
join tipos_empleados as te
on e.tipo_empleado_id = te.id
order by e.nombre;


#-----23)Nombre de los empleados y de sus jefes de departamento
select e.nombre, e.apellido, t.nombre_tipo_empleado, d.nombre_depto_emp
from empleados as e
join tipos_empleados as t
join depto_emp_oficinas as deo
join departamentos_empresas as d
on e.tipo_empleado_id = t.id
and e.depto_emp_oficina_id = deo.id
and deo.departamento_empresa_id = d.id
group by e.id;

#-----24)Suma del sueldo de los empleados, sin la bonificación
select sum(te.sueldo_base) 
as sueldo_total_empleados
from tipos_empleados 
as te;

#-----25)Promedio del sueldo, sin contar bonificación
select avg(te.sueldo_base) 
as promedio_sueldo_empleados
from tipos_empleados 
as te
join empleados 
as e;

#-----26) Salarios máximo y mínimo de los empleados, incluyendo bonificación 
select max(te.sueldo_base+te.bonificacion_ley+te.bonificacion_empresa) 
as sueldo_maximo__empleados,
min(te.sueldo_base+te.bonificacion_ley+te.bonificacion_empresa) 
as sueldo_minimo_empleados
from tipos_empleados 
as te;

#-----27)Número de empleados que superan los 40 años
select timestampdiff(year, e.fecha_nacimiento,curdate()) as edades, 
count(timestampdiff(year, e.fecha_nacimiento,curdate())) as numero_empleados
from empleados as e
where timestampdiff(year, e.fecha_nacimiento,curdate()) > 40;

#-----28)Número de edades diferentes que tienen los empleados
SELECT DISTINCT TIMESTAMPDIFF(YEAR,fecha_nacimiento,CURDATE()) AS edad
FROM empleados;