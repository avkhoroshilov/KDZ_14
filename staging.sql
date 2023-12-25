create schema if not exists kdz_14_staging;

-- staging к src.airport 

drop table if exists kdz_14_staging.airport;
create table if not exists kdz_14_staging.airport (
		year_flight int not null
	,	quarter_flight int not null
	,	month_flight int not null
	,	sch_flight_date timestamp not null
	,	act_flight_date timestamp null
	,	reporting_airline varchar(8) null
	,	tail_number varchar(15) null
	,	flight_number int null
	,   	origin varchar(8) null
	,	destination varchar(8) null
	,	sch_dep_time time null
	,	act_dep_time time null
	,	dep_delay int null
	,	cancelled int null
	,	cancellation_code varchar (2) null
	,	airtime int null
	,	distance int null
	,	weatherdelay int null
	,	loaded_ts timestamp not null default (now())
	,	primary key(sch_flight_date, flight_number, origin, destination)
);


insert into kdz_14_staging.airport 
(year_flight, quarter_flight, month_flight, sch_flight_date, act_flight_date, reporting_airline, tail_number,
flight_number, origin, destination, sch_dep_time, act_dep_time, dep_delay,
cancelled, cancellation_code, airtime, distance, weatherdelay)
	select
			year_flight 
		,	quarter_flight
		,	month_flight
		,	sch_flight_date
		,	act_flight_date
		,	reporting_airline
		,	tail_number
		,	flight_number
		,	origin
		,	destination
		,	sch_dep_time
		,	act_dep_time
		,	dep_delay
		,	cancelled
		,	cancellation_code
		,	airtime
		,	distance
		,	weatherdelay
	from kdz_14_etl.airport
	on conflict (sch_flight_date, flight_number, origin, destination) do update
	set
		 	act_flight_date = excluded.act_flight_date
		,	reporting_airline = excluded.reporting_airline
		,	tail_number = excluded.tail_number
		--,	origin = excluded.origin
		--,	destination = excluded.destination
		--,	sch_dep_time = excluded.sch_dep_time
		,	act_dep_time = excluded.act_dep_time
		,	dep_delay = excluded.dep_delay
		,	cancelled = excluded.cancelled
		,	cancellation_code = excluded.cancellation_code
		,	airtime = excluded.airtime
		,	distance = excluded.distance
		,	weatherdelay = excluded.weatherdelay
		,	loaded_ts = now()
;


delete from kdz_14_etl.load_airport 
where exists (select 1 from kdz_14_etl.load_airport)
;

insert into kdz_14_etl.load_airport (loaded_ts)
	select ts2
	from kdz_14_etl.load_airport_min_max
	where exists (select 1 from kdz_14_etl.load_airport_min_max)
;

-- staging к src.weather

insert into kdz_14_staging.weather
(icao_code, local_datetime, temperature, pressure0,	pressure, humidity
, wind_direction, wind_speed, max_gustvalue, w_phenomena_special, w_phenomena_recent
, clouds, horizontal_visibility, dewpoint )
select
		icao_code
	,	local_datetime
	,	temperature 
	,	pressure0
	,	pressure
	,	humidity
	,	wind_direction
	,	wind_speed
	,	max_gustvalue
	,	w_phenomena_special
	,	w_phenomena_recent
	,	clouds
	,	horizontal_visibility
	,	dewpoint
from kdz_14_etl.weather
on conflict (icao_code, local_datetime) do update
	set
			temperature = excluded.temperature
		,	pressure0 = excluded.pressure0
		,	pressure = excluded.pressure
		,	humidity = excluded.humidity
		,	wind_direction = excluded.wind_direction
		,	wind_speed = excluded.wind_speed
		,	max_gustvalue = excluded.max_gustvalue
		,	w_phenomena_special = excluded.w_phenomena_special
		,	w_phenomena_recent = excluded.w_phenomena_recent
		,	clouds = excluded.clouds
		,	horizontal_visibility = excluded.horizontal_visibility
		,	dewpoint = excluded.dewpoint
		,	loaded_ts = now()
;

delete from kdz_14_etl.load_weather 
where exists (select 1 from kdz_14_etl.load_weather)
;

insert into kdz_14_etl.load_weather (loaded_ts)
	select ts2
	from kdz_14_etl.load_weather_min_max
	where exists (select 1 from kdz_14_etl.load_weather_min_max)
;
