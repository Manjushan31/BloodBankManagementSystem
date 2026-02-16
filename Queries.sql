mysql> -- BASIC QUERIES
mysql> -- DISPLAY ALL DONORS WITH CONTACT DETAILS.
mysql> SELECT NAME,BLOOD_GROUP,PHONE
    -> FROM DONOR;
+--------------+-------------+------------+
| NAME         | BLOOD_GROUP | PHONE      |
+--------------+-------------+------------+
| Ravi Kumar   | O+          | 9876543210 |
| Sneha Reddy  | A+          | 9123456780 |
| Arjun Varma  | B+          | 9012345678 |
| Lakshmi Devi | AB-         | 9988776655 |
| Kiran Kumar  | O-          | 8899776655 |
| Meena Rao    | A-          | 7766554433 |
| Rahul Sharma | B-          | 6655443322 |
| Pooja Singh  | O+          | 9543216780 |
+--------------+-------------+------------+
8 rows in set (0.00 sec)

mysql> -- SHOW AVAILABLE BLOOD IN STOCK
mysql> SELECT DISTINCT BLOOD_GROUP
    -> FROM BLOOD_STOCK;
+-------------+
| BLOOD_GROUP |
+-------------+
| A+          |
| A-          |
| B+          |
| B-          |
| O+          |
| O-          |
| AB+         |
| AB-         |
+-------------+
8 rows in set (0.00 sec)

mysql> -- LIST RECIPIENTS AND THEIR BLOOD GROUPS
mysql> SELECT NAME,BLOOD_GROUP
    -> FROM RECIPIENT;
+--------+-------------+
| NAME   | BLOOD_GROUP |
+--------+-------------+
| Anita  | A+          |
| Vikram | O+          |
| Ramesh | B+          |
| Sita   | AB-         |
| Mahesh | O-          |
| Kavya  | A-          |
+--------+-------------+
6 rows in set (0.00 sec)

mysql> -- SHOW DONORS SORTED BY LAST DONATION DATE
mysql> SELECT NAME,LAST_DONATION_DATE
    -> FROM DONOR
    -> ORDER BY LAST_DONATION_DATE DESC;
+--------------+--------------------+
| NAME         | LAST_DONATION_DATE |
+--------------+--------------------+
| Pooja Singh  | 2026-01-05         |
| Ravi Kumar   | 2025-12-10         |
| Arjun Varma  | 2025-11-20         |
| Meena Rao    | 2025-10-05         |
| Rahul Sharma | 2025-09-25         |
| Sneha Reddy  | 2025-08-15         |
| Lakshmi Devi | 2025-05-10         |
| Kiran Kumar  | NULL               |
+--------------+--------------------+
8 rows in set (0.00 sec)

mysql> -- FIND RECIPIENT OLDER THAN 40
mysql> SELECT NAME,AGE
    -> FROM RECIPIENT
    -> WHERE AGE>40;
+--------+------+
| NAME   | AGE  |
+--------+------+
| Anita  |   45 |
| Vikram |   60 |
| Mahesh |   50 |
+--------+------+
3 rows in set (0.00 sec)

mysql> -- SHOW BLOOD STOCK SORTED BY HIGHEST UNITS
mysql> SELECT BLOOD_GROUP,UNITS_AVAILABLE
    -> FROM BLOOD_STOCK
    -> ORDER BY UNITS_AVAILABLE DESC;
+-------------+-----------------+
| BLOOD_GROUP | UNITS_AVAILABLE |
+-------------+-----------------+
| O+          |              30 |
| A+          |              25 |
| B+          |              18 |
| A-          |              12 |
| B-          |              10 |
| O-          |               8 |
| AB+         |               6 |
| AB-         |               5 |
+-------------+-----------------+
8 rows in set (0.00 sec)

mysql> -- COUNT NUMBER OF PENDING BLOOD REQUEST
mysql> SELECT COUNT(*) AS PENDING_REQUEST
    -> FROM BLOOD_REQUEST
    -> WHERE STATUS='PENDING';
+-----------------+
| PENDING_REQUEST |
+-----------------+
|               3 |
+-----------------+
1 row in set (0.00 sec)

