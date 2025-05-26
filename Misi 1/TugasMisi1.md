# Kelompok 20 - Data Warehouse RC  
**Laporan Tugas Misi Pertama - Pergudangan Data RC**
Disusun oleh:

1. Asrizal                      (121450010)

2. Anissa Luthfi Alifia         (121450093)

3. Rani Puspita Sari            (122450030)
 
4. Rendi Alexander Hutagalung   (122450057)

5. Irvan Alfaritzi              (122450093)

---

## BAB 1: Profil Industri & Masalah Bisnis

### 1.1 Profil Industri

Industri game telah berkembang menjadi salah satu sektor hiburan terbesar di dunia, menghadirkan tantangan bagi perusahaan dalam memahami perilaku konsumen dan mengoptimalkan strategi pemasaran. Volume data penjualan yang besar dan kompleks menuntut metode pengelolaan yang efisien. Pemanfaatan **Data Warehouse** menjadi solusi penting untuk mengintegrasikan data dari berbagai sumber, memungkinkan analisis multidimensi yang mendalam. Kombinasi dengan **Online Analytical Processing (OLAP)** juga telah terbukti efektif di berbagai sektor, termasuk industri game [1].

Dalam konteks industri game, Data Warehouse membantu perusahaan mengidentifikasi kategori produk terlaris, memantau tren penjualan, serta memahami preferensi konsumen secara real-time. Sistem ini tidak hanya meningkatkan efisiensi operasional dan mengurangi kesalahan pengolahan manual, tetapi juga menjadi landasan kuat dalam pengambilan keputusan strategis yang lebih cepat dan berbasis data, di tengah persaingan industri yang semakin ketat [2].

### 1.2 Masalah Bisnis

Perusahaan di industri game menghadapi beberapa tantangan utama, seperti:

- Memahami perilaku konsumen yang terus berubah.
- Mengelola data penjualan besar dari berbagai platform.
- Mengambil keputusan strategis secara cepat dan akurat.

Tanpa sistem yang efisien, integrasi dan analisis data menjadi sulit, sehingga menghambat pengambilan keputusan yang berbasis data. Penggunaan Data Warehouse yang terintegrasi dapat menjadi solusi untuk:

- Meminimalkan waktu pemrosesan.
- Mengurangi kesalahan manual.
- Memberikan wawasan akurat untuk strategi bisnis.

---

## BAB 2: Daftar Stakeholder & Tujuan Bisnis

Berikut tabel stakeholder dan tujuan bisnis dari implementasi Data Warehouse di industri game:

### Tabel 2.1 Stakeholder dan Tujuan

![Stakeholder](https://github.com/user-attachments/assets/6765194a-d738-441a-bbab-de9f7cb8b573)

---

## BAB 3: Fakta & Dimensi

### 3.1 Tabel Fakta

Tabel fakta `TabelFakta_Sales` merupakan inti dari skema bintang karena memuat data numerik (kuantitatif) yang menjadi fokus analisis, yaitu total penjualan global.

**Kolom Utama:**
- `Total_SalesGlobal`: total penjualan game secara global.

**Foreign Key:**
- `Game_ID`, `Platform_ID`, `Year_ID`, `Genre_ID`, dan `Publisher_ID` terhubung ke masing-masing tabel dimensi.

### 3.2 Tabel Dimensi

Tabel dimensi berfungsi memberi konteks pada data dalam tabel fakta. Terdapat lima tabel dimensi:

- **`dim_game`**  
  - `Game_ID` (PK), `Name`  
  - Menyimpan nama game.

- **`dim_platform`**  
  - `Platform_ID` (PK), `Platform`  
  - Menyimpan nama platform rilis.

- **`dim_year`**  
  - `Year_ID` (PK), `Year`  
  - Menyimpan tahun rilis.

- **`dim_genre`**  
  - `Genre_ID` (PK), `Genre`  
  - Menyimpan kategori genre game.

- **`dim_publisher`**  
  - `Publisher_ID` (PK), `Publisher`  
  - Menyimpan nama perusahaan penerbit.

### Gambar Skema Fakta dan Dimensi

![Skema Fakta dan Dimensi](https://github.com/user-attachments/assets/ac36787d-5a84-47b4-8f6f-9fe918879a8a)

---

## BAB 4: Sumber Data & Metadata

### 4.1 Sumber Data

Dataset diambil dari situs Kaggle berjudul **"Video Games Sale"** oleh **Zahid Feroze**.  
Data dalam bentuk CSV dan berisi penjualan historis video game di berbagai wilayah dunia.  
Cocok untuk analisis tren berdasarkan waktu, platform, genre, serta pengaruh publisher.

- URL Dataset: [Kaggle - Video Games Sale](https://www.kaggle.com/datasets/zahidmughal2343/video-games-sale)

### 4.2 Metadata

Tabel metadata yang menjelaskan atribut-atribut pada dataset:

![Metadata](https://github.com/user-attachments/assets/025144d0-af89-4663-baa4-876d4f39fd69)

---

## DAFTAR PUSTAKA

[1] C. B. Santoso, R. Khairunnisa, M. Rachma, dan S. Humayyah, “Implementasi Data Warehouse dan Business Intelligence untuk Pemantauan dan Analisis Penjualan Game,” *TeknoIS: Jurnal Ilmiah Teknologi Informasi dan Sains*, vol. 15, no. 1, 2025. [Link](https://teknois.unbin.ac.id/JBS/)

[2] V. Yadav dan S. Yadav, “Global Gaming Market Dynamics: A Comprehensive Analysis of Video Game Sales Patterns Across Platforms, Genres, and Regions,” *International Research Journal of Modernization in Engineering Technology and Science*, vol. 6, no. 12, 2024. [DOI](https://www.doi.org/10.56726/IRJMETS65750)

[3] https://www.kaggle.com/datasets/zahidmughal2343/video-games-sale

