Create schema BLOOD;
USE BLOOD;
----------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Blood_Type (
Blood_type_id INT PRIMARY KEY,
Blood_type_name VARCHAR(100)
);

INSERT INTO Blood_Type VALUES
(1, "O+"),
(2, "O-"),
(3, "A+"),
(4, "A-"),
(5, "B+"),
(6, "B-"),
(7, "AB+"),
(8, "AB-"),
(9, "O+ Special High Demand"),
(10, "O- Rare Variant"),
(11, "A+ High Iron"),
(12, "A- Low Platelet"),
(13, "B+ High Antigen"),
(14, "B- Universal Variant"),
(15, "AB+ Plasma Only"),Blood_type_id VA
(16, "AB- Platelet Priority"),
(17, "O+ Rare Universal"),
(18, "O- Universal Donor"),
(19, "A+ Common Type"),
(20, "A- Negative Variant");

select * from Blood_Type
 ----------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Donor (
Donor_id INT PRIMARY KEY,
Name VARCHAR(100),
Age INT,
Gender ENUM('Male', 'Female', 'Other'),
Blood_type_id INT,
Phone_no VARCHAR(255) ,
Last_donation DATE,
FOREIGN KEY (blood_type_id) REFERENCES Blood_Type(blood_type_id)
);

INSERT INTO Donor VALUES
(1, "Robert Martin", 40, "Male", 1, "890-123-4567", "2024-08-02"),
(2, "Karen Wright",	26,	"Female", 2, "345-678-9012", "2024-01-25"),
(3, "Peter Harris",	33,	"Male",	3, "567-890-1234","2024-02-10"),
(4, "Nancy Moore", 42, "Female", 4, "890-567-1234", "2023-10-18"),
(5, "David Clark", 30, "Male", 5, "678-901-2345", "2023-05-25"),
(6, "Susan Hall", 27, "Female",	6, "456-123-7890", "2023-06-12"),
(7, "Brian Lewis", 35, "Male", 7, "234-789-4561", "2024-04-08"),
(8, "Jessica Walker", 29, "Female", 8, "890-234-5671", "2023-09-01"),
(9, "George Allen", 50,	"Male",	1, "567-890-2341","2024-03-22"),
(10, "Maria Young",	36,	"Female", 2,	"678-123-4562", "2023-11-14"),
(11, "Daniel King",	31,	"Male",	3, "345-678-5678","2024-02-28"),
(12, "Mark Lee", 45, "Male", 4, "456-789-1234", "2024-06-20"),
(13, "Emily Jones",	25, "Female", 5, "654-321-9876", "2023-11-10"),
(14, "John Smith", 29,"Male", 6,	"123-456-7890", "2024-10-15"),
(15, "Sarah Davis",	34, "Female", 7, "987-654-3210", "2023-12-05"),
(16, "Mark Lee", 45, "Male", 8, "456-789-1234", "2024-06-20"),
(17, "Emily Jones",	25, "Female", 1, "654-321-9876", "2023-11-10"),
(18, "Michael Brown", 39, "Male", 2, "789-123-4567", "2023-09-22"),
(19, "Linda Taylor", 31, "Female", 3, "321-654-9870", "2024-03-30"),
(20, "James Wilson", 28, "Male", 4, "123-987-6540", "2024-05-18");

select * from Donor
----------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Donation (
Donation_id INT PRIMARY KEY,
Donor_id INT ,
Donation_datetime DATETIME,
Quantity FLOAT,
Blood_type_id INT,
FOREIGN KEY (donor_id) REFERENCES Donor(donor_id),
FOREIGN KEY (blood_type_id) REFERENCES Blood_Type(blood_type_id)
);

INSERT INTO Donation VALUES
(1, 1, '2024-01-01 10:00:00', 0.5, 1),
(2, 2, '2024-01-01 11:30:00', 0.45, 2),
(3, 3, '2024-01-01 14:00:00', 0.6, 3),
(4, 4, '2024-01-02 09:15:00', 0.5, 4),
(5, 5, '2024-01-02 10:45:00', 0.55, 5),
(6, 6, '2024-01-02 13:20:00', 0.5, 6),
(7, 7, '2024-01-02 15:00:00', 0.4, 7),
(8, 8, '2024-01-03 09:30:00', 0.5, 8),
(9, 9, '2024-01-03 12:00:00', 0.5, 1),
(10, 10, '2024-01-03 14:15:00', 0.6, 2),
(11, 1, '2024-01-04 10:00:00', 0.45, 3),
(12, 2, '2024-01-04 11:45:00', 0.5, 4),
(13, 3, '2024-01-04 13:00:00', 0.55, 5),
(14, 4, '2024-01-04 15:30:00', 0.4, 6),
(15, 5, '2024-01-05 09:00:00', 0.5, 7),
(16, 6, '2024-01-05 11:15:00', 0.45, 8),
(17, 7, '2024-01-05 13:30:00', 0.5, 1),
(18, 8, '2024-01-06 10:00:00', 0.6, 2),
(19, 9, '2024-01-06 12:15:00', 0.5, 3),
(20, 10, '2024-01-06 14:30:00', 0.5, 4);

