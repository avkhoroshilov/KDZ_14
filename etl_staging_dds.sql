--airoport_weather

-- маркер последнего обработанного значения
create table if not exists etl.kdz_14_dds_load_weather_03(
loaded_ts timestamp not null primary key);


--Находим самые свежие правки
drop table if exists etl.kdz_14_dds_load_weather_01;
create table if not exists etl.kdz_14_dds_load_weather_01 as
select
	min(loaded_ts) as ts1,
	max(loaded_ts) as ts2
from kdz_14_staging.weather
where loaded_ts >= coalesce((select max(loaded_ts) 
from etl.kdz_14_dds_load_weather_03), '1970-01-01');

select * from etl.kdz_14_dds_load_weather_01

--чтение сырых данных
drop table if exists etl.kdz_14_dds_load_weather_02;
create table if not exists etl.kdz_14_dds_load_weather_02 as
select distinct
	(select dwh_dk from dwh.id_airport where src_icao_id = icao_code) as airport_dk,
	cast(temperature<0 as int) as cold,
	case when (lower(w_phenomena_special) like '%rain%') or (lower(w_phenomena_recent) like '%rain%') then 1 else 0 end as rain,
	case when (lower(w_phenomena_special) like '%snow%') or (lower(w_phenomena_recent) like '%snow%') then 1 else 0 end as snow,
	case when (lower(w_phenomena_special) like '%thunderstorm%') or (lower(w_phenomena_recent) like '%thunderstorm%') then 1 else 0 end as thunderstorm,
	case when (lower(w_phenomena_special) like '%drizzle') or (lower(w_phenomena_recent) like '%tdrizzle%') then 1 else 0 end as drizzle,
	case when (lower(w_phenomena_special) like '%fog') or (lower(w_phenomena_recent) like '%fog%') or (lower(w_phenomena_special) like '%mist%') or (lower(w_phenomena_recent) like '%mist%')then 1 else 0 end as fog_mist,
	concat(cast(temperature<0 as int),
	case when (lower(w_phenomena_special) like '%rain%') or (lower(w_phenomena_recent) like '%rain%') then 1 else 0 end,
	case when (lower(w_phenomena_special) like '%snow%') or (lower(w_phenomena_recent) like '%snow%') then 1 else 0 end,
	case when (lower(w_phenomena_special) like '%thunderstorm%') or (lower(w_phenomena_recent) like '%thunderstorm%') then 1 else 0 end,
	case when (lower(w_phenomena_special) like '%drizzle') or (lower(w_phenomena_recent) like '%tdrizzle%') then 1 else 0 end,
	case when (lower(w_phenomena_special) like '%fog') or (lower(w_phenomena_recent) like '%fog%') or (lower(w_phenomena_special) like '%mist%') or (lower(w_phenomena_recent) like '%mist%')then 1 else 0 end) as weather_type_dk,
	temperature as t,
	max_gustvalue as max_gws,
	wind_speed as w_speed,
	local_datetime as date_start,
	coalesce(lead(local_datetime) over (order by local_datetime), '3000-01-01'::timestamp) as date_end
from kdz_14_staging.weather	
	
select * from etl.kdz_14_dds_load_weather_02


