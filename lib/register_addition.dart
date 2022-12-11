import 'package:flutter/material.dart';
import 'package:si_solo/drawer_pengguna.dart';
import 'package:si_solo/landing_page_pengguna.dart';
import 'package:si_solo/main-page/model/user.dart';
import 'package:si_solo/main-page/util/fetch_user.dart';
import 'package:si_solo/main.dart';

class RegisterAdditionPage extends StatefulWidget {
  const RegisterAdditionPage({super.key});

  @override
  State<RegisterAdditionPage> createState() => _RegisterAdditionPage();
}

class _RegisterAdditionPage extends State<RegisterAdditionPage> {
  final _formKey = GlobalKey<FormState>();
  final _clearNamaLengkap =TextEditingController();
  final _clearNomorTelepon = TextEditingController();
  final _clearAlamat = TextEditingController();
  String namaLengkap = "";
  int? nomorTelepon;
  String alamat = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Informasi Tambahan'),
        ),
        body: Form(
            key: _formKey,
            child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: [
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: "Nama Lengkap",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              controller: _clearNamaLengkap,
                              onChanged: (String? value) {
                                setState(() {
                                  namaLengkap = value!;
                                });
                              },
                              onSaved: (String? value) {
                                setState(() {
                                  namaLengkap = value!;
                                });
                              },
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Nama Lengkap kosong!';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: "Nomor Telepon",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              controller: _clearNomorTelepon,
                              onChanged: (String? value) {
                                setState(() {
                                  nomorTelepon = int.tryParse(value!);
                                });
                              },
                              onSaved: (String? value) {
                                setState(() {
                                  nomorTelepon = int.tryParse(value!);
                                });
                              },
                              validator: (String? value){
                                if (value == null || value.isEmpty) {
                                  return 'Nomor Telepon tidak boleh kosong!';
                                }else if (nomorTelepon == null){
                                  return 'Nomor Telepon harus berupa angka!';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: "Alamat Tempat Tinggal",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              controller: _clearAlamat,
                              onChanged: (String? value) {
                                setState(() {
                                  alamat= value!;
                                });
                              },
                              onSaved: (String? value) {
                                setState(() {
                                  alamat = value!;
                                });
                              },
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Alamat kosong!';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: TextButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.blue),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    registerAdditionUser(UserLogin.listUserLogin[0].username, namaLengkap, nomorTelepon.toString(), alamat);
                                    // registerUser(_username, _password1);
                                    Future.delayed(Duration(milliseconds: 3000))
                                        .then((_) {
                                          Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LandingPenggunaPage()));
                                        });
                                    _clearNamaLengkap.clear();
                                    _clearNomorTelepon.clear();
                                    _clearAlamat.clear();

                                    setState(() {
                                      nomorTelepon = null;
                                    });
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      backgroundColor: Colors.red,
                                      content: const Text(
                                          "Mohon isi data dengan lengkap!"),
                                      action: SnackBarAction(
                                        label: 'Close',
                                        textColor: Colors.white,
                                        onPressed: () {
                                          ScaffoldMessenger.of(context)
                                              .hideCurrentSnackBar();
                                        },
                                      ),
                                    ));
                                  }
                                },
                                child: const Text(
                                  "Register",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ])),
                ]))),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
            tooltip: 'Kembali',
            label: const Text("Kembali"),
            onPressed: () { 
              UserLogin.listUserLogin.removeAt(0);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyHomePage()));}
                    ));
  }
}
