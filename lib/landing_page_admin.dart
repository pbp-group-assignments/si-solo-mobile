import 'package:flutter/material.dart';
import 'package:si_solo/drawer_admin.dart';
import 'package:si_solo/admin/page/list_pendaftaran_pelaku_usaha.dart';
import 'package:si_solo/admin/page/list_pendaftaran_usaha.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:si_solo/main-page/model/user.dart';
import 'package:si_solo/main.dart';

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
                      side: BorderSide(
                        color: Colors.purpleAccent,
                        width: 2,
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 3, vertical: 7),
                      child: GFListTile(
                        avatar: GFAvatar(
                          child: Image.asset('assets/images/business_icon.png'),
                          backgroundColor: Colors.white,
                        ),
                        titleText: 'Pendaftaran Pelaku Usaha',
                        subTitleText:
                            'List pengguna yang mendaftar sebagai pelaku usaha',
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ListPendaftaranPelakuUsahaPage(
                                        index: 0,
                                      )));
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: Colors.purpleAccent,
                        width: 2,
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 3, vertical: 7),
                      child: GFListTile(
                        avatar: GFAvatar(
                          child: Image.asset('assets/images/umkm_icon.jpg'),
                          backgroundColor: Colors.white,
                        ),
                        titleText: 'Pendaftaran Usaha',
                        subTitleText: 'List usaha yang didaftarkan',
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ListPendaftaranUsahaPage(
                                        index: 0,
                                      )));
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 10,),

                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.purpleAccent, width: 2,),
                    ),

                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 7),
                      child: GFListTile(
                        avatar: GFAvatar(
                          child: Image.asset('assets/images/business_icon.png'),
                          backgroundColor: Colors.white,
                        ),
                        titleText: 'Pendaftaran Pelaku Usaha',
                        subTitleText: 'List pengguna yang mendaftar sebagai pelaku usaha',
                        onTap: () {
                          Navigator.pushReplacement(
                            context, 
                            MaterialPageRoute(builder: (context) => const ListPendaftaranPelakuUsahaPage(index: 0,))
                          child: Image.asset('assets/images/pengaduan_cover.jpg'),
                          backgroundColor: Colors.white,
                        ),
                        titleText: 'Layanan Pengaduan',
                        subTitleText: 'Lihat daftar pengaduan',
                        onTap: () {
                          Navigator.pushReplacement(
                            context, 
                            MaterialPageRoute(builder: (context) => const ListPengaduanPage(index: 0,))
                          );
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 10,),

                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.purpleAccent, width: 2,),
                    ),

                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 7),
                      child: GFListTile(
                        avatar: GFAvatar(
                          child: Image.asset('assets/images/umkm_icon.jpg'),
                          backgroundColor: Colors.white,
                        ),
                        titleText: 'Pendaftaran Usaha',
                        subTitleText: 'List usaha yang didaftarkan',
                        onTap: () {
                          Navigator.pushReplacement(
                            context, 
                            MaterialPageRoute(builder: (context) => const ListPendaftaranUsahaPage(index: 0,))
                          );
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 10,),

                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.purpleAccent, width: 2,),
                    ),

                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 7),
                      child: GFListTile(
                        avatar: GFAvatar(
                          child: Image.asset('assets/images/pengaduan_cover.jpg'),
                          backgroundColor: Colors.white,
                        ),
                        titleText: 'Layanan Pengaduan',
                        subTitleText: 'Lihat daftar pengaduan',
                        onTap: () {
                          Navigator.pushReplacement(
                            context, 
                            MaterialPageRoute(builder: (context) => const ListPengaduanPage(index: 0,))
                          );
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 10,),

                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.purpleAccent, width: 2,),
                    ),

                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 7),
                      child: GFListTile(
                        avatar: GFAvatar(
                          child: Image.asset('assets/images/saran_pembangunan_cover.jpg'),
                          backgroundColor: Colors.white,
                        ),
                        titleText: 'Saran Pembangunan Kota',
                        subTitleText: 'Lihat kritik dan saran yang diberikan warga',
                        onTap: () {
                          Navigator.pushReplacement(
                            context, 
                            MaterialPageRoute(builder: (context) => const ListKritikSaranPage(index: 0,))
                          );
                        },
                      ),
                    ),
                  ),
                ],
              )),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
            tooltip: 'Logout',
            label: const Text("Logout"),
            onPressed: () {
              UserLogin.listUserLogin.removeAt(0);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()));
            }));
  }
}
