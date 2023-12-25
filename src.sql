{\rtf1\ansi\ansicpg1251\cocoartf2639
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\froman\fcharset0 TimesNewRomanPSMT;\f1\froman\fcharset0 Times-Bold;\f2\froman\fcharset0 Times-Roman;
\f3\froman\fcharset0 TimesNewRomanPS-BoldMT;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;\red107\green0\blue1;\red255\green255\blue255;
\red251\green0\blue7;\red0\green0\blue109;\red0\green0\blue255;\red15\green112\blue1;}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0;\cssrgb\c50196\c0\c0;\cssrgb\c100000\c100000\c100000;
\cssrgb\c100000\c0\c0;\cssrgb\c0\c0\c50196;\cssrgb\c0\c0\c100000;\cssrgb\c0\c50196\c0;}
\paperw11900\paperh16840\margl1440\margr1440\vieww10380\viewh12300\viewkind0
\deftab720
\pard\pardeftab720\sa160\qj\partightenfactor0

\f0\fs40 \cf0 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 SRC-\uc0\u1091 \u1088 \u1086 \u1074 \u1077 \u1085 \u1100 
\f1\b\fs48 \
\pard\pardeftab720\qj\partightenfactor0

\f0\b0\fs29\fsmilli14667 \cf0 psql "host= c-c9qia8aq371ibav26ned.rw.mdb.yandexcloud.net port=6432 sslmode=verify-full dbname=hse_main user=sa target_session_attrs=read-write"
\f2\fs24 \
\pard\pardeftab720\partightenfactor0
\cf0 \
\pard\pardeftab720\partightenfactor0

\f0\fs29\fsmilli14667 \cf0 --AIRPORT
\f2\fs24 \
\pard\pardeftab720\partightenfactor0

\f3\b\fs29\fsmilli14667 \cf3 \cb4 \strokec3 drop
\f0\b0 \cf0 \strokec2  
\f3\b \cf3 \strokec3 table
\f0\b0 \cf0 \strokec2  
\f3\b \cf3 \strokec3 if
\f0\b0 \cf0 \strokec2  
\f3\b \cf3 \strokec3 exists
\f0\b0 \cf0 \strokec2  kdz_14_src.airport\cf5 \strokec5 ;
\f2\fs24 \cf0 \strokec2 \

