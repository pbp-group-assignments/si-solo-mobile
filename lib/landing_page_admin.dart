import 'package:flutter/material.dart';
import 'package:si_solo/drawer_admin.dart';
import 'package:si_solo/admin/page/list_pendaftaran_pelaku_usaha.dart';
import 'package:si_solo/admin/page/list_pendaftaran_usaha.dart';

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
        title: Text('Halaman Utama'),
      ),
      drawer: buildDrawer(context),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Align(
              child: Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),

                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 7),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              "Pendaftaran Pelaku Usaha",
                              style: TextStyle(fontSize: 25),
                              textAlign: TextAlign.center,
                            ),

                            onTap: () {
                              Navigator.pushReplacement(
                                context, 
                                MaterialPageRoute(builder: (context) => const ListPendaftaranPelakuUsahaPage())
                              );
                            },
                          ),
                          const SizedBox(height: 10,),
                          ListTile(
                            title: Text(
                              "Pendaftaran Usaha",
                              style: TextStyle(fontSize: 25),
                              textAlign: TextAlign.center,
                            ),

                            onTap: () {
                              Navigator.pushReplacement(
                                context, 
                                MaterialPageRoute(builder: (context) => const ListPendaftaranUsahaPage())
                              );
                            },
                          ),
                        ],
                      )
                      
                    )
                  ),
                ],
              )
            )
          ],
        ),
      )
    );
  }
}
