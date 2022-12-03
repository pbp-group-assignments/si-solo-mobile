import 'package:flutter/material.dart';
import 'package:si_solo/drawer_pengguna.dart';

class LandingPenggunaPage extends StatefulWidget {
  const LandingPenggunaPage({super.key});

  @override
  State<LandingPenggunaPage> createState() => _LandingPenggunaPage();
}

class _LandingPenggunaPage extends State<LandingPenggunaPage> {
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
