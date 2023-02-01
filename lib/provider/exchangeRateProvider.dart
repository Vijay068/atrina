import 'package:atrina/apicall/exchnageRateCall.dart';
import 'package:atrina/apicall/getHogwartsCharacterCall.dart';
import 'package:atrina/model/exchangeRateModel.dart';
import 'package:atrina/model/hogwartsCharactersModel.dart';
import 'package:flutter/cupertino.dart';

class ExchangeRateProvider with ChangeNotifier {
  List<ExchangeRateModel> result = [];
  Future<void> FetchData() async {
    try {
      result = await MyExchangeRateRequest().MyGetExchangeRateRequest();
    } catch (e) {
      result = [];
    } finally {
      notifyListeners();
    }
  }
}
