# 🎮  Perancangan Data Warehouse Pada Industri Game oleh PT Lintas Dimensi Kreatif 🕹️






Proyek ini merupakan implementasi sistem Data Warehouse untuk mendukung analisis penjualan video game global. Dengan pendekatan Star Schema, sistem mencakup proses ETL, indexing, partisi tabel, hingga visualisasi. Data yang digunakan untuk mensimulasikan kondisi industri game.

# 🧠 Latar Belakang
Industri game berkembang pesat dengan data penjualan yang masif dan tersebar di banyak platform. Data warehouse hadir sebagai solusi:

* Integrasi data lintas platform & wilayah

* Analisis multidimensi (genre, waktu, platform, publisher)

* Pengambilan keputusan strategis berbasis data

# 🎯 Tujuan Proyek
* Mendesain dan membangun arsitektur gudang data penjualan video game

* Mengimplementasikan proses ETL secara end-to-end

* Menghasilkan visualisasi data yang mendukung eksplorasi pola dan tren penjualan dari berbagai perspektif


# 🗂️ Skema Star Schema

Tabel Fakta: TabelFakta_Sales menyimpan Total_SalesGlobal & foreign key

Tabel Dimensi: dim_game, dim_platform, dim_year, dim_genre, dim_publisher


# ⚙️ Teknologi dan Tools
| Proses           | Tools              |
| ---------------- | ------------------ |
| ETL              | Python (pandas)    |
| Database         | PostgreSQL         |
| DDL & Query      | SQL                |
| Manajemen Proyek | Git & GitHub       |

# 📦 Sumber Data
Dataset disusun dengan struktur dan pola yang mencerminkan kondisi nyata industri game. Data mencakup informasi:

Nama game

Genre dan tahun rilis

Platform dan publisher

Total penjualan global

Dataset ini mendukung eksperimen dan pengujian skema data warehouse secara menyeluruh.

# 🔄 Proses ETL
Extract: Dataset dummy dibaca dari file CSV menggunakan Python

Transform: Pembersihan data, konversi tipe data, mapping ke tabel dimensi

Load: Data dimasukkan ke PostgreSQL berdasarkan skema bintang


# 📈 Evaluasi dan Visualisasi
* Indeks & partisi diterapkan untuk optimisasi performa query



# 🏗️ Arsitektur Sistem
Kami mengadopsi arsitektur data warehouse dengan aliran proses sebagai berikut:

Sumber data (CSV Video Game Sales)  diproses melalui ETL (Extract, Transform, Load)  dan dimuat ke dalam Enterprise Data Warehouse. Dari sana, Data Marts khusus dibuat untuk Marketing dan Eksekutif, dan hasilnya divisualisasikan melalui BI Dashboard.


# ✨ Skema Bintang (Star Schema)
Kami menggunakan Star Schema karena kesederhanaannya dan kemampuannya mendukung analisis yang fleksibel dan efisien.

* Tabel Fakta: TabelFakta_Sales  - Menyimpan ukuran utama: Total_SalesGlobal.




* Tabel Dimensi:
  * dim_game (Info Game) 

  * dim_platform (Info Platform) 

  * dim_year (Info Tahun Rilis) 

  * dim_genre (Info Genre) 

  * dim_publisher (Info Penerbit) 


Transform: 
Membersihkan data (duplikat, inkonsistensi).
Mengonversi tipe data.
Memetakan data ke tabel dimensi.
Menghitung agregasi (Total_SalesGlobal) untuk tabel fakta.

Load: Memasukkan data yang telah ditransformasi ke dalam tabel dimensi dan fakta di database PostgreSQL.


# 👥 Tim Kami (Kelompok 20)
Berikut adalah anggota kelompok yang berkontribusi dalam proyek ini:

Asrizal (121450010) 


Anissa Luthfi Alifia (121450093) 


Rani Puspita Sari (122450030) 


Rendi Alexander Hutagalung (122450057) 


Irvan Alfaritzi (122450093) 
