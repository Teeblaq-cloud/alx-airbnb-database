-- Initial query to retrieve bookings with related user, property, and payment details
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
    pay.payment_date,
    pay.payment_method
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.booking_id = pay.booking_id;

