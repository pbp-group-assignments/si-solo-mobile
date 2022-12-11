import 'package:google_fonts/google_fonts.dart';
import 'package:si_solo/info_kuliner/model/show_tempat_kuliner.dart';
import 'package:si_solo/drawer_pengguna.dart';
import 'package:flutter/material.dart';

class KulinerPenggunaDetail  extends StatelessWidget {
  final TempatKulinerModel kulinerpengguna;
  KulinerPenggunaDetail ({super.key, required this.kulinerpengguna});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Kuliner"),
      ),
      drawer: buildDrawer(context),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
        padding: const EdgeInsets.all(5),
        child: Column(children: [
          Center(
              child: Text(
                kulinerpengguna.fields.tempatKuliner.toString(),
                style: GoogleFonts.lato(
                  // textStyle: Theme.of(context).textTheme.headline3,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              )
          ),
          const SizedBox(height: 10,), // add space
          Column(
            children: [
              Row(
                children: [
                  Flexible(
                    child: Text(
                      "Nama Menu: ${kulinerpengguna.fields.namaMenu}",
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
                      "Harga Menu: ${kulinerpengguna.fields.hargaMenu}",
                      style: GoogleFonts.lato(
                        // textStyle: Theme.of(context).textTheme.headline3,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 10,), // add space
              Row(
                children: [
                  Flexible(
                    child: Text(
                      "Deskripsi Menu: ${kulinerpengguna.fields.deskripsiMenu}",
                      style: GoogleFonts.lato(
                        // textStyle: Theme.of(context).textTheme.headline3,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 10,), // add space
            ],
          )
        ]),
      ),
      floatingActionButton: Container(
        padding: const EdgeInsets.only(left: 30),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              minimumSize: MaterialStateProperty.all(const Size.fromHeight(50)),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              "Back",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}