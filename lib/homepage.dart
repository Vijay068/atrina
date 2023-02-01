import 'dart:developer';

import 'package:atrina/constant/clickButton.dart';
import 'package:atrina/constant/primaryTextField.dart';
import 'package:atrina/constant/validator.dart';
import 'package:atrina/pages/dashboard.dart';
import 'package:atrina/pages/friendPage.dart';

import 'package:atrina/pages/profile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List pages = [
    DashBaord(),
    FriendsPage(),
    profilePage(),
  ];
  int _currentIndex = 0;

  void onTap(int index) {
    setState(() {
      _currentIndex = index;
      log("$_currentIndex");
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTap,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Friends App',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_add),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
