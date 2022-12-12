import 'dart:convert';

List<KebutuhanModel> kebutuhanModelFromJson(String str) => List<KebutuhanModel>.from(json.decode(str).map((x) => KebutuhanModel.fromJson(x)));

String kebutuhanModelToJson(List<KebutuhanModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KebutuhanModel{
  String tokoKebutuhan;
  String namaKebutuhan;
  String hargaKebutuhan;
  String deskripsiKebutuhan;

  KebutuhanModel({
    required this.tokoKebutuhan,
    required this.namaKebutuhan,
    required this.hargaKebutuhan,
    required this.deskripsiKebutuhan,
  });

  factory KebutuhanModel.fromJson(Map<String, dynamic> json) => KebutuhanModel(
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