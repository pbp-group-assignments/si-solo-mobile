import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:si_solo/info_transportasi/model/transportation.dart';
import 'package:si_solo/info_transportasi/model/route.dart' as routemodel;
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
      List<Object> routes = data[index][1] as List<Object>;
      List<Widget> routeWidgets = buildRoutes(routes);

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
        elevation: 3,
        margin: const EdgeInsets.all(5),
        shape: Border.all(
          color: borderColor
        ),
        child: Column(
          children: [
            Image.asset('assets/images/$image'),
            Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    transportation.fields.name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    transportation.fields.description,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Rute:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    child: Column(children: routeWidgets),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  List<Widget> buildRoutes(List<Object> data) {
    Color borderColor = Colors.lightBlueAccent;
    List<Widget> listWidgets = [];

    for (int j = 0; j < data.length; j++) {
      List<Object> list = data[j] as List<Object>;
      routemodel.Route route = list[0] as routemodel.Route;
      List<StopPoint> stopPoints = list[1] as List<StopPoint>;
      String strStops = "";

      for (int i = 0; i < stopPoints.length; i++) {
        strStops += "${stopPoints[i].fields.stopName} - ";
        if (i == stopPoints.length - 1) {
          strStops = strStops.substring(0, strStops.length - 3);
        }
      }

      listWidgets.add(
        Card(
          margin: const EdgeInsets.all(5),
          shape: Border.all(
            color: borderColor
          ),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                Text(
                  route.fields.fromTo,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(
                  height: 10,
                  thickness: 1,
                  indent: 5,
                  endIndent: 5,
                  color: Colors.grey,
                ),
                Text(strStops),
              ]
            ),
          )
        )
      );
    }

    return listWidgets;
  }
  
  @override
  void initState() {
    super.initState();
    transportationData = fetchTransportation();
  }

  @override
  Widget build(BuildContext context) {
    Widget drawer = const DrawerTransportRegular();

    if (UserLogin.listUserLogin.isNotEmpty && UserLogin.listUserLogin[0].role == 'Admin') {
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