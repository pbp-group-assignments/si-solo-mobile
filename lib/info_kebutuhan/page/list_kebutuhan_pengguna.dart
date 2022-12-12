import 'package:flutter/material.dart';
// import 'package:si_solo/drawer_admin.dart';
import 'package:flutter/material.dart';
import 'package:si_solo/drawer_pengguna.dart';
import 'package:si_solo/info_kebutuhan/page/detail_kebutuhan_pengguna.dart';
import 'package:si_solo/info_kebutuhan/utils/fetch_kebutuhan_pelaku.dart';


class InfoKebutuhanPenggunaPage extends StatefulWidget {
  const InfoKebutuhanPenggunaPage({super.key});

  @override
  State<InfoKebutuhanPenggunaPage> createState() => _InfoKebutuhanPenggunaState();
}

class _InfoKebutuhanPenggunaState extends State<InfoKebutuhanPenggunaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Info Kebutuhan Pokok'),
        ), // Menambahkan drawer menu
        drawer: buildDrawer(context),
        body: FutureBuilder(
            future: fetchKebutuhan(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Toko Kebutuhan tidak ada",
                        style:
                        TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => KebutuhanPenggunaDetail(
                                  kebutuhanpengguna: snapshot.data![index])),
                        ),
                        child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black, blurRadius: 2.0)
                                ],
                                border: Border.all(color: Colors.black)),
                            child: Row(
                              children: [
                                Text(
                                  "${snapshot.data![index].fields.title}",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Flexible(
                                    fit: FlexFit.tight, child: SizedBox()),
                              ],
                            )),
                      ));
                }
              }
            }));
  }
}