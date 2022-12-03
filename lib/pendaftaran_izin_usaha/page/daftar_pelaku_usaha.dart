import 'package:flutter/material.dart';
import 'package:si_solo/drawer_pelaku_usaha.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:si_solo/pendaftaran_izin_usaha/util/fetch_status_pelaku_usaha.dart';
import 'package:si_solo/main-page/model/user.dart';
import 'package:si_solo/pendaftaran_izin_usaha/page/list_pendaftaran_usaha_pengguna.dart';
import 'package:si_solo/pendaftaran_izin_usaha/util/fetch_pelaku_usaha.dart';

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
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                "Pendaftaran Pelaku Usaha",
                style: TextStyle(fontSize: 30),
              ),

              const SizedBox(height: 10,),

              Text(
                "Harap baca peraturan untuk pelaku usaha dengan menekan tombol 'Peraturan' di bawah",
                style: TextStyle(fontSize: 15),
              ),

              const SizedBox(height: 10,),

              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: StadiumBorder(),
                  side: BorderSide(
                    width: 2,
                    color: Colors.blue
                  ),
                ),
                child: Text('Peraturan', style: TextStyle(fontSize: 15, color: Colors.black),),
                onPressed: () => showModalBottomSheet(
                  backgroundColor: Colors.cyan,
                  barrierColor: Colors.transparent,
                  context: context,
                  builder: (_){
                    return Container(
                      height: 350,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20)
                        )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Peraturan Untuk Pelaku Usaha",
                              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                            ),

                            const SizedBox(height: 30,),

                            Text(
                              "1. Mohon mengisi form pendaftaran di bawah dengan NIK Anda",
                              style: TextStyle(fontSize: 15),
                            ),

                            const SizedBox(height: 5,),

                            Text(
                              "2. Data NIK yang Anda masukkan di form pendaftaran di bawah akan dianggap valid dan dapat dipertanggungjawabkan",
                              style: TextStyle(fontSize: 15),
                            ),

                            const SizedBox(height: 5,),

                            Text(
                              "3. Dengan mengisi form pendaftaran di bawah, maka Anda setuju untuk menjaga nama baik Kota Solo melalui usaha Anda",
                              style: TextStyle(fontSize: 15),
                            ),

                            const SizedBox(height: 5,),

                            Text(
                              "4. Jika usaha Anda tertangkap melakukan pelanggaran yang merusak nama baik Kota Solo tercoreng, maka Anda bersedia untuk mencabut izin usaha Anda",
                              style: TextStyle(fontSize: 15),
                              textAlign: TextAlign.center,
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
                  icon: const Icon(Icons.assignment_ind),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
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

              Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  child: const Text("Daftar", style: TextStyle(color: Colors.white, fontSize: 15),),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: (){
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
                ),
              ),
            ]
          )
        ),
      )
    );
  }
}