import 'package:atrina/model/exchangeRateModel.dart';
import 'package:atrina/model/hogwartsCharactersModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyExchangeRateRequest {
  Future<dynamic> MyGetExchangeRateRequest() async {
    try {
      http.Response response = await http.get(Uri.parse(
          " https://v6.exchangerate-api.com/v6/46762d53f3fc4bd85f45aa22/latest/USD"));
      if (response.statusCode == 200) {
        ExchangeRateModel result = exchangeRateModelFromJson(response.body);
        return result;
      } else {
        return Future.error("Something went wrong");
      }
    } catch (e) {
      rethrow;
    }
  }
}
