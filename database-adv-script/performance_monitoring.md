🧪 MySQL Performance Monitoring

✅ 1. Enable Profiling

SET profiling = 1;

✅ 2. Run a Frequently Used Query

Example: Fetch bookings in a date range

SELECT * 

FROM bookings 

WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';

✅ 3. View Profile

SHOW PROFILES;

This will show a list of recent queries and their execution time.

✅ 4. Drill Down into the Last Query

SHOW PROFILE FOR QUERY 1;  -- Replace 1 with the actual query ID from SHOW PROFILES

This provides a breakdown by CPU usage, I/O, and other stages like parsing and sending data.

🔍 Likely Bottlenecks (Based on Scenario)

1. Lack of Proper Indexing

  Missing indexes on start_date, user_id, property_id, or booking_id in joins.

Especially affects join performance and date-range filters.

2. Full Table Scans

  Queries on unindexed start_date result in full scans, even with partitioning.

EXPLAIN will show ALL in the type column if this is happening.

3. Non-selective Joins
  Joining large tables (bookings, payments, properties) without filters (e.g., date or status) increases CPU and memory load.

4. Redundant Columns or Wide Rows
  Selecting too many unused columns (e.g., SELECT *) increases I/O.

Storing derived data (like YEAR(start_date)) that’s not indexed is a missed opportunity for optimization.

✅ Recommendations for Optimization

🔹 1. Add Indexes

Ensure the following indexes exist:

CREATE INDEX idx_start_date ON bookings(start_date);
CREATE INDEX idx_user_id ON bookings(user_id);
CREATE INDEX idx_property_id ON bookings(property_id);
CREATE INDEX idx_booking_id ON payments(booking_id);  -- for joins

✅ Effect: Speeds up filtering, joining, and partition pruning.

🔹 2. Refactor Schema (Partitioning Strategy)
If the table is already partitioned by start_date, ensure  queries use direct filtering on that column (not on functions like YEAR(start_date)):

✅ Good:

WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31'

❌ Bad:

WHERE YEAR(start_date) = 2024

✅ Effect: Enables partition pruning.

🔹 3. Avoid SELECT *

Refactor queries to return only the required columns:

SELECT booking_id, user_id, start_date

FROM bookings

WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';

✅ Effect: Reduces memory usage and speeds up I/O.

🔹 4. Use Covering Indexes (If Needed)

If a query only selects booking_id, user_id, and start_date, a covering index improves performance:

CREATE INDEX idx_cover_booking ON bookings(start_date, booking_id, user_id);

CREATE INDEX idx_cover_booking ON bookings(start_date, booking_id, user_id);

✅ Effect: Query served entirely from the index—no table access.

🔹 5. Cache or Archive Old Data

If historical bookings are queried rarely:

Move them to an archive table

Or use partitioning with archiving in mind (e.g., split active_bookings and archived_bookings)

✅ Effect: Smaller active data improves query speed and table maintenance.


