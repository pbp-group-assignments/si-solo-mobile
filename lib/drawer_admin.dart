import 'package:flutter/material.dart';
import 'package:si_solo/landing_page_admin.dart';
import 'package:si_solo/admin/page/list_pendaftaran_pelaku_usaha.dart';
import 'package:si_solo/admin/page/list_pendaftaran_usaha.dart';
import 'admin/page/list_kuliner_admin.dart';
import 'admin/page/list_wisata_admin.dart';

Drawer buildDrawer(BuildContext context) {
  return Drawer(
    child: Column(
      children: [
        ListTile(
          title: const Text('Halaman Utama'),
          onTap: () {
            Navigator.pushReplacement(
              context, 
              MaterialPageRoute(builder: (context) => const LandingAdminPage())
            );
          }
        ),
        ListTile(
          title: const Text('List Pendaftaran Pelaku Usaha'),
          onTap: () {
            Navigator.pushReplacement(
              context, 
              MaterialPageRoute(builder: (context) => const ListPendaftaranPelakuUsahaPage())
            );
          }
        ),
        ListTile(
          title: const Text('List Pendaftaran Usaha'),
          onTap: () {
            Navigator.pushReplacement(
              context, 
              MaterialPageRoute(builder: (context) => const ListPendaftaranUsahaPage())
            );
          }
        ),
        ListTile(
            title: const Text('Info Wisata'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const InfoWisataPage())
              );
            }
        ),
        ListTile(
            title: const Text('Info Kuliner'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const InfoKulinerPage())
              );
            }
        ),
      ]
    )
  );
}