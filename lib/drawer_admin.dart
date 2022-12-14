import 'package:flutter/material.dart';
import 'package:si_solo/landing_page_admin.dart';
import 'package:si_solo/admin/page/list_pendaftaran_pelaku_usaha.dart';
import 'package:si_solo/admin/page/list_pendaftaran_usaha.dart';
import 'package:si_solo/admin/page/list_kuliner_admin.dart';
import 'package:si_solo/admin/page/list_wisata_admin.dart';
import 'package:si_solo/admin/page/list_kebutuhan_admin.dart';
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
              MaterialPageRoute(builder: (context) => const LandingAdminPage())
            );
          }
        ),
        ListTile(
          title: const Text('List Pendaftaran Pelaku Usaha'),
          onTap: () {
            Navigator.pushReplacement(
              context, 
              MaterialPageRoute(builder: (context) => const ListPendaftaranPelakuUsahaPage(index: 0,))
            );
          }
        ),
        ListTile(
          title: const Text('List Pendaftaran Usaha'),
          onTap: () {
            Navigator.pushReplacement(
              context, 
              MaterialPageRoute(builder: (context) => const ListPendaftaranUsahaPage(index: 0,))
            );
          }
        ),
        ListTile(
          title: const Text('List Pengaduan'),
          onTap: () {
            // Navigator.pushReplacement(
            //   context, 
            //   MaterialPageRoute(builder: (context) => const ListPengaduanPage(index: 0,))
            // );
          }
        ),
        ListTile(
          title: const Text('List Kritik Saran'),
          onTap: () {
            // Navigator.pushReplacement(
            //   context, 
            //   MaterialPageRoute(builder: (context) => const ListKritikSaranPage(index: 0,))
            // );
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
        ListTile(
            title: const Text('Info Kebutuhan'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const InfoKebutuhanPage())
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