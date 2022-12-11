import 'dart:convert';

List<KritikSaran> KritikSaranFromJson(String str) => List<KritikSaran>.from(json.decode(str).map((x) => KritikSaran.fromJson(x)));

String KritikSaranToJson(List<KritikSaran> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KritikSaran{
  String nama;
  String email;
  String kritikSaran;

  KritikSaran({
    required this.nama,
    required this.email,
    required this.kritikSaran,
  });

  factory KritikSaran.fromJson(Map<String, dynamic> json) => KritikSaran(
    nama: json["fields"]["nama"], 
    email: json["fields"]["email"], 
    kritikSaran: json["fields"]["kritikSaran"], 
  );

  Map<String, dynamic> toJson() =>{
    "nama": nama,
    "email": email,
    "kritikSaran": kritikSaran,
  };
}