CREATE DATABASE quanlyvattu;
USE quanlyvattu;
CREATE TABLE nhacc (
    MaNCC INT PRIMARY KEY,
    TenNCC VARCHAR(100),
    DiaChi VARCHAR(200),
    SDT VARCHAR(20)
);
CREATE TABLE vattu (
    MaVTU INT PRIMARY KEY,
    TenVTU VARCHAR(100)
);
CREATE TABLE dondh (
    SoDH INT PRIMARY KEY,
    NgayDH DATE,
    MaNCC INT,
    FOREIGN KEY (MaNCC) REFERENCES nhacc(MaNCC)
);
CREATE TABLE phieunhap (
    SoPN INT PRIMARY KEY,
    NgayNhap DATE
);
CREATE TABLE phieuxuat (
    SoPX INT PRIMARY KEY,
    NgayXuat DATE
);
CREATE TABLE chitiet_dondh (
    SoDH INT,
    MaVTU INT,
    PRIMARY KEY (SoDH, MaVTU),
    FOREIGN KEY (SoDH) REFERENCES dondh(SoDH),
    FOREIGN KEY (MaVTU) REFERENCES vattu(MaVTU)
);
CREATE TABLE chitiet_phieunhap (
    SoPN INT,
    MaVTU INT,
    DGNhap FLOAT,
    SLNhap INT,
    PRIMARY KEY (SoPN, MaVTU),
    FOREIGN KEY (SoPN) REFERENCES phieunhap(SoPN),
    FOREIGN KEY (MaVTU) REFERENCES vattu(MaVTU)
);
CREATE TABLE chitiet_phieuxuat (
    SoPX INT,
    MaVTU INT,
    DGXuat FLOAT,
    SLXuat INT,
    PRIMARY KEY (SoPX, MaVTU),
    FOREIGN KEY (SoPX) REFERENCES phieuxuat(SoPX),
    FOREIGN KEY (MaVTU) REFERENCES vattu(MaVTU)
);