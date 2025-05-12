# Gudang Data Misi ketiga
Disusun oleh:

Kelompok 20

1. Asrizal                      (121450010)

2. Anissa Luthfi Alifia         (121450093)

3. Rani Puspita Sari            (122450030)
 
4. Rendi Alexander Hutagalung   (122450057)

5. Irvan Alfaritzi              (122450093)

## BAB 1 - PENDAHULUAN

### 1.1 Latar Belakang
Perkembangan teknologi informasi telah mendorong sektor industri video game untuk memanfaatkan data secara optimal. Analisis penjualan sangat penting dalam mengidentifikasi tren, performa platform, serta preferensi pengguna. Dibutuhkan gudang data (data warehouse) yang mampu mengintegrasikan data dari berbagai sumber secara terstruktur untuk mendukung analisis ini.

### 1.2 Rumusan Masalah
1. Bagaimana merancang gudang data penjualan video game menggunakan star schema?
2. Bagaimana struktur tabel fakta dan dimensi mendukung analisis penjualan?
3. Bagaimana sistem ini membantu pengambilan keputusan strategis?

### 1.3 Metode Pengembangan Gudang Data
Dua metode:  
- **Waterfall**: Berurutan dan cocok untuk kebutuhan tetap.  
- **Iterative**: Bertahap dan fleksibel terhadap perubahan.  
Dipilih metode iterative untuk proyek ini.

---

## BAB 2 - DESAIN KONSEPTUAL

### 2.1 Identifikasi Proses Bisnis
Fokus pada proses penjualan video game global. Data yang digunakan meliputi: nama game, platform, tahun rilis, genre, publisher, dan penjualan global.

**Pertanyaan analitik yang didukung:**
- Game dengan penjualan tertinggi dalam satu tahun?
- Genre favorit di platform tertentu?
- Publisher dengan penjualan terbanyak?

### 2.2 Tabel Dimensi dan Fakta

#### 2.2.1 Tabel Fakta - `TabelFakta_Sales`

| Atribut       | Tipe Data | Keterangan                               |
|---------------|-----------|------------------------------------------|
| Game_ID       | INT       | FK ke `dim_game`                         |
| Platform_ID   | INT       | FK ke `dim_platform`                     |
| Year_ID       | INT       | FK ke `dim_year`                         |
| Genre_ID      | INT       | FK ke `dim_genre`                        |
| Publisher_ID  | INT       | FK ke `dim_publisher`                    |
| Total_SalesGlobal | FLOAT | Total penjualan global                   |

#### 2.2.2 Tabel Dimensi

| Nama Tabel     | Primary Key | Atribut Deskriptif     | Tipe Data |
|----------------|-------------|-------------------------|-----------|
| `dim_game`     | Game_ID     | Namegame                | VARCHAR   |
| `dim_platform` | Platform_ID | Platformname            | VARCHAR   |
| `dim_year`     | Year_ID     | Tahun_Rilis             | INT       |
| `dim_genre`    | Genre_ID    | Genre_Game              | VARCHAR   |
| `dim_publisher`| Publisher_ID| Nama_Publisher          | VARCHAR   |

### 2.3 Skema Data (Star Schema)

Skema yang digunakan dalam perancangan gudang data ini adalah skema bintang (star schema). Skema ini dipilih karena memiliki struktur sederhana dan efisien untuk kebutuhan query analitik. Dalam skema bintang, tabel fakta berada di pusat dan dikelilingi oleh tabel-tabel dimensi yang terhubung langsung melalui kunci asing (foreign key). Berikut adalah diagram skema bintang untuk sistem ini:

![image](https://github.com/user-attachments/assets/8cb069c2-413a-4ee4-a2e9-147d21926ac8)

Gambar tersebut menunjukkan bahwa TabelFakta_Sales sebagai pusat menyimpan metrik penjualan global, dan memiliki relasi langsung dengan lima tabel dimensi: dim_game, dim_platform, dim_year, dim_genre, dan dim_publisher. Dengan struktur ini, pengguna dapat melakukan eksplorasi data dan analisis penjualan berdasarkan berbagai perspektif, seperti waktu, platform, genre, dan penerbit, secara cepat dan efisien.

## BAB 3 - DESAIN LOGIKAL DAN FISIK GUDANG DATA
3.1 Translasi Desain Konseptual ke Model Relasional

Desain konseptual yang sebelumnya menggunakan pendekatan skema bintang kini diterjemahkan ke dalam model relasional dalam bentuk perintah Data Definition Language (DDL) SQL. Skema ini terdiri dari satu tabel fakta dan lima tabel dimensi, di mana setiap tabel dimensi memiliki primary key yang menjadi acuan (foreign key) dalam tabel fakta. Tabel fakta TabelFakta_Sales menyimpan informasi total penjualan global ke tabel-tabel dimensi.

-- Tabel Dimensi

CREATE TABLE dim_game (

    Game_ID INT PRIMARY KEY,
    
    NameGame VARCHAR(100)
    
);

CREATE TABLE dim_platform (

    Platform_ID INT PRIMARY KEY,
    
    PlatformName VARCHAR(50)
    
);

CREATE TABLE dim_year (

    Year_ID INT PRIMARY KEY,
    
    Tahun_Rilis INT
    
);

CREATE TABLE dim_genre (

    Genre_ID INT PRIMARY KEY,
    
    Genre_Game VARCHAR(50)
    
);

CREATE TABLE dim_publisher (

    Publisher_ID INT PRIMARY KEY,
    
    Nama_Publisher VARCHAR(100)
    
);

-- Tabel Fakta

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
);

