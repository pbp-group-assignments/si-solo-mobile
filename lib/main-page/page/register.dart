import 'package:flutter/material.dart';
import 'package:si_solo/main-page/page/login.dart';
import 'package:si_solo/main-page/util/fetch_user.dart';
import 'package:si_solo/main-page/model/user.dart';
import 'package:si_solo/landing_page_pengguna.dart';
import 'package:si_solo/main-page/util/landing_card_guest.dart';
import 'package:si_solo/main.dart';
import 'package:si_solo/register_addition.dart';
import 'package:si_solo/landing_page_admin.dart';
import 'package:si_solo/landing_page_pelaku_usaha.dart';

class RegisterFormPage extends StatefulWidget {
  const RegisterFormPage({super.key});

  @override
  State<RegisterFormPage> createState() => _RegisterFormPage();
}

class _RegisterFormPage extends State<RegisterFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _clearUsername = TextEditingController();
  final _clearPassword1 = TextEditingController();
  final _clearPassword2 = TextEditingController();
  String _username = "";
  String _password1 = "";
  String _password2 = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Register'),
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
                                labelText: "Username",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              controller: _clearUsername,
                              onChanged: (String? value) {
                                setState(() {
                                  _username = value!;
                                });
                              },
                              onSaved: (String? value) {
                                setState(() {
                                  _username = value!;
                                });
                              },
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Username kosong!';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: "Password",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              controller: _clearPassword1,
                              onChanged: (String? value) {
                                setState(() {
                                  _password1 = value!;
                                });
                              },
                              onSaved: (String? value) {
                                setState(() {
                                  _password1 = value!;
                                });
                              },
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password kosong!';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: "Password",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              controller: _clearPassword2,
                              onChanged: (String? value) {
                                setState(() {
                                  _password2 = value!;
                                });
                              },
                              onSaved: (String? value) {
                                setState(() {
                                  _password2 = value!;
                                });
                              },
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password kosong!';
                                }
                                if (_password1 != _password2) {
                                  return 'Password tidak sama!';
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
                                    registerUser(_username, _password1);
                                    Future.delayed(Duration(milliseconds: 3000))
                                        .then((_) {
                                          Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginFormPage()));
                                        });

                                    _clearUsername.clear();
                                    _clearPassword1.clear();
                                    _clearPassword2.clear();
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
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyGuestCardItem()));
                      },
                      child: const Text("Lanjutkan sebagai Guest"))
                ]))),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
            tooltip: 'Kembali',
            label: const Text("Kembali"),
            onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyHomePage()))));

  }
}
