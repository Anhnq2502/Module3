create database demo;
use demo;
create table products(
	id int,
    product_code int,
    product_name varchar(255),
    product_price float,
    product_amount int,
    product_description text,
    product_status bit,
    
    primary key(id)
);
insert into products(id, product_code, product_name, product_price, product_amount, product_description, product_status)
value(1,1,'Lenovo',1000,20,'Máy đẹp, chạy êm, nhanh nóng', 1),
(2,2,'Dell',900,15,'Máy bền, dùng thuận tay,hơi nặng', 1),
(3,3,'Asus',1200,18,'Máy đẹp, chạy êm, chơi game mượt', 1),
(4,4,'Acer',1100,25,'Máy đẹp, chạy êm, mỏng nhẹ', 1),
(5,5,'Mac',2000,10,'Máy đẹp, chạy êm, mỏng nhẹ, chơi game mượt', 1);


show indexes from products;

-- Tạo unique index 
create unique index code_index on products(product_code);

-- Tạo Composite Index
create index name_price_index on products(product_name, product_price);

-- explain 
explain select *
from products
where product_code = 4;

explain select * 
from products
where product_name = 'Asus';

-- Tạo view
create or replace view product_view
as
	select product_code, product_name, product_price, product_status
    from products;

-- sửa đổi view
update product_view
set product_price = 3000
where product_name = 'Mac';

-- Xoá view
drop view product_view;

-- Tạo store procedure lấy tất cả thông tin trong bảng product
Delimiter $$
create procedure infor_product()
begin
select * 
from products;
end $$
Delimiter ;
call infor_product();

-- Tạo store procedure thêm một sản phẩm mới
Delimiter $$
create procedure add_product(
	id1 int,
    product_code1 int,
    product_name1 varchar(255),
    product_price1 float,
    product_amount1 int,
    product_description1 text,
    product_status1 bit)
begin
insert into product(id, product_code, product_name, product_price, product_amount, product_description, product_statu)
value(id = id1,
product_code = product_code1,
product_name = product_name1,
product_price = product_price1,
product_amount = product_amount1,
product_description = product_description1,
product_status = product_status1);
end $$
Delimiter ;

-- Tạo store procedure sửa thông tin sản phẩm theo id
Delimiter $$
create procedure update_product(in a int,
	id1 int,
    product_code1 int,
    product_name1 varchar(255),
    product_price1 float,
    product_amount1 int,
    product_description1 text,
    product_status1 bit)
begin
update products
set id = id1,
product_code = product_code1,
product_name = product_name1,
product_price = product_price1,
product_amount = product_amount1,
product_description = product_description1,
product_status = product_status1
where id = a ;
end $$
Delimiter ;
call update_product(3,7,7,'a',2,3,'abc',0);

-- Tạo store procedure xoá sản phẩm theo id
Delimiter $$
create procedure delete_product(in b int)
begin
delete
from product
where id = b ;
end $$
Delimiter ;