import 'package:flutter/material.dart';
import 'package:si_solo/main-page/util/fetch_user.dart';
import 'package:si_solo/main-page/model/user.dart';
import 'package:si_solo/landing_page_pengguna.dart';
import 'package:si_solo/register_addition.dart';
import 'package:si_solo/landing_page_admin.dart';
import 'package:si_solo/landing_page_pelaku_usaha.dart';

class EditFormPage extends StatefulWidget {
  const EditFormPage({super.key});

  @override
  State<EditFormPage> createState() => _EditFormPage();
}

class _EditFormPage extends State<EditFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _numberController = TextEditingController();
  final _addressController = TextEditingController();
  String _name = UserLogin.loggedInUser.namaLengkap;
  String _number = UserLogin.loggedInUser.nomorTeleponPemilik;
  String _address = UserLogin.loggedInUser.alamatPemilik;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit'),
        ),
        body: Form(
            key: _formKey,
            child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: [
                  const Text("Edit Profile",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                labelText:
                                    "Nama Lengkap (${UserLogin.loggedInUser.namaLengkap})",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              controller: _nameController,
                              onChanged: (String? value) {
                                setState(() {
                                  _name = value!;
                                });
                              },
                              onSaved: (String? value) {
                                setState(() {
                                  _name = value!;
                                });
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText:
                                    "Nomor Telepon (${UserLogin.loggedInUser.nomorTeleponPemilik})",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              controller: _numberController,
                              onChanged: (String? value) {
                                setState(() {
                                  _number = value!;
                                });
                              },
                              onSaved: (String? value) {
                                setState(() {
                                  _number = value!;
                                });
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText:
                                    "Alamat (${UserLogin.loggedInUser.alamatPemilik})",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              controller: _addressController,
                              onChanged: (String? value) {
                                setState(() {
                                  _address = value!;
                                });
                              },
                              onSaved: (String? value) {
                                setState(() {
                                  _address = value!;
                                });
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: TextButton(
                                child: const Text(
                                  "Save",
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.blue),
                                ),
                                onPressed: () {
                                  editUser(UserLogin.loggedInUser.role, _name,
                                      _number, _address);
                                },
                              ),
                            ),
                          ]))
                ]))),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
            tooltip: 'Kembali',
            label: const Text("Kembali"),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const LandingPenggunaPage()))));
  }
}