mysql> SELECT blood_group, SUM(units_requested) AS total_units
    -> FROM Blood_Request
    -> GROUP BY blood_group;
+-------------+-------------+
| blood_group | total_units |
+-------------+-------------+
| A+          |           2 |
| O+          |           3 |
| B+          |           2 |
| AB-         |           1 |
| O-          |           2 |
| A-          |           1 |
+-------------+-------------+
6 rows in set (0.00 sec)



mysql> -- MODARATE QUERIES
mysql> -- SHOW TOTAL UNITS DONATED BY EACH DONOR
mysql> SELECT d.name, SUM(b.units_donated) AS total_units
    -> FROM Donor d
    -> JOIN Blood_Donation b ON d.donor_id = b.donor_id
    -> GROUP BY d.name;
+--------------+-------------+
| name         | total_units |
+--------------+-------------+
| Ravi Kumar   |           3 |
| Sneha Reddy  |           1 |
| Arjun Varma  |           2 |
| Lakshmi Devi |           1 |
| Meena Rao    |           1 |
| Rahul Sharma |           2 |
| Pooja Singh  |           1 |
+--------------+-------------+
7 rows in set (0.16 sec)

mysql> -- LIST PENDING BLOOD REQUEST WITH HOSPITAL NAMES
mysql> SELECT r.name, r.hospital_name, br.blood_group, br.units_requested
    -> FROM Blood_Request br
    -> JOIN Recipient r ON br.recipient_id = r.recipient_id
    -> WHERE br.status = 'Pending';
+--------+------------------+-------------+-----------------+
| name   | hospital_name    | blood_group | units_requested |
+--------+------------------+-------------+-----------------+
| Ramesh | City Hospital    | B+          |               2 |
| Mahesh | Sunrise Hospital | O-          |               2 |
| Kavya  | Care Hospital    | A-          |               1 |
+--------+------------------+-------------+-----------------+
3 rows in set (0.06 sec)

mysql> -- SHOW BLOOD GROUPS WITH LOW STOCK LESSTHAN 10
mysql> SELECT blood_group, units_available
    -> FROM Blood_Stock
    -> WHERE units_available < 10;
+-------------+-----------------+
| blood_group | units_available |
+-------------+-----------------+
| O-          |               8 |
| AB+         |               6 |
| AB-         |               5 |
+-------------+-----------------+
3 rows in set (0.03 sec)

mysql> -- COUNT TOTAL BLOOD REQUEST FOR EACH HOSPITAL
mysql> SELECT r.hospital_name, COUNT(br.request_id) AS total_requests
    -> FROM Recipient r
    -> JOIN Blood_Request br ON r.recipient_id = br.recipient_id
    -> GROUP BY r.hospital_name;
+------------------+----------------+
| hospital_name    | total_requests |
+------------------+----------------+
| Apollo Hospital  |              2 |
| Care Hospital    |              2 |
| City Hospital    |              1 |
| Sunrise Hospital |              1 |
+------------------+----------------+
4 rows in set (0.04 sec)

mysql> -- SHOW TOTAL UNITS REQUESTED FOR EACH BLOOD GROUP
mysql> SELECT blood_group, SUM(units_requested) AS total_units
    -> FROM Blood_Request
    -> GROUP BY blood_group;
+-------------+-------------+
| blood_group | total_units |
+-------------+-------------+
| A+          |           2 |
| O+          |           3 |
| B+          |           2 |
| AB-         |           1 |
| O-          |           2 |
| A-          |           1 |
+-------------+-------------+
6 rows in set (0.00 sec)

mysql> -- FIND DONORS FROM SAME CITY
mysql> SELECT address, COUNT(*) AS total_donors
    -> FROM Donor
    -> GROUP BY address
    -> HAVING total_donors > 1;
+-----------+--------------+
| address   | total_donors |
+-----------+--------------+
| Hyderabad |            2 |
+-----------+--------------+
1 row in set (0.06 sec)

mysql> -- LIST COMPLETED BLOOD REQUEST WITH ISSUED UNITS
mysql> SELECT br.request_id, br.blood_group, bi.units_issued
    -> FROM Blood_Request br
    -> JOIN Blood_Issued bi ON br.request_id = bi.request_id
    -> WHERE br.status = 'Completed';
