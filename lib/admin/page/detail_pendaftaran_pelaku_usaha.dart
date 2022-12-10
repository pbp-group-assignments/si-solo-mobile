import 'package:flutter/material.dart';
import 'package:si_solo/admin/util/fetch_pendaftaran_pelaku_usaha.dart';
import 'package:si_solo/drawer_admin.dart';
import 'package:si_solo/pendaftaran_izin_usaha/model/pelaku_usaha.dart';
import 'package:si_solo/admin/page/list_pendaftaran_pelaku_usaha.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getwidget/getwidget.dart';
import 'package:si_solo/admin/page/form_tolak_pendaftaran_pelaku_usaha.dart';

class DetailPendaftaranPelakuUsaha extends StatelessWidget{
  final PelakuUsaha pelakuUsaha;
  const DetailPendaftaranPelakuUsaha({super.key, required this.pelakuUsaha});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Pendaftar'),
      ),
      drawer: buildDrawer(context),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Center(
            child: Text(
              pelakuUsaha.namaPemilik,
              style: GoogleFonts.lato(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              textAlign: TextAlign.center,
            )
          ),

            const SizedBox(height: 20,),
            
            Column(
              children: (pelakuUsaha.status == "Ditolak")?
              [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        "Nomor Telepon Pendaftar: ${pelakuUsaha.nomorTeleponPemilik}",
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
                        "Alamat Pendaftar: ${pelakuUsaha.alamatPemilik}",
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
                        "NIK Pendaftar: ${pelakuUsaha.nik}",
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
                        "Status Pendaftaran: ${pelakuUsaha.status}",
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
                        "Alasan Ditolak: ${pelakuUsaha.pesan}",
                        style: GoogleFonts.lato(
                          // textStyle: Theme.of(context).textTheme.headline3,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
              ]:
              [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        "Nomor Telepon Pendaftar: ${pelakuUsaha.nomorTeleponPemilik}",
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
                        "Alamat Pendaftar: ${pelakuUsaha.alamatPemilik}",
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
                        "NIK Pendaftar: ${pelakuUsaha.nik}",
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
                        "Status Pendaftaran: ${pelakuUsaha.status}",
                        style: GoogleFonts.lato(
                          // textStyle: Theme.of(context).textTheme.headline3,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
              ]
            ),

            Column(
              children: (pelakuUsaha.status == "Diproses")?
              [
                const SizedBox(height: 30,),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GFButton(
                      text: "Setujui",
                      color: Colors.green,
                      shape: GFButtonShape.pills,
                      size: GFSize.LARGE,
                      onPressed: () {
                        pendaftaranDisetujui(pelakuUsaha.namaPemilik, pelakuUsaha.nomorTeleponPemilik, pelakuUsaha.alamatPemilik, pelakuUsaha.nik);
                        Future.delayed(Duration(milliseconds: 1000)).then((_){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ListPendaftaranPelakuUsahaPage(index: 0,)));
                        });
                      },
                    ),

                    const SizedBox(width: 10,),

                    GFButton(
                      text: "Tolak",
                      color: Colors.red,
                      shape: GFButtonShape.pills,
                      size: GFSize.LARGE,
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FormTolakPendaftaranPelakuUsahaPage(pelakuUsaha: pelakuUsaha,)));
                      }
                    ),
                  ]
                ),
              ]:[],
            ),

            const Spacer(),

            GFButton(
            text: "Back",
            color: Colors.purpleAccent,
            shape: GFButtonShape.pills,
            fullWidthButton: true,
            size: GFSize.LARGE,
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ListPendaftaranPelakuUsahaPage(index: 0,)));
            },
          )
          ],
        )
      )
    );
  }
}