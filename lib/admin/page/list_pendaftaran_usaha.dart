import 'package:flutter/material.dart';
import 'package:si_solo/admin/page/detail_pendaftaran_pelaku_usaha.dart';
import 'package:si_solo/drawer_admin.dart';
import 'package:si_solo/admin/util/fetch_pendaftaran_usaha.dart';

class ListPendaftaranUsahaPage extends StatefulWidget {
  const ListPendaftaranUsahaPage({super.key});

  @override
  State<ListPendaftaranUsahaPage> createState() => _ListPendaftaranUsahaPage();
}

class _ListPendaftaranUsahaPage extends State<ListPendaftaranUsahaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Pendaftaran Usaha'),
      ),
      drawer: buildDrawer(context),
      body: FutureBuilder(
        future: fetchSemuaUsaha(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          }else{
            if (!snapshot.hasData) {
              return Column(
                children: const [
                  Text(
                  "Belum ada pendaftaran usaha",
                  style: TextStyle(fontSize: 20),
                  ),
                ],
              );
            }else{
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),

                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: (snapshot.data![index].statusPendaftaran == 'Diajukan')? Colors.black:((snapshot.data![index].statusPendaftaran == 'Diproses')?Colors.yellow:((snapshot.data![index].statusPendaftaran == 'Diterma')?Colors.blue:Colors.red)), width: 2,),
                    ),

                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 7),
                      child: ListTile(
                        title: Text(
                          "${snapshot.data![index].namaPemilik}  -  ${snapshot.data![index].namaUsaha}",
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                        ),

                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                  DetailPendaftaranPelakuUsaha(
                                    pelakuUsaha: snapshot.data![index],
                                  )
                              ),
                            );
                        },
                      )
                    )
                  )
                )
              );
            }
          }
        },
      )
    );
  }
}
