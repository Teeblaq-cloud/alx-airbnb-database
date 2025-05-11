CREATE TABLE USER (
    
    user_id INT PRIMARY KEY,
    
    first_name VARCHAR(255),
    
    last_name VARCHAR(255),
    
    email VARCHAR(255) UNIQUE NOT NULL,
    
    password_hash VARCHAR(255) NOT NULL,
    
    phone_number VARCHAR(20),
    
    role VARCHAR(50),
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);

CREATE INDEX idx_user_email ON USER (email);

CREATE INDEX idx_user_role ON USER (role);


CREATE TABLE HOST (

    host_id INT PRIMARY KEY,
    
    host_name VARCHAR(255)
);

CREATE TABLE PROPERTY (
    
    property_id INT PRIMARY KEY,
    
    host_id INT,
    
    
    name VARCHAR(255),
    
    description TEXT,
    
    location VARCHAR(255),
    
    price_per_night DECIMAL(10, 2),
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (host_id) REFERENCES HOST (host_id) ON DELETE CASCADE

);

CREATE INDEX idx_property_location ON PROPERTY (location);

CREATE INDEX idx_property_host_id ON PROPERTY (host_id);


CREATE TABLE BOOKING (
   
    booking_id INT PRIMARY KEY,
    
    property_id INT,
    
    user_id INT,
    
    start_date DATE,
    
    end_date DATE,
    
    total_price DECIMAL(10, 2),
    
    status VARCHAR(50),
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (property_id) REFERENCES PROPERTY (property_id) ON DELETE CASCADE,
    
    FOREIGN KEY (user_id) REFERENCES USER (user_id) ON DELETE CASCADE

);


CREATE INDEX idx_booking_property_id ON BOOKING (property_id);

CREATE INDEX idx_booking_user_id ON BOOKING (user_id);

CREATE INDEX idx_booking_status ON BOOKING (status);


CREATE TABLE PAYMENT (

    payment_id INT PRIMARY KEY,
    
    booking_id INT,
    
    amount DECIMAL(10, 2),
    
    payment_date TIMESTAMP,
    
    payment_method VARCHAR(50),
    
    FOREIGN KEY (booking_id) REFERENCES BOOKING (booking_id) ON DELETE CASCADE

);

CREATE INDEX idx_payment_booking_id ON PAYMENT (booking_id);

CREATE INDEX idx_payment_method ON PAYMENT (payment_method);


CREATE TABLE MESSAGE (

    message_id INT PRIMARY KEY,
    
    sender_id INT,
    
    recipient_id INT,
    
    message_body TEXT,
    
    send_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (sender_id) REFERENCES USER (user_id) ON DELETE CASCADE,
    
    FOREIGN KEY (recipient_id) REFERENCES USER (user_id) ON DELETE CASCADE

);

CREATE INDEX idx_message_sender_id ON MESSAGE (sender_id);

CREATE INDEX idx_message_recipient_id ON MESSAGE (recipient_id);


CREATE TABLE REVIEW (

    review_id INT PRIMARY KEY,
    
    property_id INT,
    
    user_id INT,
    
    rating INT,
    
    comment TEXT,
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (property_id) REFERENCES PROPERTY (property_id) ON DELETE CASCADE,
    
    FOREIGN KEY (user_id) REFERENCES USER (user_id) ON DELETE CASCADE,
    
    CONSTRAINT chk_rating CHECK (rating >= 1 AND rating <= 5)

);

CREATE INDEX idx_review_property_id ON REVIEW (property_id);

CREATE INDEX idx_review_user_id ON REVIEW (user_id);

CREATE INDEX idx_review_rating ON REVIEW (rating);
