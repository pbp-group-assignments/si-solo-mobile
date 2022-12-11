import 'package:flutter/material.dart';
import 'package:si_solo/pendaftaran_izin_usaha/page/list_pendaftaran_usaha_pengguna.dart';
import 'package:si_solo/landing_page_pengguna.dart';
import 'package:si_solo/layanan_pengaduan/page/form_pengaduan.dart';
import 'package:si_solo/saran_pembangunan_kota/page/form_kritik_saran.dart';

Drawer buildDrawer(BuildContext context) {
  return Drawer(
    child: Column(
      children: [
        ListTile(
          title: const Text('Halaman Utama'),
          onTap: () {
            Navigator.pushReplacement(
              context, 
              MaterialPageRoute(builder: (context) => const LandingPenggunaPage())
            );
          }
        ),
        ListTile(
          title: const Text('Pendaftaran Usaha'),
          onTap: () {
            Navigator.pushReplacement(
              context, 
              MaterialPageRoute(builder: (context) => const ListPendaftaranUsahaPenggunaPage())
            );
          }
        ),
        ListTile(
          title: const Text('Layanan Pengaduan'),
          onTap: () {
            Navigator.pushReplacement(
              context, 
              MaterialPageRoute(builder: (context) => const FormPengaduanPage())
            );
          }
        ),
        ListTile(
          title: const Text('Saran Pembangunan Kota'),
          onTap: () {
            Navigator.pushReplacement(
              context, 
              MaterialPageRoute(builder: (context) => const FormSaranPage())
            );
          }
        ),
      ]
    )
  );
}