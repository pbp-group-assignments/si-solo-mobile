import 'package:http/http.dart' as http;
import 'package:si_solo/info_kebutuhan/model/kebutuhan.dart';
import 'dart:convert';

Future<List<KebutuhanModel>> fetchKebutuhan() async {
  var url = Uri.parse('https://si-solo.up.railway.app/info-kebutuhan-pokok/manage-json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<KebutuhanModel> listKebutuhan = [];

  for (var d in data) {
    if (d != null) {
      listKebutuhan.add(KebutuhanModel.fromJson(d));
    }
  }
  return listKebutuhan;
}