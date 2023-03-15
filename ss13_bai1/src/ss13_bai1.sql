CREATE DATABASE users;
USE users;

create table users (
 id  int,
 name varchar(255) NOT NULL,
 email varchar(255) NOT NULL,
 country varchar(255),
 PRIMARY KEY (id)
);

insert into users(id,name, email, country) values(5,'Anh','minh@codegym.vn','Viet Nam');
insert into users(id,name, email, country) values(2,'Kante','kante@che.uk','Kenia');

select * from users order by name;


DELIMITER $$
create procedure find_all_user()
begin
select *
from users;
end$$
DELIMITER ;

call find_all_user();

DELIMITER $$
create procedure edit_user(in set_id int, set_name varchar(255), set_email varchar(255), set_country varchar(255))
begin
update users
set name = set_name,
email = set_email,
country = set_country
where id = set_id;
end $$
DELIMITER ;

DELIMITER $$
create procedure delete_user(in set_id int)
begin
Delete from users
where id = set_id;
end $$
DELIMITER ;

