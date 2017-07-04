
# Data Model

Version 2017-06-05 created with the [pgModeler](https://www.pgmodeler.com.br/).

Descriptions for the tables and for the less clear table columns. Also some open questions.

## Asset

| Column  | Description  |
|---|---|
| name  | For example name of the park or road |
| geom_poly  | If the geometry of the asset is polygon or multipolygon, the geometry is stored here  |
| geom_line  | If the geometry of the asset is line or multiline, the geometry is stored here  |
| geom_point  | If the geometry of the asset is point or multipoint, the geometry is stored here  |
| landuse  | Landuse type |
| address  | Street address name |
| regionalContractArea  | "Alueurakka-alue" |
| validFrom  | The time when the phenomenon started to exist in the real world. |
| validTo  | The time from which the phenomenon no longer exists in the real world. |
| maintenanceClass  | Parks and roads have this though they have different classifications |
| winterMaintenance  | Indicates whether the asset has winter maintenance |
| addressNumber  | Street address house number |
| status  | Planned, finished, removed |
| photo1  | Identifier for the asset photo |
| partClass  | Parks and roads have this though they have different classifications |
| code_SimplifiedCode  | Simplified maintenance code based on the more complex InfraCode2017 classification |
| code_InfraCode2017  | Maintenance code from "Infra 2017 Kunnossapitonimikkeistö"  |
| id_Route  | If the asset is part of some route then this column has a value |

### Some open questions

* Should asset have column of type geometry collection?
* What landuse types there are?
* Does regionalContractArea differ for streets and parks?
* Are regionalContractArea and maintenanceRegion equal?
* Probably should have separate table where Route and Asset are connected together

## CenterLine

Road center line

### Some open questions

* Should there be table / columns for road lanes?
* How should the Digiroad needs be considred?

## Crossing

Pedestrian crossing accross a street

| Column  | Description  |
|---|---|
| trafficLights  | Type of the traffic lights if any that this crossing has |
| gid_roadPart  | A crossing is always related to one road part |

## Equipment

Can be, for example:
* bench
* trash bin
* street light
* playground item

### Some open questions

* Traffic signs should probably be modelled separately to take into account their various characteristics

## History event

Strores various events related to modifications of the data in the database. The history information is needed for reporting.

| Column  | Description  |
|---|---|
| TableName  | Name of the table for which data was inserted, updated or deleted from |
| eventType  | add, delete, update |
| userName  | User who did the modification |
| date  | Date and time of the modification |

### Some open questions

* How detailed history information should be stored?

## InfraCode2017

Maintenance codes and their names from the "Infra 2017 Kunnossapitonimikkeistö".

## Maintainer

Maintains the assets.

| Column  | Description  |
|---|---|
| maintainer_uuid  | Unique identifier for the maintainer |
| VAT_code  | Value added tax code. Used for billing |

## MaintenanceEvent

A maintence that has been ordered and possibly carried out.

| Column  | Description  |
|---|---|
| date  | Order date and time |
| id_MaintenanceWork  | One maintenance event is always related to one maintenance work |
| gid_Asset  | One maintenance event is always related to one asset |

### Some open questions

* Should orderer be a table in the Actors schema? Can orderer be owner? Can orderer be possessor? Can orderer be...?
* Should there be date when the maintenance work has been carried out in addition to order date?

## MaintenanceRegion

Regions of the city that are maintained by different parties.

### Some open questions

* Should probably have a geometry column?
* Are regionalContractArea (in Asset table) and MaintenanceRegion equal?

## MaintenanceWork

There are various maintenance works priced diffrently for roads, road markings, planting vegetation, etc.

| Column  | Description  |
|---|---|
| unit  | m<sup>2</sup>, pcs, hours, ... |
| price  | Price of the maintenance work in the units |
| validFrom  | From which date the price is valid from |
| validTo  | Unitl which date the price is valid |

## Owner

Owner of the asset.

### Some open questions

* What information should be stored in addition to the name?

## ParkPart

Part of the park.

| Column  | Description  |
|---|---|
| type  | What is the main vegetation type or other type such as asphalt for this part |
| code_UseType  | Main intended use for this part of the park |

## Possessor

Possessor of the asset.

### Some open questions

* What information should be stored in addition to the name?

## RoadLayer

A road part consists of the various layers in addition to the actual paving that are stored in this table.

## RoadPart

Part of the road that has some unique property from the other road parts.

| Column  | Description  |
|---|---|
| material  | Paving material |
| type  | Matches road link type of the Digiroad |
| functionalClass  | Matches functional road link classes of the Digiroad |
| roadClass  | Indicates whether the road part is for motor vehicles or not |
| code_UseType  | Use type of the road part as defined by the city of Espoo |

### Some open questions

* How should the Digiroad needs be considred?

## RoadSurfaceMarking

Various painted or other types of road surface markings.

| Column  | Description  |
|---|---|
| RoadMarkingCode  | Identifies the road marking type |
| gid_RoadPart  | Road surface marking belongs to a road part  |

### Some open questions

* Should the link between RoadSurfaceMarking and RoadPart be removed?

## Route

Route can be emergency route, quality route, or some other type of route. Route is defined by one or more assets.
An example route could be "Rantaraitti" in Espoo.

### Some open questions

* Probably should have separate table where Route and Assets are connected together

## UseType

Use type of the road part as defined by the city of Espoo or main intended use for a part of the park.

## Vegetation

Vegetation planted in a specific location in the city.

| Column  | Description  |
|---|---|
| vegetationCode  | Identifies the class of the vegetation |
| condition  | Code if any that indicates in how good condition the vegetation is |

### Some open questions

* There are many more attributes to add to this or related table(s). A separate schemas could be defined for
** road infrastructure and 
** park infrastructure
