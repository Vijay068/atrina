import 'package:atrina/constant/clickButton.dart';
import 'package:atrina/constant/primaryTextField.dart';
import 'package:atrina/constant/validator.dart';
import 'package:atrina/homepage.dart';
import 'package:atrina/model/profileDetailsModel.dart';
import 'package:atrina/profile/register.dart';
import 'package:atrina/provider/profileDetailsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  bool _value = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool obscure = true;
  Future<String?> validateUser() async {
    for (int i = 0;
        i < profileDetailsProvider.profiledetailsmodelList.length;
        i++) {
      ProfileDetailsModel obj =
          profileDetailsProvider.profiledetailsmodelList[i];
      print("${obj.email}");
      print("${obj.password}");
      if (obj.email == _emailController.text &&
          obj.password == _passwordController.text) {
        await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ));
      } else {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  content: Text("Login Failed"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("OK"))
                  ],
                ));
      }
    }
    return null;
  }

  late profileDetials profileDetailsProvider;

  @override
  void initState() {
    super.initState();
    profileDetailsProvider = Provider.of(context, listen: false);
    profileDetailsProvider.readData();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Login Page"),
            automaticallyImplyLeading: false,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Form(
                              key: formKey,
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    PrimaryTextField(
                                      title: "Email",
                                      subtitle: "Email",
                                      controller: _emailController,
                                      validator: emailValidator,
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    PrimaryTextField(
                                      title: "Password",
                                      subtitle: "Password",
                                      controller: _passwordController,
                                      validator: passwordValidator,
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    clickButton(
                                        title: "Login",
                                        color: Colors.blue,
                                        onPressed: () {
                                          validateUser();
                                        }),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Center(child: Text("Do you have an account ?")),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Register()));
                                    },
                                    child: Text("Register")),
                              ],
                            )
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
