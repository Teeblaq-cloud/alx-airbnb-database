-- Insert sample data into the USER table

INSERT INTO USER (user_id, first_name, last_name, email, password_hash, phone_number, role) VALUES

(1, 'John', 'Doe', 'john.doe@example.com', '$2a$12$hashed_password_1', '123-456-7890', 'guest'),

(2, 'Jane', 'Smith', 'jane.smith@example.com', '$2a$12$hashed_password_2', '987-654-3210', 'host'),

(3, 'Alice', 'Johnson', 'alice.johnson@example.com', '$2a$12$hashed_password_3', '555-123-4567', 'guest'),

(4, 'Bob', 'Williams', 'bob.williams@example.com', '$2a$12$hashed_password_4', '444-987-6543', 'host'),

(5, 'Eve', 'Brown', 'eve.brown@example.com', '$2a$12$hashed_password_5', '777-888-9999', 'guest');

-- Insert sample data into the HOST table

INSERT INTO HOST (host_id, host_name) VALUES

(2, 'Jane Smith'),

(4, 'Bob Williams');

-- Insert sample data into the PROPERTY table

INSERT INTO PROPERTY (property_id, host_id, name, description, location, price_per_night) VALUES

(101, 2, 'Cozy Apartment', 'A beautiful apartment in the city center.', 'New York, NY', 150.00),

(102, 2, 'Luxury Villa', 'A spacious villa with a private pool.', 'Los Angeles, CA', 300.00),

(103, 4, 'Rustic Cabin', 'A charming cabin in the mountains.', 'Denver, CO', 200.00),

(104, 4, 'Beach House', 'A stunning house by the sea.', 'Miami, FL', 250.00),

(105, 2, 'City Loft', 'Modern loft in downtown area', 'Chicago, IL', 175.00);

-- Insert sample data into the BOOKING table

INSERT INTO BOOKING (booking_id, property_id, user_id, start_date, end_date, total_price, status) VALUES

(1001, 101, 1, '2024-01-10', '2024-01-15', 750.00, 'confirmed'),

(1002, 102, 3, '2024-02-01', '2024-02-07', 2100.00, 'confirmed'),

(1003, 103, 1, '2024-03-01', '2024-03-05', 800.00, 'pending'),

(1004, 104, 5, '2024-03-15', '2024-03-22', 1750.00, 'confirmed'),

(1005, 101, 3, '2024-04-01', '2024-04-03', 300.00, 'cancelled'),

(1006, 105, 1, '2024-05-01', '2024-05-08', 1225, 'confirmed');

-- Insert sample data into the PAYMENT table

INSERT INTO PAYMENT (payment_id, booking_id, amount, payment_date, payment_method) VALUES

(2001, 1001, 750.00, '2024-01-10 12:00:00', 'credit card'),

(2002, 1002, 2100.00, '2024-02-01 10:00:00', 'paypal'),

(2003, 1003, 800.00, '2024-03-01 14:00:00', 'credit card'),

(2004, 1004, 1750.00, '2024-03-15 09:00:00', 'bank transfer'),

(2005, 1005, 300.00, '2024-04-01 11:00:00', 'credit card'),

(2006, 1006, 1225.00, '2024-05-01 17:30:00', 'paypal');

-- Insert sample data into the MESSAGE table

INSERT INTO MESSAGE (message_id, sender_id, recipient_id, message_body, send_at) VALUES

(3001, 1, 2, 'Hello Jane, I have a question about the apartment.', '2024-01-08 10:00:00'),

(3002, 2, 1, 'Hi John, sure, what is your question?', '2024-01-08 10:30:00'),

(3003, 3, 2, 'I am interested in booking the Luxury Villa.', '2024-01-29 15:00:00'),

(3004, 2, 3, 'Great!  It is available from Feb 1 to Feb 7.', '2024-01-29 16:00:00'),

(3005, 1, 4, 'How do I get to the Rustic Cabin?', '2024-02-28 09:00:00');

-- Insert sample data into the REVIEW table

INSERT INTO REVIEW (review_id, property_id, user_id, rating, comment) VALUES

(4001, 101, 1, 5, 'Great location and very clean.'),

(4002, 102, 3, 4, 'The villa was amazing, but the pool could have been cleaner.'),

(4003, 101, 5, 5, 'Excellent stay. Highly recommended.'),

(4004, 103, 1, 3, 'Cabin was cozy, but a bit small.'),

(4005, 104, 5, 5, 'Perfect beach house for a vacation.');
