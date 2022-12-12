import 'package:flutter/material.dart';
import 'package:si_solo/drawer_admin.dart';
import 'package:si_solo/admin/util/fetch_list_pengaduan.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';

class ListPengaduanPage extends StatefulWidget {
  const ListPengaduanPage({super.key});

  @override
  State<ListPengaduanPage> createState() => _ListPengaduanPage();
}

class _ListPengaduanPage extends State<ListPengaduanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text("List Pengaduan"),
        ),
        drawer: buildDrawer(context),
        body: FutureBuilder(
            future: fetchPengaduan(),
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
                              child:
                                Card(
                                    child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 7),
                                        child: GFListTile(
                                            titleText: '${snapshot.data![index].masalah}',
                                            subTitleText: '${snapshot.data![index].deskripsiMasalah}',
                                        ),
                                    ),
                                )
                            )
                        );
                    }
                }
            }
        )
    );
  }
}