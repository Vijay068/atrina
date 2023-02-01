import 'package:atrina/pages/friendDetails.dart';
import 'package:atrina/pages/friendsCreate.dart';
import 'package:atrina/model/friends_model.dart';
import 'package:atrina/provider/friendsProivder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({super.key});

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  late FriendsProivder provider;

  @override
  void initState() {
    super.initState();
    provider = Provider.of<FriendsProivder>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      provider.readData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FriendsCreate(),
                      ));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      color: Colors.deepOrange,
                      padding: EdgeInsets.all(10),
                      child: Text("Add Friend")),
                ))
          ],
          title: Text("Friends List"),
          centerTitle: true,
        ),
        body: Consumer<FriendsProivder>(
            builder: (context, _, child) => provider.isLoading
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: provider.addressList.length,
                    itemBuilder: (context, index) {
                      FriendsModel model = provider.addressList[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 3,
                          //  shadowColor: Colors.black,
                          //  color: Colors.greenAccent[100],
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /* Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Friend",
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
                                                            id: model.id),
                                                  ));
                                            },
                                            icon: Icon(Icons.edit)),
                                        IconButton(
                                            onPressed: () async {
                                              var result = await showDialog(
                                                context: context,
                                                builder: ((context) =>
                                                    AlertDialog(
                                                      content: Text(
                                                          "Are you sure want to delete the Address?"),
                                                      actions: [
                                                        TextButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context,
                                                                  true);
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
                                                provider.delete(model.id!);
                                              } else {}
                                            },
                                            icon: Icon(Icons.delete)),
                                      ],
                                    ),
                                  ],
                                ),*/
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                FriendsDetailsCard(
                                                    friendsModel: model)));
                                  },
                                  child: Row(
                                    children: [
                                      Text("ID:${model.id}"),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text("Name:${model.name}"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )));
  }
}
