import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:si_solo/pendaftaran_izin_usaha/model/status_pelaku_usaha.dart';

Future<List<StatusPelakuUsaha>> fetchStatusPelakuyUsaha(String role, String namaLengkap, String nomorTeleponPemilik, String alamatPemilik) async {
  var url = Uri.parse('http://127.0.0.1:8000/daftar-usaha/daftar-pelaku-usaha-mobile/$role/$namaLengkap/$nomorTeleponPemilik/$alamatPemilik');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<StatusPelakuUsaha> listStatusPelakuUsaha = [];

  if (data['message'] == 'belumDaftar'){
    listStatusPelakuUsaha.add(StatusPelakuUsaha(message: data['message'], status: "", pesan: ""));
  }else{
    if (data['status'] == 'ditolak'){
      listStatusPelakuUsaha.add(StatusPelakuUsaha(message: data['message'], status: data['status'], pesan: data['pesan']));
    }else{
      listStatusPelakuUsaha.add(StatusPelakuUsaha(message: data['message'], status: data['status'], pesan: ""));
    }
  }
  
  return listStatusPelakuUsaha;
}