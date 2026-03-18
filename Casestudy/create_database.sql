CREATE DATABASE furama;
USE furama;

-- 1. vi_tri
CREATE TABLE vi_tri (
    ma_vi_tri INT PRIMARY KEY,
    ten_vi_tri VARCHAR(50)
);

-- 2. trinh_do
CREATE TABLE trinh_do (
    ma_trinh_do INT PRIMARY KEY,
    ten_trinh_do VARCHAR(50)
);

-- 3. bo_phan
CREATE TABLE bo_phan (
    ma_bo_phan INT PRIMARY KEY,
    ten_bo_phan VARCHAR(50)
);

-- 4. loai_khach
CREATE TABLE loai_khach (
    ma_loai_khach INT PRIMARY KEY,
    ten_loai_khach VARCHAR(50)
);

-- 5. nhan_vien
CREATE TABLE nhan_vien (
    ma_nhan_vien INT AUTO_INCREMENT PRIMARY KEY,
    ho_ten VARCHAR(100),
    ngay_sinh DATE,
    so_cccd VARCHAR(20),
    luong DOUBLE,
    so_dien_thoai VARCHAR(20),
    email VARCHAR(100),
    dia_chi VARCHAR(200),
    ma_vi_tri INT,
    ma_trinh_do INT,
    ma_bo_phan INT,
    FOREIGN KEY (ma_vi_tri) REFERENCES vi_tri(ma_vi_tri),
    FOREIGN KEY (ma_trinh_do) REFERENCES trinh_do(ma_trinh_do),
    FOREIGN KEY (ma_bo_phan) REFERENCES bo_phan(ma_bo_phan)
);

-- 6. khach_hang
CREATE TABLE khach_hang (
    ma_khach_hang INT AUTO_INCREMENT PRIMARY KEY,
    ho_ten VARCHAR(100),
    ngay_sinh DATE,
    gioi_tinh BIT,
    so_cccd VARCHAR(20),
    so_dien_thoai VARCHAR(20),
    email VARCHAR(100),
    dia_chi VARCHAR(200),
    ma_loai_khach INT,
    FOREIGN KEY (ma_loai_khach) REFERENCES loai_khach(ma_loai_khach)
);

-- 7. kieu_thue
CREATE TABLE kieu_thue (
    ma_kieu_thue INT PRIMARY KEY,
    ten_kieu_thue VARCHAR(50)
);

-- 8. loai_dich_vu
CREATE TABLE loai_dich_vu (
    ma_loai_dich_vu INT PRIMARY KEY,
    ten_loai_dich_vu VARCHAR(50)
);

-- 9. dich_vu
CREATE TABLE dich_vu (
    ma_dich_vu INT AUTO_INCREMENT PRIMARY KEY,
    ten_dich_vu VARCHAR(100),
    dien_tich INT,
    chi_phi_thue DOUBLE,
    so_nguoi_toi_da INT,
    tieu_chuan_phong VARCHAR(50),
    mo_ta_tien_nghi_khac VARCHAR(255),
    dien_tich_ho_boi DOUBLE,
    so_tang INT,
    ma_kieu_thue INT,
    ma_loai_dich_vu INT,
    FOREIGN KEY (ma_kieu_thue) REFERENCES kieu_thue(ma_kieu_thue),
    FOREIGN KEY (ma_loai_dich_vu) REFERENCES loai_dich_vu(ma_loai_dich_vu)
);

-- 10. dich_vu_di_kem
CREATE TABLE dich_vu_di_kem (
    ma_dich_vu_di_kem INT AUTO_INCREMENT PRIMARY KEY,
    ten_dich_vu_di_kem VARCHAR(100),
    gia DOUBLE,
    don_vi VARCHAR(50),
    trang_thai VARCHAR(100)
);

-- 11. hop_dong
CREATE TABLE hop_dong (
    ma_hop_dong INT AUTO_INCREMENT PRIMARY KEY,
    ngay_lam_hop_dong DATE,
    ngay_ket_thuc DATE,
    tien_dat_coc DOUBLE,
    ma_nhan_vien INT,
    ma_khach_hang INT,
    ma_dich_vu INT,
    FOREIGN KEY (ma_nhan_vien) REFERENCES nhan_vien(ma_nhan_vien),
    FOREIGN KEY (ma_khach_hang) REFERENCES khach_hang(ma_khach_hang),
    FOREIGN KEY (ma_dich_vu) REFERENCES dich_vu(ma_dich_vu)
);

-- 12. hop_dong_chi_tiet
CREATE TABLE hop_dong_chi_tiet (
    ma_hop_dong_chi_tiet INT AUTO_INCREMENT PRIMARY KEY,
    so_luong INT,
    ma_hop_dong INT,
    ma_dich_vu_di_kem INT,
    FOREIGN KEY (ma_hop_dong) REFERENCES hop_dong(ma_hop_dong),
    FOREIGN KEY (ma_dich_vu_di_kem) REFERENCES dich_vu_di_kem(ma_dich_vu_di_kem)
);
SHOW TABLES;