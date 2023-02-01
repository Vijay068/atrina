import 'dart:async';

import 'package:atrina/model/hogwartsCharactersModel.dart';
import 'package:atrina/pages/Card.dart';
import 'package:atrina/provider/hogwartsCharactersProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashBaord extends StatefulWidget {
  const DashBaord({Key? key}) : super(key: key);

  @override
  State<DashBaord> createState() => _DashBaordState();
}

class _DashBaordState extends State<DashBaord>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  final List<Tab> topTabs = <Tab>[
    const Tab(
      icon: Icon(Icons.home_outlined),
    ),
    const Tab(
      icon: Icon(Icons.people_outlined),
    ),
  ];

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late HogwartsCharacterProvider provider;
  @override
  void initState() {
    provider = Provider.of<HogwartsCharacterProvider>(context, listen: false);
    provider.FetchData();

    _tabController =
        TabController(length: topTabs.length, initialIndex: 0, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _tabController!.animateTo(0);
        return false;
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("DashBoard"),
          centerTitle: true,
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: Colors.black,
            // ignore: prefer_const_literals_to_create_immutables
            tabs: [
              const Tab(
                text: "Hogwarts characters",
              ),
              const Tab(
                text: " Currency Conversion API",
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Container(
                color: Colors.grey,
                child: Consumer<HogwartsCharacterProvider>(
                    builder: (context, value, child) {
                  return ListView.builder(
                      itemCount: provider.result.length,
                      itemBuilder: ((context, index) {
                        HogwartsCharactersModel object = provider.result[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          HogwartsCharacterCard(
                                              hogwartsCharactersModel:
                                                  object))));
                            },
                            child: Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                padding: EdgeInsets.all(8),
                                child: Row(
                                  children: [
                                    Text("${index + 1}"),
                                    SizedBox(
                                        height: 100,
                                        width: 100,
                                        child:
                                            Image.network("${object.image}")),
                                    Text("Name:${object.name}"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }));
                })),
            Container(
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
