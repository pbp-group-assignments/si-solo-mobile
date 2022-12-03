import 'dart:convert';

List<StatusPelakuUsaha> statusPelakuUsahaFromJson(String str) => List<StatusPelakuUsaha>.from(json.decode(str).map((x) => StatusPelakuUsaha.fromJson(x)));

String statusPelakuUsahaToJson(List<StatusPelakuUsaha> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StatusPelakuUsaha{
  String message = "";
  String status = "";
  String pesan = "";

  StatusPelakuUsaha({
    required this.message,
    required this.status,
    required this.pesan,
  });

  factory StatusPelakuUsaha.fromJson(Map<String, dynamic> json) => StatusPelakuUsaha(
    message: json["message"],
    status: json["status"],
    pesan: json["pesan"],
  );

  Map<String, dynamic> toJson() =>{
    "message": message,
    "status": status,
    "pesan": pesan,
  };
}