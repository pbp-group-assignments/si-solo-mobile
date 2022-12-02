import 'dart:convert';

List<Usaha> usahaFromJson(String str) => List<Usaha>.from(json.decode(str).map((x) => Usaha.fromJson(x)));

String usahaToJson(List<Usaha> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Usaha{
  String namaPemilik;
  String nomorTeleponPemilik;
  String alamatPemilik;
  String namaUsaha;
  String jenisUsaha;
  String alamatUsaha;
  String nomorTeleponUsaha;
  String statusPendaftaran;
  String nomorIzinUsaha;
  String alasanDitolak;

  Usaha({
    required this.namaPemilik,
    required this.nomorTeleponPemilik,
    required this.alamatPemilik,
    required this.namaUsaha,
    required this.jenisUsaha,
    required this.alamatUsaha,
    required this.nomorTeleponUsaha,
    required this.statusPendaftaran,
    required this.nomorIzinUsaha,
    required this.alasanDitolak,
  });

  factory Usaha.fromJson(Map<String, dynamic> json) => Usaha(
    namaPemilik: json["fields"]["namaPemilik"], 
    nomorTeleponPemilik: json["fields"]["nomorTeleponPemilik"], 
    alamatPemilik: json["fields"]["alamatPemilik"], 
    namaUsaha: json["fields"]["namaUsaha"], 
    jenisUsaha: json["fields"]["jenisUsaha"], 
    alamatUsaha: json["fields"]["alamatUsaha"], 
    nomorTeleponUsaha: json["fields"]["nomorTeleponUsaha"], 
    statusPendaftaran: json["fields"]["statusPendaftaran"], 
    nomorIzinUsaha: json["fields"]["nomorIzinUsaha"], 
    alasanDitolak: json["fields"]["alasanDitolak"], 
  );

  Map<String, dynamic> toJson() =>{
    "namaPemilik": namaPemilik,
    "nomorTeleponPemilik": nomorTeleponPemilik,
    "alamatPemilik": alamatPemilik,
    "namaUsaha": namaUsaha,
    "jenisUsaha": jenisUsaha,
    "alamatUsaha": alamatUsaha,
    "nomorTeleponUsaha": nomorTeleponUsaha,
    "statusPendaftaran": statusPendaftaran,
    "nomorIzinUsaha": nomorIzinUsaha,
    "alasanDitolak": alasanDitolak,
  };
}