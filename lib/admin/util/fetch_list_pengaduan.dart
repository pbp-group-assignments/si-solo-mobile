import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:si_solo/layanan_pengaduan/model/pengaduan.dart';

Future<List<Pengaduan>> fetchPengaduan() async {
  var url = Uri.parse('https://si-solo.up.railway.app/Admin/pengaduan-json');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<Pengaduan> listPengaduan = [];
  for (var d in data){
    if (d != null){
      listPengaduan.add(Pengaduan.fromJson(d));
    }
  }

  return listPengaduan;
}