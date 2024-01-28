select * from stockmateriales;
create or replace view stockMateriales as
SELECT
    m.idmaterial,
    m.nombre,
    m.cantidad_inicial - COALESCE(SUM(t.idmaterial/t.idmaterial), 0) AS "stock Final"
FROM
    materiales m
LEFT JOIN
    trabajos t ON m.idmaterial = t.idmaterial
    GROUP BY 
    m.idmaterial, m.nombre, m.idmaterial;

