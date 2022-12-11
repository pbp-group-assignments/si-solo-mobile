import "package:flutter/material.dart";
import 'package:getwidget/getwidget.dart';
import 'package:si_solo/drawer_pengguna.dart';
import 'package:si_solo/landing_page_pengguna.dart';
import 'package:si_solo/main-page/model/user.dart';
import 'package:si_solo/layanan_pengaduan/util/fetch_pengaduan';

class FormPengaduanPage extends StatefulWidget{
  const FormPengaduanPage({super.key});

  @override
  State<FormPengaduanPage> createState() => _FormPengaduanPageState();
}
class _FormPengaduanPageState extends State<FormPengaduanPage>{
  final _formKey = GlobalKey<FormState>();
  String _masalah = "";
  String _deskripsiMasalah = "";
  final _controllerMasalah = TextEditingController();
  final _controllerDeskripsiMasalah = TextEditingController();

  void clearText(){
    _controllerMasalah.clear();
    _controllerDeskripsiMasalah.clear();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Layanan Pengaduan"),
      ),
      drawer: buildDrawer(context),
      body: Form(
        key:_formKey,
        child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Padding(padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Laporkan masalah perkotaan yang ada di sekitar Anda dan lihat laporan warga lain di sekitar Anda"),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _controllerMasalah,
                  decoration: InputDecoration(
                    hintText: "Contoh : Banjir",
                    labelText: "Masalah",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onChanged: (String? value){
                    setState(() {
                      //_controllerMasalah = value!;
                    });
                  },
                  validator: (String? value){
                    if (value == null || value.isEmpty){
                      return "Tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height:30,
                ),
                TextFormField(
                  controller: _controllerDeskripsiMasalah,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 100.0),

                    hintText: "Jelaskan masalah yang terjadi secara rinci",
                    labelText: "Deskripsi Masalah",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onChanged: (String? value){
                    setState(() {
                      //_controllerDeskripsiMasalah = value!;
                    });
                  },
                  validator: (String? value){
                    if (value == null || value.isEmpty){
                      return "Tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                  ]),
                ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shadowColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                  minimumSize: Size(300,50)
              ),
              onPressed: (){
                if(_formKey.currentState!.validate()){
                  daftarPengaduan(UserLogin.listUserLogin[0].masalah, UserLogin.listUserLogin[0].deskripsiMasalah);
                  clearText();
                  setState(() {
                      _masalah = null;
                      _deskripsiMasalah = null;
                  });
                }
              },
              child: const Text("Ajukan Pengaduan",
                style: TextStyle(color: Colors.black),
              ),
            ),
              ],
            ),
        ),
        ),
        );
  }
}