3.2 Strategi Perancangan dan Implementasi Index

Untuk meningkatkan performa saat melakukan query, strategi indexing diterapkan pada kolom-kolom yang sering digunakan dalam kondisi WHERE, GROUP BY, dan JOIN. Index digunakan agar sistem tidak perlu membaca seluruh baris tabel ketika mencari data yang dibutuhkan. Kolom yang diberi indeks antara lain adalah Platform_ID, Year_ID, Genre_ID, dan Publisher_ID.

-- Index untuk mempercepat pencarian data dan join

CREATE INDEX idx_platform ON TabelFakta_Sales(Platform_ID);

CREATE INDEX idx_year ON TabelFakta_Sales(Year_ID);

CREATE INDEX idx_genre ON TabelFakta_Sales(Genre_ID);

CREATE INDEX idx_publisher ON TabelFakta_Sales(Publisher_ID);

3.3 Optimalisasi Penyimpanan dan Organisasi Data

Optimalisasi penyimpanan menjadi penting dalam pengelolaan gudang data berskala besar. Pemilihan tipe data dilakukan secara efisien, di mana atribut ID menggunakan INT, sedangkan atribut deskriptif seperti nama game dan genre menggunakan VARCHAR dengan panjang disesuaikan kebutuhan. Nilai penjualan disimpan dalam format FLOAT untuk mendukung angka desimal. 

Selain itu, jika sistem manajemen basis data yang digunakan mendukung kompresi, seperti PostgreSQL dengan fitur TOAST atau BigQuery dengan kompresi kolom, maka fitur ini dapat diaktifkan untuk menghemat ruang penyimpanan dan mempercepat pemrosesan. Untuk media penyimpanan, disarankan menggunakan SSD (Solid State Drive) agar proses baca tulis data berlangsung cepat.

3.4 Desain Partisi Tabel dan View untuk Akses Efisien

Partisi data dilakukan untuk memecah tabel besar menjadi bagian-bagian lebih kecil yang dapat diakses secara selektif. Dalam konteks ini, partisi dapat diterapkan pada tabel fakta berdasarkan kolom YEAR_ID, sehingga analisis data berdasarkan tahun dapat dilakukan lebih cepat. Selain partisi, view juga digunakan untuk menyederhanakan query dan menyajikan data agregasi secara praktis kepada pengguna. Salah satu implementasi yang digunakan yaitu untuk melihat total penjualan berdasarkan genre : 

-- View total penjualan berdasarkan genre

CREATE VIEW View_Penjualan_Per_Genre AS

SELECT 

    g.Genre_Game,
    
    SUM(f.Total_SalesGlobal) AS Total_Penjualan
FROM 

    TabelFakta_Sales f
    
JOIN dim_genre g ON f.Genre_ID = g.Genre_ID

GROUP BY g.Genre_Game;

Implementasi partisi :

--Konsep partisi berdasarkan tahun (simulasi)

CREATE TABLE TabelFakta_Sales_2020 PARTITION OF TabelFakta_Sales

    FOR VALUES FROM (2020) TO (2021);

CREATE TABLE TabelFakta_Sales_2021 PARTITION OF TabelFakta_Sales
    
    FOR VALUES FROM (2021) TO (2022);
    
### BAB 4 - ARSITEKTUR SISTEM DAN ETL

4.1 Arsitektur Data Warehouse

Sesudah membuat elemen-elemen penting dari gudang data, diagram di bawah ini akan menggambarkan interaksi antar elemen tersebut dalam struktur sistem ini.

