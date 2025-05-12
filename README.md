# Kelompok20_DW_RC
LAPORAN TUGAS MISI PERTAMA
PERGUDANGAN DATA RC

BAB 1 
Profil Industri & Masalah Bisnis

1.1 Profil Industri 

Industri game telah berkembang menjadi salah satu sektor hiburan terbesar di dunia, menghadirkan tantangan bagi perusahaan dalam memahami perilaku konsumen dan mengoptimalkan strategi pemasaran. Volume data penjualan yang besar dan kompleks menuntut metode pengelolaan yang efisien. Pemanfaatan Data Warehouse menjadi solusi penting untuk mengintegrasikan data dari berbagai sumber, memungkinkan analisis multidimensi yang mendalam. Kombinasi dengan Online Analytical Processing (OLAP) juga telah terbukti efektif di berbagai sektor, termasuk industri game [1].

Dalam konteks industri game, Data Warehouse membantu perusahaan mengidentifikasi kategori produk terlaris, memantau tren penjualan, serta memahami preferensi konsumen secara real-time. Sistem ini tidak hanya meningkatkan efisiensi operasional dan mengurangi kesalahan pengolahan manual, tetapi juga menjadi landasan kuat dalam pengambilan keputusan strategis yang lebih cepat dan berbasis data, di tengah persaingan industri yang semakin ketat [2].

1.2 Masalah Bisnis

Perusahaan di industri game menghadapi beberapa tantangan utama, seperti memahami perilaku konsumen yang terus berubah, mengelola data penjualan yang besar dan tersebar di berbagai platform, serta mengambil keputusan strategis secara cepat dan akurat. Tanpa sistem yang efisien, integrasi dan analisis data menjadi sulit, sehingga menghambat pengambilan keputusan yang berbasis data.

Selain itu, kecepatan dan efisiensi operasional juga menjadi tantangan, terutama ketika proses pengolahan data masih dilakukan secara manual. Penggunaan Data Warehouse yang terintegrasi dapat menjadi solusi efektif untuk meminimalkan waktu pemrosesan, mengurangi kesalahan, dan memberikan wawasan yang lebih akurat untuk mendukung strategi bisnis.

BAB 2 
Daftar Stakeholder & Tujuan Bisnis

Berikut tabel stakeholder dan tujuan bisnis dari implementasi Data Warehouse di industri game:

Tabel 2.1 Daftar Stakeholder & Tujuan Bisnis

![image](https://github.com/user-attachments/assets/6765194a-d738-441a-bbab-de9f7cb8b573)

BAB 3 
Fakta & Dimensi

![image](https://github.com/user-attachments/assets/ac36787d-5a84-47b4-8f6f-9fe918879a8a)

3.1 Tabel Fakta

Tabel Fakta yaitu ‘TabelFakta_Sales’ merupakan inti dari skema bintang yang digunakan karena memuat data numerik atau kuantitatif yang menjadi fokus analisis, yaitu total penjualan global yang terhubung dengan tabel dimensi lainnya. ‘TabelFakta_Sales’ mencatat data informasi penjualan secara global pada setiap game. Kolom utama yaitu ‘Total_SalesGlobal’ merupakan total penjualan game secara global. Kolom-kolom lainnya merupakan foreign key yang berfungsi untuk menghubungkan tabel-tabel dimensi ke tabel fakta. Foreign key yang terdapat pada tabel fakta yaitu Game_ID, Platform_ID, Year_ID, Genre_ID, dan Publisher_ID.

3.2 Tabel Dimensi

Tabel dimensi dalam skema bintang berfungsi untuk memberikan informasi yang kontekstual terhadap data penjualan secara global di tabel fakta. Terdapat lima tabel dimensi dimana masing-masing tabel memiliki informasi yang berbeda yaitu:  

Tabel Dimensi Game (dim_game): memiliki informasi berupa ID pada kolom Game_ID disetiap game yang berperan sebagai primary key dan pada kolom Name menyimpan nama dari game tersebut.

Tabel Dimensi Platform (dim_platform): memiliki informasi mengenai platform dimana game tersebut dirilis. Platform_ID merupakan primary key, dan Platform berfungsi untuk menyimpan nama platform.

Tabel Dimensi Year (dim_year): memiliki informasi dan mencatat informasi mengenai tahun rilis dari setiap game, dimana Year_ID merupakan primary key dan Year merupakan nilai tahun rilis.

Tabel Dimensi Genre (dim_genre): memiliki informasi kategori beberapa genre dari game. Genre_ID merupakan primary key dan Genre berisi nama genre seperti Romance, Action, Thriller maupun beberapa genre lainnya.

Tabel Dimensi Publisher (dim_publisher): memiliki informasi sebuah data mengenai perusahaan penerbit game. Publisher_ID merupakan primary key, dan Publisher berisikan nama-nama perusahaan penerbit.

BAB 4 
Sumber Data & Metadata

4.1 Sumber Data

Data yang akan digunakan berasal dari situs Kaggle dengan judul "Video Games Sale" yang dikembangkan oleh Zahid Feroze. Data ini berbentuk CSV dan merupakan data historis penjualan video game di beberapa kawasan di dunia. Dataset ini bersifat statik atau tidak diperbarui secara berkala, karena merupakan kompilasi data historis dari berbagai sumber industri game. Oleh karena itu, frekuensi pembaruan datanya tidak relevan (non-realtime). Data ini sangat cocok digunakan untuk keperluan analisis tren penjualan game berdasarkan waktu, platform, genre, serta pengaruh publisher terhadap performa penjualan global.

4.2 Metadata
Tabel 4.1 Metadata
![image](https://github.com/user-attachments/assets/025144d0-af89-4663-baa4-876d4f39fd69)

DAFTAR PUSTAKA

[1] C. B. Santoso, R. Khairunnisa, M. Rachma, and S. Humayyah, “Implementasi Data Warehouse dan Business Intelligence untuk Pemantauan dan Analisis Penjualan Game,” TeknoIS: Jurnal Ilmiah Teknologi Informasi dan Sains, vol. 15, no. 1, pp. 40–50, Jan. 2025. [Online]. Available: https://teknois.unbin.ac.id/JBS/

[2] V. Yadav and S. Yadav, “Global Gaming Market Dynamics: A Comprehensive Analysis of Video Game Sales Patterns Across Platforms, Genres, and Regions,” International Research Journal of Modernization in Engineering Technology and Science, vol. 6, no. 12, Dec. 2024. [Online]. Available: https://www.doi.org/10.56726/IRJMETS65750

[3] https://www.kaggle.com/datasets/zahidmughal2343/video-games-sale
