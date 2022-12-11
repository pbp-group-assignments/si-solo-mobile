import 'package:flutter/material.dart';
import 'package:si_solo/main-page/util/fetch_user.dart';
import 'package:si_solo/main-page/model/user.dart';
import 'package:si_solo/landing_page_pengguna.dart';
import 'package:si_solo/main-page/util/landing_card_guest.dart';
import 'package:si_solo/main.dart';
import 'package:si_solo/register_addition.dart';
import 'package:si_solo/landing_page_admin.dart';
import 'package:si_solo/landing_page_pelaku_usaha.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class LoginFormPage extends StatefulWidget {
  const LoginFormPage({super.key});

  @override
  State<LoginFormPage> createState() => _LoginFormPage();
}

class _LoginFormPage extends State<LoginFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _clearUsername = TextEditingController();
  final _clearPassword = TextEditingController();
  String _username = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Form(
            key: _formKey,
            child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: [
                  const Text("Login",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 10,
                  ),
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
                              controller: _clearPassword,
                              onChanged: (String? value) {
                                setState(() {
                                  _password = value!;
                                });
                              },
                              onSaved: (String? value) {
                                setState(() {
                                  _password = value!;
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
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: TextButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.blue),
                                ),
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    fetchLogin(_username, _password);
                                    Future.delayed(Duration(milliseconds: 3000))
                                        .then((_) {
                                      if (UserLogin.listUserLogin[0].status ==
                                          'register') {
                                        UserLogin.loggedInUser =
                                            UserLogin.listUserLogin[0];

                                        if (UserLogin.listUserLogin[0].role ==
                                            'Admin') {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const LandingAdminPage()));
                                        } else if (UserLogin
                                                .listUserLogin[0].role ==
                                            'Pengguna') {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const LandingPenggunaPage()));
                                        } else {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const LandingPelakuUsahaPage()));
                                        }
                                      } else if (UserLogin
                                              .listUserLogin[0].status ==
                                          'notRegister') {
                                        UserLogin.loggedInUser =
                                            UserLogin.listUserLogin[0];

                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const RegisterAdditionPage()));
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          backgroundColor: Colors.red,
                                          content: const Text(
                                              "Akun tidak terdaftar!"),
                                          action: SnackBarAction(
                                            label: 'Close',
                                            textColor: Colors.white,
                                            onPressed: () {
                                              ScaffoldMessenger.of(context)
                                                  .hideCurrentSnackBar();
                                            },
                                          ),
                                        ));

                                        UserLogin.listUserLogin.removeAt(0);
                                      }
                                    });
                                    _clearUsername.clear();
                                    _clearPassword.clear();
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      backgroundColor: Colors.red,
                                      content: Text(
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
                                  "Login",
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
            onPressed: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const MyHomePage()))));
  }
}
