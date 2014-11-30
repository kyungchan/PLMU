CREATE DATABASE plmudb DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;

GRANT ALL ON plmudb.* TO 'web'@'localhost' IDENTIFIED BY 'asdf';

use plmudb;

CREATE TABLE musics (
	id INT AUTO_INCREMENT PRIMARY KEY,
	instrument VARCHAR(20) NOT NULL,
	musiccode TEXT NOT NULL
);


CREATE TABLE articles (
	id INT AUTO_INCREMENT PRIMARY KEY, 
	title VARCHAR(100) NOT NULL,
	context TEXT NOT NULL,
	author VARCHAR(20) NOT NULL,
	time_stamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	musicid INT,
	CONSTRAINT FOREIGN KEY (musicid) REFERENCES musics(id)
);

CREATE TABLE members (
	userid INT AUTO_INCREMENT PRIMARY KEY,
	email VARCHAR(15) NOT NULL UNIQUE,
	pw VARCHAR(50) NOT NULL
);

INSERT INTO musics VALUES (1, 'piano', 'asdfasdf');
INSERT INTO musics VALUES (2, 'piano', 'asdfasdf');
INSERT INTO musics VALUES (3, 'piano', 'asdfasdf');
INSERT INTO musics VALUES (4, 'piano', 'asdfasdf');

INSERT INTO articles VALUES (1, 'test1', 'test1111', 'a1', '2014-10-01 12:34:56', 1);
INSERT INTO articles VALUES (2, 'test2', 'test2222', 'a2', '2014-10-02 12:34:56', 2);
INSERT INTO articles VALUES (3, 'test3', 'test3333', 'a3', '2014-10-03 12:34:56', 3);
INSERT INTO articles VALUES (4, 'test4', 'test4444', 'a4', '2014-10-04 12:34:56', 4);