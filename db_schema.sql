-- Create Scheduled Flights Table
CREATE TABLE flights_sched (
	flight_id  , -- how should we generate this?
	mkt_unique_carrier VARCHAR(4),
	mkt_carrier_fl_num VARCHAR(8),
	fl_date DATE, -- need to reformat from M/DD/YYYY to YYYY-MM-DD
	fl_month INT, -- 1 to 6 (Jan-June)
	day_of_month INT, -- 1 to 31
	day_of_week INT, -- 1 (Mon) to 7 (Sun)
	origin VARCHAR(5), -- origin airport_code from airports table
	dest VARCHAR(5), -- destination airport_code from airports table
	crs_dep_time INT, --CONFUSED on current format. Need to transform to timestamp?
	dep_time_blk  , -- HELP
	crs_arr_time INT, --CONFUSED on current format. Need to transform to time stamp?
	arr_time_blk  , -- HELP
	crs_elapsed_time FLOAT(4), -- in minutes
	distance INT, -- in miles
	distance_group INT, -- in 250-mile increments
	PRIMARY KEY (flight_id),
	FOREIGN KEY (mkt_unique_carrier),
	FOREIGN KEY (origin),
	FOREIGN KEY (dest)
);


-- Create Flights Actual Table
CREATE TABLE flights_actual(
	flight_id , -- how should we generate this?
	dep_time FLOAT(2), -- in minutes
	taxi_out FLOAT(2), -- in minutes
	air_time FLOAT(2), -- in minutes *need to create this field*
	taxi_in FLOAT(2), -- in minutes
	arr_time FLOAT(2), -- in minutes
	actual_elapsed_time FLOAT(2), -- in minutes *need to create this field*
	PRIMARY KEY (flight_id)
);


-- Create Delayed and Cancelled Flights Table
CREATE TABLE delays_cancels(
	flight_id  , -- how should we generate this?
	dep_del15 BOOLEAN, -- we will have to change 1s and 0s to True/False
	dep_delay FLOAT(4), -- use "dep_delay_new" column for this to exclude early departures
	dep_delay_group FLOAT(4),
	arr_del15 BOOLEAN, -- we will have to change 1s and 0s to True/False
	arr_delay FLOAT(4), -- use "arr_delay_new" column for this to exclude early arrivals
	arr_delay_group FLOAT(4),
	total_delay FLOAT(2), -- need to create this field by adding all delay types below
	carrier_delay FLOAT(2), -- in minutes
	weather_delay FLOAT(2), -- in minutes
	nas_delay FLOAT(2), -- in minutes
	security_delay FLOAT(2),  -- in minutes
	late_aircraft FLOAT(2),  -- in minutes
	cancelled BOOLEAN, -- we will have to change 1s and 0s to True/False
	cancel_code VARCHAR(4),
	PRIMARY KEY (flight_id),
	FOREIGN KEY(cancel_code)
);



-- Create Airlines Table
CREATE TABLE airlines (
	mkt_unique_carrier VARCHAR(4) NOT NULL,
	carrier_name VARCHAR(20) NOT NULL,
	PRIMARY KEY (mkt_unique_carrier),
	UNIQUE (mkt_unique_carrier)
);

-- Create Airport Locations Table
CREATE TABLE airports (
	airport_code VARCHAR(5) NOT NULL,
	state_nm VARCHAR (30) NOT NULL,
	PRIMARY KEY (airport_code), -- key to origin and dest fields
	UNIQUE (airport_code)
);

-- Create Cancellation Reasons Table
CREATE TABLE cancel_reason (
	cancel_code VARCHAR(4) NOT NULL,
	cancel_reason VARCHAR(40) NOT NULL,
	PRIMARY KEY (cancel_code),
	UNIQUE (cancel_code)
);