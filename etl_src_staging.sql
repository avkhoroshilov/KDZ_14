create schema if not exists kdz_14_etl;

drop table if exists kdz_14_etl.load_airport;
create table if not exists kdz_14_etl.load_airport (
		loaded_ts timestamp not null
);

-- ETL (duplicates, increment)
drop table if exists kdz_14_etl.load_airport_min_max;
create table if not exists kdz_14_etl.load_airport_min_max as 
select
		min(loaded_ts) as ts1
	,	max(loaded_ts) as ts2
from kdz_14_src.airport 
where loaded_ts > coalesce((select max(loaded_ts) from kdz_14_etl.load_airport), '1970-01-01')
;


-- преобразование типов
drop table if exists kdz_14_etl.airport;
create table if not exists kdz_14_etl.airport as
select distinct
		year_flight 
	,	quarter_flight
	,	month_flight
	,	(to_date(flight_date, 'MM.DD.YYYY') + 
		make_time(cast(substring(crsdeptime, 1, 2) as int), cast(substring(crsdeptime, 3, 2) as int), 0.0))::timestamp as sch_flight_date
	,	case when make_time(cast(substring(dep_time, 1, 2) as int), cast(substring(dep_time, 3, 2) as int), 0.0) < 
				  make_time(cast(substring(crsdeptime, 1, 2) as int), cast(substring(crsdeptime, 3, 2) as int), 0.0)
				  and dep_delay > 0
				  then (to_date(flight_date, 'MM.DD.YYYY') + 1 + 
				  make_time(cast(substring(dep_time, 1, 2) as int), cast(substring(dep_time, 3, 2) as int), 0.0))::timestamp
			 when dep_time is null 
				  then null
             else (to_date(flight_date, 'MM.DD.YYYY') + 
             make_time(cast(substring(dep_time, 1, 2) as int), cast(substring(dep_time, 3, 2) as int), 0.0))::timestamp
        end as act_flight_date
	,	reporting_airline
	,	tail_number
	,	flight_number
	,	origin
 	,	destination
	,	make_time(cast(substring(crsdeptime, 1, 2) as int), cast(substring(crsdeptime, 3, 2) as int), 0.0) as sch_dep_time
	,	case when dep_time is null 
				  then null
			 else make_time(cast(substring(dep_time, 1, 2) as int), cast(substring(dep_time, 3, 2) as int), 0.0)
		end as act_dep_time
	,	cast(dep_delay as int)
	,	cast(cancelled as int)
	,	cancellationcode as cancellation_code
	,	cast(airtime as int)
	,	cast(distance as int)
	,	cast(weatherdelay as int)
from kdz_14_src.airport, kdz_14_etl.load_airport_min_max
where 1=1
and loaded_ts between ts1 and ts2
;

-- staging к src.weather

drop table if exists kdz_14_staging.weather;
create table if not exists kdz_14_staging.weather (
		icao_code varchar(10) not null
	,	local_datetime timestamp not null	
	,	temperature float8 null
	,	pressure0 float8 null
	,	pressure float8 null
	,	humidity int null
	,	wind_direction varchar(200) null
	,	wind_speed int null
	,	max_gustvalue int null
	,	w_phenomena_special varchar(200) null
	,	w_phenomena_recent varchar(200) null
	,	clouds varchar(500) null
	,	horizontal_visibility float8 null
	,	dewpoint int null
	,	loaded_ts timestamp not null default (now())
	,	primary key (icao_code, local_datetime)
);


drop table if exists kdz_14_etl.load_weather;
create table if not exists kdz_14_etl.load_weather (
		loaded_ts timestamp not null
);

-- ETL (duplicates, increment)

drop table if exists kdz_14_etl.load_weather_min_max;
create table if not exists kdz_14_etl.load_weather_min_max as 
select
		min(loaded_ts) as ts1
	,	max(loaded_ts) as ts2
from kdz_14_src.weather 
where loaded_ts > coalesce((select max(loaded_ts) from kdz_14_etl.load_weather), '1970-01-01')
;

-- преобразование типов

drop table if exists kdz_14_etl.weather;
create table if not exists kdz_14_etl.weather as
select distinct 
		icao as icao_code
	,	to_timestamp(local_time, 'DD.MM.YYYY HH24:MI:SS') as local_datetime
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
from kdz_14_src.weather, kdz_14_etl.load_weather_min_max
where 1=1
and loaded_ts between ts1 and ts2
;

