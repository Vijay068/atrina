import 'dart:convert';
import 'dart:developer';
import 'package:atrina/constant/clickButton.dart';
import 'package:atrina/constant/primaryTextField.dart';
import 'package:atrina/constant/validator.dart';
import 'package:atrina/model/profileDetailsModel.dart';
import 'package:atrina/profile/login.dart';
import 'package:atrina/provider/profileDetailsProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _value = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneNoController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool obscure = true;

  SharedPreferences? sharedPreferences;

  late profileDetials profileDetailsProvider;
  @override
  void initState() {
    super.initState();
    profileDetailsProvider = Provider.of(context, listen: false);
    profileDetailsProvider.readData();
  }

  void saveData() async {
    ProfileDetailsModel object = ProfileDetailsModel(
      name: _nameController.text,
      email: _emailController.text,
      password: _passwordController.text,
    );
    print("${object.toJson()}");
    profileDetailsProvider.saveData(object);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("Register"),
              automaticallyImplyLeading: false,
              centerTitle: true,
            ),
            body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PrimaryTextField(
                            title: "Full Name",
                            subtitle: "Full Name",
                            validator: Validator,
                            controller: _nameController,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          PrimaryTextField(
                              title: "Email",
                              subtitle: "Email",
                              controller: _emailController,
                              validator: emailValidator),
                          SizedBox(
                            height: 16,
                          ),
                          PrimaryTextField(
                              title: "Password",
                              subtitle: "Password",
                              controller: _passwordController,
                              validator: passwordValidator),
                          SizedBox(
                            height: 20,
                          ),
                          clickButton(
                              title: "Register",
                              color: Colors.blue,
                              onPressed: _value
                                  ? () async {
                                      if (formKey.currentState!.validate()) {
                                        formKey.currentState!.save();
                                        saveData();
                                        await showDialog(
                                            context: context,
                                            builder: (_) => AlertDialog(
                                                  content: Text("Data Saved"),
                                                ));
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => login(),
                                            ));
                                      }
                                    }
                                  : null),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Center(
                                    child: Text(
                                        "Do you already have an account ?")),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => login()));
                                    },
                                    child: Text("Login")),
                              ]),
                        ]),
                  ),
                ))));
  }
}
