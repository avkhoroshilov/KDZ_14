CREATE TABLE kdz_14_dds.airoport_weather (
	airport_dk int NOT NULL, -- постоянный ключ аэропорта. нужно взять из таблицы аэропортов
	weather_type_dk char(6) NOT NULL, -- постоянный ключ типа погоды. заполняется по формуле
	cold smallint default(0),
	rain smallint default(0),
	snow smallint default(0),
	thunderstorm smallint default(0),
	drizzle smallint default(0),
	fog_mist smallint default(0),
	t int NULL,
	max_gws int NULL,
	w_speed int NULL,
	date_start timestamp NOT NULL,
	date_end timestamp NOT NULL default('3000-01-01'::timestamp),
	loaded_ts timestamp default(now()),
	PRIMARY KEY (airport_dk, date_start)
);

CREATE TABLE kdz_14_dds.flights (
	year int NULL,
	quarter int NULL,
	month int NULL,
	flight_scheduled_date date NULL,
	flight_actual_date date NULL,
	flight_dep_scheduled_ts timestamp NOT NULL,
	flight_dep_actual_ts timestamp NULL,
	report_airline varchar(10) NOT NULL,
	tail_number varchar(10) NULL,
	flight_number_reporting_airline varchar(15) NOT NULL,
	airport_origin_dk int NULL, --постоянный ключ аэропорта. нужно взять из таблицы аэропортов
	origin_code varchar(5) null,
	airport_dest_dk int NULL,  --постоянный ключ аэропорта. нужно взять из таблицы аэропортов
	dest_code varchar(5) null,
	dep_delay_minutes float NULL,
	cancelled int NOT NULL,
	cancellation_code char(1) NULL,
	weather_delay float NULL,
	air_time float NULL,
	distance float NULL,
	loaded_ts timestamp default(now()),
	CONSTRAINT flights_pk PRIMARY KEY (flight_dep_scheduled_ts, flight_number_reporting_airline, origin_code, dest_code)
);


--Загрузим airoport_weather


-- Загрузка данных
insert into kdz_14_dds.airoport_weather(
	airport_dk,
	weather_type_dk,
	cold,
	rain,
	snow,
	thunderstorm,
	drizzle,
	fog_mist,
	t,
	max_gws,
	w_speed,
	date_start,
	date_end
	) select
	airport_dk,
	weather_type_dk,
	cold,
	rain,
	snow,
	thunderstorm,
	drizzle,
	fog_mist,
	t,
	max_gws,
	w_speed,
	date_start,
	date_end
from etl.kdz_14_dds_load_flights_02



--Загрузим flights

-- Загрузка данных
insert into kdz_14_dds.flights(
	year, 
	quarter, 
	month, 
	flight_scheduled_date,
	flight_actual_date,
	flight_dep_scheduled_ts,
	flight_dep_actual_ts,
	report_airline,
	tail_number,
	flight_number_reporting_airline,
	airport_origin_dk,
	origin_code,
	airport_dest_dk,
	dest_code,
	dep_delay_minutes,
	cancelled,
	cancellation_code,
	weather_delay,
	air_time,
	distance
	) select
	year, 
	quarter, 
	month, 
	flight_scheduled_date,
	flight_actual_date,
	flight_dep_scheduled_ts,
	flight_dep_actual_ts,
	report_airline,
	tail_number,
	flight_number_reporting_airline,
	airport_origin_dk,
	origin_code,
	airport_dest_dk,
	dest_code,
	dep_delay_minutes,
	cancelled,
	cancellation_code,
	weatherdelay,
	airtime,
	distance
from etl.kdz_14_dds_load_flights_02;
