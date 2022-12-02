import 'package:flutter/material.dart';
import 'package:si_solo/drawer_non_admin.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:si_solo/pendaftaran_izin_usaha/util/fetch_pelaku_usaha.dart';

class DaftarPelakuUsahaPage extends StatefulWidget{
  const DaftarPelakuUsahaPage({super.key});

  State<DaftarPelakuUsahaPage> createState() => _DaftarPelakuUsahaPage();
}

class _DaftarPelakuUsahaPage extends State<DaftarPelakuUsahaPage>{
  Future future = fetchPelakuUsaha();
  // void main() {
  //   print(future.toString());
  // }
  // final response = await request.get('https://si-solo.up.railway.app/Admin/pendaftaran-pelaku-usaha-json');
  
  @override
  Widget build(BuildContext context) {
    // main();
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Pelaku Usaha'),
      ),
      drawer: buildDrawer(context),
      body: FutureBuilder(
        future: future,
        builder: (context, AsyncSnapshot snapshot){
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          }else{
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),

                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: snapshot.data![index].watched? Colors.blue:Colors.red, width: 2,),
                  ),

                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 7),
                    child: ListTile(
                      title: Text(
                        "${snapshot.data![index]}",
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                      ),
                    )
                  )
                )
              )
            );
          }
        }
      )
      // body
    );
  }
}