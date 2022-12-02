import 'dart:convert';

List<PelakuUsaha> pelakuUsahaFromJson(String str) => List<PelakuUsaha>.from(json.decode(str).map((x) => PelakuUsaha.fromJson(x)));

String pelakuUsahaToJson(List<PelakuUsaha> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PelakuUsaha{
  String namaPemilik;
  String nomorTeleponPemilik;
  String alamatPemilik;
  String nik;
  String status;
  String pesan;

  PelakuUsaha({
    required this.namaPemilik,
    required this.nomorTeleponPemilik,
    required this.alamatPemilik,
    required this.nik,
    required this.status,
    required this.pesan,
  });

  factory PelakuUsaha.fromJson(Map<String, dynamic> json) => PelakuUsaha(
    namaPemilik: json["fields"]["namaPemilik"], 
    nomorTeleponPemilik: json["fields"]["nomorTeleponPemilik"], 
    alamatPemilik: json["fields"]["alamatPemilik"], 
    nik: json["fields"]["nik"], 
    status: json["fields"]["status"],
    pesan: json["fields"]["pesan"],
  );

  Map<String, dynamic> toJson() =>{
    "namaPemilik": namaPemilik,
    "nomorTeleponPemilik": nomorTeleponPemilik,
    "alamatPemilik": alamatPemilik,
    "nik": nik,
    "status": status,
    "pesan": pesan,
  };
}