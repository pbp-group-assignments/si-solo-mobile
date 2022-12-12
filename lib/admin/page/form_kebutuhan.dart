import 'package:flutter/material.dart';
import 'package:si_solo/info_kebutuhan/model/kebutuhan.dart';
import 'package:si_solo/info_kebutuhan/page/list_kebutuhan_pengguna.dart';
import 'package:si_solo/drawer_pelaku_usaha.dart';


class FormKebutuhan extends StatelessWidget {
  const FormKebutuhan({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tambah Kebutuhan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyFormPage(title: 'Tambah Kebutuhan'),
    );
  }
}

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key, required this.title});

  final String title;

  @override
  State<MyFormPage> createState() => _MyFormPage();
}

class _MyFormPage extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _namaKebutuhan = "";
  String _hargaKebutuhan = "";
  String _deskripsiKebutuhan = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: buildDrawer(context),
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Nama Kebutuhan",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            _namaKebutuhan = value!;
                          });
                        },
                        onSaved: (String? value) {
                          setState(() {
                            _namaKebutuhan = value!;
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Harga Kebutuhan",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        // inputFormatters: <TextInputFormatter>[
                        //   FilteringTextInputFormatter.digitsOnly
                        // ],
                        onChanged: (String? value) {
                          setState(() {
                            _hargaKebutuhan = value!;
                          });
                        },
                        onSaved: (String? value) {
                          setState(() {
                            _hargaKebutuhan = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Nominal tidak boleh kosong!';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Deskripsi Kebutuhan",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        // inputFormatters: <TextInputFormatter>[
                        //   FilteringTextInputFormatter.digitsOnly
                        // ],
                        onChanged: (String? value) {
                          setState(() {
                            _deskripsiKebutuhan = value!;
                          });
                        },
                        onSaved: (String? value) {
                          setState(() {
                            _deskripsiKebutuhan = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Deskripsi tidak boleh kosong!';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
