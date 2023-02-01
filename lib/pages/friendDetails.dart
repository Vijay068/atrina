import 'package:atrina/model/friends_model.dart';
import 'package:atrina/pages/friendsCreate.dart';
import 'package:atrina/provider/friendsProivder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:atrina/apicall/getHogwartsCharacterCall.dart';
import 'package:atrina/model/hogwartsCharactersModel.dart';
import 'package:atrina/provider/hogwartsCharactersProvider.dart';

class FriendsDetailsCard extends StatefulWidget {
  final FriendsModel friendsModel;
  const FriendsDetailsCard({
    Key? key,
    required this.friendsModel,
  }) : super(key: key);

  @override
  State<FriendsDetailsCard> createState() => _FriendsDetailsCardState();
}

class _FriendsDetailsCardState extends State<FriendsDetailsCard> {
  late FriendsProivder provider;
  @override
  void initState() {
    provider = Provider.of<FriendsProivder>(context, listen: false);
    provider.readData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("Friends Details"),
              centerTitle: true,
            ),
            body: Card(
              elevation: 2,
              shape: OutlineInputBorder(),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Friend Details",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    FriendsCreate(
                                                        id: widget
                                                            .friendsModel.id),
                                              ));
                                        },
                                        icon: Icon(Icons.edit)),
                                    IconButton(
                                        onPressed: () async {
                                          var result = await showDialog(
                                            context: context,
                                            builder: ((context) => AlertDialog(
                                                  content: Text(
                                                      "Are you sure want to delete the Address?"),
                                                  actions: [
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context, true);
                                                        },
                                                        child: Text("Yes")),
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                            context,
                                                          );
                                                        },
                                                        child: Text("No"))
                                                  ],
                                                )),
                                          );
                                          if (result != null) {
                                            await provider.delete(
                                                widget.friendsModel.id!);
                                            Navigator.pop(
                                              context,
                                            );
                                          } else {}
                                        },
                                        icon: Icon(Icons.delete)),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Name:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red),
                                    ),
                                    Text(
                                      "${widget.friendsModel.name}",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Address:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red),
                                    ),
                                    Text(
                                      "${widget.friendsModel.address}",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Mobile Number:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red),
                                    ),
                                    Text(
                                      "${widget.friendsModel.mobNo}",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Landmark:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red),
                                    ),
                                    Text(
                                      "${widget.friendsModel.landmark}",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "PinCode:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red),
                                    ),
                                    Text(
                                      "${widget.friendsModel.pincode}",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ]),
                    ),
                  ),
                ]),
              ),
            )));
  }
}
