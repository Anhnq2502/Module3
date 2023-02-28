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
create procedure add_product()
begin
insert into products(id, product_code, product_name, product_price, product_amount, product_description, product_status)
value(6,6,'PC',1800,10,'Máy đẹp, chạy êm, mỏng nhẹ, chơi game mượt', 1);
end $$
Delimiter ;
call add_product();

-- Tạo store procedure sửa thông tin sản phẩm theo id
Delimiter $$
create procedure update_product(in a int)
begin
update products
set product_price = 0
where id = a ;
end $$
Delimiter ;
call update_product(3);

-- Tạo store procedure xoá sản phẩm theo id
Delimiter $$
create procedure delete_product(in b int)
begin
delete
from product
where id = b ;
end $$
Delimiter ;