CREATE DATABASE ICSEHotelDB;

USE ICSEHotelDB;

CREATE TABLE customer(
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  surname1 VARCHAR(100) NOT NULL,
  surname2 VARCHAR(100),
  gender VARCHAR(100),
  phoneNumber INT(15),
  DNI VARCHAR(20) NOT NULL UNIQUE,
  address VARCHAR(50) NOT NULL,
  postalCode INT(7) NOT NULL,
  parking ENUM('YES','NO') NOT NULL,
  feedback VARCHAR(200),
  roomType ENUM('SINGLE','DOUBLE','FAMILY') NOT NULL,
  roomNumber ENUM('1.1', '1.2', '1.3', '2.1', '2.2', '2.3') NOT NULL UNIQUE,
  paymentMethod ENUM('CASH','CREDITCARD') NOT NULL,
  entryDate VARCHAR(15) NOT NULL,
  departureDate VARCHAR(15) NOT NULL,
  reservationNumber INT(15) NOT NULL
);

INSERT INTO customer(name, surname1, surname2, gender, phoneNumber, DNI, address, postalCode, parking, feedback, roomType, roomNumber, paymentMethod, entryDate, departureDate, reservationNumber)
VALUES
    ('Mario', 'Neta', 'Suárez', 'Male', '614123456', '18345678A', 'Calle Triana 123', '35002', 'YES', 'Excellent stay I will be back soon', 'SINGLE', '1.1', 'CASH', '2023-11-07', '2023-11-14', 1),
    ('Elsa', 'Pato', 'Blanco', 'Female', '620234567', '23426189B', 'Avenida Mesa y López 45', '35007', 'NO', 'Incredible experience, the staff is fantastic', 'DOUBLE', '1.2', 'CREDITCARD', '2023-11-08', '2023-11-15', 2),
    ('Armando', 'Paredes', 'De Casas', 'Male', '654345678', '34567890C', 'Plaza Santa Ana 67', '35001', 'YES', 'Unforgettable stay, stunning views', 'FAMILY', '1.3', 'CASH', '2023-11-09', '2023-11-16', 3),
    ('Alan', 'Brito', 'Delgado', 'Male', '614456789', '45678901D', 'Calle León y Castillo 89', '35003', 'NO', 'Highly recommended, the food is delicious', 'SINGLE', '2.1', 'CREDITCARD', '2023-11-10', '2023-11-17', 4),
    ('Luz', 'Rojas', 'Luzardo', 'Female', '620567890', '56789012E', 'Paseo de Chil 12', '35005', 'YES', 'I loved it, everything was perfect', 'DOUBLE', '2.2', 'CASH', '2023-11-11', '2023-11-18', 5);

