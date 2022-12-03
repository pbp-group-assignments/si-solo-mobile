import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:si_solo/pendaftaran_izin_usaha/model/usaha.dart';

Future<List<Usaha>> fetchSemuaUsaha() async {
  var url = Uri.parse('http://127.0.0.1:8000/daftar-usaha/semua-usaha-json');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // print(response.body);
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<Usaha> listPelakuUsaha = [];
  for (var d in data){
    if (d != null){
      listPelakuUsaha.add(Usaha.fromJson(d));
    }
  }

  return listPelakuUsaha;
}

Future<void> pendaftaranDisetujui(String namaLengkap, String nomorTeleponPemilik, String alamatPemilik, String nik) async {
  var url = Uri.parse('http://127.0.0.1:8000/Admin/set-diterima-pelaku-usaha-mobile');
  Map data = {};
  data['namaLengkap'] = namaLengkap;
  data['nomorTeleponPemilik'] = nomorTeleponPemilik;
  data['alamatPemilik'] = alamatPemilik;
  data['nik'] = nik;
  http.Response response = await http.post(
    url,
    headers: {"Content-Type": 'application/json; charset=UTF-8'},
    body: json.encode(data)
  );
}

Future<void> pendaftaranDitolak(String namaLengkap, String nomorTeleponPemilik, String alamatPemilik, String nik, String alasan) async {
  var url = Uri.parse('http://127.0.0.1:8000/Admin/set-ditolak-pelaku-usaha-mobile');
  Map data = {};
  data['namaLengkap'] = namaLengkap;
  data['nomorTeleponPemilik'] = nomorTeleponPemilik;
  data['alamatPemilik'] = alamatPemilik;
  data['nik'] = nik;
  data['alasan'] = alasan;
  http.Response response = await http.post(
    url,
    headers: {"Content-Type": 'application/json; charset=UTF-8'},
    body: json.encode(data)
  );
}