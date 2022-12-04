import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:si_solo/pendaftaran_izin_usaha/model/usaha.dart';

Future<List<Usaha>> fetchUsaha(String role, String namaLengkap, String nomorTeleponPemilik, String alamatPemilik) async {
  var url = Uri.parse('https://si-solo.up.railway.app/daftar-usaha/usaha-json-mobile/$role/$namaLengkap/$nomorTeleponPemilik/$alamatPemilik');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<Usaha> listUsaha = [];
  for (var d in data){
    if (d != null){
      listUsaha.add(Usaha.fromJson(d));
    }
  }

  return listUsaha;
}

Future<void> addUsaha(String role, String namaLengkap, String nomorTeleponPemilik, String alamatPemilik, String namaUsaha, String? jenisUsaha, String alamatUsaha, int? nomorTeleponUsaha) async{
  String nomorTeleponUsahaString = nomorTeleponUsaha.toString();
  var url = Uri.parse('https://si-solo.up.railway.app/daftar-usaha/add-usaha-mobile/');
  Map data = {};
  data['role'] = role;
  data['namaLengkap'] = namaLengkap;
  data['nomorTeleponPemilik'] = nomorTeleponPemilik;
  data['alamatPemilik'] = alamatPemilik;
  data['namaUsaha'] = namaUsaha;
  data['jenisUsaha'] = jenisUsaha;
  data['alamatUsaha'] = alamatUsaha;
  data['nomorTeleponUsaha'] = nomorTeleponUsahaString;
  http.Response response = await http.post(
    url,
    headers: {"Content-Type": 'application/json; charset=UTF-8'},
    body: json.encode(data)
  );
}