-- Step 1: Get the most recent date in the dataset
WITH latest_date AS (
  SELECT MAX(DATE(start_time)) AS max_date
  FROM `bigquery-public-data.austin_bikeshare.bikeshare_trips`
),

-- Step 2: Count rides per bike per day within one month before the latest date
bike_days AS (
  SELECT
    bike_id,
    DATE(start_time) AS ride_date,
    COUNT(*) AS rides_on_date
  FROM `bigquery-public-data.austin_bikeshare.bikeshare_trips`, latest_date
  WHERE 
    bike_id IS NOT NULL
    AND start_time IS NOT NULL
    AND DATE(start_time) BETWEEN DATE_SUB(latest_date.max_date, INTERVAL 1 MONTH) 
                             AND latest_date.max_date
  GROUP BY bike_id, ride_date
),

-- Step 3: Compute gaps between consecutive active dates per bike
gaps AS (
  SELECT
    bike_id,
    ride_date,
    LAG(ride_date) OVER (PARTITION BY bike_id ORDER BY ride_date) AS prev_date
  FROM bike_days
),

-- Step 4: Aggregate usage and idle gap stats per bike
bike_gap_stats AS (
  SELECT
    b.bike_id,
    COUNT(*) AS active_days,
    ROUND(AVG(bd.rides_on_date), 2) AS avg_rides_per_active_day,
    MAX(DATE_DIFF(b.ride_date, b.prev_date, DAY)) AS longest_idle_days
  FROM gaps b
  JOIN bike_days bd USING (bike_id, ride_date)
  GROUP BY b.bike_id
)

-- Step 5: Display the most active bikes in the last month of available data
SELECT
  bike_id,
  active_days,
  avg_rides_per_active_day,
  COALESCE(longest_idle_days, 0) AS longest_idle_days
FROM bike_gap_stats
ORDER BY active_days DESC
LIMIT 50;
