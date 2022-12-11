import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  String status = "";
  String username = "";
  String role = "";
  String namaLengkap = "";
  String nomorTeleponPemilik = "";
  String alamatPemilik = "";

  User({
    required this.status,
    required this.username,
    required this.role,
    required this.namaLengkap,
    required this.nomorTeleponPemilik,
    required this.alamatPemilik,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
      status: json["status"],
      username: json["fields"]["username"],
      role: json["fields"]["role"],
      namaLengkap: json["fields"]["namaLengkap"],
      nomorTeleponPemilik: json["fields"]["nomorTeleponPemilik"],
      alamatPemilik: json["fields"]["alamatPemilik"]);

  Map<String, dynamic> toJson() => {
        "status": status,
        "username": username,
        "role": role,
        "namaLengkap": namaLengkap,
        "nomorTeleponPemilik": nomorTeleponPemilik,
        "alamatPemilik": alamatPemilik,
      };
}

class UserLogin {
  static List<User> listUserLogin = [];
  static User loggedInUser = User(
      status: "",
      username: "",
      role: "",
      namaLengkap: "",
      nomorTeleponPemilik: "",
      alamatPemilik: "");
}
