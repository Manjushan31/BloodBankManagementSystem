mysql> create database BloodBank;
Query OK, 1 row affected (0.01 sec)

mysql> use BloodBank;
Database changed
mysql> CREATE TABLE Donor (
    ->     donor_id INT PRIMARY KEY AUTO_INCREMENT,
    ->     name VARCHAR(50),
    ->     age INT,
    ->     gender VARCHAR(10),
    ->     blood_group VARCHAR(5),
    ->     phone VARCHAR(15),
    ->     address VARCHAR(100),
    ->     last_donation_date DATE
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql> CREATE TABLE Recipient (
    ->     recipient_id INT PRIMARY KEY AUTO_INCREMENT,
    ->     name VARCHAR(50),
    ->     age INT,
    ->     gender VARCHAR(10),
    ->     blood_group VARCHAR(5),
    ->     phone VARCHAR(15),
    ->     hospital_name VARCHAR(100)
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql> CREATE TABLE Blood_Stock (
    ->     stock_id INT PRIMARY KEY AUTO_INCREMENT,
    ->     blood_group VARCHAR(5),
    ->     units_available INT
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> CREATE TABLE Blood_Donation (
    ->     donation_id INT PRIMARY KEY AUTO_INCREMENT,
    ->     donor_id INT,
    ->     donation_date DATE,
    ->     units_donated INT,
    ->     FOREIGN KEY (donor_id) REFERENCES Donor(donor_id)
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql> CREATE TABLE Blood_Request (
    ->     request_id INT PRIMARY KEY AUTO_INCREMENT,
    ->     recipient_id INT,
    ->     blood_group VARCHAR(5),
    ->     units_requested INT,
    ->     request_date DATE,
    ->     status VARCHAR(20),
    ->     FOREIGN KEY (recipient_id) REFERENCES Recipient(recipient_id)
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql> CREATE TABLE Blood_Issued (
    ->     issue_id INT PRIMARY KEY AUTO_INCREMENT,
    ->     request_id INT,
    ->     issue_date DATE,
    ->     units_issued INT,
    ->     FOREIGN KEY (request_id) REFERENCES Blood_Request(request_id)
    -> );
Query OK, 0 rows affected (0.06 sec)