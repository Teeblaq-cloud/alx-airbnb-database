## **INNER JOIN** ##

Users

    user_id INT (primary key)
  
    name VARCHAR (100) NOTNULL
  
    email VARCHAR(100) NOTNULL

Bookings

    booking_id INT (primary key)
    
    user_id INT (foreign key)
    
    booking_date (timestamp)
    
    property_id INT

SELECT

    Users.user_id,   
      
    Users.name, 
      
    Users.email, 
      
    Bookings.booking_id, 
      
    Bookings.booking_date,
      
    Bookings.property_id

FROM

    Users

INNER JOIN

    Bookings

ON

    Users.user_id = Bookings.user_id;

## **OUTER JOIN** ##

SELECT 
 
    properties.id AS property.id,
  
    properties.name AS property_name,
  
    reviews.id AS review_id,
  
    reviews.rating,

    reviews.comment

FROM
    
    properties

LEFT JOIN 
  
    reviews ON properties.id = reviews.property_id

  ## **FULL OUTER JOIN** ##

SELECT
  
    users.id AS user_id,

    users.name AS user_name,

    bookings.id AS booking_id,

    bookings.property_id,

    bookings.booking_date

FROM
  
    users

FULL OUTER JOIN

    bookings ON users.id =

    bookings.user_id

  
      
