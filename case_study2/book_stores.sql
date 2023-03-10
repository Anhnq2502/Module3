create database book_stores;
use book_stores;
-- drop database book_stores;
create table book_type(
	book_type_code int auto_increment primary key,
    book_type_name varchar(255)
);

create table customer(
	customer_code int auto_increment primary key,
    customer_name varchar(255),
    customer_day_of_birth date,
    customer_email varchar(255),
    customer_address varchar(255),
    customer_phone varchar(255)
);




create table book(
	book_code int auto_increment primary key,
    book_name varchar(255),
    book_price float,
    writer_name varchar(255),
    publishing_year year,
    publishing_company varchar(255),
    publisher varchar(255),
    translator varchar(255),
    detailed_description text,
    book_type_code int,
    
    foreign key(book_type_code) references book_type(book_type_code)
);

create table bill(
	bill_code int auto_increment primary key,
    customer_code int,
    book_code int,
    
    foreign key(customer_code) references customer(customer_code),
    foreign key(book_code) references book(book_code)
);

create table details_bill(
	details_bill_code int auto_increment primary key,
    quantity int,
    bill_code int,
    book_code int,
    
    foreign key(bill_code) references bill(bill_code),
    foreign key(book_code) references book(book_code)
);

create table account_admin(
	username varchar(255),
    password varchar(255)
);