+------------+-------------+--------------+
| request_id | blood_group | units_issued |
+------------+-------------+--------------+
|          1 | A+          |            2 |
|          4 | AB-         |            1 |
+------------+-------------+--------------+
2 rows in set (0.07 sec)

mysql> -- SHOW PENDING REQUEST WITH PATIENT NAMES
mysql> SELECT r.name AS patient_name,
    ->        r.hospital_name,
    ->        br.blood_group,
    ->        br.units_requested,
    ->        br.request_date
    -> FROM Blood_Request br
    -> JOIN Recipient r
    -> ON br.recipient_id = r.recipient_id
    -> WHERE br.status = 'Pending';
+--------------+------------------+-------------+-----------------+--------------+
| patient_name | hospital_name    | blood_group | units_requested | request_date |
+--------------+------------------+-------------+-----------------+--------------+
| Ramesh       | City Hospital    | B+          |               2 | 2026-01-18   |
| Mahesh       | Sunrise Hospital | O-          |               2 | 2026-01-25   |
| Kavya        | Care Hospital    | A-          |               1 | 2026-01-27   |
+--------------+------------------+-------------+-----------------+--------------+
3 rows in set (1.77 sec)


mysql> -- ADVANCED QUERIES
mysql> -- FIND THE DONOR ELIGIBLE TO DONATE NOW
mysql> SELECT name, blood_group, last_donation_date
    -> FROM Donor
    -> WHERE last_donation_date IS NULL
    ->    OR last_donation_date <= CURDATE() - INTERVAL 3 MONTH;
+--------------+-------------+--------------------+
| name         | blood_group | last_donation_date |
+--------------+-------------+--------------------+
| Sneha Reddy  | A+          | 2025-08-15         |
| Lakshmi Devi | AB-         | 2025-05-10         |
| Kiran Kumar  | O-          | NULL               |
| Meena Rao    | A-          | 2025-10-05         |
| Rahul Sharma | B-          | 2025-09-25         |
+--------------+-------------+--------------------+
5 rows in set (0.04 sec)
mysql> -- FIND BLOOD GROUPS WHERE DEMAND EXCEEDS SUPPLY
mysql> SELECT
    ->     bs.blood_group,
    ->     bs.units_available,
    ->     IFNULL(SUM(br.units_requested),0) AS requested
    -> FROM Blood_Stock bs
    -> LEFT JOIN Blood_Request br
    ->     ON bs.blood_group = br.blood_group
    ->     AND br.status = 'Pending'
    -> GROUP BY bs.blood_group, bs.units_available
    -> HAVING requested > bs.units_available;
Empty set (0.00 sec)

mysql> -- FIND DONORS ELIGIBLE TO DONATE NOW (3-MONTH-GAP)
mysql> SELECT name, blood_group, last_donation_date
    -> FROM Donor
    -> WHERE last_donation_date IS NULL
    ->    OR last_donation_date <= CURDATE() - INTERVAL 3 MONTH;
+--------------+-------------+--------------------+
| name         | blood_group | last_donation_date |
+--------------+-------------+--------------------+
| Sneha Reddy  | A+          | 2025-08-15         |
| Lakshmi Devi | AB-         | 2025-05-10         |
| Kiran Kumar  | O-          | NULL               |
| Meena Rao    | A-          | 2025-10-05         |
| Rahul Sharma | B-          | 2025-09-25         |
+--------------+-------------+--------------------+
5 rows in set (0.00 sec)
mysql> -- SHOW TOP DONORS
mysql> SELECT d.name, SUM(b.units_donated) AS units
    -> FROM Donor d
    -> JOIN Blood_Donation b ON d.donor_id = b.donor_id
    -> GROUP BY d.name
    -> ORDER BY units DESC;
+--------------+-------+
| name         | units |
+--------------+-------+
| Ravi Kumar   |     3 |
| Arjun Varma  |     2 |
| Rahul Sharma |     2 |
| Sneha Reddy  |     1 |
| Lakshmi Devi |     1 |
| Meena Rao    |     1 |
| Pooja Singh  |     1 |
+--------------+-------+
7 rows in set (0.01 sec)

