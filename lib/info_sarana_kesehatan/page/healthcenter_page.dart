import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:si_solo/info_sarana_kesehatan/model/healthcenter.dart';
import 'package:si_solo/info_sarana_kesehatan/util/drawer_healthcenter_admin.dart';
import 'package:si_solo/info_sarana_kesehatan/util/drawer_healthcenter_regular.dart';
import 'package:si_solo/info_sarana_kesehatan/util/fetch_healthcenter.dart';
import 'package:si_solo/main-page/model/user.dart';

class HealthCenterPage extends StatefulWidget {
  const HealthCenterPage({Key? key}) : super(key: key);

  @override
  HealthCenterPageState createState() => HealthCenterPageState();
}

class HealthCenterPageState extends State<HealthCenterPage> {
  late Future<List<HealthCenter>> healthCenterData;

  Widget loadWidget(List<HealthCenter> data) {
    return ListView.builder(itemCount: data.length, itemBuilder: (context, index) {
      Color borderColor = const Color.fromARGB(255, 200, 75, 204);
      String image = 'info-sarana-kesehatan-adminpage.jpg';
      HealthCenter healthCenter = data[index];
      String address = healthCenter.fields.address;
      String contact = healthCenter.fields.contact;
      String locationURL = healthCenter.fields.locationUrl;

      if (healthCenter.fields.name.contains("Hermina")) {
        image = 'rs_hermina_solo.jpg';
      } else if (healthCenter.fields.name.contains("JIH")) {
        image = 'rs_jih_solo.jpg';
      } else if (healthCenter.fields.name.contains("Kasih Ibu")) {
        image = 'rs_kasih_ibu.jpeg';
      } else if (healthCenter.fields.name.contains("Muhammadiyah")) {
        image = 'rs_pku_muhammadiyah.jpg';
      } else if (healthCenter.fields.name.contains("Sebelas Maret")) {
        image = 'rs_univ_sebelas_maret.jpg';
      } else if (healthCenter.fields.name.contains("Moewardi")) {
        image = 'rsud_dr_moewardi.jpg';
      } else if (healthCenter.fields.name.contains("RSUP")) {
        image = 'rsup_surakarta.jpg';
      }

      return Card(
        elevation: 0,
        margin: const EdgeInsets.all(5),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: borderColor,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          children: [
            Image.asset('assets/images/$image'),
            Text(
              healthCenter.fields.name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              )
            ),
            Text('Alamat: $address'),
            Text('Kontak: $contact'),
            Text('Lihat lokasi sarana kesehatan disini: $locationURL'),
          ],
        ),
      );
    });
  }
  
  @override
  void initState() {
    super.initState();
    healthCenterData = fetchHealthCenter();
  }

  @override
  Widget build(BuildContext context) {
    Widget drawer = const DrawerHealthCenterRegular();

    if (UserLogin.listUserLogin[0].role == 'Admin') {
      drawer = const DrawerHealthCenterAdmin();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Info Sarana Kesehatan'),
      ),
      drawer: drawer,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: FutureBuilder(
            future: healthCenterData,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              }
              else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Tidak ada sarana kesehatan :(",
                        style: TextStyle(
                          color: Color(0xff59A5D8),
                          fontSize: 20
                        ),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                }
                else {
                  return loadWidget(snapshot.data!);
                }
              }
            }
          ),
        ),
      )
    );
  }
}