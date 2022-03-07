Linear Regression.sql
SELECT * FROM flights_sched;
SELECT * FROM flights_sched_dely
CREATE TABLE encoded_cancel (
	flight_id  VARCHAR(10),
	CANCELLATION_CODE_A VARCHAR(4),
	CANCELLATION_CODE_B VARCHAR(4),
	CANCELLATION_CODE_C VARCHAR(4),
	CANCELLATION_CODE_D VARCHAR(4),
	CANCELLATION_CODE_E VARCHAR(4),
	PRIMARY KEY (flight_id));
CREATE TABLE encoded_orgin (
	flight_id  VARCHAR(10),
	ORIGIN_STATE_NM_California VARCHAR(4),
	ORIGIN_STATE_NM_Colorado VARCHAR(4),
	ORIGIN_STATE_NM_Florida VARCHAR(4),
	ORIGIN_STATE_NM_Georgia VARCHAR(4),
	ORIGIN_STATE_NM_Illinois VARCHAR(4),
	ORIGIN_STATE_NM_New_York VARCHAR(4),
	ORIGIN_STATE_NM_North_Carolina VARCHAR(4),
	ORIGIN_STATE_NM_Other VARCHAR(4),
	ORIGIN_STATE_NM_Texas VARCHAR(4),
	ORIGIN_STATE_NM_Virginia VARCHAR(4),
	PRIMARY KEY (flight_id));
	
	CREATE TABLE encoded_dest (
	flight_id  VARCHAR(10),
	ORIGIN_STATE_NM_California VARCHAR(4),
	ORIGIN_STATE_NM_Colorado VARCHAR(4),
	ORIGIN_STATE_NM_Florida VARCHAR(4),
	ORIGIN_STATE_NM_Georgia VARCHAR(4),
	ORIGIN_STATE_NM_Illinois VARCHAR(4),
	ORIGIN_STATE_NM_New_York VARCHAR(4),
	ORIGIN_STATE_NM_North_Carolina VARCHAR(4),
	ORIGIN_STATE_NM_Other VARCHAR(4),
	ORIGIN_STATE_NM_Texas VARCHAR(4),
	ORIGIN_STATE_NM_Virginia VARCHAR(4),
	PRIMARY KEY (flight_id));
	
	CREATE TABLE encoded_carrier (
	flight_id  VARCHAR(10),
	MKT_UNIQUE_CARRIER_AA VARCHAR(4),
	MKT_UNIQUE_CARRIER_AS VARCHAR(4),
	MKT_UNIQUE_CARRIER_B6 VARCHAR(4),
	MKT_UNIQUE_CARRIER_DL VARCHAR(4),
	MKT_UNIQUE_CARRIER_F9 VARCHAR(4),
	MKT_UNIQUE_CARRIER_G4 VARCHAR(4),
	MKT_UNIQUE_CARRIER_HA VARCHAR(4),
	MKT_UNIQUE_CARRIER_NK VARCHAR(4),
	MKT_UNIQUE_CARRIER_UA VARCHAR(4),
	MKT_UNIQUE_CARRIER_WN VARCHAR(4),
	PRIMARY KEY (flight_id));
	
CREATE TABLE merged_Cancel AS
select flights_sched.*, 
encoded_orgin.ORIGIN_STATE_NM_California,
encoded_orgin.ORIGIN_STATE_NM_Colorado,
encoded_orgin.ORIGIN_STATE_NM_Florida,
encoded_orgin.ORIGIN_STATE_NM_Georgia,
encoded_orgin.ORIGIN_STATE_NM_Illinois,
encoded_orgin.ORIGIN_STATE_NM_New_York,
encoded_orgin.ORIGIN_STATE_NM_North_Carolina,
encoded_orgin.ORIGIN_STATE_NM_Other,
encoded_orgin.ORIGIN_STATE_NM_Texas,
encoded_orgin.ORIGIN_STATE_NM_Virginia,
encoded_dest2.DEST_STATE_NM_California,
encoded_dest2.DEST_STATE_NM_Colorado,
encoded_dest2.DEST_STATE_NM_Florida,
encoded_dest2.DEST_STATE_NM_Georgia,
encoded_dest2.DEST_STATE_NM_Illinois,
encoded_dest2.DEST_STATE_NM_New_York,
encoded_dest2.DEST_STATE_NM_North_Carolina,
encoded_dest2.DEST_STATE_NM_Other,
encoded_dest2.DEST_STATE_NM_Texas,
encoded_dest2.DEST_STATE_NM_Virginia,
encoded_carrier.MKT_UNIQUE_CARRIER_AA,
encoded_carrier.MKT_UNIQUE_CARRIER_AS,
encoded_carrier.MKT_UNIQUE_CARRIER_B6,
encoded_carrier.MKT_UNIQUE_CARRIER_DL,
encoded_carrier.MKT_UNIQUE_CARRIER_F9,
encoded_carrier.MKT_UNIQUE_CARRIER_G4,
encoded_carrier.MKT_UNIQUE_CARRIER_HA,
encoded_carrier.MKT_UNIQUE_CARRIER_NK,
encoded_carrier.MKT_UNIQUE_CARRIER_UA,
encoded_carrier.MKT_UNIQUE_CARRIER_WN,
encoded_cancel.CANCELLATION_CODE_A,
encoded_cancel.CANCELLATION_CODE_B,
encoded_cancel.CANCELLATION_CODE_C,
encoded_cancel.CANCELLATION_CODE_D,
encoded_cancel.CANCELLATION_CODE_E
from flights_sched
join encoded_orgin on flights_sched.flight_id= encoded_orgin.flight_id
join encoded_dest2 on flights_sched.flight_id = encoded_dest2.flight_id
join encoded_carrier on flights_sched.flight_id = encoded_carrier.flight_id
join encoded_cancel on flights_sched.flight_id = encoded_cancel.flight_id	
	
ALTER TABLE merged_cancel
DROP COLUMN MKT_UNIQUE_CARRIER,
DROP COLUMN ORIGIN,
DROP COLUMN DEST;
Select * from merged_cancel;
	