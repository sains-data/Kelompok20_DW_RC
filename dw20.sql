-- Jalankan MySQL dan login
-- mysql.exe -u root -p

-- Buat database
CREATE DATABASE IF NOT EXISTS db_penjualan;
USE db_penjualan;

-- Buat tabel staging awal (mentah dari CSV)
CREATE TABLE IF NOT EXISTS game_sales (
  Game_ID INT,
  Platform_ID INT,
  Year_ID INT,
  Genre_ID INT,
  Publisher_ID INT,
  Total_Sales_Global FLOAT,
  Name VARCHAR(255),
  Platform VARCHAR(100),
  Year INT,
  Genre VARCHAR(100),
  Publisher VARCHAR(255)
);

-- Load data dari CSV
LOAD DATA LOCAL INFILE 'C:/Users/Anissa Luthfi Alifia/Downloads/Video Game Sales  - Sheet2 (1).csv'
INTO TABLE game_sales
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Buat tabel dimensi
CREATE TABLE IF NOT EXISTS dim_game (
  Game_ID INT PRIMARY KEY,
  Namegame VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS dim_platform (
  Platform_ID INT PRIMARY KEY,
  Platformname VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS dim_year (
  Year_ID INT PRIMARY KEY,
  Tahun_Rilis INT
);

CREATE TABLE IF NOT EXISTS dim_genre (
  Genre_ID INT PRIMARY KEY,
  Genre_game VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS dim_publisher (
  Publisher_ID INT PRIMARY KEY,
  Nama_Publisher VARCHAR(255)
);

-- Buat tabel fakta
CREATE TABLE IF NOT EXISTS fakta_penjualan (
  Game_ID INT,
  Platform_ID INT,
  Year_ID INT,
  Genre_ID INT,
  Publisher_ID INT,
  Total_SalesGlobal FLOAT,
  PRIMARY KEY (Game_ID, Platform_ID, Year_ID, Genre_ID, Publisher_ID),
  FOREIGN KEY (Game_ID) REFERENCES dim_game(Game_ID),
  FOREIGN KEY (Platform_ID) REFERENCES dim_platform(Platform_ID),
  FOREIGN KEY (Year_ID) REFERENCES dim_year(Year_ID),
  FOREIGN KEY (Genre_ID) REFERENCES dim_genre(Genre_ID),
  FOREIGN KEY (Publisher_ID) REFERENCES dim_publisher(Publisher_ID)
);

-- Isi tabel dimensi
INSERT IGNORE INTO dim_game (Game_ID, Namegame)
SELECT DISTINCT Game_ID, Name FROM game_sales;

INSERT IGNORE INTO dim_platform (Platform_ID, Platformname)
SELECT DISTINCT Platform_ID, Platform FROM game_sales;

INSERT IGNORE INTO dim_year (Year_ID, Tahun_Rilis)
SELECT DISTINCT Year_ID, Year FROM game_sales;

INSERT IGNORE INTO dim_genre (Genre_ID, Genre_game)
SELECT DISTINCT Genre_ID, Genre FROM game_sales;

INSERT IGNORE INTO dim_publisher (Publisher_ID, Nama_Publisher)
SELECT DISTINCT Publisher_ID, Publisher FROM game_sales;

-- Isi tabel fakta
INSERT INTO fakta_penjualan (
  Game_ID, Platform_ID, Year_ID, Genre_ID, Publisher_ID, Total_SalesGlobal
)
SELECT 
  Game_ID, Platform_ID, Year_ID, Genre_ID, Publisher_ID, Total_Sales_Global
FROM game_sales;

-- Verifikasi jumlah data
SELECT COUNT(*) AS Jumlah_Game FROM dim_game;
SELECT COUNT(*) AS Jumlah_Transaksi FROM fakta_penjualan;

-- Query analisis: total penjualan tahun 2019
SELECT
  Year AS Tahun,
  SUM(Total_Sales_Global) AS Total_Penjualan_Global
FROM game_sales
WHERE Year = 2019
GROUP BY Year;

-- Game terlaris
SELECT
  Game_ID,
  Name AS Game,
  SUM(Total_Sales_Global) AS Total_Penjualan_Global
FROM game_sales
GROUP BY Game_ID, Name
ORDER BY Total_Penjualan_Global DESC
LIMIT 10;

-- Genre terlaris
SELECT
  Genre_ID,
  Genre,
  SUM(Total_Sales_Global) AS Total_Penjualan_Global
FROM game_sales
GROUP BY Genre_ID, Genre
ORDER BY Total_Penjualan_Global DESC
LIMIT 10;
