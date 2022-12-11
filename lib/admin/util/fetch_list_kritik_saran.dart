import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:si_solo/saran_pembangunan_kota/model/kritik_saran.dart';

Future<List<KritikSaran>> fetchKritikSaran() async {
  var url = Uri.parse('https://si-solo.up.railway.app/Admin/saran-pembangunan-json');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<KritikSaran> listKritikSaran = [];
  for (var d in data){
    if (d != null){
      listKritikSaran.add(KritikSaran.fromJson(d));
    }
  }

  return listKritikSaran;
}