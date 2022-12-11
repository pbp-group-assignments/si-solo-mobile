import 'package:flutter/material.dart';
import 'package:si_solo/main.dart';
import 'package:si_solo/main-page/model/user.dart';
import 'package:si_solo/landing_page_admin.dart';
import 'package:si_solo/info_sarana_kesehatan/page/healthcenter_page.dart';
import 'package:si_solo/info_sarana_kesehatan/page/healthcenter_edit.dart';

class DrawerHealthCenterAdmin extends StatelessWidget {
  const DrawerHealthCenterAdmin({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Menambahkan clickable menu
          ListTile(
            title: const Text('Home'),
            onTap: () {
              // Route menu ke halaman utama
              Navigator.pushReplacement(
                context, 
                MaterialPageRoute(builder: (context) => const LandingAdminPage())
              );
            },
          ),
          ListTile(
            title: const Text('Info Sarana Kesehatan'),
            onTap: () {
              // Route menu ke halaman my watchlist
              Navigator.pushReplacement(
                context, 
                MaterialPageRoute(builder: (context) => const HealthCenterPage())
              );
            },
          ),
          ListTile(
            title: const Text('Tambah Sarana Kesehatan'),
            onTap: () {
              // TODO: Route menu ke halaman form
            },
          ),
          ListTile(
            title: const Text('Hapus Sarana Kesehatan'),
            onTap: () {
              // TODO: Route menu ke halaman form
            },
          ),
        ],
      ),
    );
  }
}