import 'package:flutter/material.dart';

import 'dart:convert';

ProfileDetailsModel profileDetailsModelFromJson(String str) =>
    ProfileDetailsModel.fromJson(json.decode(str));

String profileDetailsModelToJson(ProfileDetailsModel data) =>
    json.encode(data.toJson());

class ProfileDetailsModel {
  ProfileDetailsModel({
    this.name,
    this.email,
    this.password,
  });
  String? name;
  String? password;
  String? email;

  factory ProfileDetailsModel.fromJson(Map<String, dynamic> json) =>
      ProfileDetailsModel(
        name: json["name"],
        password: json["password"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "password": password,
        "email": email,
      };
}
