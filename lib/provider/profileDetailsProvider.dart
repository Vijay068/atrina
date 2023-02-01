import 'dart:convert';

import 'package:atrina/model/profileDetailsModel.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class profileDetials extends ChangeNotifier {
  List<String> profiledetailslist = [];
  List<ProfileDetailsModel> profiledetailsmodelList = [];
  void readData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("PROFILEDETAILS")) {
      profiledetailslist = prefs.getStringList("PROFILEDETAILS") ?? [];
      print(profiledetailslist.length);
      for (int i = 0; i < profiledetailslist.length; i++) {
        String temp = profiledetailslist[i];
        Map<String, dynamic> map = jsonDecode(temp);
        ProfileDetailsModel model = ProfileDetailsModel.fromJson(map);
        profiledetailsmodelList.add(model);
        print(profiledetailsmodelList.length);
      }
    }
  }

  notifyListeners();

  void saveData(ProfileDetailsModel object) async {
    Map<String, dynamic> map = object.toJson();
    String str = jsonEncode(map);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    profiledetailslist.add(str);
    prefs.setStringList("PROFILEDETAILS", profiledetailslist);
    notifyListeners();
  }
}
