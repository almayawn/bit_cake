// To parse this JSON data, do
//
//     final album = albumFromJson(jsonString);

import 'dart:convert';

List<Flower> flowerFromJson(String str) => List<Flower>.from(json.decode(str).map((x) => Flower.fromJson(x)));

String flowerToJson(List<Flower> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Flower {
  String model;
  int pk;
  Fields fields;

  Flower({
    required this.model,
    required this.pk,
    required this.fields,
  });

  factory Flower.fromJson(Map<String, dynamic> json) => Flower(
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
  String name;
  int amount;
  DateTime dateAdded;
  String description;
  int user;

  Fields({
    required this.name,
    required this.amount,
    required this.dateAdded,
    required this.description,
    required this.user,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    name: json["name"],
    amount: json["amount"],
    dateAdded: DateTime.parse(json["date_added"]),
    description: json["description"],
    user: json["user"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "amount": amount,
    "date_added": "${dateAdded.year.toString().padLeft(4, '0')}-${dateAdded.month.toString().padLeft(2, '0')}-${dateAdded.day.toString().padLeft(2, '0')}",
    "description": description,
    "user": user,
  };
}