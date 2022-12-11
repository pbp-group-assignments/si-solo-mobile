// To parse this JSON data, do
//
//     final tempatKulinerModel = tempatKulinerModelFromJson(jsonString);

import 'dart:convert';

List<TempatKulinerModel> tempatKulinerModelFromJson(String str) => List<TempatKulinerModel>.from(json.decode(str).map((x) => TempatKulinerModel.fromJson(x)));

String tempatKulinerModelToJson(List<TempatKulinerModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TempatKulinerModel {
  TempatKulinerModel({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory TempatKulinerModel.fromJson(Map<String, dynamic> json) => TempatKulinerModel(
    model: json["model"],
    pk: json["pk"],
    fields: Fields.fromJson(json["fields"]),
  );

  Map<String, dynamic> toJson() => {
    "model": model,
    "pk": pk,
    "fields": fields.toJson(),
  };
}

class Fields {
  Fields({
    required this.tempatKuliner,
    required this.namaMenu,
    required this.hargaMenu,
    required this.deskripsiMenu,
  });

  int tempatKuliner;
  String namaMenu;
  String hargaMenu;
  String deskripsiMenu;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    tempatKuliner: json["tempatKuliner"],
    namaMenu: json["namaMenu"],
    hargaMenu: json["hargaMenu"],
    deskripsiMenu: json["deskripsiMenu"],
  );

  Map<String, dynamic> toJson() => {
    "tempatKuliner": tempatKuliner,
    "namaMenu": namaMenu,
    "hargaMenu": hargaMenu,
    "deskripsiMenu": deskripsiMenu,
  };
}
