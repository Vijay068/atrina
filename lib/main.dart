import 'package:atrina/pages/exchangerateDetails.dart';
import 'package:atrina/pages/friendPage.dart';
import 'package:atrina/homepage.dart';
import 'package:atrina/profile/login.dart';
import 'package:atrina/profile/register.dart';
import 'package:atrina/provider/exchangeRateProvider.dart';
import 'package:atrina/provider/friendsProivder.dart';

import 'package:atrina/provider/hogwartsCharactersProvider.dart';
import 'package:atrina/provider/profileDetailsProvider.dart';
import 'package:atrina/utils/dbHelper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyDatabaseHelper.initDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HogwartsCharacterProvider()),
        ChangeNotifierProvider(create: (_) => FriendsProivder()),
        ChangeNotifierProvider(create: (_) => profileDetials()),
        ChangeNotifierProvider(create: (_) => ExchangeRateProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: login(),
      ),
    );
  }
}
