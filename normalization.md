## **Reviewing of schema and identify any potential redundancies or violations of normalization principles**Observations and Potential Issues

Based on the image and the descriptions, here are some observations and potential issues related to normalization:

Location in Property Table:

Currently, the Property table has a single location field. This could store a concatenated string like "City, State, Country".

Normalization Issue: This violates 1NF (First Normal Form). 1NF requires that each attribute of a table should hold only atomic values. Storing a combined location string means that it's not atomic.

Redundancy: If you want to search or filter properties by city or state, you'll have to use string manipulation functions, which are inefficient. Also, if a city name changes, you'd have to update it in multiple rows.

Message Table:

The Message table has sender_id and recipient_id, both foreign keys to the User table. This is good for tracking who sent and received messages.

Other Tables:

The other tables (User, Booking, Payment, Review) seem to be in reasonably good shape in terms of normalization, with clear primary keys and foreign keys, and attributes that seem to belong to their respective entities.

### **Recommendations to Improve Normalization** ###

Normalize the Location Attribute:

Create a separate Locations table with columns like location_id (PK), city, state, country, and perhaps zip_code.

In the Property table, replace the location column with a location_id (FK) that references the Locations table.

Example:

Locations Table:

| location_id | city    | state   | country | zip_code |

| :---------- | :------ | :------ | :------ | :------- |

| 1           | New York | NY      | USA     | 10001    |

| 2           | Los Angeles | CA      | USA     | 90001    |

Property Table:

| property_id | host_id | name        | description | location_id (FK) | pricepernight | ... |

| :---------- | :------ | :---------- | :---------- | :--------------- | :------------ | :-- |

| 1           | 101     | Cozy Loft | A great place | 1                | 150.00        | ... |

| 2           | 102     | Beach House | Near the sea | 2                | 250.00        | ... |

Benefits:

Eliminates redundancy: Location information is stored only once.

Improves data integrity: Consistent location data.

Simplifies queries: Easier to search and filter by location.

Improves performance: More efficient indexing and searching.









