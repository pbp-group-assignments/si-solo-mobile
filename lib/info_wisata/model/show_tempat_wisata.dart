// To parse this JSON data, do
//
//     final tempatWisataModel = tempatWisataModelFromJson(jsonString);

import 'dart:convert';

List<TempatWisataModel> tempatWisataModelFromJson(String str) => List<TempatWisataModel>.from(json.decode(str).map((x) => TempatWisataModel.fromJson(x)));

String tempatWisataModelToJson(List<TempatWisataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TempatWisataModel {
  TempatWisataModel({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory TempatWisataModel.fromJson(Map<String, dynamic> json) => TempatWisataModel(
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
    required this.tempatWisata,
    required this.namaWisata,
    required this.hargaWisata,
    required this.deskripsiWisata,
  });

  int tempatWisata;
  String namaWisata;
  String hargaWisata;
  String deskripsiWisata;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    tempatWisata: json["tempatWisata"],
    namaWisata: json["namaWisata"],
    hargaWisata: json["hargaWisata"],
    deskripsiWisata: json["deskripsiWisata"],
  );

  Map<String, dynamic> toJson() => {
    "tempatWisata": tempatWisata,
    "namaWisata": namaWisata,
    "hargaWisata": hargaWisata,
    "deskripsiWisata": deskripsiWisata,
  };
}
