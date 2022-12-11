// To parse this JSON data, do
//
//     final healthCenter = healthCenterFromJson(jsonString);

import 'dart:convert';

List<HealthCenter> healthCenterFromJson(String str) => List<HealthCenter>.from(json.decode(str).map((x) => HealthCenter.fromJson(x)));

String healthCenterToJson(List<HealthCenter> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HealthCenter {
    HealthCenter({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory HealthCenter.fromJson(Map<String, dynamic> json) => HealthCenter(
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
        required this.name,
        required this.address,
        required this.locationUrl,
        required this.contact,
        required this.image,
    });

    String name;
    String address;
    String locationUrl;
    String contact;
    String image;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        name: json["name"],
        address: json["address"],
        locationUrl: json["location_url"],
        contact: json["contact"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "address": address,
        "location_url": locationUrl,
        "contact": contact,
        "image": image,
    };
}
