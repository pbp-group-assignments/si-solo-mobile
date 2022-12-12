import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../info_wisata/model/show_tempat_wisata.dart';

Future<List<TempatWisataModel>> fetchInfoWisata() async {
  var url = Uri.parse('https://si-solo.up.railway.app/Admin/list-wisata-json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<TempatWisataModel> listTempatWisata = [];

  for (var d in data) {
    if (d != null) {
      listTempatWisata.add(TempatWisataModel.fromJson(d));
    }
  }
  return listTempatWisata;
}
