create table users ( 
	Email varchar(100) primary key,
	Password varchar(80) not null,
	Nickname varchar(30) unique not null);
	

