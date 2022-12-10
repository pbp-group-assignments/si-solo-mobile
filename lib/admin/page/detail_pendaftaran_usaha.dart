import 'package:flutter/material.dart';
import 'package:si_solo/admin/util/fetch_pendaftaran_usaha.dart';
import 'package:si_solo/drawer_admin.dart';
import 'package:si_solo/pendaftaran_izin_usaha/model/usaha.dart';
import 'package:si_solo/admin/page/list_pendaftaran_usaha.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getwidget/getwidget.dart';
import 'package:si_solo/admin/page/form_tolak_pendaftaran_usaha.dart';
import 'package:si_solo/admin/page/form_nomor_izin_usaha.dart';

class DetailPendaftaranUsaha extends StatelessWidget{
  final Usaha usaha;
  const DetailPendaftaranUsaha({super.key, required this.usaha});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Usaha'),
      ),
      drawer: buildDrawer(context),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(children: [
          Center(
            child: Text(
              usaha.namaUsaha,
              style: GoogleFonts.lato(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              textAlign: TextAlign.center,
            )
          ),
          const SizedBox(height: 10,),

          Column(
            children: (usaha.statusPendaftaran == 'Diajukan')?
            [
              const SizedBox(height: 10,),
              Row(
                  children: [
                    Flexible(
                      child: Text(
                        "Nama Pemilik Usaha: ${usaha.namaPemilik}",
                        style: GoogleFonts.lato(
                          // textStyle: Theme.of(context).textTheme.headline3,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),

              const SizedBox(height: 10,),

              Row(
                  children: [
                    Flexible(
                      child: Text(
                        "Nomor Telepon Pemilik Usaha: ${usaha.nomorTeleponPemilik}",
                        style: GoogleFonts.lato(
                          // textStyle: Theme.of(context).textTheme.headline3,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),

              const SizedBox(height: 10,),

              Row(
                  children: [
                    Flexible(
                      child: Text(
                        "Alamat Pemilik Usaha: ${usaha.alamatPemilik}",
                        style: GoogleFonts.lato(
                          // textStyle: Theme.of(context).textTheme.headline3,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),

              const SizedBox(height: 10,),

              Row(
                  children: [
                    Flexible(
                      child: Text(
                        "Jenis Usaha: ${usaha.jenisUsaha}",
                        style: GoogleFonts.lato(
                          // textStyle: Theme.of(context).textTheme.headline3,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),

              const SizedBox(height: 10,),

              Row(
                  children: [
                    Flexible(
                      child: Text(
                        "Alamat Usaha: ${usaha.alamatUsaha}",
                        style: GoogleFonts.lato(
                          // textStyle: Theme.of(context).textTheme.headline3,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),

              const SizedBox(height: 10,),

              Row(
                  children: [
                    Flexible(
                      child: Text(
                        "Nomor Telepon Usaha: ${usaha.nomorTeleponUsaha}",
                        style: GoogleFonts.lato(
                          // textStyle: Theme.of(context).textTheme.headline3,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),

              const SizedBox(height: 10,),

              Row(
                  children: [
                    Flexible(
                      child: Text(
                        "Status Pendaftaran: ${usaha.statusPendaftaran}",
                        style: GoogleFonts.lato(
                          // textStyle: Theme.of(context).textTheme.headline3,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),

              const SizedBox(height: 20,),

              GFButton(
                      text: "Proses",
                      color: Colors.green,
                      shape: GFButtonShape.pills,
                      size: GFSize.LARGE,
                      onPressed: () {
                        pendaftaranDiproses(usaha.namaPemilik, usaha.nomorTeleponPemilik, usaha.alamatPemilik, usaha.namaUsaha, usaha.jenisUsaha, usaha.alamatUsaha, usaha.nomorTeleponUsaha);
                        Future.delayed(Duration(milliseconds: 1000)).then((_){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ListPendaftaranUsahaPage(index: 0,)));
                        });
                      },
                    ),
            ]:[
              Column(
                children: (usaha.statusPendaftaran == 'Diproses')?
                [const SizedBox(height: 10,),
              Row(
                  children: [
                    Flexible(
                      child: Text(
                        "Nama Pemilik Usaha: ${usaha.namaPemilik}",
                        style: GoogleFonts.lato(
                          // textStyle: Theme.of(context).textTheme.headline3,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),

              const SizedBox(height: 10,),

              Row(
                  children: [
                    Flexible(
                      child: Text(
                        "Nomor Telepon Pemilik Usaha: ${usaha.nomorTeleponPemilik}",
                        style: GoogleFonts.lato(
                          // textStyle: Theme.of(context).textTheme.headline3,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),

              const SizedBox(height: 10,),

              Row(
                  children: [
                    Flexible(
                      child: Text(
                        "Alamat Pemilik Usaha: ${usaha.alamatPemilik}",
                        style: GoogleFonts.lato(
                          // textStyle: Theme.of(context).textTheme.headline3,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),

              const SizedBox(height: 10,),

              Row(
                  children: [
                    Flexible(
                      child: Text(
                        "Jenis Usaha: ${usaha.jenisUsaha}",
                        style: GoogleFonts.lato(
                          // textStyle: Theme.of(context).textTheme.headline3,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),

              const SizedBox(height: 10,),

              Row(
                  children: [
                    Flexible(
                      child: Text(
                        "Alamat Usaha: ${usaha.alamatUsaha}",
                        style: GoogleFonts.lato(
                          // textStyle: Theme.of(context).textTheme.headline3,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),

              const SizedBox(height: 10,),

              Row(
                  children: [
                    Flexible(
                      child: Text(
                        "Nomor Telepon Usaha: ${usaha.nomorTeleponUsaha}",
                        style: GoogleFonts.lato(
                          // textStyle: Theme.of(context).textTheme.headline3,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),

              const SizedBox(height: 10,),

              Row(
                  children: [
                    Flexible(
                      child: Text(
                        "Status Pendaftaran: ${usaha.statusPendaftaran}",
                        style: GoogleFonts.lato(
                          // textStyle: Theme.of(context).textTheme.headline3,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),

              const SizedBox(height: 20,),

              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GFButton(
                      text: "Setujui",
                      color: Colors.green,
                      shape: GFButtonShape.pills,
                      size: GFSize.LARGE,
                      onPressed: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FormNomorIzinUsahaPage(usaha: usaha,)));
                      }
                    ),

                    const SizedBox(width: 10,),

                    GFButton(
                      text: "Tolak",
                      color: Colors.red,
                      shape: GFButtonShape.pills,
                      size: GFSize.LARGE,
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FormTolakPendaftaranUsahaPage(usaha: usaha,)));
                      }
                    ),
                  ]
                ),
              ]:[
              Column(
                children: (usaha.statusPendaftaran == 'Diterima')?
                [
                  const SizedBox(height: 10,),
              Row(
                  children: [
                    Flexible(
                      child: Text(
                        "Nama Pemilik Usaha: ${usaha.namaPemilik}",
                        style: GoogleFonts.lato(
                          // textStyle: Theme.of(context).textTheme.headline3,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),

              const SizedBox(height: 10,),

              Row(
                  children: [
                    Flexible(
                      child: Text(
                        "Nomor Telepon Pemilik Usaha: ${usaha.nomorTeleponPemilik}",
                        style: GoogleFonts.lato(
                          // textStyle: Theme.of(context).textTheme.headline3,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),

              const SizedBox(height: 10,),

              Row(
                  children: [
                    Flexible(
                      child: Text(
                        "Alamat Pemilik Usaha: ${usaha.alamatPemilik}",
                        style: GoogleFonts.lato(
                          // textStyle: Theme.of(context).textTheme.headline3,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),

              const SizedBox(height: 10,),

              Row(
                  children: [
                    Flexible(
                      child: Text(
                        "Jenis Usaha: ${usaha.jenisUsaha}",
                        style: GoogleFonts.lato(
                          // textStyle: Theme.of(context).textTheme.headline3,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),

              const SizedBox(height: 10,),

              Row(
                  children: [
                    Flexible(
                      child: Text(
                        "Alamat Usaha: ${usaha.alamatUsaha}",
                        style: GoogleFonts.lato(
                          // textStyle: Theme.of(context).textTheme.headline3,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),

              const SizedBox(height: 10,),

              Row(
                  children: [
                    Flexible(
                      child: Text(
                        "Nomor Telepon Usaha: ${usaha.nomorTeleponUsaha}",
                        style: GoogleFonts.lato(
                          // textStyle: Theme.of(context).textTheme.headline3,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),

              const SizedBox(height: 10,),

              Row(
                  children: [
                    Flexible(
                      child: Text(
                        "Status Pendaftaran: ${usaha.statusPendaftaran}",
                        style: GoogleFonts.lato(
                          // textStyle: Theme.of(context).textTheme.headline3,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),

              const SizedBox(height: 10,),

              Row(
                  children: [
                    Flexible(
                      child: Text(
                        "Nomor Izin Usaha: ${usaha.nomorIzinUsaha}",
                        style: GoogleFonts.lato(
                          // textStyle: Theme.of(context).textTheme.headline3,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
                ]:[
                  const SizedBox(height: 10,),
              Row(
                  children: [
                    Flexible(
                      child: Text(
                        "Nama Pemilik Usaha: ${usaha.namaPemilik}",
                        style: GoogleFonts.lato(
                          // textStyle: Theme.of(context).textTheme.headline3,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),

              const SizedBox(height: 10,),

              Row(
                  children: [
                    Flexible(
                      child: Text(
                        "Nomor Telepon Pemilik Usaha: ${usaha.nomorTeleponPemilik}",
                        style: GoogleFonts.lato(
                          // textStyle: Theme.of(context).textTheme.headline3,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),

              const SizedBox(height: 10,),

              Row(
                  children: [
                    Flexible(
                      child: Text(
                        "Alamat Pemilik Usaha: ${usaha.alamatPemilik}",
                        style: GoogleFonts.lato(
                          // textStyle: Theme.of(context).textTheme.headline3,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),

              const SizedBox(height: 10,),

              Row(
                  children: [
                    Flexible(
                      child: Text(
                        "Jenis Usaha: ${usaha.jenisUsaha}",
                        style: GoogleFonts.lato(
                          // textStyle: Theme.of(context).textTheme.headline3,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),

              const SizedBox(height: 10,),

              Row(
                  children: [
                    Flexible(
                      child: Text(
                        "Alamat Usaha: ${usaha.alamatUsaha}",
                        style: GoogleFonts.lato(
                          // textStyle: Theme.of(context).textTheme.headline3,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),

              const SizedBox(height: 10,),

              Row(
                  children: [
                    Flexible(
                      child: Text(
                        "Nomor Telepon Usaha: ${usaha.nomorTeleponUsaha}",
                        style: GoogleFonts.lato(
                          // textStyle: Theme.of(context).textTheme.headline3,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),

              const SizedBox(height: 10,),

              Row(
                  children: [
                    Flexible(
                      child: Text(
                        "Status Pendaftaran: ${usaha.statusPendaftaran}",
                        style: GoogleFonts.lato(
                          // textStyle: Theme.of(context).textTheme.headline3,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),

              const SizedBox(height: 10,),

              Row(
                  children: [
                    Flexible(
                      child: Text(
                        "Alasan Pendaftaran Ditolak: ${usaha.alasanDitolak}",
                        style: GoogleFonts.lato(
                          // textStyle: Theme.of(context).textTheme.headline3,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
                ],
              )
            ]
                ,
              )
            ]
            ,
          ),

          const Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ListPendaftaranUsahaPage(index: 0,)));
              },

              child: const Text(
                "Back",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}