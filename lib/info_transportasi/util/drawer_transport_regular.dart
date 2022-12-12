import 'package:flutter/material.dart';
import 'package:si_solo/main.dart';
import 'package:si_solo/main-page/model/user.dart';
import 'package:si_solo/landing_page_pelaku_usaha.dart';
import 'package:si_solo/landing_page_pengguna.dart';
import 'package:si_solo/info_transportasi/page/transport_page.dart';
import 'package:si_solo/info_transportasi/page/transport_edit.dart';

class DrawerTransportRegular extends StatelessWidget {
  const DrawerTransportRegular({Key? key,}) : super(key: key);

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
              if (UserLogin.listUserLogin.isNotEmpty && UserLogin.listUserLogin[0].role == 'Pengguna') {
                Navigator.pushReplacement(
                  context, 
                  MaterialPageRoute(builder: (context) => const LandingPenggunaPage())
                );
              }
              else if (UserLogin.listUserLogin.isNotEmpty && UserLogin.listUserLogin[0].role == 'Pelaku Usaha') {
                Navigator.pushReplacement(
                  context, 
                  MaterialPageRoute(builder: (context) => const LandingPelakuUsahaPage())
                );
              }
              else {
                Navigator.pushReplacement(
                  context, 
                  MaterialPageRoute(builder: (context) => const MyHomePage())
                );
              }
            },
          ),
          ListTile(
            title: const Text('Info Transportasi Umum'),
            onTap: () {
              // Route menu ke halaman my watchlist
              Navigator.pushReplacement(
                context, 
                MaterialPageRoute(builder: (context) => const TransportPage())
              );
            },
          ),
        ],
      ),
    );
  }
}