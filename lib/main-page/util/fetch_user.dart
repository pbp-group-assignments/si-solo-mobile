import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:si_solo/main-page/model/user.dart';

// Future<List<WatchList>> fetchWatchList() async {
//   var url = Uri.parse('https://katalog-project-django.herokuapp.com/mywatchlist/json/');
  // var response = await http.get(
  //   url,
  //   headers: {
  //     "Access-Control-Allow-Origin": "*",
  //     "Content-Type": "application/json",
  //   },
  // );

//   var data = jsonDecode(utf8.decode(response.bodyBytes));

//   List<WatchList> listWatch = [];
//   for (var d in data){
//     if (d != null){
//       listWatch.add(WatchList.fromJson(d));
//     }
//   }

//   return listWatch;
// }

Future<void> fetchLogin(String username, String password) async{
    var url = Uri.parse('https://si-solo.up.railway.app/login_mobile/');
    Map data = {};
    data['username'] = username;
    data['password'] = password;
    http.Response response = await http.post(
      url,
      headers: {"Content-Type": 'application/json; charset=UTF-8'},
      body: json.encode(data)
    );

    var dataResponse = jsonDecode(utf8.decode(response.bodyBytes));

    if (dataResponse['status'] == 'register'){
      UserLogin.listUserLogin.add(User(status: dataResponse['status'], username: dataResponse['fields']['username'], role: dataResponse['fields']['role'], namaLengkap: dataResponse['fields']['namaLengkap'], nomorTeleponPemilik: dataResponse['fields']['nomorTeleponPemilik'], alamatPemilik: dataResponse['fields']['alamatPemilik']));
    }else{
      UserLogin.listUserLogin.add(User(status: dataResponse['status'], username: "", role: "", namaLengkap: "", nomorTeleponPemilik: "", alamatPemilik: ""));
    }
  }