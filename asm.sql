-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.8.2
-- PostgreSQL version: 9.5
-- Project Site: pgmodeler.com.br
-- Model Author: ---

-- object: "asmAdmin" | type: ROLE --
-- DROP ROLE IF EXISTS "asmAdmin";
CREATE ROLE "asmAdmin" WITH ;
-- ddl-end --

-- object: "asmUser" | type: ROLE --
-- DROP ROLE IF EXISTS "asmUser";
CREATE ROLE "asmUser" WITH ;
-- ddl-end --


-- Database creation must be done outside an multicommand file.
-- These commands were put in this file only for convenience.
-- -- object: "asm-2017-10-02" | type: DATABASE --
-- -- DROP DATABASE IF EXISTS "asm-2017-10-02";
-- CREATE DATABASE "asm-2017-10-02"
-- 	OWNER = "asmAdmin"
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

-- object: "Equipments" | type: SCHEMA --
-- DROP SCHEMA IF EXISTS "Equipments" CASCADE;
CREATE SCHEMA "Equipments";
-- ddl-end --
ALTER SCHEMA "Equipments" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "History" | type: SCHEMA --
-- DROP SCHEMA IF EXISTS "History" CASCADE;
CREATE SCHEMA "History";
-- ddl-end --
ALTER SCHEMA "History" OWNER TO "asmAdmin";
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

SET search_path TO pg_catalog,public,asm,"Maintenance","Actors","Equipments","History","Management","Media","Reports";
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

-- object: asm.equipmentgroup | type: TYPE --
-- DROP TYPE IF EXISTS asm.equipmentgroup CASCADE;
CREATE TYPE asm.equipmentgroup AS
 ENUM ('trash','play','sport','furniture','art','fixremove','trafficsign','guidance','markings');
-- ddl-end --
ALTER TYPE asm.equipmentgroup OWNER TO "asmAdmin";
-- ddl-end --

-- object: asm."SurfaceMaterial" | type: TYPE --
-- DROP TYPE IF EXISTS asm."SurfaceMaterial" CASCADE;
CREATE TYPE asm."SurfaceMaterial" AS
 ENUM ('A','AB');
-- ddl-end --
ALTER TYPE asm."SurfaceMaterial" OWNER TO "asmAdmin";
-- ddl-end --

-- object: asm.infraparttype | type: TYPE --
-- DROP TYPE IF EXISTS asm.infraparttype CASCADE;
CREATE TYPE asm.infraparttype AS
 ENUM ('trafficarea','greenspace','specialarea');
-- ddl-end --
ALTER TYPE asm.infraparttype OWNER TO "asmAdmin";
-- ddl-end --

-- object: asm.infra2017 | type: TYPE --
-- DROP TYPE IF EXISTS asm.infra2017 CASCADE;
CREATE TYPE asm.infra2017 AS
 ENUM ('L1.1');
-- ddl-end --
ALTER TYPE asm.infra2017 OWNER TO "asmAdmin";
-- ddl-end --

-- object: asm.simplifiedcodegroup | type: TYPE --
-- DROP TYPE IF EXISTS asm.simplifiedcodegroup CASCADE;
CREATE TYPE asm.simplifiedcodegroup AS
 ENUM ('trafficarea','greenarea','specialarea');
-- ddl-end --
ALTER TYPE asm.simplifiedcodegroup OWNER TO "asmAdmin";
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
 ENUM ('finished','underconstruction','planned','removed','repaired');
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
 ENUM ('add','change','delete');
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

-- object: asm."InfraPart" | type: TABLE --
-- DROP TABLE IF EXISTS asm."InfraPart" CASCADE;
CREATE TABLE asm."InfraPart"(
	gid serial NOT NULL,
	"speedLimit" smallint,
	type asm.infraparttype,
	"functionalClass" smallint,
	"roadClass" smallint,
	"gid_Asset" integer,
	"id_RoadMaintenanceDecision" integer,
	"code_UseType" char(5),
	CONSTRAINT "Surface_pk" PRIMARY KEY (gid)

);
-- ddl-end --
COMMENT ON COLUMN asm."InfraPart"."speedLimit" IS 'Speed limit for that road';
-- ddl-end --
ALTER TABLE asm."InfraPart" OWNER TO "asmAdmin";
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

-- object: asm.vegetationtype | type: TYPE --
-- DROP TYPE IF EXISTS asm.vegetationtype CASCADE;
CREATE TYPE asm.vegetationtype AS
 ENUM ('tree','weed','bush','flowers');
-- ddl-end --
ALTER TYPE asm.vegetationtype OWNER TO "asmAdmin";
-- ddl-end --

-- object: "Equipments".equipmentype | type: TYPE --
-- DROP TYPE IF EXISTS "Equipments".equipmentype CASCADE;
CREATE TYPE "Equipments".equipmentype AS
 ENUM ('billboard','digital','statue','graffiti','flagpole','sandbox','directionsign','fence','bank','wall','bench','slide','sandplay','playhouse','ballgame','bikestand','merrygoround','gym','balancing','christmastree');
-- ddl-end --
ALTER TYPE "Equipments".equipmentype OWNER TO "asmAdmin";
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

-- object: "Equipments"."Equipment" | type: TABLE --
-- DROP TABLE IF EXISTS "Equipments"."Equipment" CASCADE;
CREATE TABLE "Equipments"."Equipment"(
	gid serial NOT NULL,
	type "Equipments".equipmentype,
	model varchar,
	brand varchar,
	"equipmentGroup" asm.equipmentgroup,
	"installDate" date,
	installer "Actors"."Maintainer",
	material smallint,
	"gid_Asset" integer,
	"gid_InfraPart" integer,
	CONSTRAINT "Furniture_pk" PRIMARY KEY (gid)

);
-- ddl-end --
ALTER TABLE "Equipments"."Equipment" OWNER TO "asmAdmin";
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
	id serial NOT NULL,
	"gid_Asset" integer,
	"id_MaintenanceWork" integer,
-- 	"orderDate" date,
-- 	"journalNumber" numeric(35),
-- 	"planNumber" integer,
-- 	"validFrom" date,
-- 	"validTo" date,
-- 	"id_Orderer" integer,
-- 	"id_Payer" integer,
	CONSTRAINT "MaintenanceContract_pk" PRIMARY KEY (id)

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

