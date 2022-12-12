import 'dart:convert';

List<KebutuhanModel> kebutuhanModelFromJson(String str) => List<KebutuhanModel>.from(json.decode(str).map((x) => KebutuhanModel.fromJson(x)));

String kebutuhanModelToJson(List<KebutuhanModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KebutuhanModel {
  KebutuhanModel({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory KebutuhanModel.fromJson(Map<String, dynamic> json) => KebutuhanModel(
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
    required this.tokoKebutuhan,
    required this.namaKebutuhan,
    required this.hargaKebutuhan,
    required this.deskripsiKebutuhan,
  });

  String tokoKebutuhan;
  String namaKebutuhan;
  String hargaKebutuhan;
  String deskripsiKebutuhan;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    tokoKebutuhan: json["tokoKebutuhan"],
    namaKebutuhan: json["namaKebutuhan"],
    hargaKebutuhan: json["hargaKebutuhan"],
    deskripsiKebutuhan: json["deskripsiKebutuhan"],
  );

  Map<String, dynamic> toJson() => {
    "tokoKebutuhan": tokoKebutuhan,
    "namaKebutuhan": namaKebutuhan,
    "hargaKebutuhan": hargaKebutuhan,
    "deskripsiKebutuhan": deskripsiKebutuhan,
  };
}
