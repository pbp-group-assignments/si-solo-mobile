// To parse this JSON data, do
//
//     final transportation = TransportationFromJson(jsonString);

import 'dart:convert';

List<Transportation> transportationFromJson(String str) => List<Transportation>.from(json.decode(str).map((x) => Transportation.fromJson(x)));

String transportationToJson(List<Transportation> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Transportation {
    Transportation({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory Transportation.fromJson(Map<String, dynamic> json) => Transportation(
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
        required this.image,
        required this.description,
    });

    String name;
    String image;
    String description;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        name: json["name"],
        image: json["image"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "description": description,
    };
}