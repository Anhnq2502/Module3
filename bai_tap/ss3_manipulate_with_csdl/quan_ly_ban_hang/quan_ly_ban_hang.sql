create database quan_ly_ban_hang;
use quan_ly_ban_hang;
-- drop database quan_ly_ban_hang;
create table customer(
customer_id int auto_increment,
customer_name varchar(255),
customer_age int,

primary key(customer_id)
);

create table is_order(
order_id int auto_increment,
customer_id int not null,
order_date date,
order_total_price int,

primary key(order_id),
foreign key(customer_id) references customer(customer_id)
);

create table product(
product_id int auto_increment,
product_name varchar(255),
product_price int,

primary key(product_id)
);

create table order_detail(
order_id int not null,
product_id int not null,

primary key(order_id,product_id),
foreign key(order_ID) references is_order(order_id),
foreign key(product_id) references product(product_id),
order_quantity int
);

insert into customer(customer_name,customer_age)
value('Minh Quan', 10),
('Ngoc Oanh', 20),
('Hong Ha', 50);

insert into is_order(customer_id,order_date)
value(1,'2006-3-21'),
(2,'2006-3-23'),
(1,'2006-6-16');

insert into product(product_name, product_price)
value('May Giat', 3),
('Tu Lanh', 5),
('Dieu Hoa', 7),
('Quat', 1),
('Bep Dien', 2);

insert into order_detail(order_id, product_id, order_quantity)
value(1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3); 

select order_id, order_date, order_total_price
from is_order;

select customer_name, product_name
from customer as c
inner join is_order as o on c.customer_id = o.customer_id
inner join order_detail as od on o.order_id = od.order_id
inner join product as p on od.product_id = p.product_id;

select customer_name
from customer
left join is_order on customer.customer_id = is_order.customer_id
where is_order.order_id is null;

update is_order as a
inner join order_detail as b on b.order_id = a.order_id
inner join product as c on c.product_id = b.product_id
set order_total_price = b.order_quantity * c.product_price;
select order_id, order_date, order_total_price
from is_order;