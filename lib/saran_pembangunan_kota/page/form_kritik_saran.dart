import "package:flutter/material.dart";
import 'package:getwidget/getwidget.dart';
import 'package:si_solo/drawer_pengguna.dart';
import 'package:si_solo/landing_page_pengguna.dart';
import 'package:si_solo/main-page/model/user.dart';

class FormSaranPage extends StatefulWidget{
  const FormSaranPage({super.key});

  @override
  State<FormSaranPage> createState() => _FormSaranPageState();
}
class _FormSaranPageState extends State<FormSaranPage>{
  final _formKey = GlobalKey<FormState>();
  String _nama = "";
  String _email = "";
  String _kritikSaran = "";
  final _controllerNama = TextEditingController();
  final _controllerEmail = TextEditingController();
  final _controllerKritikSaran = TextEditingController();

  void clearText(){
    _controllerNama.clear();
    _controllerEmail.clear();
    _controllerKritikSaran.clear();
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
                const Text("Silakan berikan kritik serta saran yang membangun untuk kota Solo."),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _controllerNama,
                  decoration: InputDecoration(
                    hintText: "Contoh : Jane Doe",
                    labelText: "Nama",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onChanged: (String? value){
                    setState(() {
                      //_controllerNama = value!;
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
                  controller: _controllerEmail,
                  decoration: InputDecoration(
                    hintText: "Gunakan format yang benar",
                    labelText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onChanged: (String? value){
                    setState(() {
                      //_controllerEmail = value!;
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
                  controller: _controllerKritikSaran,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 100.0),

                    hintText: "Masukkan kritik dan saran yang membangun",
                    labelText: "Kritik dan Saran",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onChanged: (String? value){
                    setState(() {
                      //_controllerKritikSaran = value!;
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
                  daftarKritikSaran(UserLogin.listUserLogin[0].nama, UserLogin.listUserLogin[0].email, UserLogin.listUserLogin[0].kritikSaran);
                  clearText();
                  setState(() {
                      _nama = null;
                      _email = null;
                      _kritikSaran = null;
                  });
                }
              },
              child: const Text("Kirim",
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
