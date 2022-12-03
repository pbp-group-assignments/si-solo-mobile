import 'package:flutter/material.dart';
import 'package:si_solo/pendaftaran_izin_usaha/page/daftar_pelaku_usaha.dart';
import 'package:si_solo/landing_page_not_admin.dart';

Drawer buildDrawer(BuildContext context) {
  return Drawer(
    child: Column(
      children: [
        ListTile(
          title: const Text('Halaman Utama'),
          onTap: () {
            Navigator.pushReplacement(
              context, 
              MaterialPageRoute(builder: (context) => const LandingNotAdminPage())
            );
          }
        ),
        ListTile(
          title: const Text('Daftar Pelaku Usaha'),
          onTap: () {
            Navigator.pushReplacement(
              context, 
              MaterialPageRoute(builder: (context) => const DaftarPelakuUsahaPage())
            );
          }
        ),
      ]
    )
  );
}