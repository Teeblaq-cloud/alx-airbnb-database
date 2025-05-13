## **Practice Subqueries** ##

SELECT *

FROM properties

WHERE property id IN(
    
    SELECT propertyid
    
    FROM reviews
    
    GROUP BY propertyid
    
    HAVING AVG(rating) > 4.0

);

SELECT users_name*

FROM Users

WHERE(

    SELECT COUNT(*)
    
    FROM  bookings
    
    WHERE bookings.user_id =user.id

) > 3;
