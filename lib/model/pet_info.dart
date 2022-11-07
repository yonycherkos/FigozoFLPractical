// To parse this JSON data, do
//
//     final petInfo = petInfoFromJson(jsonString);

import 'dart:convert';

PetInfo petInfoFromJson(String str) => PetInfo.fromJson(json.decode(str));

String petInfoToJson(PetInfo data) => json.encode(data.toJson());

class PetInfo {
  PetInfo({
    required this.name,
    required this.photo,
    required this.age,
    required this.weight,
    required this.description,
  });

  String name;
  String photo;
  int age;
  int weight;
  String description;

  factory PetInfo.fromJson(Map<String, dynamic> json) => PetInfo(
        name: json["name"],
        photo: json["photo"],
        age: json["age"],
        weight: json["weight"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "photo": photo,
        "age": age,
        "weight": weight,
        "description": description,
      };
}
