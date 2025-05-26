LAPORAN TUGAS MISI KEDUA

PERGUDANGAN DATA RC

Disusun oleh:

Kelompok 20

1. Asrizal                      (121450010)

2. Anissa Luthfi Alifia         (121450093)

3. Rani Puspita Sari            (122450030)
 
4. Rendi Alexander Hutagalung   (122450057)

5. Irvan Alfaritzi              (122450093)


BAB 1 Analisis Kebutuhan Informasi Bisnis

1.1 Tinjauan Bisnis

Organisasi ini memiliki tujuan untuk mengimplementasikan data warehouse di industri game untuk data penjualan dari berbagai sumber, platform, dan daerah geografis, sesuai dengan profil industri. Data warehouse setelahnya akan disimpan menjadi solusi esensial untuk integrasi sumber data dari penjualan game yang luas, termasuk analisis multidimensi yang mendalam. Hal ini akan membentuk landasan yang kuat dalam pengambilan keputusan strategi yang lebih cepat dengan didasarkan oleh data di tengah persaingan industri yang semakin meningkat.

1.2 Permasalahan Utama

 Industri game memiliki beberapa masalah utama dalam pengelolaan dan analisis data, seperti ;
Data penjualan yang tersebar melalui berbagai platform dan wilayah geografis tidak dapat diintegrasikan.
Pengolahan data secara manual dapat menghabiskan waktu yang cukup lama dan berpotensi tinggi untuk menghadapi kesalahan.
Terdapat sejumlah keterbatasan dalam melakukan analisis multidimensi yang diperlukan untuk memahami pola penjualan berdasarkan berbagai faktor, seperti waktu, genre, platform, dan penerbit.

1.3 Pihak Terkait dan Kebutuhan

-Manajemen Eksekutif : Membutuhkan dashboard yang komprehensif untuk memantau kinerja secara global.

-Tim Marketing : Membutuhkan informasi tentang game populer berdasarkan wilayah dan platform

-Data analis :Memerlukan kemampuan untuk melakukan analisis multidimensi berdasarkan genre, platform, dan waktu.

-Pengembang Game : Membutuhkan informasi mengenai preferensi pasar yang didasarkan pada genre dan platform.

 1.4 Kebutuhan Data

Jenis data yang diperlukan mencakup informasi penjualan game, baik dalam skala global maupun regional. Data tersebut meliputi nama game, genre, platform, tahun rilis, dan penerbit. Selain itu, data mengenai waktu, seperti tahun atau periode penjualan, juga sangat penting untuk menganalisis tren. Informasi mendetail tentang platform dan penerbit pun diperlukan untuk mendukung analisis performa berdasarkan sistem dan penerbit game.

BAB 2 Skema Konseptual Multidimensi

2.1 Skema Star Schema Penjualan Game

Skema konseptual yang digunakan dalam perancangan data warehouse ini mengikuti bentuk star schema, yaitu model multidimensi yang memiliki satu tabel fakta sebagai pusat dan dikelilingi oleh beberapa tabel dimensi. Tabel fakta yang digunakan adalah TabelFakta_Sales, yang menyimpan data total penjualan global (Total_SalesGlobal) dari masing-masing game. Tabel ini terhubung dengan lima tabel dimensi, yaitu dim_game, dim_platform, dim_year, dim_genre, dan dim_publisher, yang masing-masing menyimpan informasi kontekstual yang mendukung proses analisis. Melalui hubungan tersebut, pengguna dapat mengevaluasi data penjualan dari berbagai sudut pandang, seperti penjualan berdasarkan genre, platform, tahun rilis, maupun publisher. Pendekatan ini memungkinkan fleksibilitas dalam proses analitik dan pelaporan karena setiap dimensi dapat dikombinasikan secara dinamis untuk memenuhi kebutuhan informasi yang berbeda. Struktur konseptual dari model ini dapat dilihat pada Gambar 2.1 berikut.

