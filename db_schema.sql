-- Create Scheduled Flights Table
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
	PRIMARY KEY (flight_id),
	FOREIGN KEY (mkt_unique_carrier) REFERENCES airlines(mkt_unique_carrier),
	FOREIGN KEY (origin) REFERENCES airports(airport_code),
	FOREIGN KEY (dest) REFERENCES airports(airport_code)
);


-- Create Flights Actual Table
CREATE TABLE flights_actual(
	flight_id VARCHAR(10), 
	taxi_out FLOAT(2), -- in minutes
	air_time FLOAT(2), -- in minutes *need to create this field* actual_elapsed_time - (taxi_in + taxi_out)
	taxi_in FLOAT(2), -- in minutes
	actual_elapsed_time FLOAT(2), -- in minutes
	PRIMARY KEY (flight_id)
);


-- Create Delayed and Cancelled Flights Table
CREATE TABLE delays_cancels(
	flight_id  VARCHAR(10),
	dep_del15 VARCHAR(3),
	dep_delay_new FLOAT(4), -- field excludes early departures
	arr_del15 VARCHAR(3),
	arr_delay_new FLOAT(4), -- excludes early arrivals
	total_delay FLOAT(2), -- need to create this field *(dep_delay_new + arr_delay_new)
	carrier_delay FLOAT(2), -- in minutes
	weather_delay FLOAT(2), -- in minutes
	nas_delay FLOAT(2), -- in minutes
	security_delay FLOAT(2),  -- in minutes
	late_aircraft FLOAT(2),  -- in minutes
	cancelled VARCHAR(3),
	cancel_code VARCHAR(4),
	PRIMARY KEY (flight_id),
	FOREIGN KEY (cancel_code) REFERENCES cancel_reason(cancel_code)
);



-- Create Airlines Table
CREATE TABLE airlines (
	mkt_unique_carrier VARCHAR(4) NOT NULL,
	carrier_name VARCHAR(30) NOT NULL,
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