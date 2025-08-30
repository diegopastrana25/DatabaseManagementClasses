CREATE DATABASE actividad4;

USE actividad4;

CREATE TABLE students(
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  surname1 VARCHAR(100) NOT NULL,
  surname2 VARCHAR(100),
  DNI VARCHAR(20) NOT NULL UNIQUE,
  email VARCHAR(255) NOT NULL,
  sweatshirtSize ENUM('XS', 'S', 'M', 'L', 'XL', 'XXL') NOT NULL DEFAULT 'L'
);

INSERT INTO students(name, surname1, surname2, DNI, email, sweatshirtSize)
VALUES
    ('Víctor', 'Suárez', 'Cruz','12345678X', 'victorsuarez@gmail.com','L' ),
    ('Andrea Li', 'Rodríguez', 'De La Sierra García', '87654321Y', 'andreali@gmail.com','S'),
    ('Pablo Javier', 'Monzón', 'Santana', '23456781Z', 'pablomonzon@gmail.com','L'),
    ('Carolina', 'Hernández', 'Rodríguez', '34567812W', 'carolinahernandez@gmail.com','M'),
    ('Álvaro Ginés', 'Gómez', 'Delgado', '45678123V', 'alvarogines@gmail.com', DEFAULT);
