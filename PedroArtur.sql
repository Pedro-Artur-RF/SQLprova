CREATE DATABASE main_db;
USE main_db;

CREATE TABLE users_tb(
	user_id CHAR(7) AUTO_INCREMENT PRIMARY KEY UNIQUE NOT NULL,
    user_f_nm VARCHAR(20),
    user_l_nm VARCHAR(20),
    user_email VARCHAR(40)
);

create table uniform_tb(
	uniform_id CHAR(7) PRIMARY KEY NOT NULL,
    uniform_country CHAR(56) UNIQUE NOT NULL
);

create table food_tb(
	food_id char(7) PRIMARY KEY NOT NULL UNIQUE,
    food_price FLOAT NOT NULL,
    food_nm char(20) NOT NULL
);

create table drinks_tb(
	drink_id char(7) PRIMARY KEY NOT NULL UNIQUE,
    drink_price FLOAT NOT NULL,
    drink_nm char(20) NOT NULL
);

create table matches_tb(
	match_id char(7) PRIMARY KEY NOT NULL UNIQUE,
    match_name varchar(115) NOT NULL UNIQUE,
    match_date DATE NOT NULL
);