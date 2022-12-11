import 'package:flutter/material.dart';
import 'package:si_solo/drawer_pelaku_usaha.dart';
import 'dart:ffi';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:http/http.dart';
import 'package:si_solo/main-page/model/user.dart';
import 'package:si_solo/edit_profile.dart';
import 'package:si_solo/main-page/page/login.dart';
import 'package:si_solo/main-page/util/landing_card.dart';
import 'package:si_solo/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class LandingPelakuUsahaPage extends StatefulWidget {
  const LandingPelakuUsahaPage({super.key});

  @override
  State<LandingPelakuUsahaPage> createState() => _LandingPelakuUsahaPage();
}

class _LandingPelakuUsahaPage extends State<LandingPelakuUsahaPage> {
  int _selectedIndex = 0;

  String _username = UserLogin.listUserLogin[0].username;
  String _name = UserLogin.listUserLogin[0].namaLengkap;
  String _phone = UserLogin.listUserLogin[0].nomorTeleponPemilik;
  String _address = UserLogin.listUserLogin[0].alamatPemilik;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = <Widget>[
      ListView(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 51, 51, 51),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: [
                Text(
                  "Welcome to SISolo, $_username!",
                  style: const TextStyle(fontSize: 30, color: Colors.white),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Things you need for all your Solo adventures",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: MyCardItem(),
          )
        ],
      ),
      ListView(
        children: <Widget>[
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text("Nomor Darurat",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Poltabes Solo", style: TextStyle(fontSize: 20)),
                    IconButton(
                      icon: const Icon(Icons.phone),
                      onPressed: () async {
                        const url = 'tel://0271271712600';
                        if (await canLaunchUrlString(url)) {
                          await launchUrlString(url);
                        } else {
                          throw "Could not launch $url";
                        }
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Ambulans SPGDT",
                        style: TextStyle(fontSize: 20)),
                    IconButton(
                      icon: const Icon(Icons.phone),
                      onPressed: () async {
                        const url = 'tel://119';
                        if (await canLaunchUrlString(url)) {
                          await launchUrlString(url);
                        } else {
                          throw "Could not launch $url";
                        }
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Pemadam Kebakaran",
                        style: TextStyle(fontSize: 20)),
                    IconButton(
                      icon: const Icon(Icons.phone),
                      onPressed: () async {
                        const url = 'tel://113';
                        if (await canLaunchUrlString(url)) {
                          await launchUrlString(url);
                        } else {
                          throw "Could not launch $url";
                        }
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Gangguan Listrik PLN",
                        style: TextStyle(fontSize: 20)),
                    IconButton(
                      icon: const Icon(Icons.phone),
                      onPressed: () async {
                        const url = 'tel://0271722091';
                        if (await canLaunchUrlString(url)) {
                          await launchUrlString(url);
                        } else {
                          throw "Could not launch $url";
                        }
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Stasium Solo Balapan",
                        style: TextStyle(fontSize: 20)),
                    IconButton(
                      icon: const Icon(Icons.phone),
                      onPressed: () async {
                        const url = 'tel://0271714039';
                        if (await canLaunchUrlString(url)) {
                          await launchUrlString(url);
                        } else {
                          throw "Could not launch $url";
                        }
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Terminal Tortonadi",
                        style: TextStyle(fontSize: 20)),
                    IconButton(
                      icon: const Icon(Icons.phone),
                      onPressed: () async {
                        const url = 'tel://0271738900';
                        if (await canLaunchUrlString(url)) {
                          await launchUrlString(url);
                        } else {
                          throw "Could not launch $url";
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
      ListView(
        children: <Widget>[
          Container(
            height: 250,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 209, 185, 237),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const <Widget>[
                    CircleAvatar(
                        backgroundColor: Colors.white70,
                        minRadius: 60.0,
                        child: Icon(
                          Icons.person,
                          size: 50,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$_name',
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        IconButton(
                          icon: new Icon(
                            Icons.edit,
                            size: 25,
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const EditFormPage()));
                          },
                        )
                      ],
                    ),
                    Text(
                      '@$_username',
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Column(
            children: <Widget>[
              ListTile(
                title: const Text(
                  'Nomor Telepon',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  _phone,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              const Divider(),
              ListTile(
                title: const Text(
                  'Alamat',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  _address,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  onPressed: () async {
                    UserLogin.listUserLogin.removeAt(0);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginFormPage()));
                  },
                  child: const Text("Logout"),
                ),
              )
            ],
          )
        ],
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Utama'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emergency),
            label: 'Emergency',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
      ),
      drawer: buildDrawer(context),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
    );
  }
}
