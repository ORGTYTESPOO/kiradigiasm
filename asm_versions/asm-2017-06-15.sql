
GRANT "asmAdmin" TO [youradmin];
-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.8.2
-- PostgreSQL version: 9.5
-- Project Site: pgmodeler.com.br
-- Model Author: ---

-- object: "asmAdmin" | type: ROLE --
 DROP ROLE IF EXISTS "asmAdmin";
CREATE ROLE "asmAdmin" WITH ;
-- ddl-end --

-- object: "asmUser" | type: ROLE --
 DROP ROLE IF EXISTS "asmUser";
CREATE ROLE "asmUser" WITH ;
-- ddl-end --

-- object: [youradmin] | type: ROLE --
-- DROP ROLE IF EXISTS [youradmin];
-- CREATE ROLE [youradmin] WITH IN 
--	ROLE "asmAdmin";
-- ddl-end --


-- Database creation must be done outside an multicommand file.
-- These commands were put in this file only for convenience.
-- -- object: "asm-2017-06-15" | type: DATABASE --
-- -- DROP DATABASE IF EXISTS "asm-2017-06-15";
-- CREATE DATABASE "asm-2017-06-15"
-- 	OWNER = [youradmin]
-- ;
-- -- ddl-end --
-- 

-- object: asm | type: SCHEMA --
-- DROP SCHEMA IF EXISTS asm CASCADE;
CREATE SCHEMA asm;
-- ddl-end --
ALTER SCHEMA asm OWNER TO "asmAdmin";
-- ddl-end --

-- object: "Maintenance" | type: SCHEMA --
-- DROP SCHEMA IF EXISTS "Maintenance" CASCADE;
CREATE SCHEMA "Maintenance";
-- ddl-end --
ALTER SCHEMA "Maintenance" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "Actors" | type: SCHEMA --
-- DROP SCHEMA IF EXISTS "Actors" CASCADE;
CREATE SCHEMA "Actors";
-- ddl-end --
ALTER SCHEMA "Actors" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "Owners" | type: SCHEMA --
-- DROP SCHEMA IF EXISTS "Owners" CASCADE;
CREATE SCHEMA "Owners";
-- ddl-end --
ALTER SCHEMA "Owners" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "History" | type: SCHEMA --
-- DROP SCHEMA IF EXISTS "History" CASCADE;
CREATE SCHEMA "History";
-- ddl-end --
ALTER SCHEMA "History" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "Possessors" | type: SCHEMA --
-- DROP SCHEMA IF EXISTS "Possessors" CASCADE;
CREATE SCHEMA "Possessors";
-- ddl-end --
ALTER SCHEMA "Possessors" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "Management" | type: SCHEMA --
-- DROP SCHEMA IF EXISTS "Management" CASCADE;
CREATE SCHEMA "Management";
-- ddl-end --
ALTER SCHEMA "Management" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "Media" | type: SCHEMA --
-- DROP SCHEMA IF EXISTS "Media" CASCADE;
CREATE SCHEMA "Media";
-- ddl-end --
ALTER SCHEMA "Media" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "Reports" | type: SCHEMA --
-- DROP SCHEMA IF EXISTS "Reports" CASCADE;
CREATE SCHEMA "Reports";
-- ddl-end --
ALTER SCHEMA "Reports" OWNER TO "asmAdmin";
-- ddl-end --

SET search_path TO pg_catalog,public,asm,"Maintenance","Actors","Owners","History","Possessors","Management","Media","Reports";
-- ddl-end --

-- object: asm."InfraCode2017" | type: TABLE --
-- DROP TABLE IF EXISTS asm."InfraCode2017" CASCADE;
CREATE TABLE asm."InfraCode2017"(
	code char(5) NOT NULL,
	name varchar,
	CONSTRAINT "InfraCode2017_pk" PRIMARY KEY (code)

);
-- ddl-end --
ALTER TABLE asm."InfraCode2017" OWNER TO "asmAdmin";
-- ddl-end --

-- object: asm."RoadSurfaceMarking" | type: TABLE --
-- DROP TABLE IF EXISTS asm."RoadSurfaceMarking" CASCADE;
CREATE TABLE asm."RoadSurfaceMarking"(
	gid serial NOT NULL,
	"roadMarkingCode" smallint,
	"gid_Asset" integer,
	CONSTRAINT "RoadSurfaceMarking_pk" PRIMARY KEY (gid)

);
-- ddl-end --
COMMENT ON TABLE asm."RoadSurfaceMarking" IS 'Tiemerkinn?t - maalatut tienpinnassa';
-- ddl-end --
ALTER TABLE asm."RoadSurfaceMarking" OWNER TO "asmAdmin";
-- ddl-end --

-- object: asm."Equipment" | type: TABLE --
-- DROP TABLE IF EXISTS asm."Equipment" CASCADE;
CREATE TABLE asm."Equipment"(
	gid serial NOT NULL,
	type smallint,
	model varchar,
	brand varchar,
	"gid_Asset" integer,
	CONSTRAINT "Furniture_pk" PRIMARY KEY (gid)

);
-- ddl-end --
ALTER TABLE asm."Equipment" OWNER TO "asmAdmin";
-- ddl-end --

-- object: asm."SurfaceMaterial" | type: TYPE --
-- DROP TYPE IF EXISTS asm."SurfaceMaterial" CASCADE;
CREATE TYPE asm."SurfaceMaterial" AS
 ENUM ('A','AB');
-- ddl-end --
ALTER TYPE asm."SurfaceMaterial" OWNER TO "asmAdmin";
-- ddl-end --

-- object: asm."InfraPart" | type: TABLE --
-- DROP TABLE IF EXISTS asm."InfraPart" CASCADE;
CREATE TABLE asm."InfraPart"(
	gid serial NOT NULL,
	"speedLimit" smallint,
	type smallint,
	"functionalClass" smallint,
	"roadClass" smallint,
	"code_UseType" char(5),
	"gid_Asset" integer,
	CONSTRAINT "Surface_pk" PRIMARY KEY (gid)

);
-- ddl-end --
COMMENT ON COLUMN asm."InfraPart"."speedLimit" IS 'Speed limit for that road';
-- ddl-end --
ALTER TABLE asm."InfraPart" OWNER TO "asmAdmin";
-- ddl-end --

-- object: asm.infra2017 | type: TYPE --
-- DROP TYPE IF EXISTS asm.infra2017 CASCADE;
CREATE TYPE asm.infra2017 AS
 ENUM ('L1.1');
-- ddl-end --
ALTER TYPE asm.infra2017 OWNER TO "asmAdmin";
-- ddl-end --

-- object: asm."SimplifiedCode" | type: TABLE --
-- DROP TABLE IF EXISTS asm."SimplifiedCode" CASCADE;
CREATE TABLE asm."SimplifiedCode"(
	code char(5) NOT NULL,
	name varchar,
	CONSTRAINT "SimplifiedCode_pk" PRIMARY KEY (code)

);
-- ddl-end --
COMMENT ON TABLE asm."SimplifiedCode" IS 'Simplified codes based on Infra codes';
-- ddl-end --
ALTER TABLE asm."SimplifiedCode" OWNER TO "asmAdmin";
-- ddl-end --

