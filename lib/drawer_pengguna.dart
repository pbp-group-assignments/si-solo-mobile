import 'package:flutter/material.dart';
import 'package:si_solo/pendaftaran_izin_usaha/page/list_pendaftaran_usaha_pengguna.dart';
import 'package:si_solo/landing_page_pengguna.dart';
import 'package:si_solo/layanan_pengaduan/page/form_pengaduan.dart';
import 'package:si_solo/saran_pembangunan_kota/page/form_kritik_saran.dart';
import 'info_kuliner/page/list_kuliner_pengguna.dart';
import 'info_wisata/page/list_wisata_pengguna.dart';
import 'package:si_solo/info_kebutuhan/page/list_kebutuhan_pengguna.dart';
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
            title: const Text('Info Kebutuhan Pokok'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const InfoKebutuhanPenggunaPage())
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

