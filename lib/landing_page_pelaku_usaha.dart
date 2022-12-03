import 'package:flutter/material.dart';
import 'package:si_solo/drawer_pelaku_usaha.dart';

class LandingPelakuUsahaPage extends StatefulWidget {
  const LandingPelakuUsahaPage({super.key});

  @override
  State<LandingPelakuUsahaPage> createState() => _LandingPelakuUsahaPage();
}

class _LandingPelakuUsahaPage extends State<LandingPelakuUsahaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Utama'),
      ),
      drawer: buildDrawer(context),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Text("hai")
      )
    );
  }
}
