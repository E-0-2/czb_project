create database client_tb;
use client_tb;

drop database client_tb;

create database czb_db;

use czb_db;

create table client_tb(
 userid varchar(20) not null primary key,
 userpass varchar(20) not null,
 username varchar(10) not null,
 userrrn char(14) not null,
 useraddr varchar(100) null,
 userphone int(12) not null,
 useremail varchar(30) not null
)charset='utf8';

desc client_tb;

create table res_tb(
num int auto_increment not null primary key,
userid varchar(20) not null,
movie_title varchar(40) null,
movie_location1 varchar(30) null,
movie_location2 varchar(30) null,
movie_date date not null default current_timestamp,
movie_time varchar(6) not null,
movie_seat varchar(10) not null,
foreign key (userid) references client_tb (userid)
)charset = 'utf8';

create table card_tb (
num int auto_increment not null primary key,
userid varchar(20) not null,
card_co varchar(20) not null,
card_num char(19) not null,
cvc_num char(3) not null,
foreign key (userid) references client_tb (userid)
)charset = 'utf8';

create table bank_tb (
num int auto_increment primary key not null,
userid varchar(20) not null,
bank_name varchar(15) not null,
account varchar(30) not null,
foreign key (userid) references client_tb (userid)
)charset = 'utf8';

create table pay_pass_tb (
num int not null auto_increment primary key,
userid varchar(20) not null,
paypass char(4) not null,
foreign key (userid) references client_tb (userid)
)charset = 'utf8';

