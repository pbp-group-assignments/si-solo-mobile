import 'package:flutter/material.dart';
import 'package:si_solo/drawer_pengguna.dart';
import 'package:si_solo/main-page/model/user.dart';
import 'package:si_solo/pendaftaran_izin_usaha/page/list_pendaftaran_usaha_pengguna.dart';
import 'package:si_solo/pendaftaran_izin_usaha/util/fetch_pelaku_usaha.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getwidget/getwidget.dart';

class DaftarPelakuUsahaPage extends StatefulWidget{
  const DaftarPelakuUsahaPage({super.key});

  State<DaftarPelakuUsahaPage> createState() => _DaftarPelakuUsahaPage();
}

class _DaftarPelakuUsahaPage extends State<DaftarPelakuUsahaPage>{
  final _formKey = GlobalKey<FormState>();
  final _clearNik = TextEditingController();
  int? _nik;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Pelaku Usaha'),
      ),
      drawer: buildDrawer(context),
      
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text(
                "Pendaftaran Pelaku Usaha",
                style: GoogleFonts.lato(
                  // textStyle: Theme.of(context).textTheme.headline3,
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 10,),

              Text(
                "Sebelum mendaftar, harap baca peraturan untuk pelaku usaha dengan menekan tombol 'Peraturan' di bawah",
                style: GoogleFonts.lato(
                  // textStyle: Theme.of(context).textTheme.headline3,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 10,),

              GFButton(
                text: "Peraturan",
                color: Colors.purpleAccent,
                shape: GFButtonShape.pills,
                size: GFSize.MEDIUM,
                onPressed: () => showModalBottomSheet(
                  backgroundColor: Colors.cyan.shade200,
                  barrierColor: Colors.transparent,
                  context: context,
                  builder: (_){
                    return Container(
                      height: 375,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20)
                        )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Peraturan Untuk Pelaku Usaha",
                              style: GoogleFonts.lato(
                                textStyle: Theme.of(context).textTheme.headline1,
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: Colors.black
                              ),
                            ),

                            const SizedBox(height: 25,),

                            Text(
                              "1. Mohon mengisi form pendaftaran di bawah dengan NIK Anda",
                              style: GoogleFonts.lato(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black
                              ),
                            ),

                            const SizedBox(height: 5,),

                            Text(
                              "2. Data NIK yang Anda masukkan di form pendaftaran di bawah akan dianggap valid dan dapat dipertanggungjawabkan",
                              style: GoogleFonts.lato(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black
                              ),
                            ),

                            const SizedBox(height: 5,),

                            Text(
                              "3. Dengan mengisi form pendaftaran di bawah, maka Anda setuju untuk menjaga nama baik Kota Solo melalui usaha Anda",
                              style: GoogleFonts.lato(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black
                              ),
                            ),

                            const SizedBox(height: 5,),

                            Text(
                              "4. Jika usaha Anda tertangkap melakukan pelanggaran yang merusak nama baik Kota Solo tercoreng, maka Anda bersedia untuk mencabut izin usaha Anda",
                              style: GoogleFonts.lato(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                )
              ),

              const SizedBox(height: 15,),

              TextFormField(
                decoration: InputDecoration(
                  hintText: "Contoh: 1234567891012",
                  labelText: "NIK",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Colors.black)
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Colors.black)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Colors.black)
                  ),
                ),
                controller: _clearNik,

                onChanged: (String? value){
                  setState(() {
                    _nik = int.tryParse(value!);
                  });
                },

                onSaved: (String? value){
                  setState(() {
                    _nik = int.tryParse(value!);
                  });
                },

                validator: (String? value){
                  if (value == null || value.isEmpty) {
                    return 'NIK tidak boleh kosong!';
                  }else if (_nik == null){
                    return 'NIK harus berupa angka!';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15,),

              GFButton(
                text: "Daftar",
                color: Colors.purpleAccent,
                shape: GFButtonShape.pills,
                blockButton: false,
                size: GFSize.LARGE,
                fullWidthButton: true,
                onPressed: () {
                  if (_formKey.currentState!.validate()){
                    daftarPelakuUsaha(UserLogin.listUserLogin[0].role, UserLogin.listUserLogin[0].namaLengkap, UserLogin.listUserLogin[0].nomorTeleponPemilik, UserLogin.listUserLogin[0].alamatPemilik, _nik);
                    _clearNik.clear();
                    setState(() {
                      _nik = null;
                    });

                    Future.delayed(Duration(milliseconds: 1500)).then((_){
                      Navigator.pushReplacement(
                        context, 
                        MaterialPageRoute(builder: (context) => const ListPendaftaranUsahaPenggunaPage())
                      );
                    });

                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text("Mohon isi data dengan lengkap & benar!"),
                        action: SnackBarAction(
                          label: 'Close',
                          textColor: Colors.white,
                          onPressed: (){
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          },
                        ),
                      )
                    );
                  }
                },
              )
            ]
          )
        ),
      )
    );
  }
}