import 'package:atrina/constant/clickButton.dart';
import 'package:atrina/profile/login.dart';
import 'package:atrina/provider/profileDetailsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class profilePage extends StatelessWidget {
  const profilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Profile Page"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 100,
              child: clickButton(
                  title: "Logout",
                  color: Colors.red,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => login(),
                        ));
                  }),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Consumer<profileDetials>(
                builder: ((context, value, child) => ListView.builder(
                      itemCount: value.profiledetailsmodelList.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: ((context, index) => Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Name:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red),
                                      ),
                                      Text(
                                          "${value.profiledetailsmodelList[index].name}"),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Email:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red),
                                      ),
                                      Text(
                                          "${value.profiledetailsmodelList[index].email}"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
