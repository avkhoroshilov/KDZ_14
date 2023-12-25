SRC-уровень
psql "host= c-c9qia8aq371ibav26ned.rw.mdb.yandexcloud.net port=6432 sslmode=verify-full dbname=hse_main user=sa target_session_attrs=read-write"

--AIRPORT
drop table if exists kdz_14_src.airport;
create table if not exists kdz_14_src.airport (
	year_flight int NOT NULL,
	quarter_flight int NULL,
	month_flight int NOT NULL,		
	flight_date varchar(30) NOT NULL,
	reporting_airline varchar(10) NULL,
	tail_number varchar(10) NULL,
	flight_number int not NULL,
	origin varchar(3) NULL,
	destination varchar(3) NULL,
	crsdeptime varchar(4) NULL,
	dep_time varchar(4) NULL,
	dep_delay float NULL,
	cancelled float NULL,
	cancellationcode varchar(1) NULL,
	airtime float NULL,
	distance float NULL,
	weatherdelay float NULL,
	loaded_ts timestamp not null default (now())
);

\copy kdz_14_src.airport(year_flight, quarter_flight, month_flight, flight_date, reporting_airline, tail_number, flight_number, origin, destination, crsdeptime, dep_time, dep_delay, cancelled, cancellationcode, airtime, distance , weatherdelay) from '/Users/arinakoshaeva/Downloads/kdz/airport_may.csv' with delimiter ',' CSV HEADER;

\copy kdz_14_src.airport(year_flight, quarter_flight, month_flight, flight_date, reporting_airline, tail_number, flight_number, origin, destination, crsdeptime, dep_time, dep_delay, cancelled, cancellationcode, airtime, distance , weatherdelay) from '/Users/arinakoshaeva/Downloads/kdz/airport_june.csv' with delimiter ',' CSV HEADER;

\copy kdz_14_src.airport(year_flight, quarter_flight, month_flight, flight_date, reporting_airline, tail_number, flight_number, origin, destination, crsdeptime, dep_time, dep_delay, cancelled, cancellationcode, airtime, distance , weatherdelay) from '/Users/arinakoshaeva/Downloads/kdz/airport_july.csv' with delimiter ',' CSV HEADER;

\copy kdz_14_src.airport(year_flight, quarter_flight, month_flight, flight_date, reporting_airline, tail_number, flight_number, origin, destination, crsdeptime, dep_time, dep_delay, cancelled, cancellationcode, airtime, distance , weatherdelay) from '/Users/arinakoshaeva/Downloads/kdz/airport_august.csv' with delimiter ',' CSV HEADER;



--WEATHER

drop table if exists kdz_14_src.weather;
create table if not exists kdz_14_src.weather (
	icao varchar(10) not null default ('KCLT'),
	local_time varchar(50) NOT NULL,
	temperature float NULL,
	pressure0 float null,
	pressure float null,
	humidity int null,
	wind_direction varchar(200) null,
	wind_speed int NULL,
	max_gustvalue int null,	
	w_phenomena_special varchar(200) NULL,
	w_phenomena_recent varchar(200) NULL,
	clouds varchar(500) NULL,
	horizontal_visibility float NULL,
	dewpoint float null,
	extra varchar(100) null,
	loaded_ts timestamp not null default (now())
);

\copy kdz_14_src.weather (local_time, temperature, pressure0, pressure, humidity, wind_direction, wind_speed, max_gustvalue, w_phenomena_special, w_phenomena_recent, clouds, horizontal_visibility, dewpoint, extra) from '/Users/arinakoshaeva/Downloads/kdz/weather.csv' with delimiter ';' CSV HEADER;
