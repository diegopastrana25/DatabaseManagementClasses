CREATE DATABASE actividad1;

SHOW DATABASES;

USE actividad1;

CREATE TABLE film(
id INT(15) PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(100) NOT NULL UNIQUE,
year INT(4) NOT NULL,
producer VARCHAR(20) NOT NULL,
synopsis VARCHAR(255) NOT NULL UNIQUE,
rating ENUM("1 STAR", "2 STAR", "3 STAR") NOT NULL,
watched ENUM("YES", "NO") NOT NULL,
income INT(15) NOT NULL
);

INSERT INTO film(title, year, producer, synopsis, rating, watched, income)
VALUES
  ("Interstellar", 2014, "Warner Bros", "A group of astronauts travels through a wormhole in search of a new home for humanity", "3 STAR", "YES", 677471339),
  ("The Martian", 2015, "20th Century Fox", "An astronaut becomes stranded on Mars and must struggle to survive until rescue is possible", "3 STAR", "YES", 630161890),
  ("The Lord of the Rings: The Fellowship of the Ring", 2001, "New Line Cinema", "A group of adventurers embarks on a quest to destroy a powerful ring and stop the Dark Lord", "3 STAR", "YES", 871530324),
  ("The Hobbit: An Unexpected Journey", 2012, "Warner Bros", "Bilbo Baggins joins a group of dwarves on a journey to reclaim their kingdom from a dragon", "3 STAR", "YES", 1017003568),
  ("Gravity", 2013, "Warner Bros", "Two astronauts are stranded in space after an accident at a space station", "3 STAR", "YES", 723192705);
