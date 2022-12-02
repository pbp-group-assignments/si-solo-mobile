import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:si_solo/pendaftaran_izin_usaha/model/usaha.dart';

Future<List<Usaha>> fetchUsaha() async {
  var url = Uri.parse('https://si-solo.up.railway.app/daftar-usaha/semua-usaha-json');
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