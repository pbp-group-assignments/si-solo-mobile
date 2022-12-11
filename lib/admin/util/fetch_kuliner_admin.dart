import 'package:http/http.dart' as http;
import 'package:si_solo/info_kuliner/model/show_tempat_kuliner.dart';
import 'dart:convert';

Future<List<TempatKulinerModel>> fetchInfoKuliner() async {
  var url = Uri.parse('https://si-solo.up.railway.app/tempat-kuliner/manage-json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<TempatKulinerModel> listTempatKuliner = [];

  for (var d in data) {
    if (d != null) {
      listTempatKuliner.add(TempatKulinerModel.fromJson(d));
    }
  }
  return listTempatKuliner;
}