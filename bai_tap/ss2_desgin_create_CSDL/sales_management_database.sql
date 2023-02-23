drop database if exists sales_management_database;
create database sales_management_database;
use sales_management_database;
create table customer(
customer_id int primary key auto_increment not null,
customer_name varchar(255),
customer_age int
);

create table `order`(
order_id int primary key auto_increment not null,
customer_id int,
-- foreign key(customer_id) references customer(customer_id),
order_date date,
order_total_price int
);

create table product(
product_id int primary key auto_increment not null,
product_name varchar(255),
product_price int
);

create table order_detail(
order_id int,
foreign key(order_ID) references `order`(order_id),
product_id int,
foreign key(product_id) references product(product_id),
order_quantity int
);

insert into customer(customer_name,customer_age)
value("Chính",20),
("Minh",24),
("Lãnh",33);
select * from customer;

insert into `order`(order_date,order_total_price)
value("2023-02-22",20000),
("2023-02-22",50000),
("2023-02-22",30000);
select * from `order`;

