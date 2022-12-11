import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> daftarPengaduan(String masalah, String deskripsiMasalah) async {
  var url = Uri.parse('https://si-solo.up.railway.app/layanan-pengaduan/');
  Map data = {};
  data['masalah'] = masalah;
  data['deskripsiMasalah'] = deskripsiMasalah;
  http.Response response = await http.post(
    url,
    headers: {"Content-Type": 'application/json; charset=UTF-8'},
    body: json.encode(data)
  );
}