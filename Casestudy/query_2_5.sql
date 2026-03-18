USE furama;

SELECT *
FROM nhan_vien
WHERE 
    (ho_ten LIKE 'H%' OR ho_ten LIKE 'T%' OR ho_ten LIKE 'K%')
    AND LENGTH(ho_ten) <= 15;

SELECT *
FROM khach_hang
WHERE 
    (YEAR(CURDATE()) - YEAR(ngay_sinh)) BETWEEN 18 AND 50
    AND (dia_chi LIKE '%Đà Nẵng%' OR dia_chi LIKE '%Quảng Trị%');


SELECT 
    kh.ma_khach_hang,
    kh.ho_ten,
    COUNT(hd.ma_hop_dong) AS so_lan_dat_phong
FROM khach_hang kh
JOIN loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
LEFT JOIN hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
WHERE lk.ten_loai_khach = 'Diamond'
GROUP BY kh.ma_khach_hang, kh.ho_ten
ORDER BY so_lan_dat_phong ASC;


SELECT 
    kh.ma_khach_hang,
    kh.ho_ten,
    lk.ten_loai_khach,
    hd.ma_hop_dong,
    dv.ten_dich_vu,
    hd.ngay_lam_hop_dong,
    hd.ngay_ket_thuc,
    IFNULL(dv.chi_phi_thue + SUM(hdct.so_luong * dvdk.gia), dv.chi_phi_thue) AS tong_tien
FROM khach_hang kh
LEFT JOIN loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
LEFT JOIN hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
LEFT JOIN dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
LEFT JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
LEFT JOIN dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
GROUP BY hd.ma_hop_dong;