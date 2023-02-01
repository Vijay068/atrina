import 'package:atrina/apicall/getHogwartsCharacterCall.dart';
import 'package:atrina/model/hogwartsCharactersModel.dart';
import 'package:flutter/cupertino.dart';

class HogwartsCharacterProvider with ChangeNotifier {
  List<HogwartsCharactersModel> result = [];
  Future<void> FetchData() async {
    try {
      result = await MyRequest().MyGetRequest();
    } catch (e) {
      result = [];
    } finally {
      notifyListeners();
    }
  }
}