-- при последующих запусках, ограничение необходимо для уменьшения времени и ресурсов
drop table if exists etl.kdz_14_dds_load_weather_02;
create table if not exists etl.kdz_14_dds_load_weather_02 as
select distinct
	(select dwh_dk from dwh.id_airport where src_icao_id = icao_code) as airport_dk,
	cast(temperature<0 as int) as cold,
	case when (lower(w_phenomena_special) like '%rain%') or (lower(w_phenomena_recent) like '%rain%') then 1 else 0 end as rain,
	case when (lower(w_phenomena_special) like '%snow%') or (lower(w_phenomena_recent) like '%snow%') then 1 else 0 end as snow,
	case when (lower(w_phenomena_special) like '%thunderstorm%') or (lower(w_phenomena_recent) like '%thunderstorm%') then 1 else 0 end as thunderstorm,
	case when (lower(w_phenomena_special) like '%drizzle') or (lower(w_phenomena_recent) like '%tdrizzle%') then 1 else 0 end as drizzle,
	case when (lower(w_phenomena_special) like '%fog') or (lower(w_phenomena_recent) like '%fog%') or (lower(w_phenomena_special) like '%mist%') or (lower(w_phenomena_recent) like '%mist%')then 1 else 0 end as fog_mist,
	concat(cast(temperature<0 as int),
	case when (lower(w_phenomena_special) like '%rain%') or (lower(w_phenomena_recent) like '%rain%') then 1 else 0 end,
	case when (lower(w_phenomena_special) like '%snow%') or (lower(w_phenomena_recent) like '%snow%') then 1 else 0 end,
	case when (lower(w_phenomena_special) like '%thunderstorm%') or (lower(w_phenomena_recent) like '%thunderstorm%') then 1 else 0 end,
	case when (lower(w_phenomena_special) like '%drizzle') or (lower(w_phenomena_recent) like '%tdrizzle%') then 1 else 0 end,
	case when (lower(w_phenomena_special) like '%fog') or (lower(w_phenomena_recent) like '%fog%') or (lower(w_phenomena_special) like '%mist%') or (lower(w_phenomena_recent) like '%mist%')then 1 else 0 end) as weather_type_dk,
	temperature as t,
	max_gustvalue as max_gws,
	wind_speed as w_speed,
	local_datetime as date_start,
	coalesce(lead(local_datetime) over (order by local_datetime), '3000-01-01'::timestamp) as date_end
from kdz_14_staging.weather, etl.kdz_14_dds_load_weather_01
where loaded_ts >= ts1 and loaded_ts <= ts2;

select * from etl.kdz_14_dds_load_flights_02



--flights
-- маркер последнего обработанного значения
create table if not exists etl.kdz_14_dds_load_flights_03(
loaded_ts timestamp not null primary key);

--Находим самые свежие правки
drop table if exists etl.kdz_14_dds_load_flights_01;
create table if not exists etl.kdz_14_dds_load_flights_01 as
select
	min(loaded_ts) as ts1,
	max(loaded_ts) as ts2
from kdz_14_staging.airport
where loaded_ts >= coalesce((select max(loaded_ts) 
from etl.kdz_14_dds_load_flights_03), '1970-01-01');

select * from etl.kdz_14_dds_load_flights_01

--чтение сырых данных
drop table if exists etl.kdz_14_dds_load_flights_02;
create table if not exists etl.kdz_14_dds_load_flights_02 as
select distinct
	year_flight as year, 
	quarter_flight as quarter, 
	month_flight as month,
	DATE(sch_flight_date) as flight_scheduled_date,
	DATE(act_flight_date) as flight_actual_date,
	sch_flight_date as flight_dep_scheduled_ts,
	act_flight_date as flight_dep_actual_ts,
	reporting_airline as report_airline,
	tail_number,
	flight_number as flight_number_reporting_airline,
	(select dwh_dk from dwh.id_airport where src_iata_id = origin) as airport_origin_dk,
	origin as origin_code,
	(select dwh_dk from dwh.id_airport where src_iata_id = destination) as airport_dest_dk,
	destination as dest_code,
	dep_delay as dep_delay_minutes,
	cancelled,
	cancellation_code,
	weatherdelay,
	airtime,
	distance
from kdz_14_staging.airport;

select * from etl.kdz_14_dds_load_flights_02


-- при последующих запусках, ограничение необходимо для уменьшения времени и ресурсов
drop table if exists etl.kdz_14_dds_load_flights_02;
create table if not exists etl.kdz_14_dds_load_flights_02 as
select distinct
year_flight as year, 
	quarter_flight as quarter, 
	month_flight as month,
	DATE(sch_flight_date) as flight_scheduled_date,
	DATE(act_flight_date) as flight_actual_date,
	sch_flight_date as flight_dep_scheduled_ts,
	act_flight_date as flight_dep_actual_ts,
	reporting_airline as report_airline,
	tail_number,
	flight_number as flight_number_reporting_airline,
	(select dwh_dk from dwh.id_airport where src_iata_id = origin) as airport_origin_dk,
	origin as origin_code,
	(select dwh_dk from dwh.id_airport where src_iata_id = destination) as airport_dest_dk,
	destination as dest_code,
	dep_delay as dep_delay_minutes,
	cancelled,
	cancellation_code,
	weatherdelay,
	airtime,
	distance
from kdz_14_staging.airport , etl.kdz_14_dds_load_flights_01
where loaded_ts >= ts1 and loaded_ts <= ts2;

select * from etl.kdz_14_dds_load_flights_02