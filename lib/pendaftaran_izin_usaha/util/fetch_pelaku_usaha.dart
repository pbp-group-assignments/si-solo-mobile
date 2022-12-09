import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> daftarPelakuUsaha(String role, String namaLengkap, String nomorTeleponPemilik, String alamatPemilik, int? nik) async {
  String nikString = nik.toString();
  var url = Uri.parse('https://si-solo.up.railway.app/daftar-usaha/add-pelaku-usaha/');
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
  var url = Uri.parse('https://si-solo.up.railway.app/daftar-usaha/daftar-ulang-mobile/');
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