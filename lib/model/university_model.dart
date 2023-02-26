// To parse this JSON data, do
//
//     final university = universityFromJson(jsonString);

import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

part 'university_model.g.dart';

@HiveType(typeId: 0)
class UniverResponse extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final List<University> univers;

  UniverResponse({required this.univers, required this.name});

  factory UniverResponse.fromJson({required dynamic data, required String name}) {
    List<University> listOfUniver = [];
    data.forEach((value) {
      listOfUniver.add(University.fromJson(value));
    });
    return UniverResponse(univers: listOfUniver, name: name);
  }
}

List<University> universityFromJson(String str) =>
    List<University>.from(json.decode(str).map((x) => University.fromJson(x)));

String universityToJson(List<University> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


@HiveType(typeId: 1)
class University extends HiveObject {
  University({
    this.domains,
    this.country,
    this.alphaTwoCode,
    this.webPages,
    this.stateProvince,
    this.name,
  });

  @HiveField(0)
  List<String>? domains;
  @HiveField(1)
  String? country;
  @HiveField(2)
  String? alphaTwoCode;
  @HiveField(3)
  List<String>? webPages;
  @HiveField(4)
  dynamic stateProvince;
  @HiveField(5)
  String? name;

  University copyWith({
    List<String>? domains,
    String? country,
    String? alphaTwoCode,
    List<String>? webPages,
    dynamic stateProvince,
    String? name,
  }) =>
      University(
        domains: domains ?? this.domains,
        country: country ?? this.country,
        alphaTwoCode: alphaTwoCode ?? this.alphaTwoCode,
        webPages: webPages ?? this.webPages,
        stateProvince: stateProvince ?? this.stateProvince,
        name: name ?? this.name,
      );

  factory University.fromJson(Map<String, dynamic> json) => University(
        domains: json["domains"] == null
            ? []
            : List<String>.from(json["domains"]!.map((x) => x)),
        country: json["country"],
        alphaTwoCode: json["alpha_two_code"],
        webPages: json["web_pages"] == null
            ? []
            : List<String>.from(json["web_pages"]!.map((x) => x)),
        stateProvince: json["state-province"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "domains":
            domains == null ? [] : List<dynamic>.from(domains!.map((x) => x)),
        "country": country,
        "alpha_two_code": alphaTwoCode,
        "web_pages":
            webPages == null ? [] : List<dynamic>.from(webPages!.map((x) => x)),
        "state-province": stateProvince,
        "name": name,
      };
}
