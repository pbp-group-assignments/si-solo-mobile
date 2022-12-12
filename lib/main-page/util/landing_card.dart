import 'package:flutter/material.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:si_solo/pendaftaran_izin_usaha/page/daftar_pelaku_usaha.dart';
import '../../landing_page_pengguna.dart';
import 'package:si_solo/info_transportasi/page/transport_page.dart';
import 'package:si_solo/info_sarana_kesehatan/page/healthcenter_page.dart';

class MyCardItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width / 2 - 32,
              child: Card(
                elevation: 1,
                margin: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GFListTile(
                      avatar: GFAvatar(
                        size: MediaQuery.of(context).size.width / 4 - 32,
                        backgroundColor: Colors.white,
                        child: Image.asset('assets/images/landing/report.png'),
                      ),
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const LandingPenggunaPage()));
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(
                            "Layanan Pengaduan",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width / 9 - 32,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width / 2 - 32,
              child: Card(
                elevation: 1,
                margin: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GFListTile(
                      avatar: GFAvatar(
                        size: MediaQuery.of(context).size.width / 4 - 32,
                        backgroundColor: Colors.white,
                        child:
                            Image.asset('assets/images/landing/suggestion.png'),
                      ),
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const LandingPenggunaPage()));
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(
                            "Forum Pemberian Saran",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width / 9 - 32,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width / 2 - 32,
              child: Card(
                elevation: 1,
                margin: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GFListTile(
                      avatar: GFAvatar(
                        size: MediaQuery.of(context).size.width / 4 - 32,
                        backgroundColor: Colors.white,
                        child: Image.asset('assets/images/landing/health.png'),
                      ),
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const HealthCenterPage()));
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(
                            "Sarana Kesehatan",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width / 9 - 32,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width / 2 - 32,
              child: Card(
                elevation: 1,
                margin: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GFListTile(
                      avatar: GFAvatar(
                        size: MediaQuery.of(context).size.width / 4 - 32,
                        backgroundColor: Colors.white,
                        child:
                            Image.asset('assets/images/landing/transport.png'),
                      ),
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const TransportPage()));
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(
                            "Transportasi Umum",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width / 9 - 32,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width / 2 - 32,
              child: Card(
                elevation: 1,
                margin: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GFListTile(
                      avatar: GFAvatar(
                        size: MediaQuery.of(context).size.width / 4 - 32,
                        backgroundColor: Colors.white,
                        child: Image.asset('assets/images/landing/food.png'),
                      ),
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const LandingPenggunaPage()));
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(
                            "Kuliner",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width / 9 - 32,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width / 2 - 32,
              child: Card(
                elevation: 1,
                margin: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GFListTile(
                      avatar: GFAvatar(
                        size: MediaQuery.of(context).size.width / 4 - 32,
                        backgroundColor: Colors.white,
                        child: Image.asset('assets/images/landing/wisata.png'),
                      ),
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const LandingPenggunaPage()));
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(
                            "Tempat Wisata",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width / 9 - 32,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width / 2 - 32,
              child: Card(
                elevation: 1,
                margin: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GFListTile(
                      avatar: GFAvatar(
                        size: MediaQuery.of(context).size.width / 4 - 32,
                        backgroundColor: Colors.white,
                        child:
                            Image.asset('assets/images/landing/produces.png'),
                      ),
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const LandingPenggunaPage()));
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(
                            "Jual Kebutuhan Pokok",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width / 9 - 32,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width / 2 - 32,
              child: Card(
                elevation: 1,
                margin: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GFListTile(
                      avatar: GFAvatar(
                        size: MediaQuery.of(context).size.width / 4 - 32,
                        backgroundColor: Colors.white,
                        child: Image.asset('assets/images/landing/shop.png'),
                      ),
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const DaftarPelakuUsahaPage()));
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(
                            "Izin Usaha",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width / 9 - 32,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
