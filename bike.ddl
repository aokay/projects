CREATE TABLE bike_train (
    datetime 	      timestamp,
	season			  integer,
	holiday			  integer,
	workingday		  integer,
	weather			  integer,
	temp			  decimal,
	atemp			  decimal,
	humidity		  integer,
	windspeed		  decimal,
	casual			  integer,
	registered        integer,
	count			  integer
);


ALTER TABLE bike_train ADD time_value  TIME;

UPDATE bike_train
SET time_value = datetime::time
;	

ALTER TABLE bike_train ADD date_value  DATE;


UPDATE bike_train
SET date_value = datetime::DATE
;	