select * from Donation
----------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Blood_Inventory (
Inventory_id INT PRIMARY KEY,
Blood_type_id INT,
Quantity_available FLOAT,
FOREIGN KEY (blood_type_id) REFERENCES Blood_Type(blood_type_id)
);

INSERT INTO Blood_Inventory VALUES
(1, 1, 12.5),
(2, 2, 8.3),
(3, 3, 10.0),
(4, 4, 5.5),
(5, 5, 14.2),
(6, 6, 7.8),
(7, 7, 4.0),
(8, 8, 3.6),
(9, 1, 11.0),
(10, 2, 9.4),
(11, 3, 6.5),
(12, 4, 8.0),
(13, 5, 15.3),
(14, 6, 7.2),
(15, 7, 4.8),
(16, 8, 2.5),
(17, 1, 13.1),
(18, 2, 6.7),
(19, 3, 9.0),
(20, 4, 5.3);

select * from Blood_Inventory
----------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Recipient (
Recipient_id INT PRIMARY KEY,
Name VARCHAR(100),
Blood_type_id INT,
Phone_no VARCHAR(255),
Address VARCHAR(500),
FOREIGN KEY (blood_type_id) REFERENCES Blood_Type(blood_type_id)
);

INSERT INTO Recipient VALUES
(1, "Martin", 1, "1234567890", "123 Main Street, City A"),
(2, "Wright", 2, "2345678901", "456 Elm Street, City B"),
(3, "Harris", 3, "3456789012", "789 Oak Street, City C"),
(4, "Moore", 4, "4567890123", "101 Maple Avenue, City D"),
(5, "Clark", 5, "5678901234", "202 Pine Lane, City E"),
(6, "Hall", 6, "6789012345", "303 Cedar Road, City F"),
(7, "Lewis", 7, "7890123456", "404 Birch Boulevard, City G"),
(8, "Walker", 8, "8901234567", "505 Spruce Drive, City H"),
(9, "Allen", 1, "9012345678", "606 Willow Way, City I"),
(10, "Young", 2, "0123456789", "707 Redwood Path, City J"),
(11, "King", 3, "1112223333", "808 Cherry Street, City K"),
(12, "Lee", 4, "2223334444", "909 Aspen Place, City L"),
(13, "Jones", 5, "3334445555", "1010 Beech Court, City M"),
(14, "Smith", 6, "4445556666", "1111 Cypress Avenue, City N"),
(15, "Davis", 7, "5556667777", "1212 Dogwood Street, City O"),
(16, "Lee", 8, "6667778888", "1313 Fir Drive, City P"),
(17, "Jones", 1, "7778889999", "1414 Ash Lane, City Q"),
(18, "Brown", 2, "8889990000", "1515 Juniper Road, City R"),
(19, "Taylor", 3, "9990001111", "1616 Chestnut Way, City S"),
(20, "Wilson", 4, "0001112222", "1717 Walnut Path, City T");

select * from Recipient
----------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Blood_Transfer (
Transfer_id INT PRIMARY KEY,
Recipient_id INT,
Blood_type_id INT,
Transfer_date DATETIME,
Quantity FLOAT,
Status ENUM('Pending', 'Completed', 'Cancelled'),
FOREIGN KEY (recipient_id) REFERENCES Recipient(recipient_id),
FOREIGN KEY (blood_type_id) REFERENCES Blood_Type(blood_type_id)
);

INSERT INTO Blood_Transfer VALUES
(1, 1, 1, "2024-12-01 10:30:00", 2.5, "Completed"),
(2, 2, 2, "2024-12-01 11:45:00", 1.0, "Completed"),
(3, 3, 3, "2024-12-02 09:15:00", 1.5, "Pending"),
(4, 4, 4, "2024-12-02 13:00:00", 3.0, "Cancelled"),
(5, 5, 5, "2024-12-03 14:30:00", 2.0, "Completed"),
(6, 6, 6, "2024-12-03 15:45:00", 1.8, "Pending"),
(7, 7, 7, "2024-12-04 10:00:00", 2.3, "Completed"),
(8, 8, 8, "2024-12-04 12:00:00", 1.2, "Cancelled"),
(9, 9, 1, "2024-12-05 09:45:00", 2.7, "Completed"),
(10, 10, 2, "2024-12-05 11:30:00", 2.0, "Pending"),
(11, 11, 3, "2024-12-06 13:45:00", 1.6, "Completed"),
(12, 12, 4, "2024-12-06 14:30:00", 1.4, "Cancelled"),
(13, 13, 5, "2024-12-07 09:00:00", 2.1, "Completed"),
(14, 14, 6, "2024-12-07 10:15:00", 1.7, "Pending"),
(15, 15, 7, "2024-12-08 08:30:00", 1.9, "Completed"),
(16, 16, 8, "2024-12-08 09:45:00", 2.4, "Pending"),
(17, 17, 1, "2024-12-09 11:15:00", 1.5, "Completed"),
(18, 18, 2, "2024-12-09 12:30:00", 1.3, "Cancelled"),
(19, 19, 3, "2024-12-10 14:45:00", 2.6, "Completed"),
(20, 20, 4, "2024-12-10 15:30:00", 2.1, "Completed");

select * from Blood_Transfer
----------------------------------------------------------------------------------------------------------------------------------------

