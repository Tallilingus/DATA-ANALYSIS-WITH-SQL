COPY accident(
	accident_index,
	accident_severity,
	weather_conditions
)
FROM 'C:\Users\Temporary\Documents\DATASETS\Accidents_2015.csv'
WITH (FORMAT CSV, HEADER TRUE, DELIMITER ',');


COPY accident(
	accident_index VARCHAR(13),
	accident_severity INT,
	weather_conditions TEXT
)
FROM 'C:\Users\Temporary\Documents\DATASETS\Accidents_2015.csv'
WITH (FORMAT CSV, HEADER TRUE, DELIMITER ',');