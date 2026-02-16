mysql> INSERT INTO Donor (name, age, gender, blood_group, phone, address, last_donation_date) VALUES
    -> ('Ravi Kumar', 25, 'Male', 'O+', '9876543210', 'Hyderabad', '2025-12-10'),
    -> ('Sneha Reddy', 32, 'Female', 'A+', '9123456780', 'Vijayawada', '2025-08-15'),
    -> ('Arjun Varma', 29, 'Male', 'B+', '9012345678', 'Guntur', '2025-11-20'),
    -> ('Lakshmi Devi', 41, 'Female', 'AB-', '9988776655', 'Vizag', '2025-05-10'),
    -> ('Kiran Kumar', 35, 'Male', 'O-', '8899776655', 'Tirupati', NULL),
    -> ('Meena Rao', 27, 'Female', 'A-', '7766554433', 'Nellore', '2025-10-05'),
    -> ('Rahul Sharma', 30, 'Male', 'B-', '6655443322', 'Warangal', '2025-09-25'),
    -> ('Pooja Singh', 22, 'Female', 'O+', '9543216780', 'Hyderabad', '2026-01-05');
Query OK, 8 rows affected (0.01 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Recipient (name, age, gender, blood_group, phone, hospital_name) VALUES
    -> ('Anita', 45, 'Female', 'A+', '9001112233', 'Apollo Hospital'),
    -> ('Vikram', 60, 'Male', 'O+', '9011223344', 'Care Hospital'),
    -> ('Ramesh', 38, 'Male', 'B+', '9022334455', 'City Hospital'),
    -> ('Sita', 27, 'Female', 'AB-', '9033445566', 'Apollo Hospital'),
    -> ('Mahesh', 50, 'Male', 'O-', '9044556677', 'Sunrise Hospital'),
    -> ('Kavya', 33, 'Female', 'A-', '9055667788', 'Care Hospital');
Query OK, 6 rows affected (0.03 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Blood_Stock (blood_group, units_available) VALUES
    -> ('A+', 25),
    -> ('A-', 12),
    -> ('B+', 18),
    -> ('B-', 10),
    -> ('O+', 30),
    -> ('O-', 8),
    -> ('AB+', 6),
    -> ('AB-', 5);
Query OK, 8 rows affected (0.01 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Blood_Donation (donor_id, donation_date, units_donated) VALUES
    -> (1, '2025-12-10', 2),
    -> (2, '2025-08-15', 1),
    -> (3, '2025-11-20', 2),
    -> (4, '2025-05-10', 1),
    -> (6, '2025-10-05', 1),
    -> (7, '2025-09-25', 2),
    -> (8, '2026-01-05', 1),
    -> (1, '2024-12-01', 1);
Query OK, 8 rows affected (0.01 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Blood_Request (recipient_id, blood_group, units_requested, request_date, status) VALUES
    -> (1, 'A+', 2, '2026-01-15', 'Completed'),
    -> (2, 'O+', 3, '2026-01-20', 'Completed'),
    -> (3, 'B+', 2, '2026-01-18', 'Pending'),
    -> (4, 'AB-', 1, '2026-01-22', 'Completed'),
    -> (5, 'O-', 2, '2026-01-25', 'Pending'),
    -> (6, 'A-', 1, '2026-01-27', 'Pending');
Query OK, 6 rows affected (0.01 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Blood_Issued (request_id, issue_date, units_issued) VALUES
    -> (1, '2026-01-15', 2),
    -> (3, '2026-01-18', 2),
    -> (4, '2026-01-22', 1),
    -> (6, '2026-01-27', 1);
Query OK, 4 rows affected (0.04 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select* from donor;
+----------+--------------+------+--------+-------------+------------+------------+--------------------+
| donor_id | name         | age  | gender | blood_group | phone      | address    | last_donation_date |
+----------+--------------+------+--------+-------------+------------+------------+--------------------+
|        1 | Ravi Kumar   |   25 | Male   | O+          | 9876543210 | Hyderabad  | 2025-12-10         |
|        2 | Sneha Reddy  |   32 | Female | A+          | 9123456780 | Vijayawada | 2025-08-15         |
|        3 | Arjun Varma  |   29 | Male   | B+          | 9012345678 | Guntur     | 2025-11-20         |
|        4 | Lakshmi Devi |   41 | Female | AB-         | 9988776655 | Vizag      | 2025-05-10         |
|        5 | Kiran Kumar  |   35 | Male   | O-          | 8899776655 | Tirupati   | NULL               |
|        6 | Meena Rao    |   27 | Female | A-          | 7766554433 | Nellore    | 2025-10-05         |
|        7 | Rahul Sharma |   30 | Male   | B-          | 6655443322 | Warangal   | 2025-09-25         |
|        8 | Pooja Singh  |   22 | Female | O+          | 9543216780 | Hyderabad  | 2026-01-05         |
+----------+--------------+------+--------+-------------+------------+------------+--------------------+
8 rows in set (0.00 sec)

mysql> select*from recipient;
+--------------+--------+------+--------+-------------+------------+------------------+
| recipient_id | name   | age  | gender | blood_group | phone      | hospital_name    |
+--------------+--------+------+--------+-------------+------------+------------------+
|            1 | Anita  |   45 | Female | A+          | 9001112233 | Apollo Hospital  |
|            2 | Vikram |   60 | Male   | O+          | 9011223344 | Care Hospital    |
|            3 | Ramesh |   38 | Male   | B+          | 9022334455 | City Hospital    |
|            4 | Sita   |   27 | Female | AB-         | 9033445566 | Apollo Hospital  |
|            5 | Mahesh |   50 | Male   | O-          | 9044556677 | Sunrise Hospital |
|            6 | Kavya  |   33 | Female | A-          | 9055667788 | Care Hospital    |
+--------------+--------+------+--------+-------------+------------+------------------+
6 rows in set (0.00 sec)

mysql> select*from blood_Stock;
+----------+-------------+-----------------+
| stock_id | blood_group | units_available |
+----------+-------------+-----------------+
|        1 | A+          |              25 |
|        2 | A-          |              12 |
|        3 | B+          |              18 |
|        4 | B-          |              10 |
|        5 | O+          |              30 |
|        6 | O-          |               8 |
|        7 | AB+         |               6 |
|        8 | AB-         |               5 |
+----------+-------------+-----------------+
8 rows in set (0.00 sec)

mysql> select*from blood_donation;
+-------------+----------+---------------+---------------+
| donation_id | donor_id | donation_date | units_donated |
+-------------+----------+---------------+---------------+
|           1 |        1 | 2025-12-10    |             2 |
|           2 |        2 | 2025-08-15    |             1 |
|           3 |        3 | 2025-11-20    |             2 |
|           4 |        4 | 2025-05-10    |             1 |
|           5 |        6 | 2025-10-05    |             1 |
|           6 |        7 | 2025-09-25    |             2 |
|           7 |        8 | 2026-01-05    |             1 |
|           8 |        1 | 2024-12-01    |             1 |
+-------------+----------+---------------+---------------+
8 rows in set (0.00 sec)

mysql> select*from blood_request;
+------------+--------------+-------------+-----------------+--------------+-----------+
| request_id | recipient_id | blood_group | units_requested | request_date | status    |
+------------+--------------+-------------+-----------------+--------------+-----------+
|          1 |            1 | A+          |               2 | 2026-01-15   | Completed |
|          2 |            2 | O+          |               3 | 2026-01-20   | Completed |
|          3 |            3 | B+          |               2 | 2026-01-18   | Pending   |
|          4 |            4 | AB-         |               1 | 2026-01-22   | Completed |
|          5 |            5 | O-          |               2 | 2026-01-25   | Pending   |
|          6 |            6 | A-          |               1 | 2026-01-27   | Pending   |
+------------+--------------+-------------+-----------------+--------------+-----------+
6 rows in set (0.00 sec)

mysql> select*from blood_issued;
+----------+------------+------------+--------------+
| issue_id | request_id | issue_date | units_issued |
+----------+------------+------------+--------------+
|        1 |          1 | 2026-01-15 |            2 |
|        2 |          3 | 2026-01-18 |            2 |
|        3 |          4 | 2026-01-22 |            1 |
|        4 |          6 | 2026-01-27 |            1 |
+----------+------------+------------+--------------+
4 rows in set (0.00 sec)
