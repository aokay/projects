CREATE TABLE bike_test (\
    datetime 	      timestamp,\
	season			  integer,\
	holiday			  integer,\
	workingday		  integer,\
	weather			  integer,\
	temp			  decimal,\
	atemp			  decimal,\
	humidity		  integer,\
	windspeed		  decimal,\
	casual			  integer,\
	registered        integer,\
	count			  integer\
);}


--- Test Set

ALTER TABLE bike_test ADD time_value  TIME;

UPDATE bike_test
SET time_value = datetime::time
;	

ALTER TABLE bike_test ADD date_value  DATE;


UPDATE bike_test
SET date_value = datetime::DATE
;	
