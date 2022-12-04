import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:si_solo/pendaftaran_izin_usaha/model/usaha.dart';

Future<List<Usaha>> fetchSemuaUsaha() async {
  var url = Uri.parse('https://si-solo.up.railway.app/daftar-usaha/semua-usaha-json');
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

Future<void> pendaftaranDiproses(String namaLengkap, String nomorTeleponPemilik, String alamatPemilik, String namaUsaha, String jenisUsaha, String alamatUsaha, String nomorTeleponUsaha) async {
  var url = Uri.parse('https://si-solo.up.railway.app/Admin/set-diproses-pendaftaran-mobile');
  Map data = {};
  data['namaLengkap'] = namaLengkap;
  data['nomorTeleponPemilik'] = nomorTeleponPemilik;
  data['alamatPemilik'] = alamatPemilik;
  data['namaUsaha'] = namaUsaha;
  data['jenisUsaha'] = jenisUsaha;
  data['alamatUsaha'] = alamatUsaha;
  data['nomorTeleponUsaha'] = nomorTeleponUsaha;
  http.Response response = await http.post(
    url,
    headers: {"Content-Type": 'application/json; charset=UTF-8'},
    body: json.encode(data)
  );
}

Future<void> pendaftaranDisetujui(String namaLengkap, String nomorTeleponPemilik, String alamatPemilik, String namaUsaha, String jenisUsaha, String alamatUsaha, String nomorTeleponUsaha, String nomorIzinUsaha) async {
  var url = Uri.parse('https://si-solo.up.railway.app/Admin/set-diterima-pendaftaran-mobile');
  Map data = {};
  data['namaLengkap'] = namaLengkap;
  data['nomorTeleponPemilik'] = nomorTeleponPemilik;
  data['alamatPemilik'] = alamatPemilik;
  data['namaUsaha'] = namaUsaha;
  data['jenisUsaha'] = jenisUsaha;
  data['alamatUsaha'] = alamatUsaha;
  data['nomorTeleponUsaha'] = nomorTeleponUsaha;
  data['nomorIzinUsaha'] = nomorIzinUsaha;
  http.Response response = await http.post(
    url,
    headers: {"Content-Type": 'application/json; charset=UTF-8'},
    body: json.encode(data)
  );
}

Future<void> pendaftaranDitolak(String namaLengkap, String nomorTeleponPemilik, String alamatPemilik, String namaUsaha, String jenisUsaha, String alamatUsaha, String nomorTeleponUsaha, String alasanDitolak) async {
  var url = Uri.parse('https://si-solo.up.railway.app/Admin/set-ditolak-pendaftaran-mobile');
  Map data = {};
  data['namaLengkap'] = namaLengkap;
  data['nomorTeleponPemilik'] = nomorTeleponPemilik;
  data['alamatPemilik'] = alamatPemilik;
  data['namaUsaha'] = namaUsaha;
  data['jenisUsaha'] = jenisUsaha;
  data['alamatUsaha'] = alamatUsaha;
  data['nomorTeleponUsaha'] = nomorTeleponUsaha;
  data['alasanDitolak'] = alasanDitolak;
  http.Response response = await http.post(
    url,
    headers: {"Content-Type": 'application/json; charset=UTF-8'},
    body: json.encode(data)
  );
}