import 'package:flutter/material.dart';
import 'package:si_solo/pendaftaran_izin_usaha/page/list_pendaftaran_usaha_pengguna.dart';
import 'package:si_solo/landing_page_pengguna.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

Drawer buildDrawer(BuildContext context) {
  return Drawer(
      child: Column(children: [
    ListTile(
        title: const Text('Halaman Utama'),
        onTap: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const LandingPenggunaPage()));
        }),
    ListTile(
        title: const Text('Pendaftaran Usaha'),
        onTap: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const ListPendaftaranUsahaPenggunaPage()));
        }),
  ]));
}
