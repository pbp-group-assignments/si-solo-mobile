import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:si_solo/pendaftaran_izin_usaha/model/pelaku_usaha.dart';

Future<List<PelakuUsaha>> fetchPelakuUsaha() async {
  var url = Uri.parse('https://si-solo.up.railway.app/Admin/pendaftaran-pelaku-usaha-json');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<PelakuUsaha> listPelakuUsaha = [];
  for (var d in data){
    if (d != null){
      listPelakuUsaha.add(PelakuUsaha.fromJson(d));
    }
  }

  return listPelakuUsaha;
}

// Future<PelakuUsaha> getStatusPendaftaran() async {
  // var url = Uri.parse('https://si-solo.up.railway.app/Admin/pendaftaran-pelaku-usaha-json');
  // var response = await http.get(
  //   url,
  //   headers: {
  //     "Access-Control-Allow-Origin": "*",
  //     "Content-Type": "application/json",
  //   },
  // );

  // var data = jsonDecode(utf8.decode(response.bodyBytes));

  // List<PelakuUsaha> listPelakuUsaha = [];
  // for (var d in data){
  //   if (d != null){
  //     listPelakuUsaha.add(PelakuUsaha.fromJson(d));
  //   }
  // }

  // return listPelakuUsaha;
// }