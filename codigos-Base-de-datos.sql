# creacion de la base de datos para el estudio arquitectonico
create database greenArquitectura;

#usar la base de datos greenarquitectura
use greenArquitectura;

#creacion de las tabla arquitectos
create table arquitectos(
						 idarquitecto int auto_increment primary key,
                         nombre varchar(20), 
                         apellido varchar(20),
                         direccion varchar(20),
                         telefono varchar(15),
                         fecha_nacimiento date);
                         
#insertar datos arquitectos
insert into arquitectos(nombre,apellido,direccion,telefono,fecha_nacimiento) values("Diego","Gonzales","Rondo 340","351-2598989","1970-05-10");
insert into arquitectos(nombre,apellido,direccion,telefono,fecha_nacimiento) values("Pablo","Suarez","Pueyrredon 185","351-3658954","1965-02-20");
insert into arquitectos(nombre,apellido,direccion,telefono,fecha_nacimiento) values("Mariano","Soria","Dean Funes 55","351-4265656","1982-09-05");
insert into arquitectos(nombre,apellido,direccion,telefono,fecha_nacimiento) values("Maria","Peralta","San Juan 658","351-2321245","1980-06-22");
insert into arquitectos(nombre,apellido,direccion,telefono,fecha_nacimiento) values("Eugenia","Morales","Giecco 325","351-5988748","1989-08-01");


#creacion de tabla materiales 
create table materiales(
						idmaterial int auto_increment primary key,
                        nombre varchar(30));
                        
#insertar materiales
insert into materiales(nombre) values ("bloque 20x40");
insert into materiales(nombre) values ("cable 2x1 5mts");


#creacion de tabla tareas
create table tareas(
					idtarea int auto_increment primary key,
                    nombre varchar(20));
#insertar tareas
insert into tareas(nombre) values("electrisista");
insert into tareas(nombre) values("constructor");
insert into tareas(nombre) values("pintor");
insert into tareas(nombre) values("ceramista");

#creacion de tabla contratistas
create table contratistas(
						  idcontratista int auto_increment primary key,
                          nombre varchar(20),
                          apellido varchar(20),
                          idtarea int);
                          
ALTER TABLE contratistas
ADD CONSTRAINT fk_tarea_contratista
FOREIGN KEY (idtarea)
REFERENCES tareas (idtarea) 
ON UPDATE CASCADE
ON DELETE CASCADE;

#insrtar contratistas
insert into contratistas(nombre,apellido,idtarea) values ("Jose","Perez", 1);
insert into contratistas(nombre,apellido,idtarea) values ("Manuel","Solis", 1);
                          
                          
                        
                         