\f3\b\fs29\fsmilli14667 \cf3 \strokec3 create
\f0\b0 \cf0 \strokec2  
\f3\b \cf3 \strokec3 table
\f0\b0 \cf0 \strokec2  
\f3\b \cf3 \strokec3 if
\f0\b0 \cf0 \strokec2  
\f3\b \cf3 \strokec3 not
\f0\b0 \cf0 \strokec2  
\f3\b \cf3 \strokec3 exists
\f0\b0 \cf0 \strokec2  kdz_14_src.airport (
\f2\fs24 \
\pard\pardeftab720\partightenfactor0

\f0\fs29\fsmilli14667 \cf0 	year_flight 
\f3\b \cf6 \strokec6 int
\f0\b0 \cf0 \strokec2  
\f3\b \cf3 \strokec3 NOT
\f0\b0 \cf0 \strokec2  
\f3\b \cf3 \strokec3 NULL
\f0\b0 \cf0 \strokec2 ,
\f2\fs24 \

\f0\fs29\fsmilli14667 	quarter_flight 
\f3\b \cf6 \strokec6 int
\f0\b0 \cf0 \strokec2  
\f3\b \cf3 \strokec3 NULL
\f0\b0 \cf0 \strokec2 ,
\f2\fs24 \

\f0\fs29\fsmilli14667 	month_flight 
\f3\b \cf6 \strokec6 int
\f0\b0 \cf0 \strokec2  
\f3\b \cf3 \strokec3 NOT
\f0\b0 \cf0 \strokec2  
\f3\b \cf3 \strokec3 NULL
\f0\b0 \cf0 \strokec2 ,		
\f2\fs24 \

\f0\fs29\fsmilli14667 	flight_date 
\f3\b \cf6 \strokec6 varchar
\f0\b0 \cf0 \strokec2 (\cf7 \strokec7 30\cf0 \strokec2 ) 
\f3\b \cf3 \strokec3 NOT
\f0\b0 \cf0 \strokec2  
\f3\b \cf3 \strokec3 NULL
\f0\b0 \cf0 \strokec2 ,
\f2\fs24 \

\f0\fs29\fsmilli14667 	reporting_airline 
\f3\b \cf6 \strokec6 varchar
\f0\b0 \cf0 \strokec2 (\cf7 \strokec7 10\cf0 \strokec2 ) 
\f3\b \cf3 \strokec3 NULL
\f0\b0 \cf0 \strokec2 ,
\f2\fs24 \

\f0\fs29\fsmilli14667 	tail_number 
\f3\b \cf6 \strokec6 varchar
\f0\b0 \cf0 \strokec2 (\cf7 \strokec7 10\cf0 \strokec2 ) 
\f3\b \cf3 \strokec3 NULL
\f0\b0 \cf0 \strokec2 ,
\f2\fs24 \

\f0\fs29\fsmilli14667 	flight_number 
\f3\b \cf6 \strokec6 int
\f0\b0 \cf0 \strokec2  
\f3\b \cf3 \strokec3 not
\f0\b0 \cf0 \strokec2  
\f3\b \cf3 \strokec3 NULL
\f0\b0 \cf0 \strokec2 ,
\f2\fs24 \

\f0\fs29\fsmilli14667 	origin 
\f3\b \cf6 \strokec6 varchar
\f0\b0 \cf0 \strokec2 (\cf7 \strokec7 3\cf0 \strokec2 ) 
\f3\b \cf3 \strokec3 NULL
\f0\b0 \cf0 \strokec2 ,
\f2\fs24 \

\f0\fs29\fsmilli14667 	destination 
\f3\b \cf6 \strokec6 varchar
\f0\b0 \cf0 \strokec2 (\cf7 \strokec7 3\cf0 \strokec2 ) 
\f3\b \cf3 \strokec3 NULL
\f0\b0 \cf0 \strokec2 ,
\f2\fs24 \

\f0\fs29\fsmilli14667 	crsdeptime 
\f3\b \cf6 \strokec6 varchar
\f0\b0 \cf0 \strokec2 (\cf7 \strokec7 4\cf0 \strokec2 ) 
\f3\b \cf3 \strokec3 NULL
\f0\b0 \cf0 \strokec2 ,
\f2\fs24 \

\f0\fs29\fsmilli14667 	dep_time 
\f3\b \cf6 \strokec6 varchar
\f0\b0 \cf0 \strokec2 (\cf7 \strokec7 4\cf0 \strokec2 ) 
\f3\b \cf3 \strokec3 NULL
\f0\b0 \cf0 \strokec2 ,
\f2\fs24 \

\f0\fs29\fsmilli14667 	dep_delay 
\f3\b \cf3 \strokec3 float
\f0\b0 \cf0 \strokec2  
\f3\b \cf3 \strokec3 NULL
\f0\b0 \cf0 \strokec2 ,
\f2\fs24 \

\f0\fs29\fsmilli14667 	cancelled 
\f3\b \cf3 \strokec3 float
\f0\b0 \cf0 \strokec2  
\f3\b \cf3 \strokec3 NULL
\f0\b0 \cf0 \strokec2 ,
\f2\fs24 \

\f0\fs29\fsmilli14667 	cancellationcode 
\f3\b \cf6 \strokec6 varchar
\f0\b0 \cf0 \strokec2 (\cf7 \strokec7 1\cf0 \strokec2 ) 
\f3\b \cf3 \strokec3 NULL
\f0\b0 \cf0 \strokec2 ,
\f2\fs24 \

\f0\fs29\fsmilli14667 	airtime 
\f3\b \cf3 \strokec3 float
\f0\b0 \cf0 \strokec2  
\f3\b \cf3 \strokec3 NULL
\f0\b0 \cf0 \strokec2 ,
\f2\fs24 \

\f0\fs29\fsmilli14667 	distance 
\f3\b \cf3 \strokec3 float
\f0\b0 \cf0 \strokec2  
\f3\b \cf3 \strokec3 NULL
\f0\b0 \cf0 \strokec2 ,
\f2\fs24 \

\f0\fs29\fsmilli14667 	weatherdelay 
\f3\b \cf3 \strokec3 float
\f0\b0 \cf0 \strokec2  
\f3\b \cf3 \strokec3 NULL
\f0\b0 \cf0 \strokec2 ,
\f2\fs24 \

\f0\fs29\fsmilli14667 	loaded_ts 
\f3\b \cf6 \strokec6 timestamp
\f0\b0 \cf0 \strokec2  
\f3\b \cf3 \strokec3 not
\f0\b0 \cf0 \strokec2  
\f3\b \cf3 \strokec3 null
\f0\b0 \cf0 \strokec2  
\f3\b \cf3 \strokec3 default
\f0\b0 \cf0 \strokec2  (
\f3\b \cf6 \strokec6 now
\f0\b0 \cf0 \strokec2 ())
\f2\fs24 \

\f0\fs29\fsmilli14667 )\cf5 \strokec5 ;
\f2\fs24 \cf0 \strokec2 \
\pard\pardeftab720\partightenfactor0

