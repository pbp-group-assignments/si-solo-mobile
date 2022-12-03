import 'package:flutter/material.dart';
import 'package:si_solo/drawer_pelaku_usaha.dart';
import 'package:si_solo/pendaftaran_izin_usaha/model/usaha.dart';
import 'package:si_solo/pendaftaran_izin_usaha/util/fetch_status_pelaku_usaha.dart';
import 'package:si_solo/main-page/model/user.dart';
import 'package:si_solo/pendaftaran_izin_usaha/util/fetch_usaha.dart';
import 'package:si_solo/pendaftaran_izin_usaha/page/list_pendaftaran_usaha_pelaku_usaha.dart';

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
            children: (usaha.statusPendaftaran == 'Diajukan' || usaha.statusPendaftaran == 'Diproses')?
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
          ),

          const Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ListPendaftaranUsahaPelakuUsahaPage()));
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