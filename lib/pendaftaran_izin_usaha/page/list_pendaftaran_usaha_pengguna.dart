import 'package:flutter/material.dart';
import 'package:si_solo/drawer_pengguna.dart';
import 'package:si_solo/pendaftaran_izin_usaha/util/fetch_pelaku_usaha.dart';
import 'package:si_solo/pendaftaran_izin_usaha/util/fetch_status_pelaku_usaha.dart';
import 'package:si_solo/main-page/model/user.dart';
import 'package:si_solo/pendaftaran_izin_usaha/page/daftar_pelaku_usaha.dart';
import 'package:si_solo/pendaftaran_izin_usaha/page/list_pendaftaran_usaha_pelaku_usaha.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getwidget/getwidget.dart';

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
                    const SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "Anda belum terdaftar sebagai Pelaku Usaha, segera daftarkan diri Anda dengan menekan tombol 'Daftar' dibawah",
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.headline3,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    const SizedBox(height: 10,),

                    GFButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context, 
                          MaterialPageRoute(builder: (context) => const DaftarPelakuUsahaPage())
                        );
                      },
                      text: "Daftar",
                      icon: Icon(Icons.add_circle_outline),
                      size: GFSize.LARGE,
                      color: Colors.purpleAccent,
                      shape: GFButtonShape.pills,
                      blockButton: true,
                    )
                  ],
                ),
              );
            }else{
              if (snapshot.data![0].status == 'diproses'){
                return Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 15,),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          "Pendaftaran Anda Sedang Diproses, Mohon Tunggu",
                          style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.headline3,
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.black
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
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
                            Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "Mohon Maaf, Pendaftaran Anda Telah Kami Tolak.",
                              style: GoogleFonts.lato(
                                textStyle: Theme.of(context).textTheme.headline3,
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: Colors.black
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                            
                            const SizedBox(height: 5,),

                            Text(
                              "Alasan: ${snapshot.data![0].pesan}",
                              style: GoogleFonts.lato(
                                textStyle: Theme.of(context).textTheme.headline3,
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: Colors.black
                              ),
                              textAlign: TextAlign.center,
                            ),

                            const SizedBox(height: 15,),

                            GFButton(
                              text: "Daftar Lagi",
                              icon: Icon(Icons.remove_circle_outline),
                              size: GFSize.LARGE,
                              color: Colors.purpleAccent,
                              shape: GFButtonShape.pills,
                              blockButton: true,
                              onPressed: () {
                                daftarUlang(UserLogin.listUserLogin[0].role, UserLogin.listUserLogin[0].namaLengkap, UserLogin.listUserLogin[0].nomorTeleponPemilik, UserLogin.listUserLogin[0].alamatPemilik);

                                Future.delayed(Duration(milliseconds: 1500)).then((_){
                                  Navigator.pushReplacement(
                                    context, 
                                    MaterialPageRoute(builder: (context) => const DaftarPelakuUsahaPage())
                                  );
                                });
                              },
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
                            const SizedBox(height: 15,),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "Selamat, pendaftaran Anda telah kami terima!",
                                style: GoogleFonts.lato(
                                  textStyle: Theme.of(context).textTheme.headline3,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            
                            const SizedBox(height: 10,),

                            Text(
                              "Silahkan tekan tombol 'Lanjutkan' untuk mulai mendaftarkan usaha Anda",
                              style: GoogleFonts.lato(
                                  textStyle: Theme.of(context).textTheme.headline3,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black
                                ),
                                textAlign: TextAlign.center,
                            ),

                            const SizedBox(height: 15,),

                            GFButton(
                              text: "Lanjutkan",
                              size: GFSize.LARGE,
                              color: Colors.purpleAccent,
                              shape: GFButtonShape.pills,
                              blockButton: true,
                              onPressed: (){
                                Navigator.pushReplacement(
                                  context, 
                                  MaterialPageRoute(builder: (context) => const ListPendaftaranUsahaPelakuUsahaPage(index: 0,))
                                );
                              },
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