import 'package:flutter/material.dart';
import 'package:si_solo/admin/util/fetch_pendaftaran_usaha.dart';
import 'package:si_solo/drawer_admin.dart';
import 'package:si_solo/main-page/model/user.dart';
import 'package:si_solo/pendaftaran_izin_usaha/model/usaha.dart';
import 'package:si_solo/admin/page/list_pendaftaran_usaha.dart';

class DetailPendaftaranUsaha extends StatelessWidget{
  final Usaha usaha;
  const DetailPendaftaranUsaha({super.key, required this.usaha});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Usaha'),
      ),
      drawer: buildDrawer(context),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(children: [
          Center(
            child: Text(
              usaha.namaUsaha,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            )
          ),
          const SizedBox(height: 10,),

          Column(
            children: (usaha.statusPendaftaran == 'Diajukan')?
            [
              const SizedBox(height: 10,),
              Row(
                children: [
                  const Text(
                    "Nama Pemilik Usaha: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    usaha.namaPemilik,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),

              const SizedBox(height: 10,),

              Row(
                children: [
                  const Text(
                    "Nomor Telepon Pemilik Usaha: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    usaha.nomorTeleponPemilik,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),

              const SizedBox(height: 10,),

              const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Alamat Pemilik Usaha: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              
              Row(
                  children: [
                    Flexible(
                      child: Text(
                        usaha.alamatPemilik,
                        style: const TextStyle(fontSize: 18),
                      )
                    )
                  ],
                ),

              const SizedBox(height: 10,),

              Row(
                children: [
                  const Text(
                    "Jenis Usaha: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    usaha.jenisUsaha,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),

              const SizedBox(height: 10,),

              const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Alamat Usaha: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),

              Row(
                  children: [
                    Flexible(
                      child: Text(
                        usaha.alamatUsaha,
                        style: const TextStyle(fontSize: 18),
                      )
                    )
                  ],
                ),

              const SizedBox(height: 10,),

              Row(
                children: [
                  const Text(
                    "Nomor Telepon Usaha: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    usaha.nomorTeleponUsaha,
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
                    usaha.statusPendaftaran,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),

              const SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    child: const Text("Proses", style: TextStyle(color: Colors.white),),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                    onPressed: (){
                      pendaftaranDiproses(usaha.namaPemilik, usaha.nomorTeleponPemilik, usaha.alamatPemilik, usaha.namaUsaha, usaha.jenisUsaha, usaha.alamatUsaha, usaha.nomorTeleponUsaha);
                      Future.delayed(Duration(milliseconds: 1000)).then((_){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ListPendaftaranUsahaPage()));
                      });
                    },
                  ),
                ],
              ),
            ]:[
              Column(
                children: (usaha.statusPendaftaran == 'Diproses')?
                [const SizedBox(height: 10,),
              Row(
                children: [
                  const Text(
                    "Nama Pemilik Usaha: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    usaha.namaPemilik,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),

              const SizedBox(height: 10,),

              Row(
                children: [
                  const Text(
                    "Nomor Telepon Pemilik Usaha: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    usaha.nomorTeleponPemilik,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),

              const SizedBox(height: 10,),

              const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Alamat Pemilik Usaha: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              
              Row(
                  children: [
                    Flexible(
                      child: Text(
                        usaha.alamatPemilik,
                        style: const TextStyle(fontSize: 18),
                      )
                    )
                  ],
                ),

              const SizedBox(height: 10,),

              Row(
                children: [
                  const Text(
                    "Jenis Usaha: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    usaha.jenisUsaha,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),

              const SizedBox(height: 10,),

              const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Alamat Usaha: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),

              Row(
                  children: [
                    Flexible(
                      child: Text(
                        usaha.alamatUsaha,
                        style: const TextStyle(fontSize: 18),
                      )
                    )
                  ],
                ),

              const SizedBox(height: 10,),

              Row(
                children: [
                  const Text(
                    "Nomor Telepon Usaha: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    usaha.nomorTeleponUsaha,
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
                    usaha.statusPendaftaran,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      child: const Text("Setujui", style: TextStyle(color: Colors.white),),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.green),
                      ),
                      onPressed: ()=> showModalBottomSheet(
                        backgroundColor: Colors.cyan,
                        barrierColor: Colors.transparent,
                        context: context,
                        builder: (_){
                          String _nomorIzinUsaha = "";
                          final _clearNomorIzinUsaha = TextEditingController();
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
                                                if (_nomorIzinUsaha != ""){
                                                  pendaftaranDisetujui(usaha.namaPemilik, usaha.nomorTeleponPemilik, usaha.alamatPemilik, usaha.namaUsaha, usaha.jenisUsaha, usaha.alamatUsaha, usaha.nomorTeleponUsaha, _nomorIzinUsaha);
                                                  Future.delayed(Duration(milliseconds: 1000)).then((_){
                                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ListPendaftaranUsahaPage()));
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
                      ),
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
                                              hintText: "Contoh: Alamat Usaha Tidak Sesuai",
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
                                                  pendaftaranDitolak(usaha.namaPemilik, usaha.nomorTeleponPemilik, usaha.alamatPemilik, usaha.namaUsaha, usaha.jenisUsaha, usaha.alamatUsaha, usaha.nomorTeleponUsaha, _alasanDitolak);
                                                  // pendaftaranDitolak(pelakuUsaha.namaPemilik, pelakuUsaha.nomorTeleponPemilik, pelakuUsaha.alamatPemilik, pelakuUsaha.nik, _alasanDitolak);
                                                  Future.delayed(Duration(milliseconds: 1000)).then((_){
                                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ListPendaftaranUsahaPage()));
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
              ]:[
              Column(
                children: (usaha.statusPendaftaran == 'Diterima')?
                [
                  const SizedBox(height: 10,),
              Row(
                children: [
                  const Text(
                    "Nama Pemilik Usaha: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    usaha.namaPemilik,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),

              const SizedBox(height: 10,),

              Row(
                children: [
                  const Text(
                    "Nomor Telepon Pemilik Usaha: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    usaha.nomorTeleponPemilik,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),

              const SizedBox(height: 10,),

              const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Alamat Pemilik Usaha: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              
              Row(
                  children: [
                    Flexible(
                      child: Text(
                        usaha.alamatPemilik,
                        style: const TextStyle(fontSize: 18),
                      )
                    )
                  ],
                ),

              const SizedBox(height: 10,),

              Row(
                children: [
                  const Text(
                    "Jenis Usaha: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    usaha.jenisUsaha,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),

              const SizedBox(height: 10,),

              const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Alamat Usaha: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),

              Row(
                  children: [
                    Flexible(
                      child: Text(
                        usaha.alamatUsaha,
                        style: const TextStyle(fontSize: 18),
                      )
                    )
                  ],
                ),

              const SizedBox(height: 10,),

              Row(
                children: [
                  const Text(
                    "Nomor Telepon Usaha: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    usaha.nomorTeleponUsaha,
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
                    usaha.statusPendaftaran,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),

              const SizedBox(height: 10,),

              Row(
                children: [
                  const Text(
                    "Nomor Izin Usaha: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    usaha.nomorIzinUsaha,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
                ]:[
                  const SizedBox(height: 10,),
              Row(
                children: [
                  const Text(
                    "Nama Pemilik Usaha: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    usaha.namaPemilik,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),

              const SizedBox(height: 10,),

              Row(
                children: [
                  const Text(
                    "Nomor Telepon Pemilik Usaha: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    usaha.nomorTeleponPemilik,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),

              const SizedBox(height: 10,),

              const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Alamat Pemilik Usaha: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              
              Row(
                  children: [
                    Flexible(
                      child: Text(
                        usaha.alamatPemilik,
                        style: const TextStyle(fontSize: 18),
                      )
                    )
                  ],
                ),

              const SizedBox(height: 10,),

              Row(
                children: [
                  const Text(
                    "Jenis Usaha: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    usaha.jenisUsaha,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),

              const SizedBox(height: 10,),

              const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Alamat Usaha: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),

              Row(
                  children: [
                    Flexible(
                      child: Text(
                        usaha.alamatUsaha,
                        style: const TextStyle(fontSize: 18),
                      )
                    )
                  ],
                ),

              const SizedBox(height: 10,),

              Row(
                children: [
                  const Text(
                    "Nomor Telepon Usaha: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    usaha.nomorTeleponUsaha,
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
                    usaha.statusPendaftaran,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),

              const SizedBox(height: 10,),

              Row(
                children: [
                  const Text(
                    "Alasan Pendaftaran Ditolak: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    usaha.alasanDitolak,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
                ],
              )
            ]
                ,
              )
            ]
            ,
          ),

          const Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ListPendaftaranUsahaPage()));
              },

              child: const Text(
                "Back",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}