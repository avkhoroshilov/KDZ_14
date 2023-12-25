{\rtf1\ansi\ansicpg1251\cocoartf2757
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\froman\fcharset0 TimesNewRomanPSMT;\f1\froman\fcharset0 Times-Roman;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;\red190\green208\blue246;}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0;\cssrgb\c78824\c85490\c97255;}
\paperw11900\paperh16840\margl1440\margr1440\vieww17740\viewh15100\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs29\fsmilli14667 \cf0 \expnd0\expndtw0\kerning0
create schema if not exists kdz_14_staging;
\f1\fs24 \
\
\pard\pardeftab720\partightenfactor0

\f0\fs29\fsmilli14667 \cf0 \cb3 -- staging \uc0\u1082  src.airport\'a0
\f1\fs24 \cb1 \
\
\pard\pardeftab720\partightenfactor0

\f0\fs29\fsmilli14667 \cf0 drop table if exists kdz_14_staging.airport;
\f1\fs24 \

\f0\fs29\fsmilli14667 create table if not exists kdz_14_staging.airport (
\f1\fs24 \

\f0\fs29\fsmilli14667 		year_flight int not null
\f1\fs24 \

\f0\fs29\fsmilli14667 	,	quarter_flight int not null
\f1\fs24 \

\f0\fs29\fsmilli14667 	,	month_flight int not null
\f1\fs24 \

\f0\fs29\fsmilli14667 	,	sch_flight_date timestamp not null
\f1\fs24 \

\f0\fs29\fsmilli14667 	,	act_flight_date timestamp null
\f1\fs24 \

\f0\fs29\fsmilli14667 	,	reporting_airline varchar(8) null
\f1\fs24 \

\f0\fs29\fsmilli14667 	,	tail_number varchar(15) null
\f1\fs24 \

\f0\fs29\fsmilli14667 	,	flight_number int null
\f1\fs24 \

\f0\fs29\fsmilli14667 	, \'a0 	origin varchar(8) null
\f1\fs24 \

\f0\fs29\fsmilli14667 	,	destination varchar(8) null
\f1\fs24 \

\f0\fs29\fsmilli14667 	,	sch_dep_time time null
\f1\fs24 \

\f0\fs29\fsmilli14667 	,	act_dep_time time null
\f1\fs24 \

\f0\fs29\fsmilli14667 	,	dep_delay int null
\f1\fs24 \

\f0\fs29\fsmilli14667 	,	cancelled int null
\f1\fs24 \

\f0\fs29\fsmilli14667 	,	cancellation_code varchar (2) null
\f1\fs24 \

\f0\fs29\fsmilli14667 	,	airtime int null
\f1\fs24 \

\f0\fs29\fsmilli14667 	,	distance int null
\f1\fs24 \

\f0\fs29\fsmilli14667 	,	weatherdelay int null
\f1\fs24 \

\f0\fs29\fsmilli14667 	,	loaded_ts timestamp not null default (now())
\f1\fs24 \

\f0\fs29\fsmilli14667 	,	primary key(sch_flight_date, flight_number, origin, destination)
\f1\fs24 \

\f0\fs29\fsmilli14667 );
\f1\fs24 \
\
\

\f0\fs29\fsmilli14667 insert into kdz_14_staging.airport\'a0
\f1\fs24 \

\f0\fs29\fsmilli14667 (year_flight, quarter_flight, month_flight, sch_flight_date, act_flight_date, reporting_airline, tail_number,
\f1\fs24 \

\f0\fs29\fsmilli14667 flight_number, origin, destination, sch_dep_time, act_dep_time, dep_delay,
\f1\fs24 \

\f0\fs29\fsmilli14667 cancelled, cancellation_code, airtime, distance, weatherdelay)
\f1\fs24 \

\f0\fs29\fsmilli14667 	select
\f1\fs24 \

\f0\fs29\fsmilli14667 			year_flight\'a0
\f1\fs24 \

\f0\fs29\fsmilli14667 		,	quarter_flight
\f1\fs24 \

\f0\fs29\fsmilli14667 		,	month_flight
\f1\fs24 \

\f0\fs29\fsmilli14667 		,	sch_flight_date
\f1\fs24 \

\f0\fs29\fsmilli14667 		,	act_flight_date
\f1\fs24 \

\f0\fs29\fsmilli14667 		,	reporting_airline
\f1\fs24 \

