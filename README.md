# si-solo-mobile

## Nama-nama anggota kelompok
- Clarissa Thea Aryanto (NPM: 2106634673)
- Fabian Akmal Arkandion (NPM: 2106750660)
- Jasmine Indira Wibowo (NPM: 2106650374)
- Mathilda Dellanova (NPM: 2106751240)
- Rifqi Farel Muhammad (NPM: 2106650310)
- Sakinah Richas (NPM: 2106751511)

## Deskripsi Aplikasi
Aplikasi yang kami ajukan adalah Solo smart city, bernama 'Si Solo' atau kependekan dari Sistem Informasi Solo. Smart city atau kota cerdas merupakan wilayah kota yang telah mengintegrasikan teknologi informasi dan komunikasi dalam tata kelola sehari-hari. Alasan kami memilih kota Solo adalah karena menurut kami kota Solo memiliki banyak potensi namun belum memiliki website untuk menyalurkan potensi-potensi tersebut. Manfaat dari aplikasi ini adalah memperbaiki permasalahan di masyarakat, meningkatkan layanan publik, menciptakan pemerintahan yang lebih baik, mencerdaskan masyarakat, serta mengelola potensi SDM di kota Solo. Menurut kami, aplikasi smart city yang kami buat dapat menyelesaikan beberapa isu yang dibahas dalam G20, seperti ekonomi digital, pariwisata, kesehatan, pembangunan, serta lingkungan.

## Fitur-fitur yang akan diimplementasikan
1. Forum layanan pengaduan: Forum yang memungkinkan Pengguna untuk mengirimkan laporan mengenai layanan di Kota Solo. Admin juga dapat melihat seluruh laporan yang telah dikirimkan oleh Pengguna.
2. Forum pemberian saran untuk pembangunan kota: Forum yang memungkinkan pengguna untuk mengirimkan saran yang dapat memajukan atau membangun Kota Solo. Admin dapat melihat seluruh saran yang telah dikirimkan oleh pengguna.
3. Informasi tentang kontak darurat: Halaman yang berisi kontak darurat (polisi, ambulans, pemadam kebakaran, dll) di Kota Solo.
4. Informasi tentang sarana kesehatan: Halaman yang berisi tentang informasi sarana kesehatan (lokasi, kontak, dll) di Kota Solo.
5. Informasi tentang transportasi umum: Halaman yang berisi tentang informasi transportasi umum yang ada di Kota Solo.
6. Informasi tentang kuliner: Halaman yang berisi tentang informasi kuliner (nama, menu, lokasi, dll) yang ada di Kota Solo.
7. Informasi tentang tempat wisata: Halaman yang berisi tentang informasi tempat wisata yang ada di Kota Solo.
8. Informasi tentang penjualan kebutuhan pokok: Halaman yang berisi tentang penjualan kebutuhan pokok yang ada di Kota Solo.
9. Pendaftaran izin usaha: Halaman yang berisi form beserta status pendaftaran izin usaha, dimana ketika pendaftaran telah selesai maka pelaku usaha dapat memanage langsung usahanya pada website Si Solo.

## Alur pengintegrasian web service
Aplikasi Flutter akan mengambil data JSON dengan melakukan method HTTP GET, sehingga aplikasi perlu ditambahkan dependensi `http`. Selain itu, pada aplikasi ditambahkan fungsi HTTP request dengan method `GET` secara asinkronus untuk mengambil data dari web service menggunakan url. Pada fungsi ini, dibutuhkan method jsonDecode() untuk mengubah response menjadi JSON. Selanjutnya, model dibuat berdasarkan data JSON yang akan diolah. Model dapat digambarkan seperti tempat untuk menampung data JSON yang ingin diolah. Terakhir, seluruh data yang ditampung pada model akan ditampilkan pada aplikasi Flutter menggunakan bantuan `FutureBuilder`.