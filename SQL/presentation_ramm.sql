use role tst_role_elt;
use database tst_dwh;
use schema presentation;


create or replace TABLE RAMM_FACT_GIS_BRIDGE (
	"UrbanRural" VARCHAR(16777216),
	"StartM" NUMBER(10,0),
	"EndM" NUMBER(10,0),
	"BridgeName" VARCHAR(30),
	"PlateYear" NUMBER(10,0),
	"BridgeTypeDescription" VARCHAR(50),
	"SpanCount" NUMBER(10,0),
	"SpanArrangement" VARCHAR(34),
	"StructuralRating" VARCHAR(4),
	"AssetOwner" VARCHAR(16777216),
	"Condition" VARCHAR(16777216),
	"RemainingUsefulLife" NUMBER(10,0),
	"ConditionDate" VARCHAR(50),
	"notes" VARCHAR(255),
	SHAPE GEOGRAPHY,
	"InspectionArea" VARCHAR(50),
	"StructuralDesign" VARCHAR(3),
	"ConstructionDate" VARCHAR(50),
	"RoadID" NUMBER(10,0),
	"RoadName" VARCHAR(100)
);
create or replace TABLE RAMM_FACT_GIS_CARRIAGEWAYS (
	"Hierarchy" VARCHAR(45),
	"Pavement Type" VARCHAR(1),
	"Owner" VARCHAR(50),
	ROADTYPE VARCHAR(16777216),
	ROADNAME VARCHAR(100),
	RAMMID NUMBER(10,0),
	CWAYSTART NUMBER(10,0),
	CWAYEND NUMBER(10,0),
	STARTNAME VARCHAR(100),
	ENDNAME VARCHAR(100),
	SHAPE GEOGRAPHY,
	"CarriagewayID" NUMBER(10,0),
	"Width" NUMBER(3,1),
	"Area" NUMBER(8,1),
	"TravelDirection" VARCHAR(16777216),
	"Lanes" NUMBER(10,0),
	"Length" NUMBER(10,0)
);
create or replace TABLE RAMM_FACT_GIS_CORRIDOR_ACCESS_REQUESTS (
	"CAR #" VARCHAR(8),
	"CAR Type" VARCHAR(16),
	"Work Type" VARCHAR(16),
	"CAR Step" VARCHAR(16),
	"CAR Status" VARCHAR(64),
	ACTIVITY VARCHAR(512),
	"Work Description" VARCHAR(16777216),
	"Street Name" VARCHAR(100),
	"Location In Road" VARCHAR(255),
	"Applicant Organisation" VARCHAR(150),
	"Utility Operator Organisation" VARCHAR(150),
	"Principal Organisation" VARCHAR(150),
	"Contractor Organisation" VARCHAR(150),
	"Estimated Start Date" VARCHAR(10),
	"Estimated Completion Date" VARCHAR(10),
	"Date Work Start" VARCHAR(10),
	"Date Work Complete" VARCHAR(10),
	"Date Work Signed Off" VARCHAR(10),
	"Date Warranty Started" VARCHAR(10),
	"Date Warranty Ended" VARCHAR(10),
	SHAPE VARCHAR(16777216),
	TOWNSHIP VARCHAR(50),
	POSTCODE VARCHAR(10),
	ROADNAME VARCHAR(100),
	"Road Closure Required" VARCHAR(10),
	"Date Work Start Status" VARCHAR(32),
	"Date Work Complete Status" VARCHAR(32),
	"TTM Road Level" VARCHAR(100),
	"Traffic Disruption" VARCHAR(3),
	"Cause Of Disruption" VARCHAR(16777216)
);
create or replace TABLE RAMM_FACT_GIS_FEATURES (
	"FeatureID" NUMBER(10,0),
	"FeatureType" VARCHAR(50),
	"Constructed" VARCHAR(50),
	"Age" NUMBER(10,0),
	"Condition" VARCHAR(16777216),
	"ConditionDate" VARCHAR(50),
	"AssetOwner" VARCHAR(16777216),
	SHAPE GEOGRAPHY,
	"RoadID" NUMBER(10,0),
	"RoadName" VARCHAR(100)
);
create or replace TABLE RAMM_FACT_GIS_MINOR_STRUCTURES (
	"RoadName" VARCHAR(100),
	"RoadID" NUMBER(10,0),
	"CJNLK_ms_t" VARCHAR(50),
	"CJNLK_ms_m" VARCHAR(50),
	"external_n" VARCHAR(50),
	"age" NUMBER(10,0),
	"constructe" VARCHAR(50),
	"notes" VARCHAR(500),
	SHAPE GEOGRAPHY,
	"MinorStructureID" NUMBER(10,0)
);
create or replace TABLE RAMM_FACT_GIS_ONRC (
	"ONRC_Classification" VARCHAR(19),
	"CarriagewayID" NUMBER(10,0),
	AADT NUMBER(10,0),
	"AADT_Criteria" VARCHAR(60),
	"CategoryID" NUMBER(10,0),
	"RoadName" VARCHAR(100),
	SHAPE GEOGRAPHY
);
create or replace TABLE RAMM_FACT_GIS_RETAINING_WALL (
	"RetainingWallType" VARCHAR(50),
	"MSMaterial" VARCHAR(50),
	"StartM" NUMBER(10,0),
	"EndM" NUMBER(10,0),
	"LengthM" NUMBER(7,1),
	"HeightMMax" NUMBER(6,1),
	"Constructed" VARCHAR(50),
	"Condition" VARCHAR(16777216),
	"ConditionDate" VARCHAR(50),
	"Notes" VARCHAR(500),
	"AssetOwner" VARCHAR(50),
	SHAPE GEOGRAPHY,
	"RoadID" NUMBER(10,0),
	"RoadName" VARCHAR(100),
	"RetainingWallID" NUMBER(10,0)
);
create or replace TABLE RAMM_FACT_GIS_ROAD_MARKINGS (
	"MarkingID" NUMBER(10,0),
	"MarkingType" VARCHAR(55),
	"MarkingColour" VARCHAR(50),
	"MarkingMaterial" VARCHAR(50),
	SHAPE GEOGRAPHY,
	"RoadID" NUMBER(10,0),
	"RoadName" VARCHAR(100)
);
create or replace TABLE RAMM_FACT_GIS_SIGNS (
	"SignType" VARCHAR(50),
	"SignTypeDescription" VARCHAR(55),
	"LegendNote" VARCHAR(500),
	"Legend2Note" VARCHAR(500),
	"InstallDate" VARCHAR(50),
	"Condition" VARCHAR(16777216),
	"Owner" VARCHAR(50),
	SHAPE GEOGRAPHY,
	"RoadID" NUMBER(10,0),
	"SignID" NUMBER(10,0),
	"RoadName" VARCHAR(100)
);
create or replace TABLE RAMM_FACT_GIS_STREETLIGHTS (
	"RoadName" VARCHAR(100),
	"LightOwner" VARCHAR(50),
	"PoleNumber" VARCHAR(10),
	"PoleMake" VARCHAR(50),
	"PoleOwner" VARCHAR(50),
	"PoleCondition" VARCHAR(16777216),
	"PoleAge" NUMBER(10,0),
	"BracketID" NUMBER(10,0),
	"BracketType" VARCHAR(4),
	"LightMake" VARCHAR(50),
	"LightModel" VARCHAR(50),
	"LightCondition" VARCHAR(16777216),
	"LightAge" NUMBER(10,0),
	"GearMake" VARCHAR(50),
	"GearModel" VARCHAR(50),
	"GearAge" NUMBER(10,0),
	"LampMake" VARCHAR(50),
	"LampModel" VARCHAR(50),
	"LampAge" NUMBER(10,0),
	SHAPE GEOGRAPHY,
	"LightInstallDate" VARCHAR(50),
	"RoadID" NUMBER(10,0),
	"LightID" NUMBER(10,0),
	"PoleID" NUMBER(10,0)
);
create or replace TABLE RAMM_FACT_GIS_STREETLIGHT_CONTROLLERS (
	"RoadID" NUMBER(10,0),
	"RoadName" VARCHAR(100),
	"ControllerID" NUMBER(10,0),
	"ExternalID" VARCHAR(50),
	"MeterNumber" VARCHAR(50),
	"ICP_Number" VARCHAR(50),
	"Type" VARCHAR(16777216),
	"Position" VARCHAR(26),
	"Notes" VARCHAR(500),
	SHAPE GEOGRAPHY
);
create or replace TABLE RAMM_FACT_GIS_SURFACE_STRUCTURE (
	"RoadName" VARCHAR(100),
	"StartM" NUMBER(10,0),
	"EndM" NUMBER(10,0),
	"StartName" VARCHAR(500),
	"EndName" VARCHAR(500),
	"LengthM" NUMBER(7,1),
	"SurfaceWidth" NUMBER(3,1),
	"SurfaceMaterial" VARCHAR(50),
	"SurfaceFunction" VARCHAR(16777216),
	"ChipSize" NUMBER(10,0),
	"ChipSecondSize" NUMBER(10,0),
	"SurfaceDate" VARCHAR(50),
	"Age" NUMBER(10,0),
	SHAPE GEOGRAPHY,
	"CarriageSurfaceID" NUMBER(10,0),
	"RoadID" NUMBER(10,0),
	"SurfaceStructureID" NUMBER(10,0)
);
create or replace TABLE RAMM_FACT_GIS_SURVEYBENCHMARK (
	"Road_ID" NUMBER(10,0),
	"Road_Name" VARCHAR(100),
	"Site_Descr" VARCHAR(500),
	"Benchmark" NUMBER(10,0),
	"Elevation" NUMBER(16,4),
	"Taranaki Grid Easting" NUMBER(10,2),
	"Taranaki Grid Northing" NUMBER(10,2),
	"Notes" VARCHAR(500),
	SHAPE GEOGRAPHY
);
create or replace TABLE RAMM_FACT_GIS_TRAFFIC_LOADING (
	"tload_asset_id" NUMBER(10,0),
	"traffic_loading_id" NUMBER(10,0),
	"Latest" VARCHAR(10),
	"CountDate" VARCHAR(50),
	"Direction" VARCHAR(50),
	"PeakTraffic" NUMBER(13,3),
	"PeakHour" VARCHAR(50),
	"AverageDailyTraffic" NUMBER(13,3),
	"PercentCar" NUMBER(13,3),
	"PercentLightCommercial" NUMBER(13,3),
	"PercentMediumCommercial" NUMBER(13,3),
	"PercentHeavyCommercial" NUMBER(13,3),
	"PercentHeavyCommercial2" NUMBER(13,3),
	"Notes" VARCHAR(500),
	"Shape" GEOGRAPHY,
	"RoadID" NUMBER(10,0),
	"RoadName" VARCHAR(100)
);

use role accountadmin;