![image](https://github.com/user-attachments/assets/078e8a3f-cee0-4f59-9b4e-18105a07c96c)

Gambar tersebut menunjukan bagaimana informasi yang berasal dari file CSV yang memuat data penjualan video game, diolah melalui langkah-langkah ETL (Extract, Transform, Load) sebelum disimpan di Enterprise Data Warehouse. Setelah data ini terstruktur, informasi tersebut digunakan untuk membangun data mart yang ditujukan khusus bagi tim Marketing dan Eksekutif, serta divisualisasikan melalui BI Dashboard seperti Tableau atau Power BI untuk berbagai pengguna, termasuk tim Game Developers.

4.2 Perancangan dan Implementasi Proses ETL Menjelaskan tahapan extract, transform, dan load secara teknis dan praktis.

Proses ETL, yang meliputi Extract, Transform, dan Load, adalah langkah krusial dalam pembangunan data warehouse. Berikut penjelasan proses ETL yang dilakukan :

-Ekstraksi Data

Pada tahap ini, data diambil dari sumber utama, yaitu file dataset yang berkaitan dengan penjualan video game (seperti file CSV dari Kaggle). Proses ekstraksi dilakukan dengan menggunakan alat seperti Python dan pustaka pandas, yang memungkinkan data untuk dibaca dan disimpan ke area staging untuk langkah berikutnya.

-Transformasi Data

Data yang telah diekstraksi kemudian dibersihkan dan diolah agar memenuhi standar yang diperlukan oleh data warehouse. Proses transformasi mencakup:

Penghapusan data ganda dan perbaikan data yang tidak konsisten.

Konversi format data (contoh: mengubah tipe data tahun menjadi integer).

Pemetaan data ke tabel-tabel dimensi seperti Game, Platform, Genre, Penerbit, dan Tahun.

Perhitungan total penjualan global untuk dimasukkan ke dalam tabel fakta.

-Load Data

Setelah tahap transformasi selesai, data dimasukkan ke dalam basis data data warehouse. Proses ini dilakukan dengan mentransfer data ke tabel-tabel yang telah dirancang berdasarkan skema bintang (star schema). Dengan menggunakan  SQL untuk melakukan  basis data.

4.3 Pemilihan Tools dan Teknologi Pendukung Alat yang digunakan untuk ETL, manajemen database, dan visualisasi data.

Pemilihan teknologi yang sesuai sangat krusial untuk mendukung kegiatan ETL ,penyimpanan, dan analisis data. Python, bersama dengan library pandas dan framework ETL  digunakan untuk melakukan ekstraksi dan transformasi data dengan efisien. MySQL atau PostgreSQL dipilih sebagai basis data karena kemudahan dalam integrasi dan pengelolaan data terstruktur. Untuk visualisasi, Tableau dan Power BI digunakan berkat kemampuannya dalam membuat dashboard interaktif yang mempercepat dan mempermudah pengambilan keputusan bisnis. Kombinasi ini menjamin kelancaran proses data dan hasil analisis yang optimal.


### BAB 5 - IMPLEMENTASI SISTEM DAN EVALUASI
5.1 Realisasi Struktur Tabel dan Proses ETL

5.1.1 Realisasi Struktur Tabel

Berdasarkan desain pada Bab 3, implementasi skema bintang direalisasikan dengan SQL DDL sebagai berikut :  

-- Tabel Dimensi

define dim_game (

  Game_ID INT PRIMARY KEY,
  
  NameGame VARCHAR(100)
  
);

define dim_platform (
  Platform_ID INT PRIMARY KEY,
  
  PlatformName VARCHAR(50)
  
);

define dim_year (

  Year_ID INT PRIMARY KEY,
  
  Tahun_Rilis INT
  
); 


define dim_genre (

  Genre_ID INT PRIMARY KEY,
  
  Genre_Game VARCHAR(50)
  
);

define dim_publisher (

  Publisher_ID INT PRIMARY KEY,
  
  Nama_Publisher VARCHAR(100)
  
);

-- Tabel Fakta

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
  
);

Seluruh tabel telah berhasil dibuat di PostgreSQL, struktur ini mendukung efisiensi dalam menjalankan query analitik.

5.1.2 Pipeline ETL

Proses ETL dilaksanakan dengan pendekatan bertahap yang sesuai dengan arsitektur sistem yang telah dijelaskan pada Bab 4. Data awal berupa file CSV penjualan video game diproses menggunakan tahapan ETL sebagai berikut : 

-Extract : Data diambil dari file CSV, data mentah mencakup informasi game, platform, tahun rilis, genre, publisher dan penjualan global.

-Transform : Mengelompokkan data berdasarkan entitas untuk membuat tabel dimensi, penjualan global diakumulasi per kombinasi unik untuk dimasukkan ke tabel fakta.

-Load : Data dimensi dibuat terlebih dahulu ke dalam tabel masing-masing, setelah itu data transaksi penjualan dimasukkan ke tabel fakta dengan referensi foreign key. 

5.2 Evaluasi Kinerja dan Efisiensi Sistem

Metodologi pengujian bertujuan untuk mengevaluasi efisiensi sistem data warehouse dalam mengeksekusi query analitik. Meskipun jumlah data yang digunakan dalam proyek ini relatif kecil (100 baris), pengujian tetap dilakukan untuk menilai dampak dari penerapan indeks dan partisi terhadap kinerja sistem. Pengujian dilakukan dalam dua kondisi, sistem dijalankan tanpa penambahan indeks apapun pada tabel fakta dan sistem dijalankan setelah indeks ditambahkan pada kolom-kolom foreign key yaitu Platform_ID, Year_ID, Genre_ID, dan Publisher_ID di tabel fakta. Waktu eksekusi dicatat dengan fungsi bawaan SQL (EXPLAIN ANALYZE) untuk mendapatkan estimasi performa masing - masing query. 

5.3 Visualisasi Data dan Hasil Analitik

Contoh dashboard atau laporan dari data warehouse untuk kebutuhan analisis bisnis.

![image](https://github.com/user-attachments/assets/059c3d4e-6804-494c-b115-d2afbcb85c11)

