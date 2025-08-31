create database videoclub;
use videoclub;

create table movie(
    idMovie int(250) primary key,
    name varchar(250),
    genre varchar(250),
    year int(250),
    country varchar(250),
    price varchar(250)
);

create table member(
    idMember int(250)primary key,
    name varchar(250),
    registerDay date,
    phone int(250),
    DNI varchar(250),
    address varchar(250)
);

create table renting(
    idRenting int(250) primary key,
    member_id int(250),
    movie_id int(250),
    dayteOut date,
    dateIn date
);

INSERT INTO movie (idMovie, name, genre, year, country, price) 
VALUES
    (1, 'El felpudo mágico', 'Comedia', 1995, 'Francia', '4'),
    (2, 'Two Much', 'Comedia', 1995, 'España', '3.5'),
    (3, 'El día de la bestia', 'Comedia', 1996, 'España', '3'),
    (4, 'Éxtasis', 'Drama', 1995, 'España', '4'),
    (5, 'Apolo 13', 'Suspense', 1995, 'España', '4.5'),
    (6, 'Desperado', 'Acción', 1995, 'EEUU', '3'),
    (7, 'Pena de muerte', 'Drama', 1996, 'EEUU', '3');

INSERT INTO member (idMember, name, registerDay, phone, DNI, address) 
VALUES
    (1, 'Antonio Olmo García', '2010-01-20', 111111111, '45111111A', 'Baeza, 12, 5A'),
    (2, 'Miguel Armas Ruíz', '2010-05-23', 222222222, '45222222B', 'La Valeta, 25'),
    (3, 'Antonio López Pérez', '2009-04-13', 333333333, '45333333C', 'Álamos, 23'),
    (4, 'Teresa Sánchez Sanz', '2009-08-22', 444444444, '45444444D', 'Cerón, 3, 2B'),
    (5, 'María Santana Santana', '2010-12-12', 555555555, '45555555E', 'Avd Marítima'),
    (6, 'Nuria Marrero López', '2009-05-11', 666666666, '45666666F', 'La luna, 2'),
    (7, 'Benito Pérez Galdós', '2010-11-02', 777777777, '45777777G', 'Falsa, 123');

INSERT INTO renting (idRenting, member_id, movie_id, dayteOut, dateIn) 
VALUES
    (1, 1, 4, '2010-07-12', '2010-07-13'),
    (2, 3, 7, '2010-09-11', NULL),
    (3, 4, 3, '2011-01-24', '2011-01-25'),
    (4, 4, 5, '2011-01-01', NULL),
    (5, 2, 2, '2011-01-21', '2011-01-22'),
    (6, 5, 1, '2011-01-24', '2011-01-27'),
    (7, 1, 7, '2011-01-22', '2011-01-23');

