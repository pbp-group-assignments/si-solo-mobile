import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:si_solo/drawer_pelaku_usaha.dart';
import 'package:si_solo/pendaftaran_izin_usaha/util/fetch_usaha.dart';
import 'package:si_solo/main-page/model/user.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

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
  final List<String> listJenisUsaha = ['Kuliner', 'Tempat Wisata', 'Menjual Bahan Pokok'];
  String _alamatUsaha = "";
  int? _nomorTeleponUsaha = 0;
  String? _jenis;

  List<DropdownMenuItem<String>> _addDividersAfterItems(List<String> items) {
    List<DropdownMenuItem<String>> _menuItems = [];
    for (var item in items) {
      _menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ),
          //If it's last item, we will not add Divider after it.
          if (item != items.last)
            const DropdownMenuItem<String>(
              enabled: false,
              child: Divider(),
            ),
        ],
      );
    }
    return _menuItems;
  }

  List<double> _getCustomItemsHeights() {
    List<double> _itemsHeights = [];
    for (var i = 0; i < (listJenisUsaha.length * 2) - 1; i++) {
      if (i.isEven) {
        _itemsHeights.add(40);
      }
      //Dividers indexes will be the odd indexes
      if (i.isOdd) {
        _itemsHeights.add(4);
      }
    }
    return _itemsHeights;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Usaha'),
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
                          borderSide: BorderSide(color: Colors.black)
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(color: Colors.black)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(color: Colors.black)
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
                      width: 180,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          isExpanded: true,
                          hint: Text(
                            'Pilih Jenis Usaha',
                            style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                          items: _addDividersAfterItems(listJenisUsaha),
                          customItemsHeights: _getCustomItemsHeights(),
                          value: _jenis,
                          onChanged: (value) {
                            setState(() {
                              _jenis = value as String;
                            });
                          },
                          buttonHeight: 40,
                          dropdownMaxHeight: 200,
                          buttonWidth: 170,
                          itemPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10,),

                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Contoh: Jalan Cikupat",
                        labelText: "Alamat Usaha",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(color: Colors.black)
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(color: Colors.black)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(color: Colors.black)
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
                              borderSide: BorderSide(color: Colors.black)
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(color: Colors.black)
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(color: Colors.black)
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

              GFButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() && _jenis != null){
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
                text: "Simpan",
                color: Colors.purpleAccent,
                shape: GFButtonShape.pills,
                blockButton: false,
                size: GFSize.LARGE,
                fullWidthButton: true,
              ),
            ]
          )
        )
      )
    );
  }
}