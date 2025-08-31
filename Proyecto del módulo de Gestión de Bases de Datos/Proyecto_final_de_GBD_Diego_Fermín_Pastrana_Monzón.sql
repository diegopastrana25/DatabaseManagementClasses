DROP DATABASE IF EXISTS 3Dmodels;
CREATE DATABASE 3Dmodels;
USE 3Dmodels;

CREATE TABLE 3dModel (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    description VARCHAR(255),
    creation_date DATE
);

CREATE TABLE author (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE
);

CREATE TABLE category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE tag (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE license (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(255) NOT NULL
);

-- RELACIÓN 1 A 1
CREATE TABLE 3dModelLicense (
    3dModel_id INT PRIMARY KEY,
    license_id INT,
    FOREIGN KEY (3dModel_id) REFERENCES 3dModel(id),
    FOREIGN KEY (license_id) REFERENCES license(id)
);

-- ----------------------------------------------------------

-- RELACIÓN MUCHOS A MUCHOS
CREATE TABLE 3dModelAuthor (
    3dModel_id INT,
    author_id INT,
    PRIMARY KEY (3dModel_id, author_id),
    FOREIGN KEY (3dModel_id) REFERENCES 3dModel(id),
    FOREIGN KEY (author_id) REFERENCES author(id)
);

-- RELACIÓN MUCHOS A MUCHOS
CREATE TABLE 3dModelTag (
    3dModel_id INT,
    tag_id INT,
    PRIMARY KEY (3dModel_id, tag_id),
    FOREIGN KEY (3dModel_id) REFERENCES 3dModel(id),
    FOREIGN KEY (tag_id) REFERENCES tag(id)
);

-- RELACIÓN MUCHOS A MUCHOS
CREATE TABLE 3dModelCategory (
    3dModel_id INT,
    category_id INT,
    PRIMARY KEY (3dModel_id, category_id),
    FOREIGN KEY (3dModel_id) REFERENCES 3dModel(id),
    FOREIGN KEY (category_id) REFERENCES category(id)
);

-- ----------------------------------------------------------

-- RELACIÓN DE 1 A MUCHOS
CREATE TABLE file (
    id INT AUTO_INCREMENT PRIMARY KEY,
    filePath VARCHAR(255) NOT NULL,
    3dModel_id INT,
    FOREIGN KEY (3dModel_id) REFERENCES 3dModel(id)
);

-- RELACIÓN DE 1 A MUCHOS
CREATE TABLE review (
    id INT AUTO_INCREMENT PRIMARY KEY,
    reviewText VARCHAR(255),
    rating INT,
    3dModel_id INT,
    FOREIGN KEY (3dModel_id) REFERENCES 3dModel(id)
);

-- --------------------------------------------------------------------------

INSERT INTO 3dModel (id, name, description, creation_date) 
VALUES 
(1, 'Spaceship', 'A detailed 3D model of a spaceship', '2024-01-01'),
(2, 'Castle', 'A medieval castle model', '2024-02-01'),
(3, 'Car', 'A modern sports car', '2024-03-01'),
(4, 'Tree', 'A realistic tree model', '2024-04-01'),
(5, 'Robot', 'A futuristic robot', '2024-05-01');

INSERT INTO author (id, name, email) 
VALUES 
(1, 'Juan Pérez', 'juan.perez@gmail.com'),
(2, 'María López', 'maria.lopez@gmail.com'),
(3, 'Carlos Sánchez', 'carlos.sanchez@gmail.com'),
(4, 'Ana Martínez', 'ana.martinez@gmail.com'),
(5, 'Luis Gómez', 'luis.gomez@gmail.com');

INSERT INTO category (id, name) 
VALUES 
(1, 'Sci-Fi'),
(2, 'Fantasy'),
(3, 'Vehicles'),
(4, 'Nature'),
(5, 'Technology');

INSERT INTO tag (id, name) 
VALUES 
(1, 'HighPoly'),
(2, 'LowPoly'),
(3, 'Textured'),
(4, 'Animated'),
(5, 'GameReady');

INSERT INTO license (id, type) 
VALUES 
(1, 'Creative Commons'),
(2, 'Royalty Free'),
(3, 'GPL'),
(4, 'MIT'),
(5, 'Proprietary');

INSERT INTO 3dModelLicense (3dModel_id, license_id) 
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO 3dModelAuthor (3dModel_id, author_id) 
VALUES 
(1, 1),
(1, 2),
(2, 1),
(2, 3),
(3, 4),
(3, 5),
(4, 2),
(4, 3),
(5, 4),
(5, 5);

INSERT INTO 3dModelTag (3dModel_id, tag_id) 
VALUES 
(1, 1),
(1, 2),
(2, 1),
(2, 3),
(3, 4),
(3, 5),
(4, 2),
(4, 3),
(5, 4),
(5, 5);

INSERT INTO 3dModelCategory (3dModel_id, category_id) 
VALUES 
(1, 1),
(1, 3),
(2, 2),
(2, 5),
(3, 3),
(3, 4),
(4, 4),
(4, 5),
(5, 1),
(5, 2);

INSERT INTO file (id, filePath, 3dModel_id) 
VALUES 
(1, '/models/spaceship.obj', 1),
(2, '/models/castle.obj', 2),
(3, '/models/car.obj', 3),
(4, '/models/tree.obj', 4),
(5, '/models/robot.obj', 5);

INSERT INTO review (id, reviewText, rating, 3dModel_id) 
VALUES 
(1, 'Great detail and texture!', 5, 1),
(2, 'Impressive model of a castle.', 4, 2),
(3, 'The car model is very realistic.', 5, 3),
(4, 'Perfect for my nature scene.', 4, 4),
(5, 'High quality and very detailed.', 5, 5);


-- --------------------------------------------------------------------------

UPDATE 3dModel SET name = 'New Spaceship' WHERE id = 1;

UPDATE author SET email = 'juanito.perez@gmail.com' WHERE id = 1;

UPDATE tag SET name = 'HighPoly-development' WHERE id = 1;

-- --------------------------------------------------------------------------

DELETE FROM review WHERE id = 2;

-- --------------------------------------------------------------------------

ALTER TABLE file 
ADD FOREIGN KEY (3dModel_id) 
REFERENCES 3dModel(id) 
ON DELETE CASCADE;

ALTER TABLE review 
ADD FOREIGN KEY (3dModel_id) 
REFERENCES 3dModel(id) 
ON DELETE SET NULL;

-- --------------------------------------------------------------------------

SELECT 3dModel.name, file.filePath 
FROM 3dModel 
LEFT JOIN file ON 3dModel.id = file.3dModel_id

SELECT review.reviewText, 3dModel.name
FROM review
RIGHT JOIN 3dModel ON review.3dModel_id = 3dModel.id;

SELECT 3dModel.name, 3dModelLicense.license_id
FROM 3dModel
LEFT JOIN 3dModelLicense ON 3dModel.id = 3dModelLicense.3dModel_id;

SELECT 3dModel.id, file.filePath
FROM file
RIGHT JOIN 3dModel ON file.3dModel_id = 3dModel.id;

-- --------------------------------------------------------------------------

SELECT file.filePath, 3dModel.name
FROM file
INNER JOIN 3dModel ON file.3dModel_id = 3dModel.id;

-- ------------------------------------------------------------

SELECT 3dModel.name, review.reviewText
FROM 3dModel
INNER JOIN review ON 3dModel.id = review.3dModel_id;

-- --------------------------------------------------------------------------

SELECT 3dModel.name, file.filePath 
FROM 3dModel 
LEFT JOIN file ON 3dModel.id = file.3dModel_id 
UNION 
SELECT 3dModel.name, file.filePath 
FROM file 
LEFT JOIN 3dModel ON 3dModel.id = file.3dModel_id;

-- ------------------------------------------------------------

SELECT 3dModel.name, review.reviewText 
FROM 3dModel 
LEFT JOIN review ON 3dModel.id = review.3dModel_id 
UNION 
SELECT 3dModel.name, review.reviewText 
FROM review 
LEFT JOIN 3dModel ON 3dModel.id = review.3dModel_id;

-- --------------------------------------------------------------------------

SELECT 3dModel.id, COUNT(author_id) AS author_count 
FROM 3dModel 
LEFT JOIN 3dModelAuthor ON 3dModel.id = 3dModelAuthor.3dModel_id 
GROUP BY 3dModel.id 
HAVING author_count > 1;

-- ------------------------------------------------------------

SELECT * 
FROM 3dModel 
WHERE description LIKE '%3D%';

-- ------------------------------------------------------------

SELECT author.name, COUNT(3dModelAuthor.3dModel_id) AS model_count 
FROM author 
JOIN 3dModelAuthor ON author.id = 3dModelAuthor.author_id 
GROUP BY author.name 
HAVING model_count > 1;

-- ------------------------------------------------------------

SELECT * 
FROM author 
WHERE email LIKE '%gmail.com';

