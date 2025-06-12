CREATE TABLE electric_vehicles (
    Battery FLOAT,
    Car_name VARCHAR(255),
    Car_name_link VARCHAR(255),
    Efficiency FLOAT,
    Fast_charge INT,
    Price_DE DECIMAL(10, 2),
    Range_ INT,
    Top_speed INT,
    acceleration_0_100 DECIMAL(4, 1)
);

-- To view the entire dataset:
SELECT * FROM ev_cars;

-- ---------------------------------------------------------------------
-- --------------Basic Analysis:----------------------------------------
-- ---------------------------------------------------------------------

-- Top 5 cars with the longest range:
SELECT Car_name, Range_
FROM ev_cars
ORDER BY Range_ DESC
LIMIT 5;

-- Cars with the highest efficiency:
SELECT Car_name, Efficiency
FROM ev_cars
ORDER BY Efficiency DESC;

-- Cars with the fastest acceleration (0-100 km/h):
SELECT Car_name, acceleration_0_100
FROM ev_cars
ORDER BY acceleration_0_100 ASC;

-- Average range, efficiency, and price:
SELECT AVG(Range_) AS Avg_Range, AVG(Efficiency) AS Avg_Efficiency, AVG(Price_DE) AS Avg_Price
FROM ev_cars;

-- Maximum and minimum range:
SELECT MAX(Range_) AS Max_Range, MIN(Range_) AS Min_Range
FROM ev_cars;

-- Count of cars by top speed range:
SELECT Top_speed, COUNT(*) AS Num_of_Cars
FROM ev_cars
GROUP BY Top_speed;

-- Total count of cars by manufacturers:
SELECT SUBSTRING_INDEX(Car_name, ' ', 1) AS Manufacturer, COUNT(*) AS Num_of_Cars
FROM ev_cars
GROUP BY Manufacturer;


-- ---------------------------------------------------------------------
-- -----------------------Specific Analysis-----------------------------
-- ---------------------------------------------------------------------

-- Cars with a range greater than 400 km and price less than 50,000 euros:
SELECT Car_name, Range_, Price_DE
FROM ev_cars
WHERE Range_ > 400 AND Price_DE < 50000;

-- Details of Tesla cars in the dataset:
SELECT *
FROM ev_cars
WHERE Car_name LIKE 'Tesla%';


-- ------------------------------------------------------------------
-- ----------------------------Advanced Analysis:--------------------
-- ------------------------------------------------------------------



-- Top 10 cars with the highest efficiency and their corresponding range:
SELECT Car_name, Efficiency, Range_
FROM ev_cars
ORDER BY Efficiency DESC
LIMIT 10;

-- Cars with fast charging capability (more than 600 kW):
SELECT Car_name, Fast_charge
FROM ev_cars
WHERE Fast_charge > 600;

-- Cars with a range between 300 and 400 km and top speed above 200 km/h:
SELECT Car_name, Range_, Top_speed
FROM ev_cars
WHERE Range_ BETWEEN 300 AND 400 AND Top_speed > 200;

-- Average acceleration time for cars grouped by manufacturers:
SELECT SUBSTRING_INDEX(Car_name, ' ', 1) AS Manufacturer, AVG(acceleration_0_100) AS Avg_Acceleration
FROM ev_cars
GROUP BY Manufacturer;

-- Cars sorted by their battery capacity (descending order):
SELECT Car_name, Battery
FROM ev_cars
ORDER BY Battery DESC;

-- Count of cars by their efficiency ranges:
SELECT FLOOR(Efficiency / 10) * 10 AS Efficiency_Range, COUNT(*) AS Num_of_Cars
FROM ev_cars
GROUP BY Efficiency_Range
ORDER BY Efficiency_Range;

-- Cars with the longest range per price (range divided by price):
SELECT Car_name, Range_, Price_DE, Range_ / Price_DE AS Range_Price_Ratio
FROM ev_cars
ORDER BY Range_Price_Ratio DESC;

-- Cars with a range greater than the average range and a price less than the average price:
SELECT Car_name, Range_, Price_DE
FROM ev_cars
WHERE Range_ > (SELECT AVG(Range_) FROM ev_cars) AND Price_DE < (SELECT AVG(Price_DE) FROM ev_cars);

-- Comparison of the average range, efficiency, and price between different vehicle types (e.g., sedans, SUVs, hatchbacks):
SELECT 
    CASE 
        WHEN Car_name LIKE '%Sedan%' THEN 'Sedan'
        WHEN Car_name LIKE '%SUV%' THEN 'SUV'
        WHEN Car_name LIKE '%Hatchback%' THEN 'Hatchback'
        ELSE 'Other'
    END AS Vehicle_Type,
    AVG(Range_) AS Avg_Range,
    AVG(Efficiency) AS Avg_Efficiency,
    AVG(Price_DE) AS Avg_Price
FROM ev_cars
GROUP BY Vehicle_Type;

-- Comparing top speeds of cars by manufacturers:
SELECT 
    SUBSTRING_INDEX(Car_name, ' ', 1) AS Manufacturer,
    MAX(Top_speed) AS Max_Top_Speed,
    MIN(Top_speed) AS Min_Top_Speed
FROM ev_cars
GROUP BY Manufacturer;

-- --------------------------------------------------------------------
-- ---------------------------Statistical Analysis:--------------------
-- --------------------------------------------------------------------

-- Calculating the standard deviation of range and price:
SELECT 
    STDDEV(Range_) AS Range_Standard_Deviation,
    STDDEV(Price_DE) AS Price_Standard_Deviation
FROM ev_cars;

-- Cars with a range greater than 400 km and efficiency higher than 150:
SELECT Car_name, Range_, Efficiency
FROM ev_cars
WHERE Range_ > 400 AND Efficiency > 150;

-- Top 5 cheapest cars with a range greater than 300 km:
SELECT Car_name, Price_DE, Range_
FROM ev_cars
WHERE Range_ > 300
ORDER BY Price_DE ASC
LIMIT 5;

-- To find the median of the battery column
SELECT 
    AVG(Battery) AS Battery_Median
FROM (
    SELECT 
        Battery, 
        @rownum:=@rownum+1 as `row_number`,
        @total_rows:=@rownum
    FROM 
        (SELECT @rownum:=0) r, 
        ev_cars
    ORDER BY 
        Battery
) as a
WHERE
    a.row_number IN (CEIL(@total_rows/2), FLOOR(@total_rows/2) + 1);