mysql> -- HOSPITAL THAT USED THE MOST BLOOD
mysql> SELECT r.hospital_name, SUM(bi.units_issued) AS total_used
    -> FROM Blood_Issued bi
    -> JOIN Blood_Request br ON bi.request_id = br.request_id
    -> JOIN Recipient r ON br.recipient_id = r.recipient_id
    -> GROUP BY r.hospital_name
    -> ORDER BY total_used DESC;
+-----------------+------------+
| hospital_name   | total_used |
+-----------------+------------+
| Apollo Hospital |          3 |
| City Hospital   |          2 |
| Care Hospital   |          1 |
+-----------------+------------+
3 rows in set (0.00 sec)

mysql> -- FIND DONORS MATCHING PENDING REQUEST
mysql> SELECT DISTINCT d.name, d.phone, d.blood_group
    -> FROM Donor d
    -> JOIN Blood_Request br
    -> ON d.blood_group = br.blood_group
    -> WHERE br.status = 'Pending';
+-------------+------------+-------------+
| name        | phone      | blood_group |
+-------------+------------+-------------+
| Arjun Varma | 9012345678 | B+          |
| Kiran Kumar | 8899776655 | O-          |
| Meena Rao   | 7766554433 | A-          |
+-------------+------------+-------------+
3 rows in set (0.00 sec)

mysql> -- FIND RECIPENTS WHOSE REQUEST ARES STILL UNFILFILLED
mysql> SELECT r.name, br.blood_group, br.units_requested
    -> FROM Recipient r
    -> JOIN Blood_Request br ON r.recipient_id = br.recipient_id
    -> LEFT JOIN Blood_Issued bi ON br.request_id = bi.request_id
    -> WHERE bi.issue_id IS NULL;
+--------+-------------+-----------------+
| name   | blood_group | units_requested |
+--------+-------------+-----------------+
| Vikram | O+          |               3 |
| Mahesh | O-          |               2 |
+--------+-------------+-----------------+
2 rows in set (0.00 sec)
mysql> -- FIND THE SHORTAGE OF BLOOD
mysql> SELECT
    ->     bs.blood_group,
    ->     bs.units_available,
    ->     IFNULL(SUM(br.units_requested), 0) AS units_requested,
    ->     IFNULL(SUM(br.units_requested), 0) - bs.units_available AS shortage_units
    -> FROM Blood_Stock bs
    -> LEFT JOIN Blood_Request br
    ->     ON bs.blood_group = br.blood_group
    ->     AND br.status = 'Pending'
    -> GROUP BY bs.blood_group, bs.units_available
    -> HAVING units_requested > bs.units_available;
Empty set (0.03 sec)
mysql> -- SHOW ALL THE GROUPS WITH STATUS
mysql> SELECT
    ->     bs.blood_group,
    ->     bs.units_available,
    ->     IFNULL(SUM(br.units_requested),0) AS requested,
    ->     CASE
    ->         WHEN IFNULL(SUM(br.units_requested),0) > bs.units_available
    ->         THEN 'SHORTAGE'
    ->         ELSE 'SUFFICIENT'
    ->     END AS stock_status
    -> FROM Blood_Stock bs
    -> LEFT JOIN Blood_Request br
    -> ON bs.blood_group = br.blood_group
    -> AND br.status = 'Pending'
    -> GROUP BY bs.blood_group, bs.units_available;
+-------------+-----------------+-----------+--------------+
| blood_group | units_available | requested | stock_status |
+-------------+-----------------+-----------+--------------+
| A+          |              25 |         0 | SUFFICIENT   |
| A-          |              12 |         1 | SUFFICIENT   |
| B+          |              18 |         2 | SUFFICIENT   |
| B-          |              10 |         0 | SUFFICIENT   |
| O+          |              30 |         0 | SUFFICIENT   |
| O-          |               8 |         2 | SUFFICIENT   |
| AB+         |               6 |         0 | SUFFICIENT   |
| AB-         |               5 |         0 | SUFFICIENT   |
+-------------+-----------------+-----------+--------------+
8 rows in set (0.01 sec)