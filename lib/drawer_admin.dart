import 'package:flutter/material.dart';
import 'package:si_solo/landing_page_admin.dart';

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
      ]
    )
  );
}