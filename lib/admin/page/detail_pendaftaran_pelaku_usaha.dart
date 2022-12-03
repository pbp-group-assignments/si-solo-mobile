import 'package:flutter/material.dart';
import 'package:si_solo/admin/util/fetch_pendaftaran_pelaku_usaha.dart';
import 'package:si_solo/drawer_admin.dart';
import 'package:si_solo/main-page/model/user.dart';
import 'package:si_solo/pendaftaran_izin_usaha/model/pelaku_usaha.dart';
import 'package:si_solo/admin/page/list_pendaftaran_pelaku_usaha.dart';

class DetailPendaftaranPelakuUsaha extends StatelessWidget{
  final PelakuUsaha pelakuUsaha;
  const DetailPendaftaranPelakuUsaha({super.key, required this.pelakuUsaha});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Pendaftar'),
      ),
      drawer: buildDrawer(context),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Center(
              child: Text(
                pelakuUsaha.namaPemilik,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              )
            ),

            const SizedBox(height: 20,),
            
            Column(
              children: (pelakuUsaha.status == "Ditolak")?
              [
                Row(
                  children: [
                    const Text(
                      "Nomor Telepon Pendaftar: ",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      pelakuUsaha.nomorTeleponPemilik,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),

                const SizedBox(height: 10,),

                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Alamat Pendaftar: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),

                  Row(
                  children: [
                    Flexible(
                      child: Text(
                        pelakuUsaha.alamatPemilik,
                        style: const TextStyle(fontSize: 18),
                      )
                    )
                  ],
                ),

                const SizedBox(height: 10,),

                Row(
                  children: [
                    const Text(
                      "NIK Pendaftar: ",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      pelakuUsaha.nik,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),

                const SizedBox(height: 10,),

                Row(
                  children: [
                    const Text(
                      "Status Pendaftaran: ",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      pelakuUsaha.status,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),

                const SizedBox(height: 10,),

                Row(
                  children: [
                    const Text(
                      "Alasan Ditolak: ",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      pelakuUsaha.pesan,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ]:
              [
                Row(
                  children: [
                    const Text(
                      "Nomor Telepon Pendaftar: ",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      pelakuUsaha.nomorTeleponPemilik,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),

                const SizedBox(height: 10,),

                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Alamat Pendaftar: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),

                  Row(
                  children: [
                    Flexible(
                      child: Text(
                        pelakuUsaha.alamatPemilik,
                        style: const TextStyle(fontSize: 18),
                      )
                    )
                  ],
                ),

                const SizedBox(height: 10,),

                Row(
                  children: [
                    const Text(
                      "NIK Pendaftar: ",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      pelakuUsaha.nik,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),

                const SizedBox(height: 10,),

                Row(
                  children: [
                    const Text(
                      "Status Pendaftaran: ",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      pelakuUsaha.status,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ]
            ),

            Column(
              children: (pelakuUsaha.status == "Diproses")?
              [
                const SizedBox(height: 30,),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      child: const Text("Setujui", style: TextStyle(color: Colors.white),),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.green),
                      ),
                      onPressed: (){
                        pendaftaranDisetujui(pelakuUsaha.namaPemilik, pelakuUsaha.nomorTeleponPemilik, pelakuUsaha.alamatPemilik, pelakuUsaha.nik);
                        Future.delayed(Duration(milliseconds: 1000)).then((_){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ListPendaftaranPelakuUsahaPage()));
                        });
                      },
                    ),
                    const SizedBox(width: 10,),
                    TextButton(
                      child: const Text("Tolak", style: TextStyle(color: Colors.white),),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
                      onPressed: () => showModalBottomSheet(
                        backgroundColor: Colors.cyan,
                        barrierColor: Colors.transparent,
                        context: context,
                        builder: (_){
                          String _alasanDitolak = "";
                          final _clearAlasan = TextEditingController();
                          return Container(
                            height: 350,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20)
                              )
                            ),
                            child: Form(
                              key: GlobalKey<FormState>(),
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
                                              hintText: "Contoh: NIK Tidak Sesuai",
                                              labelText: "Alasan Ditolak",
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5.0),
                                              ),
                                            ),

                                            controller: _clearAlasan,

                                            onChanged: (String? value){
                                              _alasanDitolak = value!;
                                            },

                                            onSaved: (String? value){
                                              _alasanDitolak = value!;
                                            },

                                            validator: (String? value){
                                              if (value == null || value.isEmpty) {
                                                return 'Alasan pendaftaran ditolak tidak boleh kosong!';
                                              }
                                              return "ok";
                                            },
                                          ),
                                          
                                          const SizedBox(height: 15),

                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: TextButton(
                                              child: const Text("Submit", style: TextStyle(color: Colors.white, fontSize: 15),),
                                              style: ButtonStyle(
                                                backgroundColor: MaterialStateProperty.all(Colors.blue),
                                              ),
                                              onPressed: (){
                                                if (_alasanDitolak != ""){
                                                  pendaftaranDitolak(pelakuUsaha.namaPemilik, pelakuUsaha.nomorTeleponPemilik, pelakuUsaha.alamatPemilik, pelakuUsaha.nik, _alasanDitolak);
                                                  Future.delayed(Duration(milliseconds: 1000)).then((_){
                                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ListPendaftaranPelakuUsahaPage()));
                                                  });
                                                }else{
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                    SnackBar(
                                                      backgroundColor: Colors.red,
                                                      content: Text("Alasan pendaftaran ditolak tidak boleh kosong!"),
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
                      )
                    ),
                  ]
                ),
              ]:[],
            ),

            const Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ListPendaftaranPelakuUsahaPage()));
                },

                child: const Text(
                  "Back",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        )
      )
    );
  }
}