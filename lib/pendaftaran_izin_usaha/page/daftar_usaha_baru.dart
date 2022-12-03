import 'package:flutter/material.dart';
import 'package:si_solo/drawer_pelaku_usaha.dart';
import 'package:si_solo/pendaftaran_izin_usaha/util/fetch_usaha.dart';
import 'package:si_solo/main-page/model/user.dart';

class DaftarUsahaBaruPage extends StatefulWidget{
  const DaftarUsahaBaruPage({super.key});

  @override
  State<DaftarUsahaBaruPage> createState() => _DaftarUsahaBaruPage();
}

class _DaftarUsahaBaruPage extends State<DaftarUsahaBaruPage>{
  final _formKey = GlobalKey<FormState>();
  final _clearNamausaha = TextEditingController();
  final _clearAlamatUsaha = TextEditingController();
  final _clearNomorTeleponusaha = TextEditingController();
  String _namaUsaha = "";
  List<String> listJenisUsaha = ['Kuliner', 'Tempat Wisata', 'Menjual Bahan Pokok'];
  String _alamatUsaha = "";
  int? _nomorTeleponUsaha = 0;
  String? _jenis;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Utama'),
      ),
      drawer: buildDrawer(context),
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Contoh: Mie Ayam 360",
                        labelText: "Nama Usaha",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),

                      controller: _clearNamausaha,
                      
                      onChanged: (String? value){
                        setState(() {
                          _namaUsaha = value!;
                        });
                      },

                      onSaved: (String? value){
                        setState(() {
                          _namaUsaha = value!;
                        });
                      },

                      validator: (String? value){
                        if (value == null || value.isEmpty) {
                          return 'Nama usaha tidak boleh kosong!';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 10,),

                    SizedBox(
                width: 200,
                child: DropdownButtonFormField(
                  hint: const Text('Pilih Jenis Usaha'),
                  value: _jenis,
                  validator: (value) => 
                    value == null? "Pilih Jenis Usaha":null,
                  items: const <DropdownMenuItem<String>>[
                    DropdownMenuItem<String>(
                      value: 'Kuliner',
                      child: Text('Kuliner'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'Tempat Wisata',
                      child: Text('Tempat Wisata'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'Menjual Bahan Pokok',
                      child: Text('Menjual Bahan Pokok'),
                    ),
                  ],
                  onChanged: (String? value){
                    setState(() {
                      _jenis = value!;
                    });
                  },
                ),
              ),

                    const SizedBox(height: 10,),

                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Contoh: Jalan Cikupat",
                        labelText: "Alamat Usaha",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),

                      controller: _clearAlamatUsaha,
                      
                      onChanged: (String? value){
                        setState(() {
                          _alamatUsaha = value!;
                        });
                      },

                      onSaved: (String? value){
                        setState(() {
                          _alamatUsaha = value!;
                        });
                      },

                      validator: (String? value){
                        if (value == null || value.isEmpty) {
                          return 'Alamat usaha tidak boleh kosong!';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 10,),

                    TextFormField(
                        decoration: InputDecoration(
                            hintText: "Contoh: 0812345678910",
                            labelText: "Nomor Telepon Usaha",
                            // Menambahkan icon agar lebih intuitif
                            // icon: const Icon(Icons.monetization_on),
                            // Menambahkan circular border agar lebih rapi
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                            ),
                        ),

                        controller: _clearNomorTeleponusaha,
                        // Menambahkan behavior saat nama diketik 
                        onChanged: (String? value) {
                            setState(() {
                                _nomorTeleponUsaha = int.tryParse(value!);
                            });
                        },
                        // Menambahkan behavior saat data disimpan
                        onSaved: (String? value) {
                            setState(() {
                                _nomorTeleponUsaha = int.tryParse(value!);
                            });
                        },
                        // Validator sebagai validasi form
                        validator: (String? value) {
                            if (value == null || value.isEmpty) {
                                return 'Nomor telepon usaha tidak boleh kosong!';
                            }else if (_nomorTeleponUsaha== null){
                              return 'Nomor telepon usaha harus berupa angka!';
                            }
                            return null;
                        },
                    )
                  ]
                )
              ),
              const Spacer(),

              Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  child: const Text("Simpan", style: TextStyle(color: Colors.white),),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: (){
                    if (_formKey.currentState!.validate()){
                      addUsaha(UserLogin.listUserLogin[0].role, UserLogin.listUserLogin[0].namaLengkap, UserLogin.listUserLogin[0].nomorTeleponPemilik, UserLogin.listUserLogin[0].alamatPemilik, _namaUsaha, _jenis, _alamatUsaha, _nomorTeleponUsaha);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.green,
                          content: Text("Pendaftaran telah diajukan!"),
                          action: SnackBarAction(
                            label: 'Close',
                            textColor: Colors.white,
                            onPressed: (){
                              ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            },
                          ),
                        )
                      );
                      _clearAlamatUsaha.clear();
                      _clearNamausaha.clear();
                      _clearNomorTeleponusaha.clear();

                      setState(() {
                        _jenis = null;
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
        )
      )
    );
  }
}