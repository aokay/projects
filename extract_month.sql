COPY (SELECT * FROM bike_train where EXTRACT(MONTH FROM date_value) = 01)  TO '//Users/alexkuo85/GitHub/project/kaggle/bikeshare/data/train/train_month_01.csv' WITH CSV HEADER;
COPY (SELECT * FROM bike_train where EXTRACT(MONTH FROM date_value) = 02)  TO '//Users/alexkuo85/GitHub/project/kaggle/bikeshare/data/train/train_month_02.csv' WITH CSV HEADER;
COPY (SELECT * FROM bike_train where EXTRACT(MONTH FROM date_value) = 03)  TO '//Users/alexkuo85/GitHub/project/kaggle/bikeshare/data/train/train_month_03.csv' WITH CSV HEADER;
COPY (SELECT * FROM bike_train where EXTRACT(MONTH FROM date_value) = 04)  TO '//Users/alexkuo85/GitHub/project/kaggle/bikeshare/data/train/train_month_04.csv' WITH CSV HEADER;
COPY (SELECT * FROM bike_train where EXTRACT(MONTH FROM date_value) = 05)  TO '//Users/alexkuo85/GitHub/project/kaggle/bikeshare/data/train/train_month_05.csv' WITH CSV HEADER;
COPY (SELECT * FROM bike_train where EXTRACT(MONTH FROM date_value) = 06)  TO '//Users/alexkuo85/GitHub/project/kaggle/bikeshare/data/train/train_month_06.csv' WITH CSV HEADER;
COPY (SELECT * FROM bike_train where EXTRACT(MONTH FROM date_value) = 07)  TO '//Users/alexkuo85/GitHub/project/kaggle/bikeshare/data/train/train_month_07.csv' WITH CSV HEADER;
COPY (SELECT * FROM bike_train where EXTRACT(MONTH FROM date_value) = 08)  TO '//Users/alexkuo85/GitHub/project/kaggle/bikeshare/data/train/train_month_08.csv' WITH CSV HEADER;
COPY (SELECT * FROM bike_train where EXTRACT(MONTH FROM date_value) = 09)  TO '//Users/alexkuo85/GitHub/project/kaggle/bikeshare/data/train/train_month_09.csv' WITH CSV HEADER;
COPY (SELECT * FROM bike_train where EXTRACT(MONTH FROM date_value) = 10)  TO '//Users/alexkuo85/GitHub/project/kaggle/bikeshare/data/train/train_month_10.csv' WITH CSV HEADER;
COPY (SELECT * FROM bike_train where EXTRACT(MONTH FROM date_value) = 11)  TO '//Users/alexkuo85/GitHub/project/kaggle/bikeshare/data/train/train_month_11.csv' WITH CSV HEADER;
COPY (SELECT * FROM bike_train where EXTRACT(MONTH FROM date_value) = 12)  TO '//Users/alexkuo85/GitHub/project/kaggle/bikeshare/data/train/train_month_12.csv' WITH CSV HEADER;


COPY (SELECT * FROM bike_test where EXTRACT(MONTH FROM date_value) = 01)  TO '//Users/alexkuo85/GitHub/project/kaggle/bikeshare/data/test/test_month_01.csv' WITH CSV HEADER;
COPY (SELECT * FROM bike_test where EXTRACT(MONTH FROM date_value) = 02)  TO '//Users/alexkuo85/GitHub/project/kaggle/bikeshare/data/test/test_month_02.csv' WITH CSV HEADER;
COPY (SELECT * FROM bike_test where EXTRACT(MONTH FROM date_value) = 03)  TO '//Users/alexkuo85/GitHub/project/kaggle/bikeshare/data/test/test_month_03.csv' WITH CSV HEADER;
COPY (SELECT * FROM bike_test where EXTRACT(MONTH FROM date_value) = 04)  TO '//Users/alexkuo85/GitHub/project/kaggle/bikeshare/data/test/test_month_04.csv' WITH CSV HEADER;
COPY (SELECT * FROM bike_test where EXTRACT(MONTH FROM date_value) = 05)  TO '//Users/alexkuo85/GitHub/project/kaggle/bikeshare/data/test/test_month_05.csv' WITH CSV HEADER;
COPY (SELECT * FROM bike_test where EXTRACT(MONTH FROM date_value) = 06)  TO '//Users/alexkuo85/GitHub/project/kaggle/bikeshare/data/test/test_month_06.csv' WITH CSV HEADER;
COPY (SELECT * FROM bike_test where EXTRACT(MONTH FROM date_value) = 07)  TO '//Users/alexkuo85/GitHub/project/kaggle/bikeshare/data/test/test_month_07.csv' WITH CSV HEADER;
COPY (SELECT * FROM bike_test where EXTRACT(MONTH FROM date_value) = 08)  TO '//Users/alexkuo85/GitHub/project/kaggle/bikeshare/data/test/test_month_08.csv' WITH CSV HEADER;
COPY (SELECT * FROM bike_test where EXTRACT(MONTH FROM date_value) = 09)  TO '//Users/alexkuo85/GitHub/project/kaggle/bikeshare/data/test/test_month_09.csv' WITH CSV HEADER;
COPY (SELECT * FROM bike_test where EXTRACT(MONTH FROM date_value) = 10)  TO '//Users/alexkuo85/GitHub/project/kaggle/bikeshare/data/test/test_month_10.csv' WITH CSV HEADER;
COPY (SELECT * FROM bike_test where EXTRACT(MONTH FROM date_value) = 11)  TO '//Users/alexkuo85/GitHub/project/kaggle/bikeshare/data/test/test_month_11.csv' WITH CSV HEADER;
COPY (SELECT * FROM bike_test where EXTRACT(MONTH FROM date_value) = 12)  TO '//Users/alexkuo85/GitHub/project/kaggle/bikeshare/data/test/test_month_12.csv' WITH CSV HEADER;