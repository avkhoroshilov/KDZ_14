drop table if exists dwh.kdz_14_mart_load_01;
create table if not exists dwh.kdz_14_mart_load_01 as
select
	airport_origin_dk,
	airport_dest_dk as airport_destination_dk,
	weather_type_dk,
	flight_dep_scheduled_ts as flight_scheduled_ts,
	flight_dep_actual_ts as flight_actual_time,
	flight_number_reporting_airline as flight_number, 
	distance,
	tail_number,
	report_airline as airline,
	dep_delay_minutes as dep_delay_min,
	cancelled,
	cancellation_code,
	t,
	max_gws,
	w_speed,
	air_time,
	'14' as author,
	now() as loaded_ts
from kdz_14_dds.flights as t1
inner join kdz_14_dds.airoport_weather as t2
	on t1.flight_dep_scheduled_ts >= t2.date_start and t1.flight_dep_scheduled_ts < t2.date_end
	and (t1.airport_origin_dk = t2.airport_dk or t1.airport_dest_dk = t2.airport_dk)

insert into mart.fact_departure (
	airport_origin_dk,
	airport_destination_dk,
	weather_type_dk,
	flight_scheduled_ts,
	flight_actual_time,
	flight_number,
	distance,
	tail_number,
	airline,
	dep_delay_min,
	cancelled,
	cancellation_code,
	t,
	max_gws,
	w_speed,
	air_time,
	author,
	loaded_ts
	) select *
	from dwh.kdz_14_mart_load_01