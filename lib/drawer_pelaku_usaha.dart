import 'package:flutter/material.dart';
import 'package:si_solo/pendaftaran_izin_usaha/page/list_pendaftaran_usaha_pengguna.dart';
import 'package:si_solo/landing_page_pelaku_usaha.dart';
import 'package:si_solo/pendaftaran_izin_usaha/page/daftar_usaha_baru.dart';
import 'package:si_solo/pendaftaran_izin_usaha/page/list_pendaftaran_usaha_pelaku_usaha.dart';
import 'info_kuliner/page/list_kuliner_pelaku.dart';
import 'info_wisata/page/list_wisata_pelaku.dart';
import 'package:si_solo/info_transportasi/page/transport_page.dart';
import 'package:si_solo/info_sarana_kesehatan/page/healthcenter_page.dart';

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
        ListTile(
            title: const Text('Info Wisata'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const InfoWisataPelakuPage())
              );
            }
        ),
        ListTile(
            title: const Text('Info Kuliner'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const InfoKulinerPelakuPage())
              );
            }
        ),
        ListTile(
            title: const Text('Info Transportasi Umum'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const TransportPage())
              );
            }
        ),
        ListTile(
            title: const Text('Info Sarana Kesehatan'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HealthCenterPage())
              );
            }
        ),
      ]
    )
  );
}