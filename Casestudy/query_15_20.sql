USE furama;

SELECT 
    nv.ma_nhan_vien,
    nv.ho_ten,
    td.ten_trinh_do,
    bp.ten_bo_phan,
    nv.so_dien_thoai,
    nv.dia_chi,
    COUNT(hd.ma_hop_dong) AS so_hop_dong
FROM nhan_vien nv
JOIN trinh_do td ON nv.ma_trinh_do = td.ma_trinh_do
JOIN bo_phan bp ON nv.ma_bo_phan = bp.ma_bo_phan
LEFT JOIN hop_dong hd 
    ON nv.ma_nhan_vien = hd.ma_nhan_vien
    AND YEAR(hd.ngay_lam_hop_dong) BETWEEN 2020 AND 2021
GROUP BY nv.ma_nhan_vien
HAVING so_hop_dong <= 3;

DELETE FROM nhan_vien
WHERE ma_nhan_vien NOT IN (
    SELECT ma_nhan_vien
    FROM hop_dong
    WHERE YEAR(ngay_lam_hop_dong) BETWEEN 2019 AND 2021
);


UPDATE khach_hang
SET ma_loai_khach = 1
WHERE ma_khach_hang IN (
    SELECT kh.ma_khach_hang
    FROM khach_hang kh
    JOIN loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
    JOIN hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
    JOIN dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
    LEFT JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
    LEFT JOIN dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
    WHERE lk.ten_loai_khach = 'Platinium'
    GROUP BY kh.ma_khach_hang
    HAVING SUM(dv.chi_phi_thue + IFNULL(hdct.so_luong * dvdk.gia,0)) > 10000000
    AND YEAR(hd.ngay_lam_hop_dong) = 2021
);

DELETE FROM khach_hang
WHERE ma_khach_hang IN (
    SELECT ma_khach_hang
    FROM hop_dong
    WHERE YEAR(ngay_lam_hop_dong) < 2021
);

UPDATE dich_vu_di_kem
SET gia = gia * 2
WHERE ma_dich_vu_di_kem IN (
    SELECT ma_dich_vu_di_kem
    FROM (
        SELECT dvdk.ma_dich_vu_di_kem
        FROM dich_vu_di_kem dvdk
        JOIN hop_dong_chi_tiet hdct 
            ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
        JOIN hop_dong hd 
            ON hdct.ma_hop_dong = hd.ma_hop_dong
        WHERE YEAR(hd.ngay_lam_hop_dong) = 2020
        GROUP BY dvdk.ma_dich_vu_di_kem
        HAVING SUM(hdct.so_luong) > 10
    ) tmp
);

SELECT 
    ma_nhan_vien AS id,
    ho_ten,
    email,
    so_dien_thoai,
    ngay_sinh,
    dia_chi
FROM nhan_vien

UNION

SELECT 
    ma_khach_hang AS id,
    ho_ten,
    email,
    so_dien_thoai,
    ngay_sinh,
    dia_chi
FROM khach_hang;