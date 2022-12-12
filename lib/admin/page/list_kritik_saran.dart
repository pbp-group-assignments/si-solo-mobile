import 'package:flutter/material.dart';
import 'package:si_solo/drawer_admin.dart';
import 'package:si_solo/admin/util/fetch_list_kritik_saran.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';

class ListKritikSaranPage extends StatefulWidget {
  const ListKritikSaranPage({super.key});

  @override
  State<ListKritikSaranPage> createState() => _ListKritikSaranPage();
}

class _ListKritikSaranPage extends State<InfoWisataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text("List Kritik Saran"),
        ),
        drawer: buildDrawer(context),
        body: FutureBuilder(
            future: fetchKritikSaran(),
            builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                } else {
                    if (!snapshot.hasData) {
                        return Column(
                            children: [
                            const Text("Belum ada pengaduan"),
                            const SizedBox(height: 20,),
                            ]
                        );
                    } else {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (_, index) => Container(
                                Card(
                                    child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 7),
                                        child: GFListTile(
                                            titleText: '${snapshot.data![index].nama}',
                                            subTitleText: '${snapshot.data![index].kritikSaran}',
                                        ),
                                    ),
                                )
                            )
                        )
                    }
                }
            }
        )
    )
  }
}