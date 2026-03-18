USE furama;

-- 1. vi_tri
INSERT INTO vi_tri VALUES 
(1, 'Lễ tân'),
(2, 'Phục vụ'),
(3, 'Chuyên viên'),
(4, 'Giám sát'),
(5, 'Quản lý'),
(6, 'Giám đốc');

-- 2. trinh_do
INSERT INTO trinh_do VALUES 
(1, 'Trung cấp'),
(2, 'Cao đẳng'),
(3, 'Đại học'),
(4, 'Sau đại học');

-- 3. bo_phan
INSERT INTO bo_phan VALUES 
(1, 'Sale-Marketing'),
(2, 'Hành chính'),
(3, 'Phục vụ'),
(4, 'Quản lý');

-- 4. loai_khach
INSERT INTO loai_khach VALUES 
(1, 'Diamond'),
(2, 'Platinium'),
(3, 'Gold'),
(4, 'Silver'),
(5, 'Member');

-- 5. nhan_vien
INSERT INTO nhan_vien 
(ho_ten, ngay_sinh, so_cccd, luong, so_dien_thoai, email, dia_chi, ma_vi_tri, ma_trinh_do, ma_bo_phan)
VALUES
('Hồ Thị Yến','1995-12-12','123',10000000,'0901','yen@gmail.com','Đà Nẵng',1,3,1),
('Tòng Hoàng','1990-01-01','124',8000000,'0902','hoang@gmail.com','Đà Nẵng',2,2,2),
('Nguyễn Văn A','1985-03-03','125',7000000,'0903','a@gmail.com','Huế',3,3,3),
('Khúc Nguyễn An Nghi','2000-11-08','126',9000000,'0904','nghi@gmail.com','Đà Nẵng',2,2,3);

-- 6. khach_hang
INSERT INTO khach_hang
(ho_ten, ngay_sinh, gioi_tinh, so_cccd, so_dien_thoai, email, dia_chi, ma_loai_khach)
VALUES
('Nguyễn Mỹ Kim','1995-01-01',1,'111','0905','kim@gmail.com','Đà Nẵng',1),
('Trương Đình Nghệ','1980-02-02',1,'222','0906','nghe@gmail.com','Quảng Trị',1),
('Dương Văn Quan','1992-03-03',1,'333','0907','quan@gmail.com','Đà Nẵng',1),
('Phạm Xuân Diệu','1990-05-05',1,'444','0908','dieu@gmail.com','Quảng Trị',3);

-- 7. kieu_thue
INSERT INTO kieu_thue VALUES 
(1, 'year'),
(2, 'month'),
(3, 'day'),
(4, 'hour');

-- 8. loai_dich_vu
INSERT INTO loai_dich_vu VALUES 
(1, 'Villa'),
(2, 'House'),
(3, 'Room');

-- 9. dich_vu
INSERT INTO dich_vu
(ten_dich_vu, dien_tich, chi_phi_thue, so_nguoi_toi_da, tieu_chuan_phong, mo_ta_tien_nghi_khac, dien_tich_ho_boi, so_tang, ma_kieu_thue, ma_loai_dich_vu)
VALUES
('Villa Beach Front',25000,10000000,10,'vip','Có hồ bơi',500,4,3,1),
('House Princess 01',14000,5000000,7,'vip','Có bếp',NULL,3,2,2),
('Room Twin 01',5000,1000000,2,'normal','Có tivi',NULL,NULL,4,3),
('Room Twin 02',3000,900000,2,'normal','Có tivi',NULL,NULL,4,3);

-- 10. dich_vu_di_kem
INSERT INTO dich_vu_di_kem
(ten_dich_vu_di_kem, gia, don_vi, trang_thai)
VALUES
('Massage',10000,'lần','ok'),
('Karaoke',20000,'giờ','ok'),
('Ăn uống',50000,'suất','ok');

-- 11. hop_dong
INSERT INTO hop_dong
(ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu)
VALUES
('2021-01-01','2021-01-05',200000,1,1,1),
('2021-02-01','2021-02-03',300000,2,2,2),
('2021-03-01','2021-03-06',400000,1,3,3),
('2020-12-01','2020-12-03',100000,2,4,4);

-- 12. hop_dong_chi_tiet
INSERT INTO hop_dong_chi_tiet
(so_luong, ma_hop_dong, ma_dich_vu_di_kem)
VALUES
(2,1,1),
(1,2,2),
(3,3,1),
(1,4,3);
SELECT * FROM khach_hang;
SELECT * FROM dich_vu;
SELECT * FROM hop_dong;