![image](https://github.com/user-attachments/assets/b3791795-a426-46be-a67f-b991da0014bf)

Gambar 2.1 Skema Bintang Data

2.2 Integrasi dan Tujuan Penggunaan

Model skema multidimensi ini bertujuan untuk mengintegrasikan berbagai sumber data penjualan game menjadi satu sistem terpusat yang memudahkan proses pengambilan keputusan berbasis data. Data warehouse yang dirancang dengan pendekatan ini akan mendukung berbagai kebutuhan analitik historis, tren pasar, dan prediksi penjualan berdasarkan dimensi yang tersedia.


BAB 3 Penjelasan Pada Tiap Komponen

3.1 Tabel Fakta

Tabel fakta yang digunakan dalam sistem data warehouse ini adalah TabelFakta_Sales. Tabel ini menjadi pusat dari skema bintang yang telah dibangun. Tabel ini menyimpan data numerik yang menjadi fokus utama analisis, yaitu total penjualan game secara global. Peran tabel fakta sangat penting karena menjadi tempat di mana semua data transaksi penjualan dikumpulkan, lalu dihubungkan ke berbagai tabel dimensi untuk dianalisis dari berbagai sisi. Atribut utama dari tabel ini adalah kolom Total_SalesGlobal yang mencatat jumlah total penjualan suatu game di seluruh dunia. Selain kolom utama tersebut, terdapat juga kolom lain yang  berperan sebagai foreign key, yaitu Game_ID, Platform_ID, Year_ID, Genre_ID dan Publisher_ID.  Secara keseluruhan, TabelFakta_Sales berfungsi sebagai jembatan antara data numerik dan data deskriptif dari tabel-tabel dimensi. Oleh karena itu, tabel ini menjadi komponen kunci dalam sistem data warehouse yang dibangun untuk menganalisis penjualan game secara menyeluruh.

3.2 Tabel Dimensi

Tabel dimensi dalam skema bintang berfungsi untuk memberikan informasi yang kontekstual terhadap data penjualan secara global di tabel fakta. Terdapat lima tabel dimensi dimana masing-masing tabel memiliki informasi yang berbeda yaitu: 

-dim_game : Tabel ini berisi data tentang game, Game_ID sebagai primary key. Digunakan untuk mengetahui game apa saja yang dianalisis.

-Dim_platform : Tabel ini menyimpan informasi mengenai platform tempat game dirilis. Atribut utamanya yaitu Platform_ID dan platformname.

-dim_year : memiliki informasi dan mencatat informasi mengenai tahun rilis dari setiap game, dimana Year_ID merupakan primary key dan Year merupakan nilai tahun rilis.

-dim_genre : Tabel ini memiliki informasi kategori beberapa genre dari game. Genre_ID merupakan primary key dan Genre berisi nama genre seperti Romance, Action, Thriller maupun beberapa genre lainnya. 

-dim_publisher : memiliki informasi sebuah data mengenai perusahaan penerbit game. Publisher_ID merupakan primary key, dan Publisher berisikan nama-nama perusahaan penerbit.

BAB 4 Justifikasi Desain Konseptual

4.1 Alasan Pemilihan Skema

Skema star schema dipilih karena skema ini menawarkan struktur data yang sederhana, mudah dipahami, namun tetap mampu mendukung analisis secara fleksibel dan efisien. Skema ini terdiri dari satu tabel fakta yang menyimpan data penjualan sebagai pusat, yang terhubung langsung dengan beberapa tabel dimensi seperti game, platform, genre, tahun rilis, dan publisher. Desain ini memudahkan pengguna dari berbagai latar belakang, baik teknis maupun non-teknis, untuk membaca, memahami, dan menganalisis data tanpa harus menghadapi struktur yang rumit. Keunggulan lainnya terletak pada kemampuan star schema dalam mendukung analisis multidimensi, seperti melihat tren penjualan berdasarkan genre, membandingkan performa antar platform, atau mengevaluasi kontribusi publisher dari tahun ke tahun. Dari sisi performa, struktur yang minim relasi kompleks membuat proses query menjadi lebih cepat, sehingga sangat mendukung kebutuhan pelaporan dan pembuatan dashboard interaktif. Selain itu, skema ini juga mudah untuk dikembangkan karena penambahan informasi baru cukup dilakukan di tabel dimensi tanpa mengubah struktur utama. Dengan berbagai kelebihan tersebut, star schema menjadi pilihan yang tepat untuk mengelola dan menganalisis data penjualan game secara efektif serta mendukung proses pengambilan keputusan berbasis data di lingkungan organisasi.

4.2 Kesesuaian Data dan Dimensi

Dalam Star Schema ini, TabelFakta_Sales berfungsi sebagai pusat yang menyimpan informasi penjualan dari setiap game. Tabel fakta ini dihubungkan dengan lima tabel dimensi yang memberikan konteks lebih lanjut pada data penjualan. Dimensi-dimensi tersebut antara lain:

-dim_game: Menyediakan informasi tentang nama dan jenis game, yang memungkinkan analisis penjualan berdasarkan game tertentu.

-dim_platform: Menyediakan data tentang platform tempat game dijual (misalnya PlayStation, Xbox, atau PC), yang membantu menganalisis penjualan berdasarkan platform.

-dim_year: Menyimpan informasi mengenai tahun atau periode waktu penjualan, yang memungkinkan analisis tren penjualan sepanjang waktu.

-dim_genre: Menyediakan kategori genre game (seperti aksi, petualangan, atau RPG), yang memungkinkan analisis penjualan berdasarkan preferensi genre.

-dim_publisher: Menyediakan informasi tentang penerbit game, yang memungkinkan analisis berdasarkan penerbit tertentu.

Dengan struktur ini, pengguna dapat dengan mudah menganalisis data penjualan dari berbagai aspek, seperti genre, platform, atau penerbit, sehingga membantu memahami tren dan menyusun strategi bisnis yang lebih tepat. 

BAB 5 Kesesuaian dengan Sumber Data

5.1 Asal Data

Data yang digunakan dalam skema ini bersifat fiktif namun disusun berdasarkan logika dan pola yang umum ditemukan dalam industri video game. Dataset ini menggambarkan informasi penjualan video game secara global yang dikumpulkan oleh sebuah perusahaan riset pasar bernama “Global Interactive Market Research (GIMR)”. Perusahaan ini melakukan pengumpulan data melalui kerja sama dengan publisher game, platform distribusi digital, dan laporan penjualan dari berbagai wilayah. Setiap entri dalam dataset mencakup atribut seperti nama game, platform, genre, tahun rilis, penerbit, serta angka penjualan di beberapa wilayah.

5.2 Hubungan Skema dengan Data Asal

Skema ini dirancang memiliki keterkaitan erat dengan data yang digunakan. Setiap komponen dalam skema baik tabel fakta maupun tabel dimensi dibentuk berdasarkan atribut-atribut yang dikumpulkan mengenai tren penjualan video game. 

-TabelFakta_Sales:   

Tabel ini menyimpan data numerik utama seperti Game_ID, Platform_ID, Year_ID, Genre_ID, Publisher_ID, Total_SalesGlobal. Nilai-nilai tersebut menggambarkan volume penjualan berdasarkan wilayah dan diperoleh dari penggabungan data penjualan berbagai platform distribusi.

-Tabel Dimensi: 

-Dim_Game:

Menyimpan informasi deskriptif mengenai game seperti Game_ID, INT, PK. Atribut ini membantu dalam mengelompokkan data penjualan berdasarkan jenis permainan, waktu peluncuran, dan produsen game.

-Dim_Platform:

Mewakili sistem atau konsol tempat game dirilis. Informasi ini digunakan untuk menganalisis performa penjualan berdasarkan platform.

-Dim_Year:

Berdasarkan Year_ID, INT, PK. Tabel ini mendukung analisis tren dari waktu ke waktu..

-Dim_Genre dan Dim_Publisher:

Masing-masing dapat dijadikan dimensi terpisah untuk mendukung fleksibilitas query terhadap jenis game atau kinerja masing-masing penerbit.

