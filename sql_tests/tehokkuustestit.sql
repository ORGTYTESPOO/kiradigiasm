CREATE TABLE public.katu as (
SELECT 
    id,
    addinfo1,
    addinfo1text,
    addinfo2,
    addinfo2text,
    completionyear,
    label,
    maintainedby,
    maintainedbytext,
    maintenanceclass,
    maintenanceclasstext,
    name,
    owner,
    ownertext,
    partclass,
    partclasstext,
    partnumber,
    pavingclass as pavingmaterial,
    pavingclasstext as pavingmaterialtext,
    possessor,
    possessortext,
    registerstate,
    registerstatetext,
    repairyear,
    status,
    statustext,
    usetype,
    usetypetext,
    wintermaintenance,
    geom
    FROM katuindex
);


CREATE TABLE public.viher as (
SELECT 
    id,
    addinfo1,
    addinfo1text,
    addinfo2,
    addinfo2text,
    completionyear,
    label,
    maintainedby,
    maintainedbytext,
    maintenanceclass,
    maintenanceclasstext,
    name,
    owner,
    ownertext,
    partclass,
    partclasstext,
    partnumber,
    cast (pavingmaterial),
    pavingmaterialtext,
    possessor,
    possessortext,
    registerstate,
    registerstatetext,
    repairyear,
    status,
    statustext,
    usetype,
    usetypetext,
    wintermaintenance,
    geom
    FROM viherindex
);

-- TESTIT 2 erillistä taulua

SELECT SUM(ST_Area(geom)) AS pintaala, 
(CASE 
	WHEN  maintenanceclass = '1'  THEN 'Ajorata 1'
	WHEN  maintenanceclass = '2'  THEN 'Ajorata 2'
	WHEN  maintenanceclass = '3'  THEN 'Ajorata 3'
	WHEN  maintenanceclass = '4'  THEN 'Kevyt liikenne 1'
	WHEN  maintenanceclass = '5'  THEN 'Kevyt liikenne 2'  
END) AS kunnossapitolk
FROM katu
WHERE possessor = '1'
	AND usetype <> '13'
	AND maintenanceclass in ('1','2','3','4','5')
GROUP BY maintenanceclass
ORDER BY maintenanceclass
;


SELECT SUM(ST_Area(geom))as pintaala,
(CASE 
      WHEN wintermaintenance = '0' THEN 'Ei talvikunnossapitoa'
      ELSE 'Talvikunnossapidossa'
END)talvikunnossapito
FROM katu
WHERE usetype = '13'
	AND possessor = '1'
GROUP BY usetype, wintermaintenance
;

SELECT SUM(ST_Area(geom)) as pintaala,
maintenanceclass, 
(CASE
	WHEN partclass = '1' THEN 'Puisto'
	WHEN partclass = '4' THEN 'Liikennevihreä'
	ELSE 'Piha-alue'
END) as partclass
FROM viher
WHERE maintenanceclass IN('A1','A2','A3','B3','B4','B5')
	AND possessor = '1'
GROUP BY maintenanceclass,partclass
ORDER BY maintenanceclass
;


-- union kysely kaikista pinta-aloista kahteen erilliseen tauluun


CREATE TABLE AssetArea AS (
SELECT  id,
    addinfo1,
    addinfo1text,
    addinfo2,
    addinfo2text,
    completionyear,
    label,
    maintainedby,
    maintainedbytext,
    maintenanceclass,
    maintenanceclasstext,
    name,
    owner,
    ownertext,
    partclass,
    partclasstext,
    partnumber,
    pavingmaterial,
    pavingmaterialtext,
    possessor,
    possessortext,
    registerstate,
    registerstatetext,
    repairyear,
    status,
    statustext,
    usetype,
    usetypetext,
    wintermaintenance,
    geom
FROM katu
UNION 
SELECT  id,
    addinfo1,
    addinfo1text,
    addinfo2,
    addinfo2text,
    completionyear,
    label,
    maintainedby,
    maintainedbytext,
    maintenanceclass,
    maintenanceclasstext,
    name,
    owner,
    ownertext,
    partclass,
    partclasstext,
    partnumber,
    cast(pavingmaterial as text),
    pavingmaterialtext,
    possessor,
    possessortext,
    registerstate,
    registerstatetext,
    repairyear,
    status,
    statustext,
    usetype,
    usetypetext,
    wintermaintenance,
    geom
FROM viher
    )
;

-- TESTIT 1 taulu, jossa katu/viherpinta-alat yhdistetty

SELECT SUM(ST_Area(geom)) AS pintaala, 
maintenanceclasstext
FROM assetarea
GROUP BY maintenanceclasstext
;


-- INSERT, DELETE, UPDATE

BEGIN;
EXPLAIN ANALYZE ...;
ROLLBACK;


