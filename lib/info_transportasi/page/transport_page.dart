import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:si_solo/info_transportasi/model/transportation.dart';
import 'package:si_solo/info_transportasi/model/route.dart';
import 'package:si_solo/info_transportasi/model/stop_point.dart';
import 'package:si_solo/info_transportasi/util/drawer_transport_regular.dart';
import 'package:si_solo/info_transportasi/util/fetch_transportation.dart';
import 'package:si_solo/info_transportasi/util/drawer_transport_admin.dart';
import 'package:si_solo/info_transportasi/util/drawer_transport_regular.dart';
import 'package:si_solo/main-page/model/user.dart';

class TransportPage extends StatefulWidget {
  const TransportPage({Key? key}) : super(key: key);

  @override
  TransportPageState createState() => TransportPageState();
}

class TransportPageState extends State<TransportPage> {
  late Future<List<Object>> transportationData;

  Widget loadWidget(List<List<Object>> data) {
    return ListView.builder(itemCount: data.length, itemBuilder: (context, index) {
      Color borderColor = const Color.fromARGB(255, 200, 75, 204);
      String image = '';
      Transportation transportation = data[index][0] as Transportation;

      if (transportation.fields.name.contains("Bus Batik")) {
        image = 'bus_bst.jpg';
      } else if (transportation.fields.name.contains("Feeder")) {
        image = 'angkot_bst.jpg';
      } else if (transportation.fields.name.contains("Kresna")) {
        image = 'batara_kresna.jpg';
      } else if (transportation.fields.name.contains("Werkudara")) {
        image = 'bus_werkudara.jpg';
      } else if (transportation.fields.name.contains("Jaladara")) {
        image = 'jaladara.jpg';
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
              transportation.fields.name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              )
            ),
            const Text('Deskripsi:'),
            Text(transportation.fields.description)
          ],
        ),
      );
    });
  }
  
  @override
  void initState() {
    super.initState();
    transportationData = fetchTransportation();
  }

  @override
  Widget build(BuildContext context) {
    Widget drawer = const DrawerTransportRegular();

    if (UserLogin.listUserLogin[0].role == 'Admin') {
      drawer = const DrawerTransportAdmin();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Info Transportasi Umum'),
      ),
      drawer: drawer,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: FutureBuilder(
            future: transportationData,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              }
              else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Tidak ada transportasi :(",
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