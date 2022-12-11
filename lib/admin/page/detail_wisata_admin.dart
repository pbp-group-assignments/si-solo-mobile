import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:si_solo/info_wisata/model/show_tempat_wisata.dart';
import '../../drawer_admin.dart';

class WisataAdminDetail  extends StatelessWidget {
  final TempatWisataModel wisataadmin;
  WisataAdminDetail ({super.key, required this.wisataadmin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Wisata"),
      ),
      drawer: buildDrawer(context),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
        padding: const EdgeInsets.all(5),
        child: Column(
            children: [
          Center(
              child: Text(
                wisataadmin.fields.tempatWisata.toString(),
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
                      "Nama Wisata: ${wisataadmin.fields.namaWisata}",
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
                      "Harga Wisata: ${wisataadmin.fields.hargaWisata}",
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
                      "Deskripsi Wisata: ${wisataadmin.fields.deskripsiWisata}",
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