\f0\fs29\fsmilli14667 		,	tail_number
\f1\fs24 \

\f0\fs29\fsmilli14667 		,	flight_number
\f1\fs24 \

\f0\fs29\fsmilli14667 		,	origin
\f1\fs24 \

\f0\fs29\fsmilli14667 		,	destination
\f1\fs24 \

\f0\fs29\fsmilli14667 		,	sch_dep_time
\f1\fs24 \

\f0\fs29\fsmilli14667 		,	act_dep_time
\f1\fs24 \

\f0\fs29\fsmilli14667 		,	dep_delay
\f1\fs24 \

\f0\fs29\fsmilli14667 		,	cancelled
\f1\fs24 \

\f0\fs29\fsmilli14667 		,	cancellation_code
\f1\fs24 \

\f0\fs29\fsmilli14667 		,	airtime
\f1\fs24 \

\f0\fs29\fsmilli14667 		,	distance
\f1\fs24 \

\f0\fs29\fsmilli14667 		,	weatherdelay
\f1\fs24 \

\f0\fs29\fsmilli14667 	from kdz_14_etl.airport
\f1\fs24 \

\f0\fs29\fsmilli14667 	on conflict (sch_flight_date, flight_number, origin, destination) do update
\f1\fs24 \

\f0\fs29\fsmilli14667 	set
\f1\fs24 \

\f0\fs29\fsmilli14667 		 	act_flight_date = excluded.act_flight_date
\f1\fs24 \

\f0\fs29\fsmilli14667 		,	reporting_airline = excluded.reporting_airline
\f1\fs24 \

\f0\fs29\fsmilli14667 		,	tail_number = excluded.tail_number
\f1\fs24 \

\f0\fs29\fsmilli14667 		--,	origin = excluded.origin
\f1\fs24 \

\f0\fs29\fsmilli14667 		--,	destination = excluded.destination
\f1\fs24 \

\f0\fs29\fsmilli14667 		--,	sch_dep_time = excluded.sch_dep_time
\f1\fs24 \

\f0\fs29\fsmilli14667 		,	act_dep_time = excluded.act_dep_time
\f1\fs24 \

\f0\fs29\fsmilli14667 		,	dep_delay = excluded.dep_delay
\f1\fs24 \

\f0\fs29\fsmilli14667 		,	cancelled = excluded.cancelled
\f1\fs24 \

\f0\fs29\fsmilli14667 		,	cancellation_code = excluded.cancellation_code
\f1\fs24 \

\f0\fs29\fsmilli14667 		,	airtime = excluded.airtime
\f1\fs24 \

\f0\fs29\fsmilli14667 		,	distance = excluded.distance
\f1\fs24 \

\f0\fs29\fsmilli14667 		,	weatherdelay = excluded.weatherdelay
\f1\fs24 \

\f0\fs29\fsmilli14667 		,	loaded_ts = now()
\f1\fs24 \

\f0\fs29\fsmilli14667 ;
\f1\fs24 \
\
\

\f0\fs29\fsmilli14667 delete from kdz_14_etl.load_airport\'a0
\f1\fs24 \

\f0\fs29\fsmilli14667 where exists (select 1 from kdz_14_etl.load_airport)
\f1\fs24 \

\f0\fs29\fsmilli14667 ;
\f1\fs24 \
\

\f0\fs29\fsmilli14667 insert into kdz_14_etl.load_airport (loaded_ts)
\f1\fs24 \

\f0\fs29\fsmilli14667 	select ts2
\f1\fs24 \

\f0\fs29\fsmilli14667 	from kdz_14_etl.load_airport_min_max
\f1\fs24 \

\f0\fs29\fsmilli14667 	where exists (select 1 from kdz_14_etl.load_airport_min_max)
\f1\fs24 \

\f0\fs29\fsmilli14667 ;
\f1\fs24 \
\
\
\
\
\
\pard\pardeftab720\partightenfactor0

\f0\fs29\fsmilli14667 \cf0 \cb3 -- staging \uc0\u1082  src.weather
\f1\fs24 \cb1 \
\
\
\pard\pardeftab720\partightenfactor0

\f0\fs29\fsmilli14667 \cf0 insert into kdz_14_staging.weather
\f1\fs24 \

