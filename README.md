## ⚡ **Electric Vehicles Data Analysis | SQL Project**

Welcome to the **Electric Vehicles (EV) SQL Data Analysis Project**! This project leverages structured queries to analyze EV performance metrics, efficiency, pricing, and manufacturer trends. The goal is to derive insights from raw data that can inform decisions in manufacturing, marketing, and consumer choice.

---

## 🎯 **Project Objective**

The aim of this project is to explore electric vehicle data using SQL and answer key business and technical questions such as:

- Which EVs offer the longest range and best performance?
- What brands and models stand out in efficiency and affordability?
- How does battery capacity relate to price or charging speed?
- Which vehicles strike the best balance between range and cost?

---

## 📁 **Dataset Overview**

The dataset is stored in a relational table named `electric_vehicles`. It contains specifications and market data for various EVs.

| Column               | Description                               | Data Type       |
|----------------------|-------------------------------------------|-----------------|
| `Battery`            | Battery capacity (in kWh)                 | FLOAT           |
| `Car_name`           | Name of the car                           | VARCHAR(255)    |
| `Car_name_link`      | External link to car details              | VARCHAR(255)    |
| `Efficiency`         | Energy consumption (Wh/km)                | FLOAT           |
| `Fast_charge`        | Fast charging capability (kW)             | INT             |
| `Price_DE`           | Price in Germany (Euros)                  | DECIMAL(10, 2)  |
| `Range_`             | Driving range per full charge (in km)     | INT             |
| `Top_speed`          | Maximum speed (km/h)                      | INT             |
| `Acceleration_0_100` | Time to accelerate from 0–100 km/h (secs) | DECIMAL(4, 1)   |

---

## 🧠 **Methodology**

1. **Data Source**: Imported dataset into a SQL-compatible RDBMS (e.g., MySQL, PostgreSQL).
2. **Data Cleaning**: Ensured numeric formats were correct, removed duplicates, validated nulls.
3. **Query Design**: Created categorized queries — basic, specific, advanced, and statistical.
4. **Insight Extraction**: Used aggregate functions, filtering conditions, derived metrics (e.g., range/price ratio).
5. **Result Interpretation**: Interpreted SQL output tables to draw practical, business-related conclusions.

---

## 📊 **Analysis List**

### ✅ **Basic Analysis**

1. Top 5 cars with the longest range  
2. Cars with the highest efficiency  
3. Fastest cars by acceleration (0–100 km/h)  
4. Average range, efficiency, and price  
5. Max and min range across all cars  
6. Count of cars by top speed ranges  
7. Count of cars by manufacturers  

### 🎯 **Specific Analysis**

1. Cars with range > 400 km and price < €50,000  
2. All Tesla-branded vehicles  

### 🚀 **Advanced Analysis**

1. Top 10 most efficient cars and their ranges  
2. Cars with fast charging > 600 kW  
3. Cars with range 300–400 km and speed > 200 km/h  
4. Average acceleration grouped by manufacturer  
5. Cars ordered by battery capacity (descending)  
6. Car count by efficiency ranges (e.g., 100–150 Wh/km, etc.)  
7. Best range-per-price vehicles (range ÷ price)  
8. Cars with above-average range and below-average price  
9. (If available) Comparison of range/efficiency by vehicle types (e.g., SUV, Sedan)  
10. Comparison of top speeds by manufacturer  

### 📈 **Statistical Analysis**

1. Standard deviation of range and price  
2. Cars with range > 400 km and efficiency > 150 Wh/km  
3. 5 cheapest cars with range > 300 km  
4. Median battery capacity across all EVs  

---

## 🛠 **Tools & Technologies**

- **SQL (MySQL)** – Primary language for analysis  
- **DB Management Tool** – e.g., MySQL Workbench  
- **CSV File** – Source dataset imported into database  
 


