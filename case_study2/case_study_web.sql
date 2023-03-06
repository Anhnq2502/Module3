create database web;
use web;
drop database web;

create table loai_sach(
	ma_loai_sach int,
    ten_loai_sach varchar(255),
    
    primary key(ma_loai_sach)
);

create table tac_gia(
	ma_tac_gia int,
	ten_tac_gia varchar(255),

	primary key(ma_tac_gia)
);

create table nha_san_xuat(
	ma_nha_san_xuat int,
    ten_nha_san_xuat varchar(255),
    
    primary key(ma_nha_san_xuat)
);

create table xuat_ban(
	ma_xuat_ban int,
    nam_xuat_ban year,
    
    primary key(ma_xuat_ban)
);

create table sach(
	ma_sach int auto_increment,
    ten_sach varchar(255),
    gia float,
    so_luong int,
    ma_tac_gia int,
    ma_nha_san_xuat int,
    ma_xuat_ban int,
    ma_loai_sach int,
    
    primary key(ma_sach),
    foreign key (ma_tac_gia) references tac_gia(ma_tac_gia),
    foreign key (ma_nha_san_xuat) references nha_san_xuat(ma_nha_san_xuat),
	foreign key (ma_xuat_ban) references xuat_ban(ma_xuat_ban),
    foreign key (ma_loai_sach) references loai_sach(ma_loai_sach)
);

create table khach_hang(
	ma_khach_hang int,
    ten_khach_hang varchar(255),
    
    primary key(ma_khach_hang)
);

create table hoa_don(
	ma_hoa_don int,
    ma_khach_hang int,
    ma_sach int,
    so_luong int,
    
    primary key (ma_hoa_don),
    foreign key (ma_khach_hang) references khach_hang(ma_khach_hang),
    foreign key (ma_sach) references sach(ma_sach)
);