\f0\fs29\fsmilli14667 (icao_code, local_datetime, temperature, pressure0,	pressure, humidity
\f1\fs24 \

\f0\fs29\fsmilli14667 , wind_direction, wind_speed, max_gustvalue, w_phenomena_special, w_phenomena_recent
\f1\fs24 \

\f0\fs29\fsmilli14667 , clouds, horizontal_visibility, dewpoint )
\f1\fs24 \

\f0\fs29\fsmilli14667 select
\f1\fs24 \

\f0\fs29\fsmilli14667 		icao_code
\f1\fs24 \

\f0\fs29\fsmilli14667 	,	local_datetime
\f1\fs24 \

\f0\fs29\fsmilli14667 	,	temperature\'a0
\f1\fs24 \

\f0\fs29\fsmilli14667 	,	pressure0
\f1\fs24 \

\f0\fs29\fsmilli14667 	,	pressure
\f1\fs24 \

\f0\fs29\fsmilli14667 	,	humidity
\f1\fs24 \

\f0\fs29\fsmilli14667 	,	wind_direction
\f1\fs24 \

\f0\fs29\fsmilli14667 	,	wind_speed
\f1\fs24 \

\f0\fs29\fsmilli14667 	,	max_gustvalue
\f1\fs24 \

\f0\fs29\fsmilli14667 	,	w_phenomena_special
\f1\fs24 \

\f0\fs29\fsmilli14667 	,	w_phenomena_recent
\f1\fs24 \

\f0\fs29\fsmilli14667 	,	clouds
\f1\fs24 \

\f0\fs29\fsmilli14667 	,	horizontal_visibility
\f1\fs24 \

\f0\fs29\fsmilli14667 	,	dewpoint
\f1\fs24 \

\f0\fs29\fsmilli14667 from kdz_14_etl.weather
\f1\fs24 \

\f0\fs29\fsmilli14667 on conflict (icao_code, local_datetime) do update
\f1\fs24 \

\f0\fs29\fsmilli14667 	set
\f1\fs24 \

\f0\fs29\fsmilli14667 			temperature = excluded.temperature
\f1\fs24 \

\f0\fs29\fsmilli14667 		,	pressure0 = excluded.pressure0
\f1\fs24 \

\f0\fs29\fsmilli14667 		,	pressure = excluded.pressure
\f1\fs24 \

\f0\fs29\fsmilli14667 		,	humidity = excluded.humidity
\f1\fs24 \

\f0\fs29\fsmilli14667 		,	wind_direction = excluded.wind_direction
\f1\fs24 \

\f0\fs29\fsmilli14667 		,	wind_speed = excluded.wind_speed
\f1\fs24 \

\f0\fs29\fsmilli14667 		,	max_gustvalue = excluded.max_gustvalue
\f1\fs24 \

\f0\fs29\fsmilli14667 		,	w_phenomena_special = excluded.w_phenomena_special
\f1\fs24 \

\f0\fs29\fsmilli14667 		,	w_phenomena_recent = excluded.w_phenomena_recent
\f1\fs24 \

\f0\fs29\fsmilli14667 		,	clouds = excluded.clouds
\f1\fs24 \

\f0\fs29\fsmilli14667 		,	horizontal_visibility = excluded.horizontal_visibility
\f1\fs24 \

\f0\fs29\fsmilli14667 		,	dewpoint = excluded.dewpoint
\f1\fs24 \

\f0\fs29\fsmilli14667 		,	loaded_ts = now()
\f1\fs24 \

\f0\fs29\fsmilli14667 ;
\f1\fs24 \
\

\f0\fs29\fsmilli14667 delete from kdz_14_etl.load_weather\'a0
\f1\fs24 \

\f0\fs29\fsmilli14667 where exists (select 1 from kdz_14_etl.load_weather)
\f1\fs24 \

\f0\fs29\fsmilli14667 ;
\f1\fs24 \
\

\f0\fs29\fsmilli14667 insert into kdz_14_etl.load_weather (loaded_ts)
\f1\fs24 \

\f0\fs29\fsmilli14667 	select ts2
\f1\fs24 \

\f0\fs29\fsmilli14667 	from kdz_14_etl.load_weather_min_max
\f1\fs24 \

\f0\fs29\fsmilli14667 	where exists (select 1 from kdz_14_etl.load_weather_min_max)
\f1\fs24 \

\f0\fs29\fsmilli14667 ;}