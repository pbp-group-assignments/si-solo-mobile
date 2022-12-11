// To parse this JSON data, do
//
//     final stopPoint = StopPointFromJson(jsonString);

import 'dart:convert';

List<StopPoint> stopPointFromJson(String str) => List<StopPoint>.from(json.decode(str).map((x) => StopPoint.fromJson(x)));

String stopPointToJson(List<StopPoint> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StopPoint {
    StopPoint({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory StopPoint.fromJson(Map<String, dynamic> json) => StopPoint(
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
        required this.route,
        required this.stopName,
        required this.stopLocation,
    });

    int route;
    String stopName;
    String stopLocation;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        route: json["route"],
        stopName: json["stop_name"],
        stopLocation: json["stop_location"],
    );

    Map<String, dynamic> toJson() => {
        "route": route,
        "stop_name": stopName,
        "stop_location": stopLocation,
    };
}