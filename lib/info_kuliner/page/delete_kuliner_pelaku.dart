import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/getwidget.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import '../../drawer_pelaku_usaha.dart';

class FormKulinerPelakuPage extends StatefulWidget {
  const FormKulinerPelakuPage({super.key});

  @override
  State<FormKulinerPelakuPage> createState() => _FormKulinerPelakuPageState();
}

class Budget {
  String namaMenu;
  int hargaMenu;
  String deskripsiMenu;

  Budget(this.namaMenu, this.hargaMenu, this.deskripsiMenu);
}


class FormBudget {
  static List<Budget> budgets = [];
}

class _FormKulinerPelakuPageState extends State<FormKulinerPelakuPage>{
  final _formKey = GlobalKey<FormState>();
  String _namaMenu = "";
  int _hargaMenu = 0;
  String _deskripsiMenu = "";
  String _idMenuString = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
      ),
      // membuat drawer
      drawer: buildDrawer(context),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(1),
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // field judul
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Gado - Gado Solo",
                      labelText: "Judul",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _namaMenu = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        _namaMenu = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Judul tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                // field nominal
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ], // Only numbers
                    decoration: InputDecoration(
                      hintText: "Contoh: 18000",
                      labelText: "Nominal",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _hargaMenu = int.tryParse(value!)!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        _hargaMenu = int.parse(value!);
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nominal tidak boleh kosong!';
                      } else if (int.tryParse(value) == null) {
                        // tryparse return null jika tidak bisa di parse
                        return 'Nominal harus angka!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Gado - Gado Solo buka dari pukul 09.00 hingga habis.",
                      labelText: "Deskripsi",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _deskripsiMenu = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        _deskripsiMenu = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Deksripsi tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        const url =
                            "https://si-solo.up.railway.app/tempat-kuliner/delete-menu-kuliner";
                        final response = await request.post(url, {
                          "idMenuString": _idMenuString,
                        });
                        _formKey.currentState!.save();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Data berhasil dihapus!'),
                          ),
                        );
                        // Mengosongkan form
                        _formKey.currentState!.reset();
                      }
                    },
                    child: const Text(
                      "Simpan",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}