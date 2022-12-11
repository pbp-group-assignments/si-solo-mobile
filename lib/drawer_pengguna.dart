import 'package:flutter/material.dart';
import 'package:si_solo/pendaftaran_izin_usaha/page/list_pendaftaran_usaha_pengguna.dart';
import 'package:si_solo/landing_page_pengguna.dart';
import 'info_kuliner/page/list_kuliner_pengguna.dart';
import 'info_wisata/page/list_wisata_pengguna.dart';

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
            title: const Text('Info Wisata'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const InfoWisataPenggunaPage())
              );
            }
        ),
        ListTile(
            title: const Text('Info Kuliner'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const InfoKulinerPenggunaPage())
              );
            }
        ),
      ]
    )
  );
}