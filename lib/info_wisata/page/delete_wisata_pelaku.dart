import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/getwidget.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import '../../drawer_pelaku_usaha.dart';

class FormWisataPelakuPage extends StatefulWidget {
  const FormWisataPelakuPage({super.key});

  @override
  State<FormWisataPelakuPage> createState() => _FormWisataPelakuPageState();
}

class Budget {
  String namaWisata;
  int hargaWisata;
  String deskripsiWisata;

  Budget(this.namaWisata, this.hargaWisata, this.deskripsiWisata);
}


class FormBudget {
  static List<Budget> budgets = [];
}

class _FormWisataPelakuPageState extends State<FormWisataPelakuPage>{
  final _formKey = GlobalKey<FormState>();
  String _namaWisata = "";
  int _hargaWisata = 0;
  String _deskripsiWisata = "";
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
                      hintText: " The Heritage Palace Solo",
                      labelText: "Judul",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _namaWisata = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        _namaWisata = value!;
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
                        _hargaWisata = int.tryParse(value!)!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        _hargaWisata = int.parse(value!);
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
                      hintText: "Terletak di Jl. Permata Raya Dukuh Tegal Mulyo, Pabelan, Kartasura, Sukoharjo, Jawa Tengah",
                      labelText: "Deskripsi",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _deskripsiWisata = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        _deskripsiWisata = value!;
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
                            "https://si-solo.up.railway.app/tempat-wisata/delete-deskripsi-wisata";
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