import 'package:flutter/material.dart';
import 'package:si_solo/drawer_pelaku_usaha.dart';
import 'package:si_solo/pendaftaran_izin_usaha/util/fetch_pelaku_usaha.dart';
import 'package:si_solo/pendaftaran_izin_usaha/util/fetch_status_pelaku_usaha.dart';
import 'package:si_solo/main-page/model/user.dart';
import 'package:si_solo/pendaftaran_izin_usaha/util/fetch_usaha.dart';
import 'package:si_solo/pendaftaran_izin_usaha/page/detail_pendaftaran_usaha.dart';

class ListPendaftaranUsahaPelakuUsahaPage extends StatefulWidget{
  const ListPendaftaranUsahaPelakuUsahaPage({super.key});

  State<ListPendaftaranUsahaPelakuUsahaPage> createState() => _ListPendaftaranUsahaPelakuUsahaPage();
}

class _ListPendaftaranUsahaPelakuUsahaPage extends State<ListPendaftaranUsahaPelakuUsahaPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Pendaftaran Usaha'),
      ),
      drawer: buildDrawer(context),
      
      body: FutureBuilder(
        future: fetchStatusPelakuyUsaha(UserLogin.listUserLogin[0].role, UserLogin.listUserLogin[0].namaLengkap, UserLogin.listUserLogin[0].nomorTeleponPemilik, UserLogin.listUserLogin[0].alamatPemilik),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          }else{
                return FutureBuilder(
                  future: fetchUsaha(UserLogin.listUserLogin[0].role, UserLogin.listUserLogin[0].namaLengkap, UserLogin.listUserLogin[0].nomorTeleponPemilik, UserLogin.listUserLogin[0].alamatPemilik),
                  builder: (context, AsyncSnapshot snapshot2){
                    if (snapshot2.data == null) {
                      return const Center(child: CircularProgressIndicator());
                    }else{
                      if (!snapshot2.hasData) {
                        return Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: TextButton(
                                  child: const Text("Login", style: TextStyle(color: Colors.white),),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                                  ),
                                  onPressed: (){

                                  },
                                ),
                              ),
                              const SizedBox(height: 30,),
                              Text(
                                "Belum ada usaha yang didaftarkan",
                                style: TextStyle(fontSize: 20),
                              ),
                            ]
                          ),
                        );
                      }else{
                        return ListView.builder(
                          itemCount: snapshot2.data!.length,
                          itemBuilder: (_, index) => Container(
                            margin: const EdgeInsets.all(8.0),

                            child: Column(
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(color: (snapshot2.data![index].statusPendaftaran == 'Diajukan')? Colors.black:((snapshot2.data![index].statusPendaftaran == 'Diproses')?Colors.yellow:((snapshot2.data![index].statusPendaftaran == 'Diterima')?Colors.blue:Colors.red)), width: 2,),
                                  ),

                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 7),
                                    child: ListTile(
                                      title: Text(
                                        "${snapshot2.data![index].namaUsaha}  ->  ${snapshot2.data![index].statusPendaftaran}",
                                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                                      ),

                                      onTap: (){
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                              DetailPendaftaranUsaha(
                                                usaha: snapshot2.data![index],
                                              )
                                          ),
                                        );
                                                  }
                                    ),
                                  ),
                                )
                              ],
                            )
                          )
                        );
                      }
                    }
                  },
                );
          }
        }
      )
    );
  }
}