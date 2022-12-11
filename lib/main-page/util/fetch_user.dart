import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:si_solo/main-page/model/user.dart';

Future<void> fetchLogin(String username, String password) async {
  var url = Uri.parse('https://si-solo.up.railway.app/login_mobile/');
  Map data = {};
  data['username'] = username;
  data['password'] = password;
  http.Response response = await http.post(url,
      headers: {"Content-Type": 'application/json; charset=UTF-8'},
      body: json.encode(data));

  var dataResponse = jsonDecode(utf8.decode(response.bodyBytes));

  if (dataResponse['status'] == 'register') {
    UserLogin.listUserLogin.add(User(
        status: dataResponse['status'],
        username: dataResponse['fields']['username'],
        role: dataResponse['fields']['role'],
        namaLengkap: dataResponse['fields']['namaLengkap'],
        nomorTeleponPemilik: dataResponse['fields']['nomorTeleponPemilik'],
        alamatPemilik: dataResponse['fields']['alamatPemilik']));
  } else {
    UserLogin.listUserLogin.add(User(
        status: dataResponse['status'],
        username: "",
        role: "",
        namaLengkap: "",
        nomorTeleponPemilik: "",
        alamatPemilik: ""));
  }
}

Future<void> registerUser(String username, String password) async {
  var url = Uri.parse('http://si-solo.up.railway/register_mobile/');
  Map data = {};
  data['username'] = username;
  data['password'] = password;
  http.Response response = await http.post(url,
      headers: {"Content-Type": 'application/json; charset=UTF-8'},
      body: json.encode(data));
}

Future<void> editUser(String role, String namaLengkap,
    String nomorTeleponPemilik, String alamatPemilik) async {
  var url = Uri.parse('http://si-solo.up.railway/edit_user_mobile/');
  Map data = {};
  data['role'] = role;
  data['namaLengkap'] = namaLengkap;
  data['nomorTeleponPemilik'] = nomorTeleponPemilik;
  data['alamatPemilik'] = alamatPemilik;
  http.Response response = await http.post(url,
      headers: {"Content-Type": 'application/json; charset=UTF-8'},
      body: json.encode(data));
}
