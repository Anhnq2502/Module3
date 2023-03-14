create database user_manage;
use user_manage;

create table user_manage(
	user_id int,
    user_name varchar(255),
    user_country varchar(255),
    
    primary key(user_id)
);


insert into user_manage(user_id, user_name, user_country)
value(1,"Minh","Việt Nam"),
(2,"Chính","Việt Nam");