\f0\fs29\fsmilli14667 \cf0 \cb1 \
\pard\pardeftab720\qj\partightenfactor0

\fs29\fsmilli14667 \cf0 \outl0\strokewidth0 \\copy kdz_14_src.airport(year_flight, quarter_flight, month_flight, flight_date, reporting_airline, tail_number, flight_number, origin, destination, crsdeptime, dep_time, dep_delay, cancelled, cancellationcode, airtime, distance 
\f3\b , 
\f0\b0 weatherdelay) from '/Users/arinakoshaeva/Downloads/kdz/airport_may.csv' with delimiter ',' CSV HEADER;
\f2\fs24 \
\pard\pardeftab720\partightenfactor0
\cf0 \
\pard\pardeftab720\qj\partightenfactor0

\f0\fs29\fsmilli14667 \cf0 \\copy kdz_14_src.airport(year_flight, quarter_flight, month_flight, flight_date, reporting_airline, tail_number, flight_number, origin, destination, crsdeptime, dep_time, dep_delay, cancelled, cancellationcode, airtime, distance 
\f3\b , 
\f0\b0 weatherdelay) from '/Users/arinakoshaeva/Downloads/kdz/airport_june.csv' with delimiter ',' CSV HEADER;
\f2\fs24 \
\pard\pardeftab720\partightenfactor0
\cf0 \
\pard\pardeftab720\qj\partightenfactor0

\f0\fs29\fsmilli14667 \cf0 \\copy kdz_14_src.airport(year_flight, quarter_flight, month_flight, flight_date, reporting_airline, tail_number, flight_number, origin, destination, crsdeptime, dep_time, dep_delay, cancelled, cancellationcode, airtime, distance 
\f3\b , 
\f0\b0 weatherdelay) from '/Users/arinakoshaeva/Downloads/kdz/airport_july.csv' with delimiter ',' CSV HEADER;
\f2\fs24 \
\pard\pardeftab720\partightenfactor0
\cf0 \
\pard\pardeftab720\qj\partightenfactor0

