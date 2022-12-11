# si-solo-mobile

[![Develop][actions-badge](https://github.com/pbp-group-assignments/si-solo-mobile/commits/main)
[![Build status](https://build.appcenter.ms/v0.1/apps/6bb8b49c-3913-4b66-ae04-707a9749474c/branches/main/badge)](https://appcenter.ms)

## Tautan APK
[APK Si Solo](https://install.appcenter.ms/orgs/pbp-group-b12/apps/si-solo/distribution_groups/public)

## Nama-nama anggota kelompok
- Clarissa Thea Aryanto (NPM: 2106634673)
- Fabian Akmal Arkandion (NPM: 2106750660)
- Jasmine Indira Wibowo (NPM: 2106650374)
- Mathilda Dellanova (NPM: 2106751240)
- Rifqi Farel Muhammad (NPM: 2106650310)
- Sakinah Richas (NPM: 2106751511)

## Deskripsi aplikasi
Aplikasi yang kami ajukan adalah Solo smart city, bernama 'Si Solo' atau kependekan dari Sistem Informasi Solo. Smart city atau kota cerdas merupakan wilayah kota yang telah mengintegrasikan teknologi informasi dan komunikasi dalam tata kelola sehari-hari. Alasan kami memilih kota Solo adalah karena menurut kami kota Solo memiliki banyak potensi namun belum memiliki website untuk menyalurkan potensi-potensi tersebut. Manfaat dari aplikasi ini adalah memperbaiki permasalahan di masyarakat, meningkatkan layanan publik, menciptakan pemerintahan yang lebih baik, mencerdaskan masyarakat, serta mengelola potensi SDM di kota Solo. Menurut kami, aplikasi smart city yang kami buat dapat menyelesaikan beberapa isu yang dibahas dalam G20, seperti ekonomi digital, pariwisata, kesehatan, pembangunan, serta lingkungan.

Terdapat empat role/peran pengguna pada aplikasi ini, yaitu:
1. Pengguna asing: Merupakan pengguna yang belum login ke website. Pengguna asing hanya dapat mengakses landing page, page informasi tentang lokasi kuliner & wisata, page informasi tentang sarana kesehatan, page informasi tentang transportasi umum, dan page informasi tentang lokasi penjualan kebutuhan pokok.
2. Pengguna: Merupakan pengguna yang sudah login ke website. Pengguna dapat mengakses seluruh hal yang dapat diakses oleh pengguna asing dan juga dapat mengakses page forum layanan pengaduan dan page forum pemberian saran untuk pembangunan kota.
3. Pelaku usaha: Merupakan pengguna yang juga sudah terdaftar izin usahanya di website, sehingga dapat memanage usahanya di website. 
4. Admin: Role untuk pemerintah (melalui pegawainya) untuk mengatur dan mengawasi interaktif yang terjadi di website agar kelancaran website dapat terjamin. Role admin dapat memberikan respon terhadap pengaduan dari forum layanan pengaduan, melihat saran yang diberikan pada page forum pemberian saran untuk pembangunan kota, mengelola jadwal dan rute transportasi umum, melihat list pendaftaran izin usaha dan yang mengubah status dari pendaftaran tersebut, dan menghapus suatu usaha dari website Si Solo jika usaha tersebut terbukti melakukan sesuatu yang membuat nama Kota Solo menjadi kurang baik.

## Daftar modul yang akan diimplementasikan
1. Forum layanan pengaduan & pemberian saran untuk pembangunan kota (dikerjakan oleh Mathilda Dellanova)
- Forum layanan pengaduan: Forum yang memungkinkan Pengguna untuk mengirimkan laporan mengenai layanan di Kota Solo. Admin juga dapat melihat seluruh laporan yang telah dikirimkan oleh Pengguna.
- Forum pemberian saran untuk pembangunan kota: Forum yang memungkinkan pengguna untuk mengirimkan saran yang dapat memajukan atau membangun Kota Solo. Admin dapat melihat seluruh saran yang telah dikirimkan oleh pengguna.

2. Informasi tentang kontak darurat (dikerjakan oleh Clarissa Thea Aryanto): Halaman yang berisi kontak darurat (polisi, ambulans, pemadam kebakaran, dll) di Kota Solo.

3. Informasi tentang sarana kesehatan & transportasi umum (dikerjakan oleh Fabian Akmal Arkandion)
- Informasi tentang sarana kesehatan: Halaman yang berisi tentang informasi sarana kesehatan (lokasi, kontak, dll) di Kota Solo.
- Informasi tentang transportasi umum: Halaman yang berisi tentang informasi transportasi umum yang ada di Kota Solo.

4. Informasi tentang kuliner & tempat wisata (dikerjakan oleh Jasmine Indira Wibowo)
- Informasi tentang kuliner: Halaman yang berisi tentang informasi kuliner (nama, menu, lokasi, dll) yang ada di Kota Solo.
- Informasi tentang tempat wisata: Halaman yang berisi tentang informasi tempat wisata yang ada di Kota Solo.

5. Informasi tentang penjualan kebutuhan pokok (dikerjakan oleh Sakinah Richas): Halaman yang berisi tentang penjualan kebutuhan pokok yang ada di Kota Solo.

6. Pendaftaran izin usaha (dikerjakan oleh Rifqi Farel Muhammad): Halaman yang berisi form beserta status pendaftaran izin usaha, dimana ketika pendaftaran telah selesai maka pelaku usaha dapat memanage langsung usahanya pada website Si Solo.

## Alur pengintegrasian web service
Aplikasi Flutter akan mengambil data JSON dengan melakukan method HTTP GET, sehingga aplikasi perlu ditambahkan dependensi `http`. Selain itu, pada aplikasi ditambahkan fungsi HTTP request dengan method `GET` secara asinkronus untuk mengambil data dari web service menggunakan url. Pada fungsi ini, dibutuhkan method jsonDecode() untuk mengubah response menjadi JSON. Selanjutnya, model dibuat berdasarkan data JSON yang akan diolah. Model dapat digambarkan seperti tempat untuk menampung data JSON yang ingin diolah. Terakhir, seluruh data yang ditampung pada model akan ditampilkan pada aplikasi Flutter menggunakan bantuan FutureBuilder.

Selanjutnya, pada aplikasi juga ditambahkan fungsi HTTP request dengan method POST untuk mengirim data ke server. Untuk implementasi method HTTP POST pada Flutter dapat dilakukan dengan membuat fungsi createAlbum() yang akan mengembalikan HTTP response berupa objek Future. Di dalam fungsi ini, response yang akan dikembalikan didapat dari method http.post() yang di dalamnya terdapat parameter URL untuk endpoint data JSON yang akan diperbarui dan pada parameter body perlu ditambahkan field data objek yang akan ditambahkan ke database dalam bentuk JSON dengan bantuan method jsonEncode(). Tiap field objek yang ingin ditambahkan perlu ditambahkan sebagai parameter dalam fungsi createAlbum() agar data-data field tersebut dapat dikirimkan ke server. Berikutnya untuk memudahkan, kita perlu membuat kelas baru yang berperan sebagai hasil konversi HTTP response menjadi objek Dart (kelas tersebut dapat diberi nama Album). Kelas ini berisi field-field yang akan dikirim ke server beserta ID objek tersebut. Di dalam kelas tersebut, perlu dibuat factory constructor yang akan mengkonversi JSON menjadi objek Album yang sudah dibuat. Setelah membuat kelas tersebut, pada fungsi createAlbum() kita bisa mengembalikan objek Album yang dikonversi dari JSON dengan memanggil factory constructor yang menggunakan method fromJson() untuk mengubah map JSON yang didapat dari method jsonDecode() menjadi objek Album. Kemudian, untuk mendapatkan field data yang diinput pengguna kita perlu membuat input field yang memiliki atribut controller. Controller ini dapat mengembalikan value input yang diberikan pengguna sehingga kita bisa memanggil fungsi createAlbum() dengan parameter berupa value yang didapat dari controller tersebut. Future album yang dihasilkan akan ditaruh di dalam FutureBuilder sebagai atribut future sehingga data baru dapat ditampilkan.

Terakhir, aplikasi Flutter kami juga mengimplementasikan method HTTP DELETE untuk menghapus data objek di server. Fungsi deleteAlbum() dibuat dengan membuat response menggunakan method http.delete() yang di dalamnya diberi parameter URL ke endpoint JSON. URL data JSON ini harus spesifik menunjuk ke data objek yang akan dihapus. Oleh karena itu, fungsi deleteAlbum() ini juga perlu diberi parameter ID objek yang akan dihapus tersebut. Kemudian untuk memperbarui tampilan, kita perlu membuat tombol delete yang akan mengubah state dari future album menjadi hasil tampilan setelah berhasil menghapus objek dari server. Caranya adalah dengan memanggil method setState() ketika event onPressed pada tombol delete. Di dalam method setState() akan dipanggil fungsi deleteAlbum() untuk menghapus data objek dan future album akan diperbarui dengan memanggil fungsi fetchAlbum() yang mengimplementasikan method HTTP GET seperti yang sudah dijelaskan sebelumnya.
