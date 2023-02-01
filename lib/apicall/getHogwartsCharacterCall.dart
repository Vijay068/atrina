import 'package:atrina/model/hogwartsCharactersModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyRequest {
  Future<dynamic> MyGetRequest() async {
    try {
      http.Response response = await http.get(
          Uri.parse("https://hp-api.onrender.com/api/characters/students"));
      if (response.statusCode == 200) {
        List<HogwartsCharactersModel> result =
            hogwartsCharactersModelFromJson(response.body);
        return result;
      } else {
        return Future.error("Something went wrong");
      }
    } catch (e) {
      rethrow;
    }
  }
}
