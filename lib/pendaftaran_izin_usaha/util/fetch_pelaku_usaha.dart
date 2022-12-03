import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:si_solo/pendaftaran_izin_usaha/model/pelaku_usaha.dart';

// Future<List<PelakuUsaha>> fetchPelakuUsaha() async {
//   var url = Uri.parse('https://si-solo.up.railway.app/Admin/pendaftaran-pelaku-usaha-json');
//   var response = await http.get(
//     url,
//     headers: {
//       "Access-Control-Allow-Origin": "*",
//       "Content-Type": "application/json",
//     },
//   );

//   var data = jsonDecode(utf8.decode(response.bodyBytes));

//   List<PelakuUsaha> listPelakuUsaha = [];
//   for (var d in data){
//     if (d != null){
//       listPelakuUsaha.add(PelakuUsaha.fromJson(d));
//     }
//   }

//   return listPelakuUsaha;
// }

Future<void> daftarPelakuUsaha(String role, String namaLengkap, String nomorTeleponPemilik, String alamatPemilik, int? nik) async {
  String nikString = nik.toString();
  var url = Uri.parse('http://127.0.0.1:8000/daftar-usaha/add-pelaku-usaha/');
  Map data = {};
  data['role'] = role;
  data['namaLengkap'] = namaLengkap;
  data['nomorTeleponPemilik'] = nomorTeleponPemilik;
  data['alamatPemilik'] = alamatPemilik;
  data['nik'] = nikString;
  http.Response response = await http.post(
    url,
    headers: {"Content-Type": 'application/json; charset=UTF-8'},
    body: json.encode(data)
  );
}

Future<void> daftarUlang(String role, String namaLengkap, String nomorTeleponPemilik, String alamatPemilik) async {
  var url = Uri.parse('http://127.0.0.1:8000/daftar-usaha/daftar-ulang-mobile/');
  Map data = {};
  data['role'] = role;
  data['namaLengkap'] = namaLengkap;
  data['nomorTeleponPemilik'] = nomorTeleponPemilik;
  data['alamatPemilik'] = alamatPemilik;
  http.Response response = await http.post(
    url,
    headers: {"Content-Type": 'application/json; charset=UTF-8'},
    body: json.encode(data)
  );
}