\f0\fs29\fsmilli14667 \cf0 \\copy kdz_14_src.airport(year_flight, quarter_flight, month_flight, flight_date, reporting_airline, tail_number, flight_number, origin, destination, crsdeptime, dep_time, dep_delay, cancelled, cancellationcode, airtime, distance 
\f3\b , 
\f0\b0 weatherdelay) from '/Users/arinakoshaeva/Downloads/kdz/airport_august.csv' with delimiter ',' CSV HEADER;
\f2\fs24 \
\pard\pardeftab720\partightenfactor0
\cf0 \outl0\strokewidth0 \strokec2 \
\
\
\pard\pardeftab720\partightenfactor0

\f0\fs29\fsmilli14667 \cf0 --WEATHER
\f2\fs24 \
\
\pard\pardeftab720\partightenfactor0

\f3\b\fs32 \cf3 \cb4 \strokec3 drop
\f0\b0 \cf0 \strokec2  
\f3\b \cf3 \strokec3 table
\f0\b0 \cf0 \strokec2  
\f3\b \cf3 \strokec3 if
\f0\b0 \cf0 \strokec2  
\f3\b \cf3 \strokec3 exists
\f0\b0 \cf0 \strokec2  kdz_14_src.weather\cf5 \strokec5 ;
\f2\fs24 \cf0 \strokec2 \