-- object: asm."RoadLayer" | type: TABLE --
-- DROP TABLE IF EXISTS asm."RoadLayer" CASCADE;
CREATE TABLE asm."RoadLayer"(
	gid serial NOT NULL,
	material varchar,
	thickness smallint,
	"gid_Asset" integer,
	CONSTRAINT "RoadLayer_pk" PRIMARY KEY (gid)

);
-- ddl-end --
ALTER TABLE asm."RoadLayer" OWNER TO "asmAdmin";
-- ddl-end --

-- object: asm."assetStatus" | type: TYPE --
-- DROP TYPE IF EXISTS asm."assetStatus" CASCADE;
CREATE TYPE asm."assetStatus" AS
 ENUM ('planned','finished','removed');
-- ddl-end --
ALTER TYPE asm."assetStatus" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "Maintenance"."MaintenanceRegion" | type: TABLE --
-- DROP TABLE IF EXISTS "Maintenance"."MaintenanceRegion" CASCADE;
CREATE TABLE "Maintenance"."MaintenanceRegion"(
	gid serial NOT NULL,
	name varchar,
	type smallint,
	"validFrom" date,
	"validTo" date,
	"isTemporary" bool,
	priority smallint,
	"id_Maintainer" integer,
	CONSTRAINT "MaintenanceRegion_pk" PRIMARY KEY (gid)

);
-- ddl-end --
COMMENT ON COLUMN "Maintenance"."MaintenanceRegion"."validFrom" IS 'The time when the phenomenon started to exist in the real world.';
-- ddl-end --
COMMENT ON COLUMN "Maintenance"."MaintenanceRegion"."validTo" IS 'The time from which the phenomenon no longer exists in the real world.';
-- ddl-end --
COMMENT ON COLUMN "Maintenance"."MaintenanceRegion"."isTemporary" IS 'Temporary region overrides common geospatial area with the other maintenance regions';
-- ddl-end --
COMMENT ON COLUMN "Maintenance"."MaintenanceRegion".priority IS 'If some maintenance regions intersect each other then then the region with higher priority overrides the area of the intersecting region with lower priority';
-- ddl-end --
ALTER TABLE "Maintenance"."MaintenanceRegion" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "Actors"."Actor" | type: TABLE --
-- DROP TABLE IF EXISTS "Actors"."Actor" CASCADE;
CREATE TABLE "Actors"."Actor"(
	id serial NOT NULL,
	name varchar,
	"VATCode" varchar,
	code smallint,
	CONSTRAINT "Actor_pk" PRIMARY KEY (id),
	CONSTRAINT "Actor_code_uq" UNIQUE (code)

);
-- ddl-end --
ALTER TABLE "Actors"."Actor" OWNER TO "asmAdmin";
-- ddl-end --

-- object: asm."UseType" | type: TABLE --
-- DROP TABLE IF EXISTS asm."UseType" CASCADE;
CREATE TABLE asm."UseType"(
	code char(5) NOT NULL,
	name varchar,
	CONSTRAINT "UseType_pk" PRIMARY KEY (code)

);
-- ddl-end --
ALTER TABLE asm."UseType" OWNER TO "asmAdmin";
-- ddl-end --

-- object: asm."RouteType" | type: TYPE --
-- DROP TYPE IF EXISTS asm."RouteType" CASCADE;
CREATE TYPE asm."RouteType" AS
 ENUM ('Rescue','Quality');
-- ddl-end --
ALTER TYPE asm."RouteType" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "History"."EventType" | type: TYPE --
-- DROP TYPE IF EXISTS "History"."EventType" CASCADE;
CREATE TYPE "History"."EventType" AS
 ENUM ('add','delete');
-- ddl-end --
ALTER TYPE "History"."EventType" OWNER TO "asmAdmin";
-- ddl-end --

-- object: asm."CenterLine" | type: TABLE --
-- DROP TABLE IF EXISTS asm."CenterLine" CASCADE;
CREATE TABLE asm."CenterLine"(
	gid serial NOT NULL,
	geom geometry(LINESTRINGZ, 3879),
	"gid_InfraPart" integer,
	CONSTRAINT "CenterLine_pk" PRIMARY KEY (gid)

);
-- ddl-end --
ALTER TABLE asm."CenterLine" OWNER TO "asmAdmin";
-- ddl-end --

