create or replace view datos as
select 
      trabajos.idtrabajo as "id",
      localidades.nombre as "provincia",
      contratistas.nombre as "contratista",
      trabajos.precio as "precio",
      concat(arquitectos.nombre," ",arquitectos.apellido) as "arquitecto",
      trabajos.fecha as "fecha comienzo obra",
      materiales.nombre as "material",
      tipotrabajo.nombre as "tipo trabajo",
      tareas.nombre as "profecion",
      trabajos.estado as "estado",
      CASE
        WHEN tipotrabajo.nombre = 'inst' THEN 2
        WHEN tipotrabajo.nombre = 'rinst' THEN 1
        WHEN tipotrabajo.nombre = 'st' THEN 0.5
        WHEN tipotrabajo.nombre = 'alta' THEN 1.5
        WHEN tipotrabajo.nombre = 'modif' THEN 0.7
        ELSE 0
    END AS "valor tipo",
    CASE
        WHEN trabajos.estado = 'Finalizado' THEN trabajos.precio + (trabajos.precio * 0.005)
        ELSE trabajos.precio
    END AS "precioFinal",
    CASE
        WHEN trabajos.estado = 'Finalizado' THEN trabajos.precio + (trabajos.precio * 0.005)
        ELSE trabajos.precio
    END / 1250 as "precioDolar"
    
from trabajos
	  inner join localidades on trabajos.idlocalidad = localidades.idlocalidad
      inner join contratistas on trabajos.idcontratista = contratistas.idcontratista
      inner join arquitectos on contratistas.idarquitecto = arquitectos.idarquitecto
      inner join materiales on trabajos.idmaterial = materiales.idmaterial
      inner join tipotrabajo on trabajos.idtipo = tipotrabajo.idtipo
      inner join tareas on tareas.idtarea = contratistas.idtarea
      
      