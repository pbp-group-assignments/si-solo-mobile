// To parse this JSON data, do
//
//     final route = RouteFromJson(jsonString);

import 'dart:convert';

List<Route> routeFromJson(String str) => List<Route>.from(json.decode(str).map((x) => Route.fromJson(x)));

String routeToJson(List<Route> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Route {
    Route({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory Route.fromJson(Map<String, dynamic> json) => Route(
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
        required this.transportation,
        required this.fromTo,
    });

    int transportation;
    String fromTo;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        transportation: json["transportation"],
        fromTo: json["from_to"],
    );

    Map<String, dynamic> toJson() => {
        "transportation": transportation,
        "from_to": fromTo,
    };
}