import 'dart:convert';

List<Pengaduan> PengaduanFromJson(String str) => List<Pengaduan>.from(json.decode(str).map((x) => Pengaduan.fromJson(x)));

String PengaduanToJson(List<Pengaduan> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pengaduan{
  String masalah;
  String deskripsiMasalah;

  Pengaduan({
    required this.masalah,
    required this.deskripsiMasalah,
  });

  factory Pengaduan.fromJson(Map<String, dynamic> json) => Pengaduan(
    masalah: json["fields"]["masalah"], 
    deskripsiMasalah: json["fields"]["deskripsiMasalah"], 
  );

  Map<String, dynamic> toJson() =>{
    "masalah": masalah,
    "deskripsiMasalah": deskripsiMasalah,
  };
}