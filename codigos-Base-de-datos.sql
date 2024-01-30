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
insert into materiales(nombre) values ("ladrillo 15x20");
insert into materiales(nombre) values ("20l pintura latex blanco");
insert into materiales(nombre) values ("caño de 1/2 rosca plastico");

insert into materiales(nombre) values ("hierro del 8");
insert into materiales(nombre) values ("hierro del 10");
insert into materiales(nombre) values ("hierro del 12");
insert into materiales(nombre) values ("caja ceramica violeta");
insert into materiales(nombre) values ("vigas 3.20");

ALTER TABLE materiales
ADD COLUMN cantidad_inicial INT DEFAULT 1000;

#creacion de tabla tareas
create table tareas(
					idtarea int auto_increment primary key,
                    nombre varchar(20));
#insertar tareas
insert into tareas(nombre) values("electrisista");
insert into tareas(nombre) values("constructor");
insert into tareas(nombre) values("pintor");
insert into tareas(nombre) values("ceramista");
insert into tareas(nombre) values("plomero");

#creacion de tabla contratistas
create table contratistas(
						  idcontratista int auto_increment primary key,
                          idarquitecto int,
                          nombre varchar(20),
                          apellido varchar(20),
                          idtarea int);
     
#creacion de llave foranea hacia tareas idtareas
ALTER TABLE contratistas
DROP FOREIGN KEY fk_tarea_contratista;
drop table contratistas;

ALTER TABLE contratistas
ADD CONSTRAINT fk_tarea_contratista
FOREIGN KEY (idtarea)
REFERENCES tareas (idtarea) 
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE contratistas
ADD CONSTRAINT fk_arquitecto_contratista
FOREIGN KEY (idarquitecto)
REFERENCES arquitectos (idarquitecto) 
ON UPDATE CASCADE
ON DELETE CASCADE;

#insrtar contratistas
insert into contratistas(idarquitecto,nombre,apellido,idtarea) values (4,"Marcelo","Boris", 2);
insert into contratistas(idarquitecto,nombre,apellido,idtarea) values (3,"Manuel","Solis", 1);
insert into contratistas(idarquitecto,nombre,apellido,idtarea) values (1,"Esteban","Perety", 4);
insert into contratistas(idarquitecto,nombre,apellido,idtarea) values (2,"Natalia","Volpini", 3);
insert into contratistas(idarquitecto,nombre,apellido,idtarea) values (5,"Veronica","Guzman", 2);

#creacin de tabla tipotrabajo
create table tipotrabajo(
						 idtipo int auto_increment primary key,
                         nombre varchar(5));
insert into tipotrabajo(nombre)values("inst");
insert into tipotrabajo(nombre)values("st");
insert into tipotrabajo(nombre)values("rinst");
insert into tipotrabajo(nombre)values("alta");
insert into tipotrabajo(nombre)values("modif");

#creacion de tabla trabajos
create table trabajos(
					  idtrabajo int auto_increment primary key,
                       idlocalidad int,
                       idmaterial int,
                       idcontratista int,
                       precio int,
                       idtipo int,
                       estado varchar(10),
                       fecha date);

