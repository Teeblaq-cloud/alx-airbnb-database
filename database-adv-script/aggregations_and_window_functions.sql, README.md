## **Apply Aggregations and Window Functions** ##

SELECT user_id, COUNT(*) AS

total_bookings

FROM bookings

Group BY users_id;

SELECT
    
    property_id,
    
    COUNT(*) AS total_bookings,
    
    RANK() OVER (ORDER BY COUNT(*)

DESC) AS booking_rank

FROM bookings

GROUP BY propert_id;
