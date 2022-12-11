import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:si_solo/info_kebutuhan/model/kebutuhan.dart';

Future<List<Kebutuhan>> fetchKebutuhan() async {
  var url = Uri.parse('https://si-solo.up.railway.app/info-kebutuhan-pokok/manage-json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<Kebutuhan> listKebutuhan = [];
  for (var element in data){
    if (element != null){
      listKebutuhan.add(Kebutuhan.fromJson(element));
    }
  }

  return listKebutuhan;
}