ALTER TABLE trabajos
ADD CONSTRAINT fk_localidad_trabajo
FOREIGN KEY (idlocalidad)
REFERENCES localidades (idlocalidad) 
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE trabajos
ADD CONSTRAINT fk_material_trabajo
FOREIGN KEY (idmaterial)
REFERENCES materiales (idmaterial) 
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE trabajos
ADD CONSTRAINT fk_contratista_trabajo
FOREIGN KEY (idcontratista)
REFERENCES contratistas (idcontratista) 
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE trabajos
ADD CONSTRAINT fk_tipo_trabajo
FOREIGN KEY (idtipo)
REFERENCES tipotrabajo (idtipo) 
ON UPDATE CASCADE
ON DELETE CASCADE;


                       
insert into trabajos(idlocalidad,idmaterial,idcontratista,precio,idtipo,estado,fecha)values(2,6,6,250000,3,"Finalizado","2021-10-10");
insert into trabajos(idlocalidad,idmaterial,idcontratista,precio,idtipo,estado,fecha)values(3,7,1,350000,2,"En curso","2021-05-10");
insert into trabajos(idlocalidad,idmaterial,idcontratista,precio,idtipo,estado,fecha)values(4,8,5,185550,4,"Finalizado","2021-05-10");
insert into trabajos(idlocalidad,idmaterial,idcontratista,precio,idtipo,estado,fecha)values(1,9,4,500352,1,"En curso","2021-05-10");
insert into trabajos(idlocalidad,idmaterial,idcontratista,precio,idtipo,estado,fecha)values(2,10,3,120200,5,"En curso","2021-04-10");
insert into trabajos(idlocalidad,idmaterial,idcontratista,precio,idtipo,estado,fecha)values(4,9,1,540250,4,"En curso","2023-04-10");
insert into trabajos(idlocalidad,idmaterial,idcontratista,precio,idtipo,estado,fecha)values(3,8,2,320150,5,"Finalizado","2021-08-10");

insert into trabajos(idlocalidad,idmaterial,idcontratista,precio,idtipo,estado,fecha)values(2,11,2,250000,3,"Finalizado","2021-10-10");
insert into trabajos(idlocalidad,idmaterial,idcontratista,precio,idtipo,estado,fecha)values(3,11,1,350000,2,"En curso","2022-10-10");
insert into trabajos(idlocalidad,idmaterial,idcontratista,precio,idtipo,estado,fecha)values(4,12,5,185550,4,"Finalizado","2023-10-10");
insert into trabajos(idlocalidad,idmaterial,idcontratista,precio,idtipo,estado,fecha)values(1,13,4,500352,1,"En curso","2022-05-10");
insert into trabajos(idlocalidad,idmaterial,idcontratista,precio,idtipo,estado,fecha)values(2,15,3,120200,5,"En curso","2022-03-10");
insert into trabajos(idlocalidad,idmaterial,idcontratista,precio,idtipo,estado,fecha)values(4,14,1,540250,4,"En curso","2021-07-10");
insert into trabajos(idlocalidad,idmaterial,idcontratista,precio,idtipo,estado,fecha)values(3,12,2,320150,5,"Finalizado","2023-08-10");

insert into trabajos(idlocalidad,idmaterial,idcontratista,precio,idtipo,estado,fecha)values(2,11,2,352000,3,"Finalizado","2021-07-20");
insert into trabajos(idlocalidad,idmaterial,idcontratista,precio,idtipo,estado,fecha)values(3,11,1,529230,2,"En curso","2022-01-10");
insert into trabajos(idlocalidad,idmaterial,idcontratista,precio,idtipo,estado,fecha)values(4,12,5,185550,4,"Finalizado","2023-03-10");
insert into trabajos(idlocalidad,idmaterial,idcontratista,precio,idtipo,estado,fecha)values(1,13,4,600520,1,"En curso","2022-04-10");
insert into trabajos(idlocalidad,idmaterial,idcontratista,precio,idtipo,estado,fecha)values(2,15,3,103500,5,"En curso","2022-05-10");
insert into trabajos(idlocalidad,idmaterial,idcontratista,precio,idtipo,estado,fecha)values(4,14,1,540250,4,"En curso","2021-09-10");
insert into trabajos(idlocalidad,idmaterial,idcontratista,precio,idtipo,estado,fecha)values(3,12,2,320150,5,"Finalizado","2023-09-10");
                       
#crear tabla de localidades
create table localidades(
						 idlocalidad int auto_increment primary key,
                         nombre varchar(15));
insert into localidades(nombre)values("Cordoba");
insert into localidades(nombre)values("Rosario");
insert into localidades(nombre)values("Tucuman");
insert into localidades(nombre)values("Mendoza");


select * from datos
                          
                          
                        
                         