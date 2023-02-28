use furama_database;


select table_name, is_updatable
from information_schema.views
where table_schema = 'furama_database';


-- Câu 2:
select * 
from nhan_vien
where ho_ten like 'H%' or ho_ten like 'T%' or ho_ten like 'K%' and length(ho_ten) <=15;

-- Câu 3:
select *
from khach_hang
where ((timestampdiff(year,ngay_sinh,now())) between 18 and 50) and (dia_chi like '%Đà Nẵng' or dia_chi like '%Quảng Trị');

-- Câu 4:
select kh.ma_khach_hang, kh.ho_ten, ten_loai_khach, count(kh.ma_khach_hang) as so_lan_dat_phong
from khach_hang as kh
inner join loai_khach as lk on lk.ma_loai_khach = kh.ma_loai_khach
inner join hop_dong as hd on hd.ma_khach_hang = kh.ma_khach_hang
where ten_loai_khach = 'Diamond'
group by kh.ma_khach_hang
order by so_lan_dat_phong asc;

-- câu 5:

select kh.ma_khach_hang, kh.ho_ten,lk.ten_loai_khach, hd.ma_hop_dong, dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, dv.chi_phi_thue + hdct.so_luong * dvdk.gia as tong_tien
from khach_hang as kh
left join hop_dong as hd on kh.ma_khach_hang = hd.ma_khach_hang
left join loai_khach as lk on lk.ma_loai_khach = kh.ma_loai_khach
left join dich_vu as dv on dv.ma_dich_vu = hd.ma_dich_vu
left join hop_dong_chi_tiet as hdct on hdct.ma_hop_dong = hd.ma_hop_dong
left join dich_vu_di_kem as dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by hd.ma_hop_dong
order by ma_khach_hang asc;


-- Câu 6: Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu 
from dich_vu as dv
inner join loai_dich_vu as ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
where ma_dich_vu not in (select  ma_dich_vu from hop_dong where month(ngay_lam_hop_dong) between 1 and 3)
order by dien_tich desc;


-- Câu 7: Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
select ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu
from dich_vu as dv
inner join  loai_dich_vu as ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
where ma_dich_vu not in (select ma_dich_vu from hop_dong where ngay_lam_hop_dong like '2021%');


-- Câu 8: Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Cách 1:
select distinct ho_ten
from khach_hang
order by ho_ten;
-- Cách 2:
select ho_ten
from khach_hang
group by ho_ten;
-- Cách 3:


-- Câu 9: Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select month(ngay_lam_hop_dong) as thang, count(month(ngay_lam_hop_dong)) as so_luong_khach_hang 
from hop_dong 
where year(ngay_lam_hop_dong) = 2021
group by month(ngay_lam_hop_dong)
order by month(ngay_lam_hop_dong);


-- Câu 10: Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
select hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc, ifnull(sum(hdct.so_luong),0) as so_luong_dich_vu_di_kem
from hop_dong as hd
left join hop_dong_chi_tiet as hdct on hdct.ma_hop_dong = hd.ma_hop_dong
group by hd.ma_hop_dong;

-- Câu 11: Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”. 
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem
from khach_hang as kh
inner join loai_khach as lk on lk.ma_loai_khach= kh.ma_loai_khach
inner join hop_dong as hd on hd.ma_khach_hang = kh.ma_khach_hang
inner join hop_dong_chi_tiet as hdct on hdct.ma_hop_dong = hd.ma_hop_dong 
inner join dich_vu_di_kem as dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
where lk.ten_loai_khach = 'Diamond' and (kh.dia_chi like '%Vinh' or kh.dia_chi like '%Quảng Ngãi');


-- Câu 12: Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
select hd.ma_hop_dong, nv.ho_ten, kh.ho_ten, kh.so_dien_thoai, dv.ma_dich_vu, dv.ten_dich_vu, ifnull(sum(hdct.so_luong), 0) as so_luong_dich_vu_di_kem, hd.tien_dat_coc 
from hop_dong as hd
left join nhan_vien as nv on nv.ma_nhan_vien = hd.ma_nhan_vien
left join khach_hang as kh on kh.ma_khach_hang = hd.ma_khach_hang
left join dich_vu as dv on dv.ma_dich_vu = hd.ma_dich_vu
left join hop_dong_chi_tiet as hdct on hdct.ma_hop_dong = hd.ma_hop_dong
where ((month(ngay_lam_hop_dong) between 10 and 12) and (year(ngay_lam_hop_dong) = 2020)) 
and month(ngay_lam_hop_dong) not in((month(ngay_lam_hop_dong) between 1 and 6) and (year(ngay_lam_hop_dong) = 2021))
group by hd.ma_hop_dong;

-- Câu 13: Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, hdct.so_luong as so_luong_dich_vu_di_kem
from dich_vu_di_kem as dvdk
inner join hop_dong_chi_tiet as hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
where hdct.so_luong = (select max(so_luong) from hop_dong_chi_tiet)
order by ma_dich_vu_di_kem;

-- Câu 14: Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).
select hd.ma_hop_dong, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem, count(dvdk.ma_dich_vu_di_kem) as so_lan_su_dung
from dich_vu_di_kem as dvdk
inner join hop_dong_chi_tiet as hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
inner join hop_dong as hd on hd.ma_hop_dong = hdct.ma_hop_dong
inner join dich_vu as dv on dv.ma_dich_vu = hd.ma_dich_vu
inner join loai_dich_vu as ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
group by dvdk.ma_dich_vu_di_kem
having count(dvdk.ma_dich_vu_di_kem) = 1
order by hd.ma_hop_dong asc;

-- Câu 15: Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
select nv.ma_nhan_vien, nv.ho_ten, td.ten_trinh_do, bp.ten_bo_phan, nv.so_dien_thoai, nv.dia_chi
from nhan_vien as nv
inner join trinh_do as td on td.ma_trinh_do = nv.ma_trinh_do
inner join bo_phan as bp on bp.ma_bo_phan = nv.ma_bo_phan
inner join hop_dong as hd on hd.ma_nhan_vien = nv.ma_nhan_vien
group by nv.ma_nhan_vien
having count(hd.ma_nhan_vien) <= 3
order by ma_nhan_vien asc;

-- Câu 16: Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
create view nhan_vien1
as select nv.ma_nhan_vien, nv.ho_ten
from nhan_vien as nv;
create view nhan_vien2
as select nv.ma_nhan_vien 
from nhan_vien as nv
inner join hop_dong as hd on hd.ma_nhan_vien = nv.ma_nhan_vien
group by nv.ma_nhan_vien;
delete
from nhan_vien1
where nhan_vien1.ma_nhan_vien not in (select nhan_vien2.ma_nhan_vien from nhan_vien2);

-- Câu 17

