Test_Linnear_Regression.sql
	CREATE TABLE flights_sched (
	flight_id  VARCHAR(10),
	mkt_unique_carrier VARCHAR(4),
	mkt_carrier_fl_num VARCHAR(8),
	fl_date DATE, -- need to reformat from M/DD/YYYY to YYYY-MM-DD
	fl_month INT, -- 1 to 6 (Jan-June)
	day_of_month INT, -- 1 to 31
	day_of_week INT, -- 1 (Mon) to 7 (Sun)
	origin VARCHAR(5), -- origin airport_code from airports table
	dest VARCHAR(5), -- destination airport_code from airports table
	dep_time_blk  INT, -- need to truncate to first 2 digits
	arr_time_blk  INT, -- need to truncate to first 2 digits
	crs_elapsed_time FLOAT(4), -- in minutes
	distance INT, -- in miles
	PRIMARY KEY (flight_id));
	
	CREATE TABLE encoded_cancel (
	flight_id  VARCHAR(10),
	CANCELLATION_CODE_A VARCHAR(4),
	CANCELLATION_CODE_B VARCHAR(4),
	CANCELLATION_CODE_C VARCHAR(4),
	CANCELLATION_CODE_D VARCHAR(4),
	CANCELLATION_CODE_E VARCHAR(4),
	PRIMARY KEY (flight_id));
	SELECT * FROM encoded_cancel;
	
CREATE TABLE merged_table2 AS
	SELECT encoded_cancel.CANCELLATION_CODE_A, encoded_cancel.CANCELLATION_CODE_B, encoded_cancel.CANCELLATION_CODE_C, encoded_cancel.CANCELLATION_CODE_D, encoded_cancel.CANCELLATION_CODE_E, encoded_cancel.flight_id,
	flights_sched.MKT_CARRIER_FL_NUM, flights_sched.FL_DATE, flights_sched.fl_month, flights_sched.DAY_OF_MONTH, flights_sched.DAY_OF_WEEK, flights_sched.DEP_TIME_BLK, flights_sched.ARR_TIME_BLK, flights_sched.CRS_ELAPSED_TIME, flights_sched.DISTANCE
	FROM encoded_cancel
	JOIN flights_sched 
	ON encoded_cancel.flight_id = flights_sched.flight_id
SELECT * FROM merged_table2;
