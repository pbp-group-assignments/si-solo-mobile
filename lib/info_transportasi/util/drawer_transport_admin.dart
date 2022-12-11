import 'package:flutter/material.dart';
import 'package:si_solo/main.dart';
import 'package:si_solo/main-page/model/user.dart';
import 'package:si_solo/landing_page_admin.dart';
import 'package:si_solo/info_transportasi/page/transport_page.dart';
import 'package:si_solo/info_transportasi/page/transport_edit.dart';

class DrawerTransportAdmin extends StatelessWidget {
  const DrawerTransportAdmin({Key? key,}) : super(key: key);

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
            title: const Text('Info Transportasi Umum'),
            onTap: () {
              // Route menu ke halaman my watchlist
              Navigator.pushReplacement(
                context, 
                MaterialPageRoute(builder: (context) => const TransportPage())
              );
            },
          ),
          ListTile(
            title: const Text('Tambah Transportasi'),
            onTap: () {
              // TODO: Route menu ke halaman form
            },
          ),
          ListTile(
            title: const Text('Tambah Rute'),
            onTap: () {
              // TODO: Route menu ke halaman form
            },
          ),
          ListTile(
            title: const Text('Tambah Titik Pemberhentian'),
            onTap: () {
              // TODO: Route menu ke halaman form
            },
          ),
          ListTile(
            title: const Text('Hapus Transportasi'),
            onTap: () {
              // TODO: Route menu ke halaman form
            },
          ),
        ],
      ),
    );
  }
}