-- object: "Equipments"."UrbanRunoffEquipment" | type: TABLE --
-- DROP TABLE IF EXISTS "Equipments"."UrbanRunoffEquipment" CASCADE;
CREATE TABLE "Equipments"."UrbanRunoffEquipment"(
	id serial NOT NULL,
	"flowDirection" smallint,
	pool bool,
-- 	gid integer NOT NULL,
-- 	type "Equipments".equipmentype,
-- 	model varchar,
-- 	brand varchar,
-- 	"equipmentGroup" asm.equipmentgroup,
-- 	"installDate" date,
-- 	installer "Actors"."Maintainer",
-- 	material smallint,
-- 	"gid_Asset" integer,
-- 	"gid_InfraPart" integer,
	CONSTRAINT "UrbanRunoffEqupiment_pk" PRIMARY KEY (id)

) INHERITS("Equipments"."Equipment")
;
-- ddl-end --
COMMENT ON COLUMN "Equipments"."UrbanRunoffEquipment"."flowDirection" IS 'virtaussuunta';
-- ddl-end --
COMMENT ON COLUMN "Equipments"."UrbanRunoffEquipment".pool IS 'allas';
-- ddl-end --
ALTER TABLE "Equipments"."UrbanRunoffEquipment" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "Equipments".mountingtype | type: TYPE --
-- DROP TYPE IF EXISTS "Equipments".mountingtype CASCADE;
CREATE TYPE "Equipments".mountingtype AS
 ENUM ('lightpole','pole','portal','trafficlight','wall','other');
-- ddl-end --
ALTER TYPE "Equipments".mountingtype OWNER TO "asmAdmin";
-- ddl-end --

-- object: "Equipments"."TrafficCalming" | type: TABLE --
-- DROP TABLE IF EXISTS "Equipments"."TrafficCalming" CASCADE;
CREATE TABLE "Equipments"."TrafficCalming"(
	gid serial NOT NULL,
-- 	type "Equipments".equipmentype,
-- 	model varchar,
-- 	brand varchar,
-- 	"equipmentGroup" asm.equipmentgroup,
-- 	"installDate" date,
-- 	installer "Actors"."Maintainer",
-- 	material smallint,
-- 	"gid_Asset" integer,
-- 	"gid_InfraPart" integer,
	CONSTRAINT "TrafficCalming_pk" PRIMARY KEY (gid)

) INHERITS("Equipments"."Equipment")
;
-- ddl-end --
ALTER TABLE "Equipments"."TrafficCalming" OWNER TO "asmAdmin";
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

-- object: asm.wintermaintenance | type: TYPE --
-- DROP TYPE IF EXISTS asm.wintermaintenance CASCADE;
CREATE TYPE asm.wintermaintenance AS
 ENUM ('nowintermaintenance','entirelyonwintermaintenance','partlyonwintermaintenance');
-- ddl-end --
ALTER TYPE asm.wintermaintenance OWNER TO "asmAdmin";
-- ddl-end --

-- object: asm."Asset" | type: TABLE --
-- DROP TABLE IF EXISTS asm."Asset" CASCADE;
CREATE TABLE asm."Asset"(
	gid serial NOT NULL,
	dataid smallint,
	name varchar,
	geom_poly geometry(MULTIPOLYGONZ, 3879),
	geom_line geometry(MULTILINESTRINGZM, 3879),
	geom_point geometry(MULTIPOINTZM, 3879),
	landuse varchar,
	address varchar,
	"validFrom" date,
	"validTo" date,
	"winterMaintenance" asm.wintermaintenance,
	"addressNumber" varchar,
	status asm."assetStatus",
	note varchar,
	"additionalInfo" varchar,
	"partClass" smallint,
	"planNumber" smallint,
	condition asm.condition,
	"code_InfraCode2017" char(5),
	"id_Owner" integer,
	"id_Possessor" integer,
	"id_MaintenanceCard" integer,
	"code_SimplifiedCode" char(5),
	CONSTRAINT "AssetArea_pk" PRIMARY KEY (gid)

);
-- ddl-end --
COMMENT ON COLUMN asm."Asset".dataid IS 'id that helps insert data when it is split into multiple tales';
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
-- ALTER TABLE "Media"."AssetPhotoLink" DROP CONSTRAINT IF EXISTS "Asset_fk" CASCADE;
ALTER TABLE "Media"."AssetPhotoLink" ADD CONSTRAINT "Asset_fk" FOREIGN KEY ("gid_Asset")
REFERENCES asm."Asset" (gid) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "AssetPhotoLink_uq1" | type: CONSTRAINT --
-- ALTER TABLE "Media"."AssetPhotoLink" DROP CONSTRAINT IF EXISTS "AssetPhotoLink_uq1" CASCADE;
ALTER TABLE "Media"."AssetPhotoLink" ADD CONSTRAINT "AssetPhotoLink_uq1" UNIQUE ("gid_Asset");
-- ddl-end --

-- object: asm."Vegetation" | type: TABLE --
-- DROP TABLE IF EXISTS asm."Vegetation" CASCADE;
CREATE TABLE asm."Vegetation"(
	gid serial,
	"vegetationType" asm.vegetationtype,
	"vegetationCode" numeric(5),
	"vegetationNumber" smallint,
	"gid_Asset" integer,
	CONSTRAINT vegetationnumber_uq UNIQUE ("vegetationNumber")

);
-- ddl-end --
COMMENT ON COLUMN asm."Vegetation"."vegetationNumber" IS 'For arborists';
-- ddl-end --
ALTER TABLE asm."Vegetation" OWNER TO "asmAdmin";
-- ddl-end --

-- object: asm."SimplifiedCode" | type: TABLE --
-- DROP TABLE IF EXISTS asm."SimplifiedCode" CASCADE;
CREATE TABLE asm."SimplifiedCode"(
	code char(5) NOT NULL,
	name varchar,
	"group" asm.simplifiedcodegroup,
	CONSTRAINT "SimplifiedCode_pk" PRIMARY KEY (code)

);
-- ddl-end --
COMMENT ON TABLE asm."SimplifiedCode" IS 'Simplified codes based on Infra codes';
-- ddl-end --
ALTER TABLE asm."SimplifiedCode" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "Equipments"."RoadSurfaceMarking" | type: TABLE --
-- DROP TABLE IF EXISTS "Equipments"."RoadSurfaceMarking" CASCADE;
CREATE TABLE "Equipments"."RoadSurfaceMarking"(
	gid serial NOT NULL,
	"roadMarkingCode" smallint,
-- 	type "Equipments".equipmentype,
-- 	model varchar,
-- 	brand varchar,
-- 	"equipmentGroup" asm.equipmentgroup,
-- 	"installDate" date,
-- 	installer "Actors"."Maintainer",
-- 	material smallint,
-- 	"gid_Asset" integer,
-- 	"gid_InfraPart" integer,
	CONSTRAINT "RoadSurfaceMarking_pk" PRIMARY KEY (gid)

) INHERITS("Equipments"."Equipment")
;
-- ddl-end --
COMMENT ON TABLE "Equipments"."RoadSurfaceMarking" IS 'Tiemerkinn�t - maalatut tienpinnassa';
-- ddl-end --
ALTER TABLE "Equipments"."RoadSurfaceMarking" OWNER TO "asmAdmin";
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

