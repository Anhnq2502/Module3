-- drop database if exists sales_management_database;
create database sales_management_database;
use sales_management_database;
create table customer(
customer_id int primary key auto_increment,
customer_name varchar(255),order_detail
customer_age int
);

create table `order`(
order_id int primary key auto_increment,
customer_id int not null,
foreign key(customer_id) references customer(customer_id),
order_date date,
order_total_price int
);

create table product(
product_id int primary key auto_increment,
product_name varchar(255),
product_price int
);

create table order_detail(
order_id int not null,
product_id int not null,

primary key(order_id,product_id),
foreign key(order_ID) references `order`(order_id),
foreign key(product_id) references product(product_id),
order_quantity int
);

insert into customer(customer_name,customer_age)
value("Chính",20),
("Minh",24),
("Lãnh",33);
select * from customer;

insert into `order`(customer_id,order_date,order_total_price)
value(1,"2023-02-22",20000),
(2,"2023-02-22",50000),
(3,"2023-02-22",30000);
select * from `order`;
insert into product(product_name,product_price)
value("Bánh", 10000),
("Kẹo", 5000),
("Nước ngọt", 10000);
insert into order_detail(order_id,product_id,order_quantity)
value(1,1,5),
(2,2,2),
(3,3,10);
select * from order_detail;
