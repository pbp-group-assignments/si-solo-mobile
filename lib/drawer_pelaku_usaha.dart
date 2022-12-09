import 'package:flutter/material.dart';
import 'package:si_solo/pendaftaran_izin_usaha/page/list_pendaftaran_usaha_pengguna.dart';
import 'package:si_solo/landing_page_pelaku_usaha.dart';
import 'package:si_solo/pendaftaran_izin_usaha/page/daftar_usaha_baru.dart';
import 'package:si_solo/pendaftaran_izin_usaha/page/list_pendaftaran_usaha_pelaku_usaha.dart';

Drawer buildDrawer(BuildContext context) {
  return Drawer(
    child: Column(
      children: [
        ListTile(
          title: const Text('Halaman Utama'),
          onTap: () {
            Navigator.pushReplacement(
              context, 
              MaterialPageRoute(builder: (context) => const LandingPelakuUsahaPage())
            );
          }
        ),
        ListTile(
          title: const Text('List Pendaftaran Usaha'),
          onTap: () {
            Navigator.pushReplacement(
              context, 
              MaterialPageRoute(builder: (context) => const ListPendaftaranUsahaPelakuUsahaPage(index: 0,))
            );
          }
        ),
        ListTile(
          title: const Text('Daftar Usaha Baru'),
          onTap: () {
            Navigator.pushReplacement(
              context, 
              MaterialPageRoute(builder: (context) => const DaftarUsahaBaruPage())
            );
          }
        ),
      ]
    )
  );
}