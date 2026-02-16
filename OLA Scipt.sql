Create Database Ola;
USE Ola;

#1. Retrieve all successful bookings:
Create view Successfull_Bookings As
SELECT * FROM bookings 
WHERE Booking_status = 'Success';

select * from Successfull_Bookings;

#2. Find the average ride distance for each vehicle type:
create view ride_distance_for_each_vehicle As 
SELECT Vehicle_Type, AVG(Ride_Distance)
as avg_distance FROM bookings
GROUP BY Vehicle_Type;

select * from ride_distance_for_each_vehicle;

#3. Get the total number of cancelled rides by customers:
create view cancelled_rides_by_customers As
SELECT count(*) FROM bookings 
WHERE Booking_Status = 'canceled by customer';

select * from cancelled_rides_by_customers;

#4. List the top 5 customers who booked the highest number of rides:
create view Top_5_Customers As
SELECT Customer_ID, COUNT(Booking_ID) as total_rides 
FROM bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC LIMIT 5;

SELECT * FROM Top_5_Customers;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view Ride_Canceled_by_Drivers_P_C_Issues AS 
SELECT COUNT(*) FROM bookings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

SELECT * FROM Ride_Canceled_by_Drivers_P_C_Issues;

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
CREATE view Max_Min_Driver_Rating As 
SELECT MAX(Driver_Ratings) as max_rating, MIN(Driver_Ratings)
as min_rating 
FROM bookings 
WHERE Vehicle_Type = 'Prime Sedan';

SELECT * FROM Max_Min_Driver_Rating;

#7. Retrieve all rides where payment was made using UPI:
CREATE VIEW UPI_Payment As 
SELECT * FROM bookings 
WHERE Payment_Method = 'UPI';

SELECT * FROM UPI_Payment; 

#8. Find the average customer rating per vehicle type:
CREATE VIEW AVG_Cust_Rating As
SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating 
FROM bookings
GROUP BY Vehicle_Type;

SELECT * FROM AVG_Cust_Rating;

#9. Calculate the total booking value of rides completed successfully:
CREATE VIEW total_successful_ride_value As
SELECT SUM(Booking_Value) as total_successful_value
FROM bookings
WHERE Booking_status = 'Success';
 
 SELECT * FROM total_successful_ride_value;

#10. List all incomplete rides along with the reason:
CREATE VIEW Incomplete_Rides_Reason As
 SELECT Booking_ID, Incomplete_Rides_Reason
 FROM bookings
 WHERE Incomplete_Rides ='Yes';
 
select * from Incomplete_Rides_Reason;



