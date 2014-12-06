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
	likecount INT NOT NULL DEFAULT '0',
	dislike INT NOT NULL DEFAULT '0',
	musicid INT,
	pw VARCHAR(255) NOT NULL,
	CONSTRAINT FOREIGN KEY (musicid) REFERENCES musics(id) ON DELETE CASCADE
);

CREATE TABLE members (
	userid INT AUTO_INCREMENT PRIMARY KEY,
	email VARCHAR(50) NOT NULL UNIQUE,
	pw VARCHAR(50) NOT NULL
);

INSERT INTO musics VALUES (1, 'piano', 'piano-3C,0.66|piano-3D,1.06|piano-3E,1.44|piano-3F,1.88|piano-3G,2.27|piano-3A,2.68|piano-3B,3.05|piano-3B,4|piano-3A,4.46|piano-3G,4.82|piano-3F,5.23|piano-3E,5.64|piano-3D,6.01|piano-3C,6.38|');
INSERT INTO musics VALUES (2, 'piano', 'piano-4G,0.36|piano-4G,0.68|piano-4A,1.06|piano-4A,1.46|piano-4G,1.83|piano-4G,2.19|piano-4E,2.57|piano-4G,3.29|piano-4G,3.65|piano-4E,3.99|piano-4E,4.32|piano-4D,4.73|piano-4G,5.94|piano-4G,6.27|piano-4A,6.56|piano-4A,6.87|');
INSERT INTO musics VALUES (3, 'piano', 'piano-3C,0.42|piano-3D,0.79|piano-3E,1.2|piano-3E,1.63|piano-3C,2.01|piano-3E,2.4|piano-3G,2.79|piano-3A,3.04|piano-3G,3.32|piano-3C,3.76|piano-3D,4.16|piano-3E,4.58|piano-3E,4.93|piano-3C,5.33|piano-3D,5.68|piano-3G,6|piano-3A,6.26|piano-3G,6.54|');

INSERT INTO articles(title, context, author, time_stamp, musicid, pw) VALUES ('test1', 'test11111', 'a1', '2014-10-01 12:34:56', 1, PASSWORD('test'));
INSERT INTO articles(title, context, author, time_stamp, musicid, pw) VALUES ('test2', 'test22222', 'a2', '2014-10-02 12:34:56', 2, PASSWORD('test'));
INSERT INTO articles(title, context, author, time_stamp, musicid, pw) VALUES ('test3', 'test33333', 'a3', '2014-10-03 12:34:56', 3, PASSWORD('test'));