\f3\b\fs32 \cf3 \strokec3 create
\f0\b0 \cf0 \strokec2  
\f3\b \cf3 \strokec3 table
\f0\b0 \cf0 \strokec2  
\f3\b \cf3 \strokec3 if
\f0\b0 \cf0 \strokec2  
\f3\b \cf3 \strokec3 not
\f0\b0 \cf0 \strokec2  
\f3\b \cf3 \strokec3 exists
\f0\b0 \cf0 \strokec2  kdz_14_src.weather (
\f2\fs24 \
\pard\pardeftab720\partightenfactor0

\f0\fs32 \cf0 	icao 
\f3\b \cf6 \strokec6 varchar
\f0\b0 \cf0 \strokec2 (\cf7 \strokec7 10\cf0 \strokec2 ) 
\f3\b \cf3 \strokec3 not
\f0\b0 \cf0 \strokec2  
\f3\b \cf3 \strokec3 null
\f0\b0 \cf0 \strokec2  
\f3\b \cf3 \strokec3 default
\f0\b0 \cf0 \strokec2  (\cf8 \strokec8 'KCLT'\cf0 \strokec2 ),
\f2\fs24 \

\f0\fs32 	local_time 
\f3\b \cf6 \strokec6 varchar
\f0\b0 \cf0 \strokec2 (\cf7 \strokec7 50\cf0 \strokec2 ) 
\f3\b \cf3 \strokec3 NOT
\f0\b0 \cf0 \strokec2  
\f3\b \cf3 \strokec3 NULL
\f0\b0 \cf0 \strokec2 ,
\f2\fs24 \

\f0\fs32 	temperature 
\f3\b \cf3 \strokec3 float
\f0\b0 \cf0 \strokec2  
\f3\b \cf3 \strokec3 NULL
\f0\b0 \cf0 \strokec2 ,
\f2\fs24 \

\f0\fs32 	pressure0 
\f3\b \cf3 \strokec3 float
\f0\b0 \cf0 \strokec2  
\f3\b \cf3 \strokec3 null
\f0\b0 \cf0 \strokec2 ,
\f2\fs24 \

\f0\fs32 	pressure 
\f3\b \cf3 \strokec3 float
\f0\b0 \cf0 \strokec2  
\f3\b \cf3 \strokec3 null
\f0\b0 \cf0 \strokec2 ,
\f2\fs24 \

\f0\fs32 	humidity 
\f3\b \cf6 \strokec6 int
\f0\b0 \cf0 \strokec2  
\f3\b \cf3 \strokec3 null
\f0\b0 \cf0 \strokec2 ,
\f2\fs24 \

\f0\fs32 	wind_direction 
\f3\b \cf6 \strokec6 varchar
\f0\b0 \cf0 \strokec2 (\cf7 \strokec7 200\cf0 \strokec2 ) 
\f3\b \cf3 \strokec3 null
\f0\b0 \cf0 \strokec2 ,
\f2\fs24 \

\f0\fs32 	wind_speed 
\f3\b \cf6 \strokec6 int
\f0\b0 \cf0 \strokec2  
\f3\b \cf3 \strokec3 NULL
\f0\b0 \cf0 \strokec2 ,
\f2\fs24 \

\f0\fs32 	max_gustvalue 
\f3\b \cf6 \strokec6 int
\f0\b0 \cf0 \strokec2  
\f3\b \cf3 \strokec3 null
\f0\b0 \cf0 \strokec2 ,	
\f2\fs24 \

\f0\fs32 	w_phenomena_special 
\f3\b \cf6 \strokec6 varchar
\f0\b0 \cf0 \strokec2 (\cf7 \strokec7 200\cf0 \strokec2 ) 
\f3\b \cf3 \strokec3 NULL
\f0\b0 \cf0 \strokec2 ,
\f2\fs24 \

\f0\fs32 	w_phenomena_recent 
\f3\b \cf6 \strokec6 varchar
\f0\b0 \cf0 \strokec2 (\cf7 \strokec7 200\cf0 \strokec2 ) 
\f3\b \cf3 \strokec3 NULL
\f0\b0 \cf0 \strokec2 ,
\f2\fs24 \

\f0\fs32 	clouds 
\f3\b \cf6 \strokec6 varchar
\f0\b0 \cf0 \strokec2 (\cf7 \strokec7 500\cf0 \strokec2 ) 
\f3\b \cf3 \strokec3 NULL
\f0\b0 \cf0 \strokec2 ,
\f2\fs24 \

\f0\fs32 	horizontal_visibility 
\f3\b \cf3 \strokec3 float
\f0\b0 \cf0 \strokec2  
\f3\b \cf3 \strokec3 NULL
\f0\b0 \cf0 \strokec2 ,
\f2\fs24 \

\f0\fs32 	dewpoint 
\f3\b \cf3 \strokec3 float
\f0\b0 \cf0 \strokec2  
\f3\b \cf3 \strokec3 null
\f0\b0 \cf0 \strokec2 ,
\f2\fs24 \

\f0\fs32 	extra 
\f3\b \cf6 \strokec6 varchar
\f0\b0 \cf0 \strokec2 (\cf7 \strokec7 100\cf0 \strokec2 ) 
\f3\b \cf3 \strokec3 null
\f0\b0 \cf0 \strokec2 ,
\f2\fs24 \

\f0\fs32 	loaded_ts 
\f3\b \cf6 \strokec6 timestamp
\f0\b0 \cf0 \strokec2  
\f3\b \cf3 \strokec3 not
\f0\b0 \cf0 \strokec2  
\f3\b \cf3 \strokec3 null
\f0\b0 \cf0 \strokec2  
\f3\b \cf3 \strokec3 default
\f0\b0 \cf0 \strokec2  (
\f3\b \cf6 \strokec6 now
\f0\b0 \cf0 \strokec2 ())
\f2\fs24 \

\f0\fs32 )\cf5 \strokec5 ;
\f2\fs24 \cf0 \strokec2 \
\
\pard\pardeftab720\partightenfactor0

\f0\fs29\fsmilli14667 \cf0 \cb1 \outl0\strokewidth0 \\copy kdz_14_src.weather (local_time, temperature, pressure0, pressure, humidity, wind_direction, wind_speed, max_gustvalue, 
\fs32 w_phenomena_special
\fs29\fsmilli14667 , 
\fs32 w_phenomena_recent
\fs29\fsmilli14667 , clouds, horizontal_visibility, dewpoint, extra) from '/Users/arinakoshaeva/Downloads/kdz/weather.csv' with delimiter ';' CSV HEADER;}