import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:si_solo/drawer_admin.dart';
import 'package:si_solo/admin/util/fetch_pendaftaran_usaha.dart';
import 'package:si_solo/pendaftaran_izin_usaha/model/usaha.dart';
import 'package:si_solo/admin/page/list_pendaftaran_usaha.dart';

class FormNomorIzinUsahaPage extends StatelessWidget{
  final _formKey = GlobalKey<FormState>();
  String _nomorIzinUsaha = "";
  final _clearNomorIzinUsaha = TextEditingController();
  FormNomorIzinUsahaPage({super.key, required this.usaha});
  final Usaha usaha;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nomor Izin Usaha'),
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
                                              hintText: "Contoh: S24/VII/2020",
                                              labelText: "Nomor Izin Usaha",
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5.0),
                                              ),
                                            ),

                                            controller: _clearNomorIzinUsaha,

                                            onChanged: (String? value){
                                              _nomorIzinUsaha = value!;
                                            },

                                            onSaved: (String? value){
                                              _nomorIzinUsaha = value!;
                                            },

                                            validator: (String? value){
                                              if (value == null || value.isEmpty) {
                                                return 'Nomor Izin Usaha tidak boleh kosong!';
                                              }
                                              return null;
                                            },
                                          ),
                                          
                                          const SizedBox(height: 15),

                                          GFButton(
                                            text: "Submit",
                                            color: Colors.green,
                                            shape: GFButtonShape.pills,
                                            size: GFSize.LARGE,
                                            onPressed: (){
                                              if (_nomorIzinUsaha != ""){
                                                  pendaftaranDisetujui(usaha.namaPemilik, usaha.nomorTeleponPemilik, usaha.alamatPemilik, usaha.namaUsaha, usaha.jenisUsaha, usaha.alamatUsaha, usaha.nomorTeleponUsaha, _nomorIzinUsaha);
                                                  Future.delayed(Duration(milliseconds: 1000)).then((_){
                                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ListPendaftaranUsahaPage(index: 0,)));
                                                  });
                                                }else{
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                    SnackBar(
                                                      backgroundColor: Colors.red,
                                                      content: Text("Nomor izin usaha tidak boleh kosong!"),
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
                                          ),
                                        ]
                                      )
                                    )
                                  ]
                                )
                              )
      ),
    );
  }
}