import 'package:flutter/material.dart';
import 'package:si_solo/drawer_non_admin.dart';

class LandingAdminPage extends StatefulWidget {
  const LandingAdminPage({super.key});

  @override
  State<LandingAdminPage> createState() => _LandingAdminPage();
}

class _LandingAdminPage extends State<LandingAdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Utama Admin'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                child: Text('Login', style: TextStyle(fontSize: 15.0, color: Colors.white),),  
                style: ButtonStyle(
                  // foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {},
              )
            )
          ],
        ),
      )
    );
  }
}
