import 'package:atrina/constant/clickButton.dart';
import 'package:atrina/constant/primaryTextField.dart';
import 'package:atrina/constant/validator.dart';
import 'package:atrina/model/friends_model.dart';
import 'package:atrina/provider/friendsProivder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FriendsCreate extends StatefulWidget {
  int? id;
  FriendsCreate({super.key, this.id});

  @override
  State<FriendsCreate> createState() => _FriendsCreateState();
}

class _FriendsCreateState extends State<FriendsCreate> {
  late FriendsProivder _provider;
  late TextEditingController nameController,
      mobNoController,
      addressController,
      landmarkController,
      pincodeController;
  final GlobalKey<FormState> _formkey = GlobalKey();
  @override
  void initState() {
    super.initState();
    _provider = Provider.of<FriendsProivder>(context, listen: false);
    if (widget.id == null) {
      nameController = TextEditingController();
      mobNoController = TextEditingController();
      addressController = TextEditingController();
      landmarkController = TextEditingController();
      pincodeController = TextEditingController();
    } else {
      FriendsModel obj = _provider.addressList
          .firstWhere((element) => element.id == widget.id);
      nameController = TextEditingController(text: obj.name);
      mobNoController = TextEditingController(text: obj.mobNo.toString());
      addressController = TextEditingController(text: obj.address);
      landmarkController = TextEditingController(text: obj.landmark);
      pincodeController = TextEditingController(text: obj.pincode.toString());
    }
  }

  saveData() async {
    await _provider.insertData(
        nameController.text,
        int.parse(mobNoController.text),
        addressController.text,
        landmarkController.text,
        int.parse(pincodeController.text));
    await _provider.readData();
    Navigator.pop(context);
  }

  updateData() async {
    await _provider.updateData(
        widget.id!,
        nameController.text,
        int.parse(mobNoController.text),
        addressController.text,
        landmarkController.text,
        int.parse(pincodeController.text));
    await _provider.readData();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Friend"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formkey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  PrimaryTextField(
                      title: "Name",
                      subtitle: "Enter your name",
                      controller: nameController,
                      validator: Validator),
                  SizedBox(height: 10),
                  PrimaryTextField(
                      title: "Mobile Number",
                      subtitle: "Enter your Mobile Number",
                      controller: mobNoController,
                      validator: phoneNoValidator),
                  SizedBox(height: 10),
                  PrimaryTextField(
                      title: "Address",
                      subtitle: "Enter your Address",
                      controller: addressController,
                      validator: Validator),
                  SizedBox(height: 10),
                  PrimaryTextField(
                      title: "LandMark",
                      subtitle: "Enter your Landmark",
                      controller: landmarkController,
                      validator: Validator),
                  SizedBox(height: 10),
                  PrimaryTextField(
                      title: "PinCode",
                      subtitle: "Enter your Pincode",
                      controller: pincodeController,
                      validator: Validator),
                  SizedBox(height: 20),
                  widget.id == null
                      ? clickButton(
                          title: "Save",
                          color: Colors.blue,
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              saveData();
                            }
                          })
                      : clickButton(
                          title: "Update",
                          color: Colors.blue,
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              updateData();
                            }
                          })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