-- object: "InfraCode2017_fk" | type: CONSTRAINT --
-- ALTER TABLE asm."Asset" DROP CONSTRAINT IF EXISTS "InfraCode2017_fk" CASCADE;
ALTER TABLE asm."Asset" ADD CONSTRAINT "InfraCode2017_fk" FOREIGN KEY ("code_InfraCode2017")
REFERENCES asm."InfraCode2017" (code) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Asset_uq" | type: CONSTRAINT --
-- ALTER TABLE asm."Asset" DROP CONSTRAINT IF EXISTS "Asset_uq" CASCADE;
ALTER TABLE asm."Asset" ADD CONSTRAINT "Asset_uq" UNIQUE ("code_InfraCode2017");
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

-- object: "Maintenance"."MaintenanceCard" | type: TABLE --
-- DROP TABLE IF EXISTS "Maintenance"."MaintenanceCard" CASCADE;
CREATE TABLE "Maintenance"."MaintenanceCard"(
	id serial NOT NULL,
	class smallint,
	description varchar,
	CONSTRAINT "MaintenanceClass_pk" PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE "Maintenance"."MaintenanceCard" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "Reports"."InfraAreasGroupedByMaintenance" | type: MATERIALIZED VIEW --
-- DROP MATERIALIZED VIEW IF EXISTS "Reports"."InfraAreasGroupedByMaintenance" CASCADE;
CREATE MATERIALIZED VIEW "Reports"."InfraAreasGroupedByMaintenance"
AS 

SELECT
   SUM(ST_Area(geom_poly)) AS area,
   mcard.description
FROM
   asm."Asset" AS asset,
   "Maintenance"."MaintenanceCard" AS mcard
WHERE
   asset."id_MaintenanceCard" = mcard.id
GROUP BY mcard.description;
-- ddl-end --
ALTER MATERIALIZED VIEW "Reports"."InfraAreasGroupedByMaintenance" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "Owner_fk" | type: CONSTRAINT --
-- ALTER TABLE asm."Asset" DROP CONSTRAINT IF EXISTS "Owner_fk" CASCADE;
ALTER TABLE asm."Asset" ADD CONSTRAINT "Owner_fk" FOREIGN KEY ("id_Owner")
REFERENCES "Actors"."Owner" (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Asset_uq1" | type: CONSTRAINT --
-- ALTER TABLE asm."Asset" DROP CONSTRAINT IF EXISTS "Asset_uq1" CASCADE;
ALTER TABLE asm."Asset" ADD CONSTRAINT "Asset_uq1" UNIQUE ("id_Owner");
-- ddl-end --

-- object: "Possessor_fk" | type: CONSTRAINT --
-- ALTER TABLE asm."Asset" DROP CONSTRAINT IF EXISTS "Possessor_fk" CASCADE;
ALTER TABLE asm."Asset" ADD CONSTRAINT "Possessor_fk" FOREIGN KEY ("id_Possessor")
REFERENCES "Actors"."Possessor" (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Asset_uq2" | type: CONSTRAINT --
-- ALTER TABLE asm."Asset" DROP CONSTRAINT IF EXISTS "Asset_uq2" CASCADE;
ALTER TABLE asm."Asset" ADD CONSTRAINT "Asset_uq2" UNIQUE ("id_Possessor");
-- ddl-end --

-- object: "Reports"."HighWayAreasClassI" | type: MATERIALIZED VIEW --
-- DROP MATERIALIZED VIEW IF EXISTS "Reports"."HighWayAreasClassI" CASCADE;
CREATE MATERIALIZED VIEW "Reports"."HighWayAreasClassI"
AS 

SELECT
   SUM(ST_Area(geom_poly)) AS area,
   usetype.code,
usetype.name AS usetypedescription,
region.name AS maintenanceregion
FROM
   asm."Asset" AS asset,
   "Maintenance"."MaintenanceRegion" AS region,
   "Maintenance"."MaintenanceRegionAssetLink" AS link,
   asm."UseType" AS usetype,
   asm."InfraPart" AS infrapart,
   "Maintenance"."MaintenanceCard" AS mcard,
   "Actors"."Maintainer" AS maintainer,
   "Actors"."Possessor" AS possessor
WHERE
   asset."id_Possessor" = possessor.id
AND infrapart."gid_Asset" = asset.gid
AND infrapart."code_UseType" = usetype.code
AND link."gid_Asset" = asset.gid
AND link."gid_MaintenanceRegion" = region.gid
AND asset."id_MaintenanceCard" = mcard.id
AND region."id_Maintainer" = maintainer.id
AND possessor.code = 1
AND maintainer.code IN (12,11,10,13,15,17,18,16)
AND infrapart."functionalClass" = 1
AND mcard.class IN (1,14)
GROUP BY maintenanceregion,usetype.code
ORDER BY maintenanceregion,usetype.code;
-- ddl-end --
ALTER MATERIALIZED VIEW "Reports"."HighWayAreasClassI" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "MaintenanceCard_fk" | type: CONSTRAINT --
-- ALTER TABLE asm."Asset" DROP CONSTRAINT IF EXISTS "MaintenanceCard_fk" CASCADE;
ALTER TABLE asm."Asset" ADD CONSTRAINT "MaintenanceCard_fk" FOREIGN KEY ("id_MaintenanceCard")
REFERENCES "Maintenance"."MaintenanceCard" (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Asset_uq3" | type: CONSTRAINT --
-- ALTER TABLE asm."Asset" DROP CONSTRAINT IF EXISTS "Asset_uq3" CASCADE;
ALTER TABLE asm."Asset" ADD CONSTRAINT "Asset_uq3" UNIQUE ("id_MaintenanceCard");
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

-- object: "Equipments"."Mounting" | type: TABLE --
-- DROP TABLE IF EXISTS "Equipments"."Mounting" CASCADE;
CREATE TABLE "Equipments"."Mounting"(
	gid serial NOT NULL,
	"mountingType" "Equipments".mountingtype,
	"gid_InfraPart" integer,
-- 	type "Equipments".equipmentype,
-- 	model varchar,
-- 	brand varchar,
-- 	"equipmentGroup" asm.equipmentgroup,
-- 	"installDate" date,
-- 	installer "Actors"."Maintainer",
-- 	material smallint,
-- 	"gid_Asset" integer,
	CONSTRAINT "LightPole_pk" PRIMARY KEY (gid)

) INHERITS("Equipments"."Equipment")
;
-- ddl-end --
ALTER TABLE "Equipments"."Mounting" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "Management"."RoadMaintenanceDecision" | type: TABLE --
-- DROP TABLE IF EXISTS "Management"."RoadMaintenanceDecision" CASCADE;
CREATE TABLE "Management"."RoadMaintenanceDecision"(
	id serial NOT NULL,
	"decisionDate" date,
	"validFrom" date,
	"validTo" date,
	"id_Decider" integer,
	CONSTRAINT "RoadMaintenanceDecision_pk" PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE "Management"."RoadMaintenanceDecision" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "RoadMaintenanceDecision_fk" | type: CONSTRAINT --
-- ALTER TABLE asm."InfraPart" DROP CONSTRAINT IF EXISTS "RoadMaintenanceDecision_fk" CASCADE;
ALTER TABLE asm."InfraPart" ADD CONSTRAINT "RoadMaintenanceDecision_fk" FOREIGN KEY ("id_RoadMaintenanceDecision")
REFERENCES "Management"."RoadMaintenanceDecision" (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "InfraPart_uq2" | type: CONSTRAINT --
-- ALTER TABLE asm."InfraPart" DROP CONSTRAINT IF EXISTS "InfraPart_uq2" CASCADE;
ALTER TABLE asm."InfraPart" ADD CONSTRAINT "InfraPart_uq2" UNIQUE ("id_RoadMaintenanceDecision");
-- ddl-end --

-- object: "Actors"."Decider" | type: TABLE --
-- DROP TABLE IF EXISTS "Actors"."Decider" CASCADE;
CREATE TABLE "Actors"."Decider"(
	id serial NOT NULL,
-- 	name varchar,
-- 	"VATCode" varchar,
-- 	code smallint,
	CONSTRAINT "Decider_pk" PRIMARY KEY (id)

) INHERITS("Actors"."Actor")
;
-- ddl-end --
ALTER TABLE "Actors"."Decider" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "Decider_fk" | type: CONSTRAINT --
-- ALTER TABLE "Management"."RoadMaintenanceDecision" DROP CONSTRAINT IF EXISTS "Decider_fk" CASCADE;
ALTER TABLE "Management"."RoadMaintenanceDecision" ADD CONSTRAINT "Decider_fk" FOREIGN KEY ("id_Decider")
REFERENCES "Actors"."Decider" (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "RoadMaintenanceDecision_uq" | type: CONSTRAINT --
-- ALTER TABLE "Management"."RoadMaintenanceDecision" DROP CONSTRAINT IF EXISTS "RoadMaintenanceDecision_uq" CASCADE;
ALTER TABLE "Management"."RoadMaintenanceDecision" ADD CONSTRAINT "RoadMaintenanceDecision_uq" UNIQUE ("id_Decider");
-- ddl-end --

-- object: "Equipments"."StreetLight" | type: TABLE --
-- DROP TABLE IF EXISTS "Equipments"."StreetLight" CASCADE;
CREATE TABLE "Equipments"."StreetLight"(
	gid serial NOT NULL,
	"lightTypeCode" varchar,
	phase varchar,
	"gid_Mounting" integer,
-- 	type "Equipments".equipmentype,
-- 	model varchar,
-- 	brand varchar,
-- 	"equipmentGroup" asm.equipmentgroup,
-- 	"installDate" date,
-- 	installer "Actors"."Maintainer",
-- 	material smallint,
-- 	"gid_Asset" integer,
-- 	"gid_InfraPart" integer,
	CONSTRAINT "StreetLight_pk" PRIMARY KEY (gid)

) INHERITS("Equipments"."Equipment")
;
-- ddl-end --
ALTER TABLE "Equipments"."StreetLight" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "Mounting_fk" | type: CONSTRAINT --
-- ALTER TABLE "Equipments"."StreetLight" DROP CONSTRAINT IF EXISTS "Mounting_fk" CASCADE;
ALTER TABLE "Equipments"."StreetLight" ADD CONSTRAINT "Mounting_fk" FOREIGN KEY ("gid_Mounting")
REFERENCES "Equipments"."Mounting" (gid) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "StreetLight_uq" | type: CONSTRAINT --
-- ALTER TABLE "Equipments"."StreetLight" DROP CONSTRAINT IF EXISTS "StreetLight_uq" CASCADE;
ALTER TABLE "Equipments"."StreetLight" ADD CONSTRAINT "StreetLight_uq" UNIQUE ("gid_Mounting");
-- ddl-end --

-- object: "Media"."Symbol" | type: TABLE --
-- DROP TABLE IF EXISTS "Media"."Symbol" CASCADE;
CREATE TABLE "Media"."Symbol"(
	id serial NOT NULL,
	"imageURL" varchar,
	"gid_Equipment" integer,
	CONSTRAINT "Symbol_pk" PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE "Media"."Symbol" OWNER TO "asmAdmin";
-- ddl-end --

-- object: asm."Bridge" | type: TABLE --
-- DROP TABLE IF EXISTS asm."Bridge" CASCADE;
CREATE TABLE asm."Bridge"(
-- 	gid integer NOT NULL,
-- 	"speedLimit" smallint,
-- 	type asm.infraparttype,
-- 	"functionalClass" smallint,
-- 	"roadClass" smallint,
-- 	"code_UseType" char(5),
-- 	"gid_Asset" integer,
-- 	"id_RoadMaintenanceDecision" integer,

) INHERITS(asm."InfraPart")
;
-- ddl-end --
ALTER TABLE asm."Bridge" OWNER TO "asmAdmin";
-- ddl-end --

-- object: asm."Underpass" | type: TABLE --
-- DROP TABLE IF EXISTS asm."Underpass" CASCADE;
CREATE TABLE asm."Underpass"(
-- 	gid integer NOT NULL,
-- 	"speedLimit" smallint,
-- 	type asm.infraparttype,
-- 	"functionalClass" smallint,
-- 	"roadClass" smallint,
-- 	"code_UseType" char(5),
-- 	"gid_Asset" integer,
-- 	"id_RoadMaintenanceDecision" integer,

) INHERITS(asm."InfraPart")
;
-- ddl-end --
ALTER TABLE asm."Underpass" OWNER TO "asmAdmin";
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

-- object: "Maintenance"."MaintenanceArea" | type: TABLE --
-- DROP TABLE IF EXISTS "Maintenance"."MaintenanceArea" CASCADE;
CREATE TABLE "Maintenance"."MaintenanceArea"(
	gid serial NOT NULL,
	geom geometry(MULTIPOLYGONZ, 3879),
	type smallint,
	name varchar,
	CONSTRAINT "MaintenanceArea_pk" PRIMARY KEY (gid)

);
-- ddl-end --
COMMENT ON TABLE "Maintenance"."MaintenanceArea" IS 'The "cookie -cutter" table that holds separate geometries for map making and analyses.';
-- ddl-end --
ALTER TABLE "Maintenance"."MaintenanceArea" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "Equipments"."TrafficSign" | type: TABLE --
-- DROP TABLE IF EXISTS "Equipments"."TrafficSign" CASCADE;
CREATE TABLE "Equipments"."TrafficSign"(
	gid serial NOT NULL,
	signtype smallint,
	signtext varchar,
	"viewingAngle" smallint,
	"horizontalPlace" smallint,
	"verticalPlace" smallint,
	"gid_Mounting" integer,
-- 	type "Equipments".equipmentype,
-- 	model varchar,
-- 	brand varchar,
-- 	"equipmentGroup" asm.equipmentgroup,
-- 	"installDate" date,
-- 	installer "Actors"."Maintainer",
-- 	material smallint,
-- 	"gid_Asset" integer,
-- 	"gid_InfraPart" integer,
	CONSTRAINT "TrafficSign_pk" PRIMARY KEY (gid)

) INHERITS("Equipments"."Equipment")
;
-- ddl-end --
COMMENT ON COLUMN "Equipments"."TrafficSign".signtype IS 'See http://www.liikennevirasto.fi/tieverkko/liikennemerkit#.WUEriR9Nzc-';
-- ddl-end --
COMMENT ON COLUMN "Equipments"."TrafficSign"."viewingAngle" IS 'Viewing angle';
-- ddl-end --
COMMENT ON COLUMN "Equipments"."TrafficSign"."horizontalPlace" IS 'Horiozontal order placement compared to other traffic signs mounted to same mounting';
-- ddl-end --
COMMENT ON COLUMN "Equipments"."TrafficSign"."verticalPlace" IS 'Vertical order placement compared to other traffic signs mounted to same mounting';
-- ddl-end --
ALTER TABLE "Equipments"."TrafficSign" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "Asset_fk" | type: CONSTRAINT --
-- ALTER TABLE "Equipments"."Equipment" DROP CONSTRAINT IF EXISTS "Asset_fk" CASCADE;
ALTER TABLE "Equipments"."Equipment" ADD CONSTRAINT "Asset_fk" FOREIGN KEY ("gid_Asset")
REFERENCES asm."Asset" (gid) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Equipment_uq" | type: CONSTRAINT --
-- ALTER TABLE "Equipments"."Equipment" DROP CONSTRAINT IF EXISTS "Equipment_uq" CASCADE;
ALTER TABLE "Equipments"."Equipment" ADD CONSTRAINT "Equipment_uq" UNIQUE ("gid_Asset");
-- ddl-end --

-- object: "InfraPart_fk" | type: CONSTRAINT --
-- ALTER TABLE "Equipments"."Mounting" DROP CONSTRAINT IF EXISTS "InfraPart_fk" CASCADE;
ALTER TABLE "Equipments"."Mounting" ADD CONSTRAINT "InfraPart_fk" FOREIGN KEY ("gid_InfraPart")
REFERENCES asm."InfraPart" (gid) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Mounting_uq" | type: CONSTRAINT --
-- ALTER TABLE "Equipments"."Mounting" DROP CONSTRAINT IF EXISTS "Mounting_uq" CASCADE;
ALTER TABLE "Equipments"."Mounting" ADD CONSTRAINT "Mounting_uq" UNIQUE ("gid_InfraPart");
-- ddl-end --

-- object: "SimplifiedCode_fk" | type: CONSTRAINT --
-- ALTER TABLE asm."Asset" DROP CONSTRAINT IF EXISTS "SimplifiedCode_fk" CASCADE;
ALTER TABLE asm."Asset" ADD CONSTRAINT "SimplifiedCode_fk" FOREIGN KEY ("code_SimplifiedCode")
REFERENCES asm."SimplifiedCode" (code) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Asset_uq4" | type: CONSTRAINT --
-- ALTER TABLE asm."Asset" DROP CONSTRAINT IF EXISTS "Asset_uq4" CASCADE;
ALTER TABLE asm."Asset" ADD CONSTRAINT "Asset_uq4" UNIQUE ("code_SimplifiedCode");
-- ddl-end --

-- object: asm."RoadSurface" | type: TABLE --
-- DROP TABLE IF EXISTS asm."RoadSurface" CASCADE;
CREATE TABLE asm."RoadSurface"(
	gid serial NOT NULL,
	material varchar,
	thickness smallint,
	"gid_Asset" integer,
	CONSTRAINT "RoadSurface_pk" PRIMARY KEY (gid)

);
-- ddl-end --
ALTER TABLE asm."RoadSurface" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "Equipments"."PlayGroundEquipment" | type: TABLE --
-- DROP TABLE IF EXISTS "Equipments"."PlayGroundEquipment" CASCADE;
CREATE TABLE "Equipments"."PlayGroundEquipment"(
-- 	gid integer NOT NULL,
-- 	type "Equipments".equipmentype,
-- 	model varchar,
-- 	brand varchar,
-- 	"equipmentGroup" asm.equipmentgroup,
-- 	"installDate" date,
-- 	installer "Actors"."Maintainer",
-- 	material smallint,
-- 	"gid_Asset" integer,
-- 	"gid_InfraPart" integer,

) INHERITS("Equipments"."Equipment")
;
-- ddl-end --
ALTER TABLE "Equipments"."PlayGroundEquipment" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "Reports"."TreeMaintenanceWorks" | type: MATERIALIZED VIEW --
-- DROP MATERIALIZED VIEW IF EXISTS "Reports"."TreeMaintenanceWorks" CASCADE;
CREATE MATERIALIZED VIEW "Reports"."TreeMaintenanceWorks"
AS 

SELECT
   "Maintenance"."MaintenanceWork".type,
   asm."Vegetation"."vegetationCode",
   asm."Vegetation"."vegetationNumber",
   asm."Vegetation"."vegetationType" AS vegetype
FROM
   "Maintenance"."MaintenanceWork",
   asm."Vegetation"
WHERE
   asm."Vegetation"."vegetationType" = 'tree';
-- ddl-end --
ALTER MATERIALIZED VIEW "Reports"."TreeMaintenanceWorks" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "Equipments"."Furniture" | type: TABLE --
-- DROP TABLE IF EXISTS "Equipments"."Furniture" CASCADE;
CREATE TABLE "Equipments"."Furniture"(
-- 	gid integer NOT NULL,
-- 	type "Equipments".equipmentype,
-- 	model varchar,
-- 	brand varchar,
-- 	"equipmentGroup" asm.equipmentgroup,
-- 	"installDate" date,
-- 	installer "Actors"."Maintainer",
-- 	material smallint,
-- 	"gid_Asset" integer,
-- 	"gid_InfraPart" integer,

) INHERITS("Equipments"."Equipment")
;
-- ddl-end --
ALTER TABLE "Equipments"."Furniture" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "Equipments"."Advertisement" | type: TABLE --
-- DROP TABLE IF EXISTS "Equipments"."Advertisement" CASCADE;
CREATE TABLE "Equipments"."Advertisement"(
-- 	gid integer NOT NULL,
-- 	type "Equipments".equipmentype,
-- 	model varchar,
-- 	brand varchar,
-- 	"equipmentGroup" asm.equipmentgroup,
-- 	"installDate" date,
-- 	installer "Actors"."Maintainer",
-- 	material smallint,
-- 	"gid_Asset" integer,
-- 	"gid_InfraPart" integer,

) INHERITS("Equipments"."Equipment")
;
-- ddl-end --
ALTER TABLE "Equipments"."Advertisement" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "Equipments"."Art" | type: TABLE --
-- DROP TABLE IF EXISTS "Equipments"."Art" CASCADE;
CREATE TABLE "Equipments"."Art"(
-- 	gid integer NOT NULL,
-- 	type "Equipments".equipmentype,
-- 	model varchar,
-- 	brand varchar,
-- 	"equipmentGroup" asm.equipmentgroup,
-- 	"installDate" date,
-- 	installer "Actors"."Maintainer",
-- 	material smallint,
-- 	"gid_Asset" integer,
-- 	"gid_InfraPart" integer,

) INHERITS("Equipments"."Equipment")
;
-- ddl-end --
ALTER TABLE "Equipments"."Art" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "Equipments"."Crossing" | type: TABLE --
-- DROP TABLE IF EXISTS "Equipments"."Crossing" CASCADE;
CREATE TABLE "Equipments"."Crossing"(
	gid serial NOT NULL,
-- 	type "Equipments".equipmentype,
-- 	model varchar,
-- 	brand varchar,
-- 	"equipmentGroup" asm.equipmentgroup,
-- 	"installDate" date,
-- 	installer "Actors"."Maintainer",
-- 	material smallint,
-- 	"gid_Asset" integer,
-- 	"gid_InfraPart" integer,
	CONSTRAINT "Crossing_pk" PRIMARY KEY (gid)

) INHERITS("Equipments"."Equipment")
;
-- ddl-end --
ALTER TABLE "Equipments"."Crossing" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "Equipments"."Structure" | type: TABLE --
-- DROP TABLE IF EXISTS "Equipments"."Structure" CASCADE;
CREATE TABLE "Equipments"."Structure"(
-- 	gid integer NOT NULL,
-- 	type "Equipments".equipmentype,
-- 	model varchar,
-- 	brand varchar,
-- 	"equipmentGroup" asm.equipmentgroup,
-- 	"installDate" date,
-- 	installer "Actors"."Maintainer",
-- 	material smallint,
-- 	"gid_Asset" integer,
-- 	"gid_InfraPart" integer,

) INHERITS("Equipments"."Equipment")
;
-- ddl-end --
ALTER TABLE "Equipments"."Structure" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "Equipments"."TrashEquipment" | type: TABLE --
-- DROP TABLE IF EXISTS "Equipments"."TrashEquipment" CASCADE;
CREATE TABLE "Equipments"."TrashEquipment"(
-- 	gid integer NOT NULL,
-- 	type "Equipments".equipmentype,
-- 	model varchar,
-- 	brand varchar,
-- 	"equipmentGroup" asm.equipmentgroup,
-- 	"installDate" date,
-- 	installer "Actors"."Maintainer",
-- 	material smallint,
-- 	"gid_Asset" integer,
-- 	"gid_InfraPart" integer,

) INHERITS("Equipments"."Equipment")
;
-- ddl-end --
ALTER TABLE "Equipments"."TrashEquipment" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "Reports"."PlaygroundEquipmentList" | type: MATERIALIZED VIEW --
-- DROP MATERIALIZED VIEW IF EXISTS "Reports"."PlaygroundEquipmentList" CASCADE;
CREATE MATERIALIZED VIEW "Reports"."PlaygroundEquipmentList"
AS 

SELECT
   equip.model,
  equipasset.name,
  equipasset.address,
  equipasset."addressNumber"
FROM
   asm."Asset" AS equipasset,
   "Equipments"."PlayGroundEquipment" AS equip
WHERE
   equip."gid_Asset" = equipasset.gid
AND equipasset.landuse = 'park'
   GROUP BY equipasset.name, equipasset.address,
equipasset."addressNumber", equip.model
ORDER BY equipasset.name, equip.model;
-- ddl-end --
ALTER MATERIALIZED VIEW "Reports"."PlaygroundEquipmentList" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "Equipments"."StreetSign" | type: TABLE --
-- DROP TABLE IF EXISTS "Equipments"."StreetSign" CASCADE;
CREATE TABLE "Equipments"."StreetSign"(
	"gid_Mounting" integer,
-- 	gid integer NOT NULL,
-- 	type "Equipments".equipmentype,
-- 	model varchar,
-- 	brand varchar,
-- 	"equipmentGroup" asm.equipmentgroup,
-- 	"installDate" date,
-- 	installer "Actors"."Maintainer",
-- 	material smallint,
-- 	"gid_Asset" integer,
-- 	"gid_InfraPart" integer,
	CONSTRAINT "StreetSign_pk" PRIMARY KEY (gid)

) INHERITS("Equipments"."Equipment")
;
-- ddl-end --
ALTER TABLE "Equipments"."StreetSign" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "Equipments"."Fence" | type: TABLE --
-- DROP TABLE IF EXISTS "Equipments"."Fence" CASCADE;
CREATE TABLE "Equipments"."Fence"(
-- 	gid integer NOT NULL,
-- 	type "Equipments".equipmentype,
-- 	model varchar,
-- 	brand varchar,
-- 	"equipmentGroup" asm.equipmentgroup,
-- 	"installDate" date,
-- 	installer "Actors"."Maintainer",
-- 	material smallint,
-- 	"gid_Asset" integer,
-- 	"gid_InfraPart" integer,

) INHERITS("Equipments"."Equipment")
;
-- ddl-end --
ALTER TABLE "Equipments"."Fence" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "Mounting_fk" | type: CONSTRAINT --
-- ALTER TABLE "Equipments"."TrafficSign" DROP CONSTRAINT IF EXISTS "Mounting_fk" CASCADE;
ALTER TABLE "Equipments"."TrafficSign" ADD CONSTRAINT "Mounting_fk" FOREIGN KEY ("gid_Mounting")
REFERENCES "Equipments"."Mounting" (gid) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "TrafficSign_uq" | type: CONSTRAINT --
-- ALTER TABLE "Equipments"."TrafficSign" DROP CONSTRAINT IF EXISTS "TrafficSign_uq" CASCADE;
ALTER TABLE "Equipments"."TrafficSign" ADD CONSTRAINT "TrafficSign_uq" UNIQUE ("gid_Mounting");
-- ddl-end --

-- object: "Equipments"."StreetLightConductor" | type: TABLE --
-- DROP TABLE IF EXISTS "Equipments"."StreetLightConductor" CASCADE;
CREATE TABLE "Equipments"."StreetLightConductor"(
-- 	gid integer NOT NULL,
-- 	type "Equipments".equipmentype,
-- 	model varchar,
-- 	brand varchar,
-- 	"equipmentGroup" asm.equipmentgroup,
-- 	"installDate" date,
-- 	installer "Actors"."Maintainer",
-- 	material smallint,
-- 	"gid_Asset" integer,
-- 	"gid_InfraPart" integer,

) INHERITS("Equipments"."Equipment")
;
-- ddl-end --
ALTER TABLE "Equipments"."StreetLightConductor" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "Equipments"."StreetLightStation" | type: TABLE --
-- DROP TABLE IF EXISTS "Equipments"."StreetLightStation" CASCADE;
CREATE TABLE "Equipments"."StreetLightStation"(
-- 	gid integer NOT NULL,
-- 	type "Equipments".equipmentype,
-- 	model varchar,
-- 	brand varchar,
-- 	"equipmentGroup" asm.equipmentgroup,
-- 	"installDate" date,
-- 	installer "Actors"."Maintainer",
-- 	material smallint,
-- 	"gid_Asset" integer,
-- 	"gid_InfraPart" integer,

) INHERITS("Equipments"."Equipment")
;
-- ddl-end --
ALTER TABLE "Equipments"."StreetLightStation" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "Equipments"."NoiseBarrier" | type: TABLE --
-- DROP TABLE IF EXISTS "Equipments"."NoiseBarrier" CASCADE;
CREATE TABLE "Equipments"."NoiseBarrier"(
-- 	gid integer NOT NULL,
-- 	type "Equipments".equipmentype,
-- 	model varchar,
-- 	brand varchar,
-- 	"equipmentGroup" asm.equipmentgroup,
-- 	"installDate" date,
-- 	installer "Actors"."Maintainer",
-- 	material smallint,
-- 	"gid_Asset" integer,
-- 	"gid_InfraPart" integer,

) INHERITS("Equipments"."Equipment")
;
-- ddl-end --
ALTER TABLE "Equipments"."NoiseBarrier" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "Mounting_fk" | type: CONSTRAINT --
-- ALTER TABLE "Equipments"."StreetSign" DROP CONSTRAINT IF EXISTS "Mounting_fk" CASCADE;
ALTER TABLE "Equipments"."StreetSign" ADD CONSTRAINT "Mounting_fk" FOREIGN KEY ("gid_Mounting")
REFERENCES "Equipments"."Mounting" (gid) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "StreetSign_uq" | type: CONSTRAINT --
-- ALTER TABLE "Equipments"."StreetSign" DROP CONSTRAINT IF EXISTS "StreetSign_uq" CASCADE;
ALTER TABLE "Equipments"."StreetSign" ADD CONSTRAINT "StreetSign_uq" UNIQUE ("gid_Mounting");
-- ddl-end --

-- object: "Equipment_fk" | type: CONSTRAINT --
-- ALTER TABLE "Media"."Symbol" DROP CONSTRAINT IF EXISTS "Equipment_fk" CASCADE;
ALTER TABLE "Media"."Symbol" ADD CONSTRAINT "Equipment_fk" FOREIGN KEY ("gid_Equipment")
REFERENCES "Equipments"."Equipment" (gid) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Symbol_uq" | type: CONSTRAINT --
-- ALTER TABLE "Media"."Symbol" DROP CONSTRAINT IF EXISTS "Symbol_uq" CASCADE;
ALTER TABLE "Media"."Symbol" ADD CONSTRAINT "Symbol_uq" UNIQUE ("gid_Equipment");
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

-- object: "Equipments"."TrafficLight" | type: TABLE --
-- DROP TABLE IF EXISTS "Equipments"."TrafficLight" CASCADE;
CREATE TABLE "Equipments"."TrafficLight"(
-- 	gid integer NOT NULL,
-- 	type "Equipments".equipmentype,
-- 	model varchar,
-- 	brand varchar,
-- 	"equipmentGroup" asm.equipmentgroup,
-- 	"installDate" date,
-- 	installer "Actors"."Maintainer",
-- 	material smallint,
-- 	"gid_Asset" integer,
-- 	"gid_InfraPart" integer,

) INHERITS("Equipments"."Equipment")
;
-- ddl-end --
ALTER TABLE "Equipments"."TrafficLight" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "InfraPart_fk" | type: CONSTRAINT --
-- ALTER TABLE "Equipments"."Equipment" DROP CONSTRAINT IF EXISTS "InfraPart_fk" CASCADE;
ALTER TABLE "Equipments"."Equipment" ADD CONSTRAINT "InfraPart_fk" FOREIGN KEY ("gid_InfraPart")
REFERENCES asm."InfraPart" (gid) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Equipment_uq1" | type: CONSTRAINT --
-- ALTER TABLE "Equipments"."Equipment" DROP CONSTRAINT IF EXISTS "Equipment_uq1" CASCADE;
ALTER TABLE "Equipments"."Equipment" ADD CONSTRAINT "Equipment_uq1" UNIQUE ("gid_InfraPart");
-- ddl-end --

-- object: "Equipments".material | type: TYPE --
-- DROP TYPE IF EXISTS "Equipments".material CASCADE;
CREATE TYPE "Equipments".material AS
 ENUM ('bush','metal','wood','plastic','other');
-- ddl-end --
ALTER TYPE "Equipments".material OWNER TO "asmAdmin";
-- ddl-end --

-- object: "Reports"."RoadLengthsBySurfaceMaterial" | type: MATERIALIZED VIEW --
-- DROP MATERIALIZED VIEW IF EXISTS "Reports"."RoadLengthsBySurfaceMaterial" CASCADE;
CREATE MATERIALIZED VIEW "Reports"."RoadLengthsBySurfaceMaterial"
AS 

SELECT
   SUM(ST_Length(cline.geom)) / 1000  AS length,
   rsurface.material,
   infrapart."roadClass" AS roadclass
FROM
   asm."CenterLine" AS cline,
   asm."RoadSurface" AS rsurface,
   asm."Asset" AS asset,
   asm."InfraPart" AS infrapart
WHERE
   cline."gid_InfraPart" = infrapart.gid
AND rsurface."gid_Asset" = asset.gid
AND infrapart."gid_Asset" = asset.gid
GROUP BY rsurface.material,infrapart."roadClass"
ORDER BY infrapart."roadClass",rsurface.material;
-- ddl-end --
ALTER MATERIALIZED VIEW "Reports"."RoadLengthsBySurfaceMaterial" OWNER TO "asmAdmin";
-- ddl-end --

-- object: "Asset_fk" | type: CONSTRAINT --
-- ALTER TABLE asm."RoadSurface" DROP CONSTRAINT IF EXISTS "Asset_fk" CASCADE;
ALTER TABLE asm."RoadSurface" ADD CONSTRAINT "Asset_fk" FOREIGN KEY ("gid_Asset")
REFERENCES asm."Asset" (gid) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "RoadSurface_uq" | type: CONSTRAINT --
-- ALTER TABLE asm."RoadSurface" DROP CONSTRAINT IF EXISTS "RoadSurface_uq" CASCADE;
ALTER TABLE asm."RoadSurface" ADD CONSTRAINT "RoadSurface_uq" UNIQUE ("gid_Asset");
-- ddl-end --

-- object: "History"."TrafficSignDeleteReport" | type: MATERIALIZED VIEW --
-- DROP MATERIALIZED VIEW IF EXISTS "History"."TrafficSignDeleteReport" CASCADE;
CREATE MATERIALIZED VIEW "History"."TrafficSignDeleteReport"
AS 

SELECT
     histevent."eventType" AS eventtype,
  extract(month from histevent.date) AS month,
  trafficsign.model AS model,
  actor.name AS maintainer
FROM
   "History"."HistoryEvent" AS histevent,
   "Equipments"."TrafficSign" AS trafficsign,
   "Actors"."Maintainer" AS actor,
   "Maintenance"."MaintenanceRegion" AS maintregion,
   "Maintenance"."MaintenanceRegionAssetLink" AS assetmregionlink,
   asm."Asset" AS asset
WHERE
  actor.id = maintregion."id_Maintainer"
  AND assetmregionlink."gid_MaintenanceRegion" = maintregion."id_Maintainer"
  AND assetmregionlink."gid_Asset" = asset.gid
  AND trafficsign."gid_Asset" = asset.gid
  AND histevent."TableName" = 'TrafficSign'
  AND histevent."eventType" = 'delete'
  GROUP BY eventtype,month, model, maintainer
  ORDER BY eventtype,month, model, maintainer;
-- ddl-end --
ALTER MATERIALIZED VIEW "History"."TrafficSignDeleteReport" OWNER TO "asmAdmin";
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

-- object: grant_1fda9b6f72 | type: PERMISSION --
GRANT CREATE,USAGE
   ON SCHEMA asm
   TO "asmUser";
-- ddl-end --

-- object: grant_6d6c4d6921 | type: PERMISSION --
GRANT CREATE,USAGE
   ON SCHEMA "Maintenance"
   TO "asmUser";
-- ddl-end --

-- object: grant_aba7489c4c | type: PERMISSION --
GRANT CREATE,USAGE
   ON SCHEMA "History"
   TO "asmUser";
-- ddl-end --

-- object: grant_d22cc8956c | type: PERMISSION --
GRANT CREATE,USAGE
   ON SCHEMA "Actors"
   TO "asmUser";
-- ddl-end --

-- object: grant_19ae0e0204 | type: PERMISSION --
GRANT CREATE,USAGE
   ON SCHEMA "Management"
   TO "asmUser";
-- ddl-end --

-- object: grant_380537e92e | type: PERMISSION --
GRANT CREATE,USAGE
   ON SCHEMA "Media"
   TO "asmUser";
-- ddl-end --

-- object: grant_8725a9f3cf | type: PERMISSION --
GRANT CREATE,USAGE
   ON SCHEMA "Reports"
   TO "asmUser";
-- ddl-end --

-- object: grant_c774ca5a05 | type: PERMISSION --
GRANT CREATE,USAGE
   ON SCHEMA "Equipments"
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

GRANT SELECT,INSERT,UPDATE
   ON ALL TABLES IN SCHEMA "Management"
   TO "asmUser";

GRANT SELECT,INSERT,UPDATE
   ON ALL TABLES IN SCHEMA "Media"
   TO "asmUser";

GRANT SELECT,INSERT,UPDATE
   ON ALL TABLES IN SCHEMA "Reports"
   TO "asmUser";

GRANT SELECT,INSERT,UPDATE
   ON ALL TABLES IN SCHEMA "Equipments"
   TO "asmUser";
---
