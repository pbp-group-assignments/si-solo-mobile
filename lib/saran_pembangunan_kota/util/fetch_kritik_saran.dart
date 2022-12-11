import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> daftarKritikSaran(String nama, String email, String kritikSaran) async {
  var url = Uri.parse('https://si-solo.up.railway.app/saran-pembangunan-kota/');
  Map data = {};
  data['nama'] = nama;
  data['email'] = email;
  data['kritikSaran'] = kritikSaran;
  http.Response response = await http.post(
    url,
    headers: {"Content-Type": 'application/json; charset=UTF-8'},
    body: json.encode(data)
  );
}