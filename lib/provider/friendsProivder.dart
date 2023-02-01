import 'dart:developer';

import 'package:atrina/model/friends_model.dart';
import 'package:atrina/utils/dbHelper.dart';
import 'package:flutter/material.dart';

class FriendsProivder extends ChangeNotifier {
  List<FriendsModel> addressList = [];

  var isLoading = false;
  setIsLoading(bool status) {
    isLoading = status;
    notifyListeners();
  }

  readData() async {
    addressList = [];
    setIsLoading(true);
    List<Map<String, dynamic>> data = await MyDatabaseHelper.readData(
        "Select * from ${MyDatabaseHelper.TABLE_NAME}");
    log("${data}");

    for (Map<String, dynamic> element in data) {
      addressList.add(FriendsModel.fromJson(element));
    }
    setIsLoading(false);
    notifyListeners();
  }

  insertData(String name, int mobNo, String address, String landmark,
      int pincode) async {
    String query =
        "insert into ${MyDatabaseHelper.TABLE_NAME}(name,mobNo,address,landmark,pincode) values('$name','$mobNo','$address','$landmark','$pincode')";
    int result = await MyDatabaseHelper.insertData(query);
    log("$result");
  }

  updateData(int id, String name, int mobNo, String address, String landmark,
      int pincode) async {
    String query =
        "update ${MyDatabaseHelper.TABLE_NAME} set  name='$name' , mobNo ='$mobNo',address='$address',landmark ='$landmark',pincode='$pincode' where id='$id'";
    int result = await MyDatabaseHelper.updateData(query);
    log("$result");
  }

  delete(int id) async {
    String query = "delete from ${MyDatabaseHelper.TABLE_NAME} where id='$id'";
    int result = await MyDatabaseHelper.deleteData(query);
    log("$result");
    await readData();
  }
}
