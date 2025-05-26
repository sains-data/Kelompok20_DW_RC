🎮 Proyek Pergudangan Data: Analisis Penjualan Video Game Global 🕹️
Selamat datang di repositori proyek Pergudangan Data RC - Kelompok 20 dari Program Studi Sains Data, Institut Teknologi Sumatera (ITERA) angkatan 2025.





Proyek ini bertujuan untuk merancang dan mengimplementasikan sebuah data warehouse untuk menganalisis data penjualan video game dari berbagai sumber, platform, dan wilayah geografis.

👥 Tim Kami (Kelompok 20)
Berikut adalah anggota kelompok yang berkontribusi dalam proyek ini:

Asrizal (121450010) 


Anissa Luthfi Alifia (121450093) 


Rani Puspita Sari (122450030) 


Rendi Alexander Hutagalung (122450057) 


Irvan Alfaritzi (122450093) 


Rafa Aqilla Jungjunan (122450142)  (Catatan: Tercantum di Misi 1)
🎯 Latar Belakang & Tujuan
Industri game global menghasilkan volume data penjualan yang sangat besar dan tersebar. Perusahaan menghadapi tantangan dalam:

Mengintegrasikan data penjualan yang tersebar.
Menghindari pemrosesan data manual yang memakan waktu dan rentan kesalahan.
Melakukan analisis multidimensi untuk memahami pola penjualan (berdasarkan waktu, genre, platform, dll.).
Tujuan utama proyek ini adalah membangun data warehouse yang:

Mengintegrasikan data penjualan game.
Memfasilitasi analisis multidimensi.
Menyediakan landasan kuat untuk pengambilan keputusan strategis berbasis data.
Mendukung kebutuhan berbagai stakeholder (Manajemen, Marketing, Analis, Developer).

🏗️ Arsitektur Sistem
Kami mengadopsi arsitektur data warehouse dengan aliran proses sebagai berikut:

Sumber data (CSV Video Game Sales)  diproses melalui ETL (Extract, Transform, Load)  dan dimuat ke dalam Enterprise Data Warehouse. Dari sana, Data Marts khusus dibuat untuk Marketing dan Eksekutif, dan hasilnya divisualisasikan melalui BI Dashboard.


✨ Skema Bintang (Star Schema)
Kami menggunakan Star Schema karena kesederhanaannya dan kemampuannya mendukung analisis yang fleksibel dan efisien.

* Tabel Fakta: TabelFakta_Sales  - Menyimpan ukuran utama: Total_SalesGlobal.




Tabel Dimensi: 
dim_game (Info Game) 

dim_platform (Info Platform) 

dim_year (Info Tahun Rilis) 

dim_genre (Info Genre) 

dim_publisher (Info Penerbit) 

🛠️ Teknologi yang Digunakan
ETL & Transformasi Data: Python (dengan library Pandas).

Database (Data Warehouse): PostgreSQL / MySQL.

Visualisasi & Dashboard: Tableau / Power BI.
Sumber Data: Dataset "Video Games Sale" dari Kaggle.
⚙️ Proses ETL (Extract, Transform, Load)
Extract: Mengambil data mentah dari file CSV penjualan video game.

Transform: 
Membersihkan data (duplikat, inkonsistensi).
Mengonversi tipe data.
Memetakan data ke tabel dimensi.
Menghitung agregasi (Total_SalesGlobal) untuk tabel fakta.

Load: Memasukkan data yang telah ditransformasi ke dalam tabel dimensi dan fakta di database PostgreSQL.

📊 Contoh Implementasi & Visualisasi
SQL DDL (Contoh)
SQL

-- Tabel Dimensi Game
CREATE TABLE dim_game (
    Game_ID INT PRIMARY KEY,
    NameGame VARCHAR(100)
); [cite: 115]

-- Tabel Fakta Sales
CREATE TABLE TabelFakta_Sales (
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
); [cite: 117, 118]

-- Contoh Index
CREATE INDEX idx_platform ON TabelFakta_Sales(Platform_ID); [cite: 121]

-- Contoh View
CREATE VIEW View_Penjualan_Per_Genre AS
SELECT
    g.Genre_Game,
    SUM(f.Total_SalesGlobal) AS Total_Penjualan
FROM
    TabelFakta_Sales f
JOIN dim_genre g ON f.Genre_ID = g.Genre_ID
GROUP BY g.Genre_Game; [cite: 132]
