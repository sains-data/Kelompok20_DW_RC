# 🎮  Perancangan Data Warehouse Pada Industri Game oleh PT Lintas Dimensi Kreatif 🕹️






Proyek ini merupakan implementasi sistem Data Warehouse untuk mendukung analisis penjualan video game global. Dengan pendekatan Star Schema, sistem mencakup proses ETL, indexing, partisi tabel, hingga visualisasi. Data yang digunakan untuk mensimulasikan kondisi industri game.

# 🏗️ Sistem Arsitektur 
Kami mengadopsi arsitektur data warehouse dengan aliran proses sebagai berikut:

Sumber data diproses melalui ETL (Extract, Transform, Load)  dan dimuat ke dalam Enterprise Data Warehouse. Dari sana, Data Marts khusus dibuat untuk Marketing dan Eksekutif.
![image](https://github.com/user-attachments/assets/170e5ea6-be4f-4e6e-8eab-455e67da9cb1)


# 🧠 Latar Belakang
Industri game berkembang pesat dengan data penjualan yang masif dan tersebar di banyak platform. Data warehouse hadir sebagai solusi:

* Integrasi data lintas platform & wilayah

* Analisis multidimensi (genre, waktu, platform, publisher)

* Pengambilan keputusan strategis berbasis data

# 🎯 Tujuan Proyek
* Mendesain dan membangun arsitektur gudang data penjualan video game

* Mengimplementasikan proses ETL secara end-to-end

* Menghasilkan visualisasi data yang mendukung eksplorasi pola dan tren penjualan dari berbagai perspektif


# ✨ Skema Bintang (Star Schema)

Kami menggunakan Star Schema karena kesederhanaannya dan kemampuannya mendukung analisis yang fleksibel dan efisien.

![WhatsApp Image 2025-05-27 at 19 15 10_093eb195](https://github.com/user-attachments/assets/4dacb9f8-3399-418c-be7b-4a9350d03157)



* Tabel Fakta: TabelFakta_Sales  - Menyimpan ukuran utama: Total_SalesGlobal.

* Tabel Dimensi:
  * dim_game (Info Game) 

  * dim_platform (Info Platform) 

  * dim_year (Info Tahun Rilis) 

  * dim_genre (Info Genre) 

  * dim_publisher (Info Penerbit) 

# 🔄 Tahapan Pengembangan (Metode Waterfall)

### 1. Analisis Kebutuhan & Identifikasi Data

Pada tahap awal, dilakukan identifikasi terhadap kebutuhan bisnis dan pihak-pihak yang terlibat, seperti:

- Manajemen Eksekutif
- Tim Marketing
- Analis Data
- Pengembang Game

Fakta dan dimensi ditentukan dari kebutuhan analisis multidimensi berdasarkan data ini.

### 2.  Perancangan Skema Konseptual & Logikal

Skema konseptual dirancang dalam bentuk **Star Schema** yang terdiri dari:

 Tabel Fakta
- `FaktaSales`: Menyimpan data penjualan sebagai pusat analisis.

### 🧾 Tabel Dimensi
- `dim_game`: Informasi game
- `dim_platform`: Informasi platform
- `dim_year`: Tahun rilis
- `dim_genre`: Genre game
- `dim_publisher`: Penerbit game

Relasi antar tabel dirancang untuk mendukung integritas dan fleksibilitas dalam analisis data.

### 3.  Desain Fisik & Implementasi ETL

Desain logikal diubah menjadi **desain fisik** menggunakan perintah SQL (DDL), dan proses ETL dilakukan dengan tahapan:

 ETL Process
- **Extract**: Pengambilan data dari file CSV
- **Transform**: Pembersihan, pemetaan, dan pengelompokan data sesuai entitas
- **Load**: Memuat data ke dalam tabel berdasarkan skema bintang

Strategi optimasi seperti indexing diterapkan pada kolom-kolom kunci untuk efisiensi query.

### 4.  Evaluasi & Visualisasi

Sistem dievaluasi dengan uji efisiensi query untuk memastikan performa yang optimal.


# ⚙️ Teknologi dan Tools
| Proses           | Tools              |
| ---------------- | ------------------ |
| ETL              | Python (pandas)    |
| Database         | PostgreSQL         |
| DDL & Query      | SQL                |
| Manajemen Proyek | Git & GitHub       |

# 📦 Sumber Data
Dataset disusun dengan struktur dan pola yang mencerminkan kondisi nyata industri game. Data mencakup informasi:

* Nama game

* Genre dan tahun rilis

* Platform dan publisher

* Total penjualan global

Dataset ini mendukung eksperimen dan pengujian skema data warehouse secara menyeluruh.

# 🧱 Struktur Data Warehouse
🔹 Tabel Fakta
| Kolom               | Tipe Data | Deskripsi                            |
| ------------------- | --------- | ------------------------------------ |
| `Game_ID`           | INT       | FK ke `dim_game`                     |
| `Platform_ID`       | INT       | FK ke `dim_platform`                 |
| `Year_ID`           | INT       | FK ke `dim_year`                     |
| `Genre_ID`          | INT       | FK ke `dim_genre`                    |
| `Publisher_ID`      | INT       | FK ke `dim_publisher`                |
| `Total_SalesGlobal` | FLOAT     | Total penjualan global per kombinasi |

🔹 Tabel Dimensi
| Nama Tabel      | Kolom            | Tipe Data | Deskripsi                        |
| --------------- | ---------------- | --------- | -------------------------------- |
| `dim_game`      | `Game_ID`        | INT (PK)  | ID unik game                     |
|                 | `NameGame`       | VARCHAR   | Nama game                        |
| `dim_platform`  | `Platform_ID`    | INT (PK)  | ID platform                      |
|                 | `PlatformName`   | VARCHAR   | Nama platform (misal: PS5, Xbox) |
| `dim_year`      | `Year_ID`        | INT (PK)  | ID tahun                         |
|                 | `Tahun_Rilis`    | INT       | Tahun rilis game                 |
| `dim_genre`     | `Genre_ID`       | INT (PK)  | ID genre                         |
|                 | `Genre_Game`     | VARCHAR   | Nama genre (Action, RPG, dsb.)   |
| `dim_publisher` | `Publisher_ID`   | INT (PK)  | ID publisher                     |
|                 | `Nama_Publisher` | VARCHAR   | Nama perusahaan penerbit game    |




# 🔄 Proses ETL
ETL dibangun menggunakan :

### 1. Extract  
Data diekstrak dari file CSV Penjualan game.

### 2. Transform  
- Hapus duplikat  
- Konversi tipe data  
- Mapping ke tabel dimensi  
- Generate ID unik  
- Bentuk tabel fakta

### 3. Load  
Data dimasukkan ke PostgreSQL ke dalam tabel fakta dan lima tabel dimensi sesuai dengan skema bintang.

# 📈 Evaluasi dan Visualisasi

###  Evaluasi Sistem

Evaluasi dilakukan untuk menilai efektivitas sistem data warehouse dan dashboard yang telah dibangun dalam mendukung kebutuhan analitik bisnis pada industri game.

####  Keberhasilan Sistem

- **Efisiensi Star Schema**  
  Struktur skema bintang (1 tabel fakta dan 5 tabel dimensi) berhasil mendukung analisis multidimensi seperti genre, tahun, platform, dan publisher.

- **ETL Terstruktur dan Stabil**  
  Proses ETL (Extract, Transform, Load) berjalan mulus dari file CSV ke MariaDB/MySQL. Data yang dimuat telah melalui proses pembersihan dan transformasi yang konsisten.

- **Dashboard Interaktif**  
  Visualisasi dibuat menggunakan **Tableau** dan **Power BI**, mencakup:
  - Tren penjualan per tahun
  - Genre dengan penjualan tertinggi
  - Publisher terpopuler secara global
  - Perbandingan performa antar platform

- **Performa Query Cepat**  
  Penggunaan indeks dan view membuat waktu eksekusi query berada di bawah 1 detik. Sistem mendukung analisis cepat dan responsif untuk kebutuhan pengguna akhir.

####  Keterbatasan Sistem

- **Data statis & terbatas**  
  Dataset yang digunakan belum mencakup data real-time atau data tersegmentasi secara geografis secara rinci.

- **Tidak mendukung Real-Time Analytics**  
  Sistem saat ini bergantung pada proses ETL manual/terjadwal.

- **Dashboard dasar**  
  Fitur drill-down, filtering dinamis, dan analitik prediktif masih terbatas.

- **Kendala teknis & skalabilitas**  
  MariaDB belum optimal untuk kebutuhan big data atau multi-user secara bersamaan. Belum terdapat sistem manajemen hak akses pengguna.

---

### Visualisasi Dashboard Penjualan Game

Dashboard ini dikembangkan untuk memberikan insight strategis dalam industri video game.


# 📁 Struktur Repositori

```bash 
📦 game-sales-data-warehouse/
├── 📁 data/
│   └── game_sales_dummy.csv        # Dataset dummy yang digunakan
│
├── 📁 etl/
│   └── etl_pipeline.py             # Skrip Python untuk proses ETL (Extract, Transform, Load)
│
├── 📁 sql/
│   ├── ddl_tables.sql              # Skrip SQL untuk membuat tabel fakta & dimensi
│   ├── indexing.sql                # Skrip SQL untuk menambahkan indeks
│   ├── views.sql                   # Skrip SQL untuk view agregasi (misal per genre)
│   └── partitioning.sql            # Skrip SQL untuk partisi data (simulasi per tahun)
│
├── 📁 visualization/
│   └── dashboard_mockup.png        # Screenshot atau mockup visualisasi dari BI Tools
│
├── 📁 docs/
│   └── laporan_proyek.pdf          # Laporan akhir proyek (kompilasi misi 1-3)
│
├── README.md                       # Dokumentasi proyek (file ini)
└── requirements.txt                # Daftar library Python untuk ETL (opsional)
```





# 👥 Tim Kami (Warehouse Warriors)
Berikut adalah anggota kelompok yang berkontribusi dalam proyek ini:

1. Asrizal (121450010) 

2. Anissa Luthfi Alifia (121450093) 

3. Rani Puspita Sari (122450030) 

4. Rendi Alexander Hutagalung (122450057) 

5. Irvan Alfaritzi (122450093) 
