-- CREATE TABLE accident (
-- 	accident_index VARCHAR,
-- 	accident_severity integer,
-- 	weather_conditions integer
-- );

-- CREATE TABLE vechicle_types (
-- 	code bigserial,
-- 	label VARCHAR
-- );

-- CREATE TABLE vechicle_2015 (
-- 	accident_index VARCHAR,
-- 	Vehicle_Reference integer,
-- 	vehicle_type integer,
-- 	sex_of_Driver integer,
-- 	Age_of_Driver integer,
-- 	Age_Band_of_Driver integer
-- );



-- SELECT max (vehicle_type) FROM vechicle_2015

-- SELECT * FROM vechicle_types t INNER JOIN vechicle_2015 v ON t.code=v.vehicle_type
-- WHERE label ILIKE '%motorcycle%' 

-- SELECT * FROM vechicle_types t INNER JOIN vechicle_2015 v ON t.code=v.vehicle_type
-- WHERE label ILIKE '%motorcycle%'

-- Evaluate the median severity value of accidents caused by various Motorcycles
-- SELECT PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY accident_severity) FROM accident INNER JOIN vechicle_2015 v USING (accident_index)
-- INNER JOIN vechicle_types t ON t.code=v.vehicle_type
-- WHERE label ILIKE '%motorcycle%'

-- SELECT * FROM vechicle_2015

-- Evaluate Accident Severity and Total Accidents per Vehicle Type
-- SELECT 
-- 	vehicle_type, 
-- 	label,
-- 	AVG (accident_severity):: integer as accident_severity, 
-- 	COUNT (accident_severity) as total_accidents
-- FROM accident 
-- 	INNER JOIN vechicle_2015 v USING(accident_index)
-- 	INNER JOIN vechicle_types t ON t.code = v.vehicle_type
-- GROUP BY vehicle_type, label

-- Calculate the Average Severity by vehicle type
-- SELECT 
-- 	vehicle_type, 
-- 	label,
-- 	AVG (accident_severity):: integer as avg_accident_severity
-- FROM accident 
-- 	INNER JOIN vechicle_2015 v USING(accident_index)
-- 	INNER JOIN vechicle_types t ON t.code = v.vehicle_type
-- GROUP BY vehicle_type, label

-- Calculate the Average Severity and Total Accidents by Motorcycle
SELECT 
vehicle_type, 
label,
AVG (accident_severity):: integer as accident_severity, 
COUNT (accident_severity) as total_accidents
FROM accident 
INNER JOIN vechicle_2015 v USING(accident_index)
INNER JOIN vechicle_types t ON t.code = v.vehicle_type
GROUP BY vehicle_type, label
HAVING label ILIKE '%motorcycle%'