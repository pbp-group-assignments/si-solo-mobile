import 'dart:convert';

List<Kebutuhan> KebutuhanFromJson(String str) => List<Kebutuhan>.from(json.decode(str).map((x) => Kebutuhan.fromJson(x)));

String KebutuhanToJson(List<Kebutuhan> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Kebutuhan{
  String tokoKebutuhan;
  String namaKebutuhan;
  String hargaKebutuhan;
  String deskripsiKebutuhan;

  Kebutuhan({
    required this.tokoKebutuhan;
    required this.namaKebutuhan;
    required this.hargaKebutuhan;
    required this.deskripsiKebutuhan;
  });

  factory Kebutuhan.fromJson(Map<String, dynamic> json) => Kebutuhan(
    tokoKebutuhan: json["fields"]["tokoKebutuhan"], 
    namaKebutuhan: json["fields"]["namaKebutuhan"], 
    hargaKebutuhan: json["fields"]["hargaKebutuhan"], 
    deskripsiKebutuhan: json["fields"]["deskripsiKebutuhan"], 
  );

  Map<String, dynamic> toJson() =>{
    "tokoKebutuhan": tokoKebutuhan,
    "namaKebutuhan": namaKebutuhan,
    "hargaKebutuhan": hargaKebutuhan,
    "deskripsiKebutuhan": deskripsiKebutuhan,
  };
}