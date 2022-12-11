import 'package:flutter/material.dart';
import 'package:si_solo/main.dart';
import 'package:si_solo/main-page/model/user.dart';
import 'package:si_solo/landing_page_pelaku_usaha.dart';
import 'package:si_solo/landing_page_pengguna.dart';
import 'package:si_solo/info_sarana_kesehatan/page/healthcenter_page.dart';
import 'package:si_solo/info_sarana_kesehatan/page/healthcenter_edit.dart';

class DrawerHealthCenterRegular extends StatelessWidget {
  const DrawerHealthCenterRegular({Key? key,}) : super(key: key);

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
              if (UserLogin.listUserLogin[0].role == 'Pengguna') {
                Navigator.pushReplacement(
                  context, 
                  MaterialPageRoute(builder: (context) => const LandingPenggunaPage())
                );
              }
              else {
                Navigator.pushReplacement(
                  context, 
                  MaterialPageRoute(builder: (context) => const LandingPelakuUsahaPage())
                );
              }
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
        ],
      ),
    );
  }
}