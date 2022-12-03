import 'package:flutter/material.dart';
import 'package:si_solo/drawer_pengguna.dart';
import 'package:si_solo/pendaftaran_izin_usaha/util/fetch_pelaku_usaha.dart';
import 'package:si_solo/pendaftaran_izin_usaha/util/fetch_status_pelaku_usaha.dart';
import 'package:si_solo/main-page/model/user.dart';
import 'package:si_solo/pendaftaran_izin_usaha/util/fetch_usaha.dart';
import 'package:si_solo/pendaftaran_izin_usaha/page/daftar_pelaku_usaha.dart';
import 'package:si_solo/pendaftaran_izin_usaha/page/list_pendaftaran_usaha_pelaku_usaha.dart';

class ListPendaftaranUsahaPenggunaPage extends StatefulWidget{
  const ListPendaftaranUsahaPenggunaPage({super.key});

  State<ListPendaftaranUsahaPenggunaPage> createState() => _ListPendaftaranUsahaPenggunaPage();
}

class _ListPendaftaranUsahaPenggunaPage extends State<ListPendaftaranUsahaPenggunaPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pendaftaran Usaha'),
      ),
      drawer: buildDrawer(context),
      
      body: FutureBuilder(
        future: fetchStatusPelakuyUsaha(UserLogin.listUserLogin[0].role, UserLogin.listUserLogin[0].namaLengkap, UserLogin.listUserLogin[0].nomorTeleponPemilik, UserLogin.listUserLogin[0].alamatPemilik),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          }else{
            if (snapshot.data![0].message == 'belumDaftar'){
              return Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(
                        "Anda belum terdaftar sebagai Pelaku Usaha, segera daftarkan diri Anda dengan menekan tombol 'Daftar' dibawah",
                        style: TextStyle(fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    const SizedBox(height: 10,),

                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: StadiumBorder(),
                        side: BorderSide(
                          width: 2,
                          color: Colors.red
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context, 
                          MaterialPageRoute(builder: (context) => const DaftarPelakuUsahaPage())
                        );
                      },
                      child: Text('Daftar', style: TextStyle(fontSize: 22, color: Colors.black),),
                    ),
                  ],
                ),
              );
            }else{
              if (snapshot.data![0].status == 'diproses'){
                return Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Text(
                          "Pendaftaran Anda Sedang Diproses, Mohon Tunggu",
                          style: TextStyle(fontSize: 25),
                          textAlign: TextAlign.center,
                          ),
                      )
                    ],
                  ),
                );
              }else if (snapshot.data![0].status == 'ditolak'){
                return Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              "Mohon Maaf, Pendaftaran Anda Telah Kami Tolak.",
                              style: TextStyle(fontSize: 25),
                              textAlign: TextAlign.center,
                            ),
                            
                            const SizedBox(height: 5,),

                            Text(
                              "Alasan: ${snapshot.data![0].pesan}",
                              style: TextStyle(fontSize: 25),
                              textAlign: TextAlign.center,
                            ),

                            const SizedBox(height: 15,),

                            Align(
                              alignment: Alignment.bottomCenter,
                              child: TextButton(
                                child: const Text("Daftar Lagi", style: TextStyle(color: Colors.white, fontSize: 15),),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                                ),
                                onPressed: (){
                                  daftarUlang(UserLogin.listUserLogin[0].role, UserLogin.listUserLogin[0].namaLengkap, UserLogin.listUserLogin[0].nomorTeleponPemilik, UserLogin.listUserLogin[0].alamatPemilik);

                                  Future.delayed(Duration(milliseconds: 1500)).then((_){
                                    Navigator.pushReplacement(
                                      context, 
                                      MaterialPageRoute(builder: (context) => const ListPendaftaranUsahaPenggunaPage())
                                    );
                                  });
                                },
                              ),
                            ),
                          ],
                        )
                      )
                    ],
                  ),
                );
              }else{
                return Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              "Selamat, pendaftaran Anda telah kami terima!",
                              style: TextStyle(fontSize: 25),
                              textAlign: TextAlign.center,
                            ),
                            
                            const SizedBox(height: 5,),

                            Text(
                              "Silahkan tekan tombol 'Lanjutkan' untuk mulai mendaftarkan usaha Anda",
                              style: TextStyle(fontSize: 25),
                              textAlign: TextAlign.center,
                            ),

                            const SizedBox(height: 15,),

                            Align(
                              alignment: Alignment.bottomCenter,
                              child: TextButton(
                                child: const Text("Lanjutkan", style: TextStyle(color: Colors.white, fontSize: 15),),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                                ),
                                onPressed: (){
                                  Navigator.pushReplacement(
                                    context, 
                                    MaterialPageRoute(builder: (context) => const ListPendaftaranUsahaPelakuUsahaPage())
                                  );
                                },
                              ),
                            ),
                          ],
                        )
                      )
                    ],
                  ),
                );
              }
            }
          }
        }
      )
    );
  }
}