-- object: asm."Route" | type: TABLE --
-- DROP TABLE IF EXISTS asm."Route" CASCADE;
CREATE TABLE asm."Route"(
	id serial NOT NULL,
	name varchar,
	description varchar,
	type asm."RouteType",
	CONSTRAINT "Route_pk" PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE asm."Route" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "History"."HistoryEvent" | type: TABLE --
-- DROP TABLE IF EXISTS "History"."HistoryEvent" CASCADE;
CREATE TABLE "History"."HistoryEvent"(
	id serial NOT NULL,
	"TableName" varchar,
	"eventType" "History"."EventType",
	"userName" varchar,
	date date,
	description varchar,
	"sqlQuery" varchar,
	CONSTRAINT "HistoryEvent_pk" PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN "History"."HistoryEvent"."TableName" IS 'Table that has a row added or deleted';
-- ddl-end --
COMMENT ON COLUMN "History"."HistoryEvent"."userName" IS 'Name of the user who did the change';
-- ddl-end --
ALTER TABLE "History"."HistoryEvent" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "InfraPart_fk" | type: CONSTRAINT --
-- ALTER TABLE asm."CenterLine" DROP CONSTRAINT IF EXISTS "InfraPart_fk" CASCADE;
ALTER TABLE asm."CenterLine" ADD CONSTRAINT "InfraPart_fk" FOREIGN KEY ("gid_InfraPart")
REFERENCES asm."InfraPart" (gid) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "CenterLine_uq" | type: CONSTRAINT --
-- ALTER TABLE asm."CenterLine" DROP CONSTRAINT IF EXISTS "CenterLine_uq" CASCADE;
ALTER TABLE asm."CenterLine" ADD CONSTRAINT "CenterLine_uq" UNIQUE ("gid_InfraPart");
-- ddl-end --

-- object: "Maintenance"."MaintenanceWork" | type: TABLE --
-- DROP TABLE IF EXISTS "Maintenance"."MaintenanceWork" CASCADE;
CREATE TABLE "Maintenance"."MaintenanceWork"(
	id serial NOT NULL,
	type varchar,
	description varchar,
	unit varchar,
	price double precision,
	"validFrom" date,
	"validTo" date,
	CONSTRAINT "MaintenanceWork_pk" PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN "Maintenance"."MaintenanceWork"."validFrom" IS 'The time when the phenomenon started to exist in the real world.';
-- ddl-end --
COMMENT ON COLUMN "Maintenance"."MaintenanceWork"."validTo" IS 'The time from which the phenomenon no longer exists in the real world.';
-- ddl-end --
ALTER TABLE "Maintenance"."MaintenanceWork" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "Actors"."Maintainer" | type: TABLE --
-- DROP TABLE IF EXISTS "Actors"."Maintainer" CASCADE;
CREATE TABLE "Actors"."Maintainer"(
	id serial NOT NULL,
-- 	name varchar,
-- 	"VATCode" varchar,
-- 	code smallint,
	CONSTRAINT "Maintainer_pk" PRIMARY KEY (id)

) INHERITS("Actors"."Actor")
;
-- ddl-end --
ALTER TABLE "Actors"."Maintainer" OWNER TO "asmAdmin";
-- ddl-end --

-- object: asm."Vegetation" | type: TABLE --
-- DROP TABLE IF EXISTS asm."Vegetation" CASCADE;
CREATE TABLE asm."Vegetation"(
	gid serial,
	"vegetationCode" numeric(5),
	"gid_Asset" integer

);
-- ddl-end --
ALTER TABLE asm."Vegetation" OWNER TO "asmAdmin";
-- ddl-end --

-- object: asm."Crossing" | type: TABLE --
-- DROP TABLE IF EXISTS asm."Crossing" CASCADE;
CREATE TABLE asm."Crossing"(
	gid serial NOT NULL,
	"trafficLightsType" smallint,
	"gid_Asset" integer,
	CONSTRAINT "Crossing_pk" PRIMARY KEY (gid)

);
-- ddl-end --
ALTER TABLE asm."Crossing" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "UseType_fk" | type: CONSTRAINT --
-- ALTER TABLE asm."InfraPart" DROP CONSTRAINT IF EXISTS "UseType_fk" CASCADE;
ALTER TABLE asm."InfraPart" ADD CONSTRAINT "UseType_fk" FOREIGN KEY ("code_UseType")
REFERENCES asm."UseType" (code) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "InfraPart_uq" | type: CONSTRAINT --
-- ALTER TABLE asm."InfraPart" DROP CONSTRAINT IF EXISTS "InfraPart_uq" CASCADE;
ALTER TABLE asm."InfraPart" ADD CONSTRAINT "InfraPart_uq" UNIQUE ("code_UseType");
-- ddl-end --

-- object: "Maintainer_fk" | type: CONSTRAINT --
-- ALTER TABLE "Maintenance"."MaintenanceRegion" DROP CONSTRAINT IF EXISTS "Maintainer_fk" CASCADE;
ALTER TABLE "Maintenance"."MaintenanceRegion" ADD CONSTRAINT "Maintainer_fk" FOREIGN KEY ("id_Maintainer")
REFERENCES "Actors"."Maintainer" (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Management"."Contract" | type: TABLE --
-- DROP TABLE IF EXISTS "Management"."Contract" CASCADE;
CREATE TABLE "Management"."Contract"(
	id serial NOT NULL,
	"orderDate" date,
	"journalNumber" numeric(35),
	"planNumber" integer,
	"validFrom" date,
	"validTo" date,
	"id_Orderer" integer,
	"id_Payer" integer,
	CONSTRAINT "Contract_pk" PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN "Management"."Contract"."validFrom" IS 'The time when the phenomenon started to exist in the real world.';
-- ddl-end --
COMMENT ON COLUMN "Management"."Contract"."validTo" IS 'The time from which the phenomenon no longer exists in the real world.';
-- ddl-end --
ALTER TABLE "Management"."Contract" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "Actors"."Possessor" | type: TABLE --
-- DROP TABLE IF EXISTS "Actors"."Possessor" CASCADE;
CREATE TABLE "Actors"."Possessor"(
	id serial NOT NULL,
-- 	name varchar,
-- 	"VATCode" varchar,
-- 	code smallint,
	CONSTRAINT "Possessor_pk" PRIMARY KEY (id)

) INHERITS("Actors"."Actor")
;
-- ddl-end --
ALTER TABLE "Actors"."Possessor" OWNER TO "asmAdmin";
-- ddl-end --

-- object: asm."TrafficCalming" | type: TABLE --
-- DROP TABLE IF EXISTS asm."TrafficCalming" CASCADE;
CREATE TABLE asm."TrafficCalming"(
	gid serial NOT NULL,
	type smallint,
	"gid_Asset" integer,
	CONSTRAINT "TrafficCalming_pk" PRIMARY KEY (gid)

);
-- ddl-end --
ALTER TABLE asm."TrafficCalming" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "Media"."Media" | type: TABLE --
-- DROP TABLE IF EXISTS "Media"."Media" CASCADE;
CREATE TABLE "Media"."Media"(
	id serial NOT NULL,
	"URL" varchar,
	"URI" varchar,
	geom geometry(POINTZ, 3879),
	"mapillaryPhotoKey" varchar,
	description varchar,
	"MIMEType" varchar,
	CONSTRAINT "Photo_id" PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE "Media"."Media" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "Maintenance"."MaintenanceContract" | type: TABLE --
-- DROP TABLE IF EXISTS "Maintenance"."MaintenanceContract" CASCADE;
CREATE TABLE "Maintenance"."MaintenanceContract"(
	"gid_Asset" integer,
	"id_MaintenanceWork" integer
-- 	id integer NOT NULL,
-- 	"orderDate" date,
-- 	"journalNumber" numeric(35),
-- 	"planNumber" integer,
-- 	"validFrom" date,
-- 	"validTo" date,
-- 	"id_Orderer" integer,
-- 	"id_Payer" integer,

) INHERITS("Management"."Contract")
;
-- ddl-end --
ALTER TABLE "Maintenance"."MaintenanceContract" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "Maintenance"."MaintenanceRegionAssetLink" | type: TABLE --
-- DROP TABLE IF EXISTS "Maintenance"."MaintenanceRegionAssetLink" CASCADE;
CREATE TABLE "Maintenance"."MaintenanceRegionAssetLink"(
	id serial NOT NULL,
	"gid_MaintenanceRegion" integer,
	"gid_Asset" integer,
	CONSTRAINT "MaintenanceRegionAssetLink_pk" PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE "Maintenance"."MaintenanceRegionAssetLink" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "MaintenanceRegion_fk" | type: CONSTRAINT --
-- ALTER TABLE "Maintenance"."MaintenanceRegionAssetLink" DROP CONSTRAINT IF EXISTS "MaintenanceRegion_fk" CASCADE;
ALTER TABLE "Maintenance"."MaintenanceRegionAssetLink" ADD CONSTRAINT "MaintenanceRegion_fk" FOREIGN KEY ("gid_MaintenanceRegion")
REFERENCES "Maintenance"."MaintenanceRegion" (gid) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "MaintenanceRegionAssetLink_uq" | type: CONSTRAINT --
-- ALTER TABLE "Maintenance"."MaintenanceRegionAssetLink" DROP CONSTRAINT IF EXISTS "MaintenanceRegionAssetLink_uq" CASCADE;
ALTER TABLE "Maintenance"."MaintenanceRegionAssetLink" ADD CONSTRAINT "MaintenanceRegionAssetLink_uq" UNIQUE ("gid_MaintenanceRegion");
-- ddl-end --

-- object: asm."AssetRouteLink" | type: TABLE --
-- DROP TABLE IF EXISTS asm."AssetRouteLink" CASCADE;
CREATE TABLE asm."AssetRouteLink"(
	id serial NOT NULL,
	"id_Route" integer,
	"gid_Asset" integer,
	CONSTRAINT "AssetRouteLink_pk" PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE asm."AssetRouteLink" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "Route_fk" | type: CONSTRAINT --
-- ALTER TABLE asm."AssetRouteLink" DROP CONSTRAINT IF EXISTS "Route_fk" CASCADE;
ALTER TABLE asm."AssetRouteLink" ADD CONSTRAINT "Route_fk" FOREIGN KEY ("id_Route")
REFERENCES asm."Route" (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "AssetRouteLink_uq" | type: CONSTRAINT --
-- ALTER TABLE asm."AssetRouteLink" DROP CONSTRAINT IF EXISTS "AssetRouteLink_uq" CASCADE;
ALTER TABLE asm."AssetRouteLink" ADD CONSTRAINT "AssetRouteLink_uq" UNIQUE ("id_Route");
-- ddl-end --

-- object: asm."TrashEquipment" | type: TABLE --
-- DROP TABLE IF EXISTS asm."TrashEquipment" CASCADE;
CREATE TABLE asm."TrashEquipment"(
	gid serial NOT NULL,
	type smallint,
	model varchar,
	brand varchar,
	"gid_Asset" integer,
	CONSTRAINT "TrashEquipment_pk" PRIMARY KEY (gid)

);
-- ddl-end --
ALTER TABLE asm."TrashEquipment" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "Media"."AssetPhotoLink" | type: TABLE --
-- DROP TABLE IF EXISTS "Media"."AssetPhotoLink" CASCADE;
CREATE TABLE "Media"."AssetPhotoLink"(
	id serial NOT NULL,
	"id_Media" integer,
	"gid_Asset" integer,
	CONSTRAINT "AssetPhotoLink_pk" PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE "Media"."AssetPhotoLink" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "Media_fk" | type: CONSTRAINT --
-- ALTER TABLE "Media"."AssetPhotoLink" DROP CONSTRAINT IF EXISTS "Media_fk" CASCADE;
ALTER TABLE "Media"."AssetPhotoLink" ADD CONSTRAINT "Media_fk" FOREIGN KEY ("id_Media")
REFERENCES "Media"."Media" (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "AssetPhotoLink_uq" | type: CONSTRAINT --
-- ALTER TABLE "Media"."AssetPhotoLink" DROP CONSTRAINT IF EXISTS "AssetPhotoLink_uq" CASCADE;
ALTER TABLE "Media"."AssetPhotoLink" ADD CONSTRAINT "AssetPhotoLink_uq" UNIQUE ("id_Media");
-- ddl-end --

-- object: asm."UrbanRunoffEquipment" | type: TABLE --
-- DROP TABLE IF EXISTS asm."UrbanRunoffEquipment" CASCADE;
CREATE TABLE asm."UrbanRunoffEquipment"(
	id serial NOT NULL,
	type smallint,
	"flowDirection" smallint,
	geom geometry(MULTILINESTRINGZ),
	diameter smallint,
	material varchar,
	pool bool,
	geom2 geometry(MULTIPOLYGON),
	"gid_Asset" integer,
	CONSTRAINT "UrbanRunoffEqupiment_pk" PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN asm."UrbanRunoffEquipment".type IS 'drum, pipe, ditch (rumpu,putki,avo-oja)';
-- ddl-end --
COMMENT ON COLUMN asm."UrbanRunoffEquipment"."flowDirection" IS 'virtaussuunta';
-- ddl-end --
COMMENT ON COLUMN asm."UrbanRunoffEquipment".diameter IS 'halkaisija';
-- ddl-end --
COMMENT ON COLUMN asm."UrbanRunoffEquipment".pool IS 'allas';
-- ddl-end --
ALTER TABLE asm."UrbanRunoffEquipment" OWNER TO "asmAdmin";
-- ddl-end --

-- object: asm.johdot | type: TABLE --
-- DROP TABLE IF EXISTS asm.johdot CASCADE;
CREATE TABLE asm.johdot(

);
-- ddl-end --
ALTER TABLE asm.johdot OWNER TO "asmAdmin";
-- ddl-end --

-- object: asm."TrafficSign" | type: TABLE --
-- DROP TABLE IF EXISTS asm."TrafficSign" CASCADE;
CREATE TABLE asm."TrafficSign"(
	fid_ smallint NOT NULL,
	x double precision,
	y double precision,
	z double precision,
	stdx double precision,
	stdy double precision,
	stdz double precision,
	signtype smallint,
	signtext varchar,
	signdrager varchar,
	date_recor date,
	geometry_d smallint,
	"gid_Asset" integer,
	CONSTRAINT "TrafficSign_pk" PRIMARY KEY (fid_)

);
-- ddl-end --
COMMENT ON COLUMN asm."TrafficSign".signtype IS 'See http://www.liikennevirasto.fi/tieverkko/liikennemerkit#.WUEriR9Nzc-';
-- ddl-end --
COMMENT ON COLUMN asm."TrafficSign".signdrager IS 'Attachment type of the sign';
-- ddl-end --
COMMENT ON COLUMN asm."TrafficSign".geometry_d IS 'Viewing angle';
-- ddl-end --
ALTER TABLE asm."TrafficSign" OWNER TO "asmAdmin";
-- ddl-end --

-- object: asm.condition | type: TYPE --
-- DROP TYPE IF EXISTS asm.condition CASCADE;
CREATE TYPE asm.condition AS
 ENUM ('excellent','good','mediocre','poor');
-- ddl-end --
ALTER TYPE asm.condition OWNER TO "asmAdmin";
-- ddl-end --

-- object: "Actors"."Owner" | type: TABLE --
-- DROP TABLE IF EXISTS "Actors"."Owner" CASCADE;
CREATE TABLE "Actors"."Owner"(
	id serial NOT NULL,
-- 	name varchar,
-- 	"VATCode" varchar,
-- 	code smallint,
	CONSTRAINT "Owner_pk" PRIMARY KEY (id)

) INHERITS("Actors"."Actor")
;
-- ddl-end --
ALTER TABLE "Actors"."Owner" OWNER TO "asmAdmin";
-- ddl-end --

-- object: asm."Asset" | type: TABLE --
-- DROP TABLE IF EXISTS asm."Asset" CASCADE;
CREATE TABLE asm."Asset"(
	gid serial NOT NULL,
	name varchar,
	geom_poly geometry(MULTIPOLYGONZ, 3879),
	geom_line geometry(MULTILINESTRINGZM, 3879),
	geom_point geometry(MULTIPOINTZM, 3879),
	landuse varchar,
	address varchar,
	"validFrom" date,
	"validTo" date,
	"winterMaintenance" bool,
	"addressNumber" varchar,
	status asm."assetStatus",
	note varchar,
	"additionalInfo" varchar,
	"partClass" smallint,
	"planNumber" smallint,
	condition asm.condition,
	"code_SimplifiedCode" char(5),
	"code_InfraCode2017" char(5),
	"id_Owner" integer,
	"id_Possessor" integer,
	"id_MaintenanceClass" integer,
	CONSTRAINT "AssetArea_pk" PRIMARY KEY (gid)

);
-- ddl-end --
COMMENT ON COLUMN asm."Asset".address IS 'Street name, for parks entrance address';
-- ddl-end --
COMMENT ON COLUMN asm."Asset"."validFrom" IS 'The time when the phenomenon started to exist in the real world.';
-- ddl-end --
COMMENT ON COLUMN asm."Asset"."validTo" IS 'The time from which the phenomenon no longer exists in the real world.';
-- ddl-end --
COMMENT ON COLUMN asm."Asset"."addressNumber" IS 'Street house number';
-- ddl-end --
ALTER TABLE asm."Asset" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "Asset_fk" | type: CONSTRAINT --
-- ALTER TABLE asm."RoadLayer" DROP CONSTRAINT IF EXISTS "Asset_fk" CASCADE;
ALTER TABLE asm."RoadLayer" ADD CONSTRAINT "Asset_fk" FOREIGN KEY ("gid_Asset")
REFERENCES asm."Asset" (gid) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "RoadLayer_uq" | type: CONSTRAINT --
-- ALTER TABLE asm."RoadLayer" DROP CONSTRAINT IF EXISTS "RoadLayer_uq" CASCADE;
ALTER TABLE asm."RoadLayer" ADD CONSTRAINT "RoadLayer_uq" UNIQUE ("gid_Asset");
-- ddl-end --

-- object: "Asset_fk" | type: CONSTRAINT --
-- ALTER TABLE asm."TrashEquipment" DROP CONSTRAINT IF EXISTS "Asset_fk" CASCADE;
ALTER TABLE asm."TrashEquipment" ADD CONSTRAINT "Asset_fk" FOREIGN KEY ("gid_Asset")
REFERENCES asm."Asset" (gid) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "TrashEquipment_uq" | type: CONSTRAINT --
-- ALTER TABLE asm."TrashEquipment" DROP CONSTRAINT IF EXISTS "TrashEquipment_uq" CASCADE;
ALTER TABLE asm."TrashEquipment" ADD CONSTRAINT "TrashEquipment_uq" UNIQUE ("gid_Asset");
-- ddl-end --

-- object: "Asset_fk" | type: CONSTRAINT --
-- ALTER TABLE asm."Crossing" DROP CONSTRAINT IF EXISTS "Asset_fk" CASCADE;
ALTER TABLE asm."Crossing" ADD CONSTRAINT "Asset_fk" FOREIGN KEY ("gid_Asset")
REFERENCES asm."Asset" (gid) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Crossing_uq" | type: CONSTRAINT --
-- ALTER TABLE asm."Crossing" DROP CONSTRAINT IF EXISTS "Crossing_uq" CASCADE;
ALTER TABLE asm."Crossing" ADD CONSTRAINT "Crossing_uq" UNIQUE ("gid_Asset");
-- ddl-end --

-- object: "Asset_fk" | type: CONSTRAINT --
-- ALTER TABLE "Media"."AssetPhotoLink" DROP CONSTRAINT IF EXISTS "Asset_fk" CASCADE;
ALTER TABLE "Media"."AssetPhotoLink" ADD CONSTRAINT "Asset_fk" FOREIGN KEY ("gid_Asset")
REFERENCES asm."Asset" (gid) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "AssetPhotoLink_uq1" | type: CONSTRAINT --
-- ALTER TABLE "Media"."AssetPhotoLink" DROP CONSTRAINT IF EXISTS "AssetPhotoLink_uq1" CASCADE;
ALTER TABLE "Media"."AssetPhotoLink" ADD CONSTRAINT "AssetPhotoLink_uq1" UNIQUE ("gid_Asset");
-- ddl-end --

-- object: "Asset_fk" | type: CONSTRAINT --
-- ALTER TABLE asm."TrafficCalming" DROP CONSTRAINT IF EXISTS "Asset_fk" CASCADE;
ALTER TABLE asm."TrafficCalming" ADD CONSTRAINT "Asset_fk" FOREIGN KEY ("gid_Asset")
REFERENCES asm."Asset" (gid) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "TrafficCalming_uq" | type: CONSTRAINT --
-- ALTER TABLE asm."TrafficCalming" DROP CONSTRAINT IF EXISTS "TrafficCalming_uq" CASCADE;
ALTER TABLE asm."TrafficCalming" ADD CONSTRAINT "TrafficCalming_uq" UNIQUE ("gid_Asset");
-- ddl-end --

-- object: "Asset_fk" | type: CONSTRAINT --
-- ALTER TABLE asm."Vegetation" DROP CONSTRAINT IF EXISTS "Asset_fk" CASCADE;
ALTER TABLE asm."Vegetation" ADD CONSTRAINT "Asset_fk" FOREIGN KEY ("gid_Asset")
REFERENCES asm."Asset" (gid) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Vegetation_uq" | type: CONSTRAINT --
-- ALTER TABLE asm."Vegetation" DROP CONSTRAINT IF EXISTS "Vegetation_uq" CASCADE;
ALTER TABLE asm."Vegetation" ADD CONSTRAINT "Vegetation_uq" UNIQUE ("gid_Asset");
-- ddl-end --

-- object: "SimplifiedCode_fk" | type: CONSTRAINT --
-- ALTER TABLE asm."Asset" DROP CONSTRAINT IF EXISTS "SimplifiedCode_fk" CASCADE;
ALTER TABLE asm."Asset" ADD CONSTRAINT "SimplifiedCode_fk" FOREIGN KEY ("code_SimplifiedCode")
REFERENCES asm."SimplifiedCode" (code) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Asset_uq" | type: CONSTRAINT --
-- ALTER TABLE asm."Asset" DROP CONSTRAINT IF EXISTS "Asset_uq" CASCADE;
ALTER TABLE asm."Asset" ADD CONSTRAINT "Asset_uq" UNIQUE ("code_SimplifiedCode");
-- ddl-end --

-- object: "Asset_fk" | type: CONSTRAINT --
-- ALTER TABLE asm."Equipment" DROP CONSTRAINT IF EXISTS "Asset_fk" CASCADE;
ALTER TABLE asm."Equipment" ADD CONSTRAINT "Asset_fk" FOREIGN KEY ("gid_Asset")
REFERENCES asm."Asset" (gid) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Equipment_uq" | type: CONSTRAINT --
-- ALTER TABLE asm."Equipment" DROP CONSTRAINT IF EXISTS "Equipment_uq" CASCADE;
ALTER TABLE asm."Equipment" ADD CONSTRAINT "Equipment_uq" UNIQUE ("gid_Asset");
-- ddl-end --

-- object: "Asset_fk" | type: CONSTRAINT --
-- ALTER TABLE asm."InfraPart" DROP CONSTRAINT IF EXISTS "Asset_fk" CASCADE;
ALTER TABLE asm."InfraPart" ADD CONSTRAINT "Asset_fk" FOREIGN KEY ("gid_Asset")
REFERENCES asm."Asset" (gid) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "InfraPart_uq1" | type: CONSTRAINT --
-- ALTER TABLE asm."InfraPart" DROP CONSTRAINT IF EXISTS "InfraPart_uq1" CASCADE;
ALTER TABLE asm."InfraPart" ADD CONSTRAINT "InfraPart_uq1" UNIQUE ("gid_Asset");
-- ddl-end --

-- object: "Asset_fk" | type: CONSTRAINT --
-- ALTER TABLE asm."RoadSurfaceMarking" DROP CONSTRAINT IF EXISTS "Asset_fk" CASCADE;
ALTER TABLE asm."RoadSurfaceMarking" ADD CONSTRAINT "Asset_fk" FOREIGN KEY ("gid_Asset")
REFERENCES asm."Asset" (gid) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "RoadSurfaceMarking_uq" | type: CONSTRAINT --
-- ALTER TABLE asm."RoadSurfaceMarking" DROP CONSTRAINT IF EXISTS "RoadSurfaceMarking_uq" CASCADE;
ALTER TABLE asm."RoadSurfaceMarking" ADD CONSTRAINT "RoadSurfaceMarking_uq" UNIQUE ("gid_Asset");
-- ddl-end --

-- object: "InfraCode2017_fk" | type: CONSTRAINT --
-- ALTER TABLE asm."Asset" DROP CONSTRAINT IF EXISTS "InfraCode2017_fk" CASCADE;
ALTER TABLE asm."Asset" ADD CONSTRAINT "InfraCode2017_fk" FOREIGN KEY ("code_InfraCode2017")
REFERENCES asm."InfraCode2017" (code) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Asset_uq1" | type: CONSTRAINT --
-- ALTER TABLE asm."Asset" DROP CONSTRAINT IF EXISTS "Asset_uq1" CASCADE;
ALTER TABLE asm."Asset" ADD CONSTRAINT "Asset_uq1" UNIQUE ("code_InfraCode2017");
-- ddl-end --

-- object: "Asset_fk" | type: CONSTRAINT --
-- ALTER TABLE "Maintenance"."MaintenanceRegionAssetLink" DROP CONSTRAINT IF EXISTS "Asset_fk" CASCADE;
ALTER TABLE "Maintenance"."MaintenanceRegionAssetLink" ADD CONSTRAINT "Asset_fk" FOREIGN KEY ("gid_Asset")
REFERENCES asm."Asset" (gid) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "MaintenanceRegionAssetLink_uq1" | type: CONSTRAINT --
-- ALTER TABLE "Maintenance"."MaintenanceRegionAssetLink" DROP CONSTRAINT IF EXISTS "MaintenanceRegionAssetLink_uq1" CASCADE;
ALTER TABLE "Maintenance"."MaintenanceRegionAssetLink" ADD CONSTRAINT "MaintenanceRegionAssetLink_uq1" UNIQUE ("gid_Asset");
-- ddl-end --

-- object: "Asset_fk" | type: CONSTRAINT --
-- ALTER TABLE "Maintenance"."MaintenanceContract" DROP CONSTRAINT IF EXISTS "Asset_fk" CASCADE;
ALTER TABLE "Maintenance"."MaintenanceContract" ADD CONSTRAINT "Asset_fk" FOREIGN KEY ("gid_Asset")
REFERENCES asm."Asset" (gid) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "MaintenanceContract_uq" | type: CONSTRAINT --
-- ALTER TABLE "Maintenance"."MaintenanceContract" DROP CONSTRAINT IF EXISTS "MaintenanceContract_uq" CASCADE;
ALTER TABLE "Maintenance"."MaintenanceContract" ADD CONSTRAINT "MaintenanceContract_uq" UNIQUE ("gid_Asset");
-- ddl-end --

-- object: "Management"."RequestForTender" | type: TABLE --
-- DROP TABLE IF EXISTS "Management"."RequestForTender" CASCADE;
CREATE TABLE "Management"."RequestForTender"(
	id serial NOT NULL,
	"validFrom" date,
	"validTo" date,
	"id_Orderer" integer,
	CONSTRAINT "RequestForTender_pk" PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE "Management"."RequestForTender" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "Management"."TenderProposal" | type: TABLE --
-- DROP TABLE IF EXISTS "Management"."TenderProposal" CASCADE;
CREATE TABLE "Management"."TenderProposal"(
	id serial NOT NULL,
	"validFrom" date,
	"validTo" date,
	"id_RequestForTender" integer,
	CONSTRAINT "TenderProposal_pk" PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE "Management"."TenderProposal" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "Actors"."Orderer" | type: TABLE --
-- DROP TABLE IF EXISTS "Actors"."Orderer" CASCADE;
CREATE TABLE "Actors"."Orderer"(
	id serial NOT NULL,
-- 	name varchar,
-- 	"VATCode" varchar,
-- 	code smallint,
	CONSTRAINT "Orderer_pk" PRIMARY KEY (id)

) INHERITS("Actors"."Actor")
;
-- ddl-end --
ALTER TABLE "Actors"."Orderer" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "Asset_fk" | type: CONSTRAINT --
-- ALTER TABLE asm."AssetRouteLink" DROP CONSTRAINT IF EXISTS "Asset_fk" CASCADE;
ALTER TABLE asm."AssetRouteLink" ADD CONSTRAINT "Asset_fk" FOREIGN KEY ("gid_Asset")
REFERENCES asm."Asset" (gid) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "AssetRouteLink_uq1" | type: CONSTRAINT --
-- ALTER TABLE asm."AssetRouteLink" DROP CONSTRAINT IF EXISTS "AssetRouteLink_uq1" CASCADE;
ALTER TABLE asm."AssetRouteLink" ADD CONSTRAINT "AssetRouteLink_uq1" UNIQUE ("gid_Asset");
-- ddl-end --

-- object: "MaintenanceWork_fk" | type: CONSTRAINT --
-- ALTER TABLE "Maintenance"."MaintenanceContract" DROP CONSTRAINT IF EXISTS "MaintenanceWork_fk" CASCADE;
ALTER TABLE "Maintenance"."MaintenanceContract" ADD CONSTRAINT "MaintenanceWork_fk" FOREIGN KEY ("id_MaintenanceWork")
REFERENCES "Maintenance"."MaintenanceWork" (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "MaintenanceContract_uq1" | type: CONSTRAINT --
-- ALTER TABLE "Maintenance"."MaintenanceContract" DROP CONSTRAINT IF EXISTS "MaintenanceContract_uq1" CASCADE;
ALTER TABLE "Maintenance"."MaintenanceContract" ADD CONSTRAINT "MaintenanceContract_uq1" UNIQUE ("id_MaintenanceWork");
-- ddl-end --

-- object: "Asset_fk" | type: CONSTRAINT --
-- ALTER TABLE asm."TrafficSign" DROP CONSTRAINT IF EXISTS "Asset_fk" CASCADE;
ALTER TABLE asm."TrafficSign" ADD CONSTRAINT "Asset_fk" FOREIGN KEY ("gid_Asset")
REFERENCES asm."Asset" (gid) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "TrafficSign_uq" | type: CONSTRAINT --
-- ALTER TABLE asm."TrafficSign" DROP CONSTRAINT IF EXISTS "TrafficSign_uq" CASCADE;
ALTER TABLE asm."TrafficSign" ADD CONSTRAINT "TrafficSign_uq" UNIQUE ("gid_Asset");
-- ddl-end --

-- object: "Asset_fk" | type: CONSTRAINT --
-- ALTER TABLE asm."UrbanRunoffEquipment" DROP CONSTRAINT IF EXISTS "Asset_fk" CASCADE;
ALTER TABLE asm."UrbanRunoffEquipment" ADD CONSTRAINT "Asset_fk" FOREIGN KEY ("gid_Asset")
REFERENCES asm."Asset" (gid) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "UrbanRunoffEquipment_uq" | type: CONSTRAINT --
-- ALTER TABLE asm."UrbanRunoffEquipment" DROP CONSTRAINT IF EXISTS "UrbanRunoffEquipment_uq" CASCADE;
ALTER TABLE asm."UrbanRunoffEquipment" ADD CONSTRAINT "UrbanRunoffEquipment_uq" UNIQUE ("gid_Asset");
-- ddl-end --

-- object: "Actors"."Payer" | type: TABLE --
-- DROP TABLE IF EXISTS "Actors"."Payer" CASCADE;
CREATE TABLE "Actors"."Payer"(
	id serial NOT NULL,
-- 	name varchar,
-- 	"VATCode" varchar,
-- 	code smallint,
	CONSTRAINT "Payer_pk" PRIMARY KEY (id)

) INHERITS("Actors"."Actor")
;
-- ddl-end --
ALTER TABLE "Actors"."Payer" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "Management"."Permission" | type: TABLE --
-- DROP TABLE IF EXISTS "Management"."Permission" CASCADE;
CREATE TABLE "Management"."Permission"(
	id serial NOT NULL,
	"validFrom" date,
	"validTo" date,
	"id_Owner" integer,
	CONSTRAINT "Permission_pk" PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE "Management"."Permission" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "RequestForTender_fk" | type: CONSTRAINT --
-- ALTER TABLE "Management"."TenderProposal" DROP CONSTRAINT IF EXISTS "RequestForTender_fk" CASCADE;
ALTER TABLE "Management"."TenderProposal" ADD CONSTRAINT "RequestForTender_fk" FOREIGN KEY ("id_RequestForTender")
REFERENCES "Management"."RequestForTender" (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "TenderProposal_uq" | type: CONSTRAINT --
-- ALTER TABLE "Management"."TenderProposal" DROP CONSTRAINT IF EXISTS "TenderProposal_uq" CASCADE;
ALTER TABLE "Management"."TenderProposal" ADD CONSTRAINT "TenderProposal_uq" UNIQUE ("id_RequestForTender");
-- ddl-end --

-- object: "Maintenance"."MaintenanceClass" | type: TABLE --
-- DROP TABLE IF EXISTS "Maintenance"."MaintenanceClass" CASCADE;
CREATE TABLE "Maintenance"."MaintenanceClass"(
	id serial NOT NULL,
	class smallint,
	description varchar,
	CONSTRAINT "MaintenanceClass_pk" PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE "Maintenance"."MaintenanceClass" OWNER TO "asmAdmin";
-- ddl-end --

-- -- object: "Reports"."InfraAreasGroupedByMaintenance" | type: MATERIALIZED VIEW --
-- -- DROP MATERIALIZED VIEW IF EXISTS "Reports"."InfraAreasGroupedByMaintenance" CASCADE;
-- CREATE MATERIALIZED VIEW "Reports"."InfraAreasGroupedByMaintenance"
-- AS 
-- 
-- SELECT
--    SUM(ST_Area(geom_poly)) AS area,
--    maintenanceclass.description
-- FROM
--    asm."Asset" AS asset,
--    "Maintenance"."MaintenanceClass" AS maintenanceclass
-- WHERE
--    asset."id_MaintenanceClass" = maintenanceclass.id
-- GROUP BY maintenanceclass.description;
-- -- ddl-end --
-- ALTER MATERIALIZED VIEW "Reports"."InfraAreasGroupedByMaintenance" OWNER TO "asmAdmin";
-- -- ddl-end --
-- 
-- object: "Owner_fk" | type: CONSTRAINT --
-- ALTER TABLE asm."Asset" DROP CONSTRAINT IF EXISTS "Owner_fk" CASCADE;
ALTER TABLE asm."Asset" ADD CONSTRAINT "Owner_fk" FOREIGN KEY ("id_Owner")
REFERENCES "Actors"."Owner" (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Asset_uq2" | type: CONSTRAINT --
-- ALTER TABLE asm."Asset" DROP CONSTRAINT IF EXISTS "Asset_uq2" CASCADE;
ALTER TABLE asm."Asset" ADD CONSTRAINT "Asset_uq2" UNIQUE ("id_Owner");
-- ddl-end --

-- object: "Possessor_fk" | type: CONSTRAINT --
-- ALTER TABLE asm."Asset" DROP CONSTRAINT IF EXISTS "Possessor_fk" CASCADE;
ALTER TABLE asm."Asset" ADD CONSTRAINT "Possessor_fk" FOREIGN KEY ("id_Possessor")
REFERENCES "Actors"."Possessor" (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Asset_uq3" | type: CONSTRAINT --
-- ALTER TABLE asm."Asset" DROP CONSTRAINT IF EXISTS "Asset_uq3" CASCADE;
ALTER TABLE asm."Asset" ADD CONSTRAINT "Asset_uq3" UNIQUE ("id_Possessor");
-- ddl-end --

-- -- object: "Reports"."HighWayAreasClassI" | type: MATERIALIZED VIEW --
-- -- DROP MATERIALIZED VIEW IF EXISTS "Reports"."HighWayAreasClassI" CASCADE;
-- CREATE MATERIALIZED VIEW "Reports"."HighWayAreasClassI"
-- AS 
-- 
-- SELECT
--    SUM(ST_Area(geom_poly)) AS area,
--    asm."UseType".code AS usetype,
--    asm."UseType".name AS usetypedescription,
--    "Maintenance"."MaintenanceRegion".name AS maintenanceregion
-- FROM
--    asm."Asset" AS asset,
--    "Maintenance"."MaintenanceRegion" AS region,
--    "Maintenance"."MaintenanceRegionAssetLink" AS link,
--    asm."UseType" AS usetype,
--    asm."InfraPart" AS infrapart,
--    "Maintenance"."MaintenanceClass" AS maintenanceclass,
--    "Actors"."Maintainer" AS maintainer,
--    "Actors"."Possessor" AS possessor
-- WHERE
--    asset."id_Possessor" = possessor.id
-- AND infrapart."gid_Asset" = asset.gid
-- AND infrapart."code_UseType" = usetype.code
-- AND link."gid_Asset" = asset.gid
-- AND link."gid_maintenanceRegion" = maintenanceregion.gid
-- AND asset."id_MaintenanceClass" = maintenancneclass.id
-- AND region."id_Maintainer" = maintainer.id
-- AND possessor.code = 1
-- AND maintainer.code IN (12,11,10,13,15,17,18,16)
-- AND infrapart."functionalClass" = 1
-- AND maintenanceclass.class IN (1,14)
-- GROUP BY maintenanceregion,usetype
-- ORDER BY maintenanceregion,usetype;
-- -- ddl-end --
-- ALTER MATERIALIZED VIEW "Reports"."HighWayAreasClassI" OWNER TO "asmAdmin";
-- -- ddl-end --
-- 
-- object: "MaintenanceClass_fk" | type: CONSTRAINT --
-- ALTER TABLE asm."Asset" DROP CONSTRAINT IF EXISTS "MaintenanceClass_fk" CASCADE;
ALTER TABLE asm."Asset" ADD CONSTRAINT "MaintenanceClass_fk" FOREIGN KEY ("id_MaintenanceClass")
REFERENCES "Maintenance"."MaintenanceClass" (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Asset_uq4" | type: CONSTRAINT --
-- ALTER TABLE asm."Asset" DROP CONSTRAINT IF EXISTS "Asset_uq4" CASCADE;
ALTER TABLE asm."Asset" ADD CONSTRAINT "Asset_uq4" UNIQUE ("id_MaintenanceClass");
-- ddl-end --

-- object: "Orderer_fk" | type: CONSTRAINT --
-- ALTER TABLE "Management"."RequestForTender" DROP CONSTRAINT IF EXISTS "Orderer_fk" CASCADE;
ALTER TABLE "Management"."RequestForTender" ADD CONSTRAINT "Orderer_fk" FOREIGN KEY ("id_Orderer")
REFERENCES "Actors"."Orderer" (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "RequestForTender_uq" | type: CONSTRAINT --
-- ALTER TABLE "Management"."RequestForTender" DROP CONSTRAINT IF EXISTS "RequestForTender_uq" CASCADE;
ALTER TABLE "Management"."RequestForTender" ADD CONSTRAINT "RequestForTender_uq" UNIQUE ("id_Orderer");
-- ddl-end --

-- object: "Owner_fk" | type: CONSTRAINT --
-- ALTER TABLE "Management"."Permission" DROP CONSTRAINT IF EXISTS "Owner_fk" CASCADE;
ALTER TABLE "Management"."Permission" ADD CONSTRAINT "Owner_fk" FOREIGN KEY ("id_Owner")
REFERENCES "Actors"."Owner" (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Permission_uq" | type: CONSTRAINT --
-- ALTER TABLE "Management"."Permission" DROP CONSTRAINT IF EXISTS "Permission_uq" CASCADE;
ALTER TABLE "Management"."Permission" ADD CONSTRAINT "Permission_uq" UNIQUE ("id_Owner");
-- ddl-end --

-- object: "Orderer_fk" | type: CONSTRAINT --
-- ALTER TABLE "Management"."Contract" DROP CONSTRAINT IF EXISTS "Orderer_fk" CASCADE;
ALTER TABLE "Management"."Contract" ADD CONSTRAINT "Orderer_fk" FOREIGN KEY ("id_Orderer")
REFERENCES "Actors"."Orderer" (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Contract_uq" | type: CONSTRAINT --
-- ALTER TABLE "Management"."Contract" DROP CONSTRAINT IF EXISTS "Contract_uq" CASCADE;
ALTER TABLE "Management"."Contract" ADD CONSTRAINT "Contract_uq" UNIQUE ("id_Orderer");
-- ddl-end --

-- object: "Payer_fk" | type: CONSTRAINT --
-- ALTER TABLE "Management"."Contract" DROP CONSTRAINT IF EXISTS "Payer_fk" CASCADE;
ALTER TABLE "Management"."Contract" ADD CONSTRAINT "Payer_fk" FOREIGN KEY ("id_Payer")
REFERENCES "Actors"."Payer" (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Contract_uq1" | type: CONSTRAINT --
-- ALTER TABLE "Management"."Contract" DROP CONSTRAINT IF EXISTS "Contract_uq1" CASCADE;
ALTER TABLE "Management"."Contract" ADD CONSTRAINT "Contract_uq1" UNIQUE ("id_Payer");
-- ddl-end --

-- object: grant_731a98d44b | type: PERMISSION --
GRANT CREATE,USAGE
   ON SCHEMA asm
   TO "asmUser";
-- ddl-end --

-- object: grant_53a4a835ac | type: PERMISSION --
GRANT CREATE,USAGE
   ON SCHEMA "Maintenance"
   TO "asmUser";
-- ddl-end --

-- object: grant_145aa95e34 | type: PERMISSION --
GRANT CREATE,USAGE
   ON SCHEMA "History"
   TO "asmUser";
-- ddl-end --

-- object: grant_270e71827c | type: PERMISSION --
GRANT CREATE,USAGE
   ON SCHEMA "Owners"
   TO "asmUser";
-- ddl-end --

-- object: grant_d1bf1b2149 | type: PERMISSION --
GRANT CREATE,USAGE
   ON SCHEMA "Possessors"
   TO "asmUser";
-- ddl-end --


-- Appended SQL commands --

GRANT SELECT,INSERT,UPDATE
   ON ALL TABLES IN SCHEMA asm
   TO "asmUser";

GRANT SELECT,INSERT,UPDATE
   ON ALL TABLES IN SCHEMA "Maintenance"
   TO "asmUser";

GRANT SELECT,INSERT,UPDATE
   ON ALL TABLES IN SCHEMA "History"
   TO "asmUser";


GRANT SELECT,INSERT,UPDATE
   ON ALL TABLES IN SCHEMA "Actors"
   TO "asmUser";

---
