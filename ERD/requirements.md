## **Entities and Attributes** ##

#### **User** ####

user_id: Primary Key, UUID, Indexed

first_name: VARCHAR, NOT NULL

last_name: VARCHAR, NOT NULL

email: VARCHAR, UNIQUE, NOT NULL

password_hash: VARCHAR, NOT NULL

phone_number: VARCHAR, NULL

role: ENUM (guest, host, admin), NOT NULL

created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

#### **Property** ####

property_id: Primary Key, UUID, Indexed

host_id: Foreign Key, references User(user_id)

name: VARCHAR, NOT NULL

description: TEXT, NOT NULL

location: VARCHAR, NOT NULL

pricepernight: DECIMAL, NOT NULL

created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

updated_at: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP

#### **Booking** ####

booking_id: Primary Key, UUID, Indexed

property_id: Foreign Key, references Property(property_id)

user_id: Foreign Key, references User(user_id)

start_date: DATE, NOT NULL

end_date: DATE, NOT NULL

total_price: DECIMAL, NOT NULL

status: ENUM (pending, confirmed, canceled), NOT NULL

created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

#### **Payment** ####

payment_id: Primary Key, UUID, Indexed

booking_id: Foreign Key, references Booking(booking_id)

amount: DECIMAL, NOT NULL

payment_date: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

payment_method: ENUM (credit_card, paypal, stripe), NOT NULL

#### **Review** ####

review_id: Primary Key, UUID, Indexed

property_id: Foreign Key, references Property(property_id)

user_id: Foreign Key, references User(user_id)

rating: INTEGER, CHECK: rating >= 1 AND rating <= 5, NOT NULL

comment: TEXT, NOT NULL

created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

#### **Message** ####

message_id: Primary Key, UUID, Indexed

sender_id: Foreign Key, references User(user_id)

recipient_id: Foreign Key, references User(user_id)

message_body: TEXT, NOT NULL

sent_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

#### **Constraints** ####

User Table

Unique constraint on email.

Non-null constraints on required fields.

#### **Property Table** ####

Foreign key constraint on host_id.

Non-null constraints on essential attributes.

#### **Booking Table** ####

Foreign key constraints on property_id and user_id.

status must be one of pending, confirmed, or canceled.

#### **Payment Table** ####

Foreign key constraint on booking_id, ensuring payment is linked to valid bookings.

#### **Review Table** ####

Constraints on rating values (1-5).

Foreign key constraints on property_id and user_id.

#### **Message Table** ####

Foreign key constraints on sender_id and recipient_id.

#### **Indexing** ####

Primary Keys: Indexed automatically.

Additional Indexes:

email in the User table.

property_id in the Property and Booking tables.

booking_id in the Booking and Payment tables.

#### **The Relationship between Entities** ####

👤 1. User ↔ Property

One user (a host) can list many properties

But each property belongs to one user (the host)

📘 Relationship:

User (1) —owns—> Property (many)

🧠 This is a one-to-many (1:N) relationship

🔗 Using: host_id in Property → user_id in User

🏠 2. User ↔ Booking

One user (a guest) can make many bookings

Each booking belongs to one user

📘 Relationship:

User (1) —makes—> Booking (many)

🔗 Using: user_id in Booking → user_id in User

🏠 3. Property ↔ Booking

One property can be booked many times

Each booking is for one property

📘 Relationship:

Property (1) —has—> Booking (many)

🔗 Using: property_id in Booking → property_id in Property

📅 4. Booking ↔ Payment

One booking can have one payment

Each payment belongs to one booking

📘 Relationship:

Booking (1) —has—> Payment (1)

🔗 Using: booking_id in Payment → booking_id in Booking

🧠 This is a one-to-one (1:1) relationship

⭐ 5. User ↔ Review

One user can leave many reviews

Each review is written by one user

📘 Relationship:

User (1) —writes—> Review (many)

🔗 Using: user_id in Review → user_id in User

⭐ 6. Property ↔ Review

One property can have many reviews

Each review is for one property

📘 Relationship:

Property (1) —receives—> Review (many)

🔗 Using: property_id in Review → property_id in Property

💬 7. User ↔ Message

One user can send and receive many messages

Each message has a sender and recipient

📘 Relationship:

User (1) —sends/receives—> Message (many)

🔗 Using: sender_id and recipient_id in Message → user_id in User

🧠 This is a many-to-many via two one-to-many relationships

#### **ER Diagram** ####

![alx-airbnb-database drawio](https://github.com/user-attachments/assets/a0bae1f2-853e-4f60-983c-b81336bbb9fb)



