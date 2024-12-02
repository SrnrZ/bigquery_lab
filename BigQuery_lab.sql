-- Using the NYC Taxi public dataset (Yellow Trips) from Google BigQuery, complete the following exercises:

-- Exercise 1: Count the number of trips in January 2023
SELECT COUNT(trip_distance) FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2021`
# Result: 30904297

-- Exercise 2: Calculate the total revenue generated by taxi trips in 2023
SELECT SUM(tip_amount + total_amount)
FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2021`
# Results: 681052460.85

-- Exercise 3: Find the most popular pickup location
SELECT pickup_location_id, COUNT(*)
FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2021`
GROUP BY pickup_location_id

-- Exercise 4: Analyze the number of trips per hour of the day
SELECT 
    EXTRACT(HOUR FROM pickup_datetime) AS event_hour,
    COUNT(*) AS event_count
FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2021`
GROUP BY event_hour
ORDER BY event_count;

-- Exercise 5: Calculate the average trip distance
SELECT AVG(trip_distance)
FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2021`

-- Exercise 6: Find the longest trip by distance
SELECT trip_distance
FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2021`
ORDER BY trip_distance DESC
LIMIT 1;

-- Exercise 7: Calculate the total number of passengers by payment type
SELECT payment_type, SUM(passenger_count) as passenger_sum
FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2021`
GROUP BY payment_type
ORDER BY passenger_sum;

-- Exercise 8: Find the most common drop-off location for trips paid by credit card
SELECT dropoff_location_id, COUNT(dropoff_location_id) as dropoff_location_count
FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2021`
GROUP BY dropoff_location_id
ORDER BY dropoff_location_count DESC
LIMIT 1;

-- Exercise 9: Calculate the total number of trips that had more than 4 passengers
SELECT COUNT(pickup_datetime) as trip_count, SUM(passenger_count) as passenger_sum
FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2021`
GROUP BY pickup_datetime
HAVING passenger_sum > 4
ORDER BY trip_count DESC;

-- Exercise 10: Subquery - Find the average fare for trips longer than the average trip distance
SELECT AVG(fare_amount) AS fare_average
FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2021`
WHERE trip_distance > (
    SELECT AVG(trip_distance)
    FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2021`
);