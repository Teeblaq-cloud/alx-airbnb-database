EXPLAIN SELECT 
   
    b.booking_id,
    
    b.booking_date,
    
    b.check_in_date,
    
    b.check_out_date,
    
    u.user_id,
    
    u.name AS user_name,
    
    u.email AS user_email,

    p.property_id,
    
    p.name AS property_name,
    
    p.location,

    pay.payment_id,

    pay.amount,
    
    pay.payment_date,
    
    pay.payment_method

FROM bookings b

JOIN users u ON b.user_id = u.user_id

JOIN properties p ON b.property_id = p.property_id

LEFT JOIN payments pay ON b.booking_id = pay.booking_id;

How to Interpret and Identify Inefficiencies

  Type of Join Used:

    ALL or INDEX in the type column: Indicates a full table scan or index scan, which is slower than ref or eq_ref.

    If multiple tables use ALL, it's a sign that indexes may be missing.

  Key Usage:

    Check the key column to see if appropriate indexes are being used (e.g., user_id, property_id, booking_id).

    If NULL is shown in the key column, the database isn't using an index, which may slow down performance.

  Rows Scanned:

    The rows column shows the estimated number of rows scanned. Very high values may indicate inefficiencies, especially if they appear for multiple joins.

  Join Order and Dependencies:

    Make sure the most selective joins are being executed first (e.g., filtering on bookings before joining payments).

Common Inefficiencies and Fixes
 
    Missing Indexes:
    
      Ensure that foreign key columns used in joins (user_id, property_id, booking_id) are indexed.

    Large Table Joins Without Filters:
      
      If you're joining large tables without filtering (e.g., by booking date), consider limiting the data with a WHERE clause (e.g., recent bookings only).

    Unnecessary Columns:
      
      Only select the columns you truly need to reduce I/O.

      -- Recommended: Add indexes if not already present

-- CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- CREATE INDEX idx_payments_booking_id ON payments(booking_id);

SELECT 

    b.booking_id,
    
    b.booking_date,
    
    b.check_in_date,
    
    b.check_out_date,
    
    u.user_id,
    
    u.name AS user_name,
    
    u.email AS user_email,

    p.property_id,
    
    p.name AS property_name,
    
    p.location,
    
    pay.payment_id,
    
    pay.amount,
    
    pay.payment_date

FROM bookings b

JOIN users u ON b.user_id = u.user_id

JOIN properties p ON b.property_id = p.property_id

LEFT JOIN payments pay ON pay.booking_id = b.booking_id;
