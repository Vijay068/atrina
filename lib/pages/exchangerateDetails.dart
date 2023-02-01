import 'package:atrina/model/exchangeRateModel.dart';
import 'package:atrina/provider/exchangeRateProvider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class ExchangeRateDetails extends StatefulWidget {
  const ExchangeRateDetails({super.key});

  @override
  State<ExchangeRateDetails> createState() => _ExchangeRateDetailsState();
}

class _ExchangeRateDetailsState extends State<ExchangeRateDetails> {
  late ExchangeRateProvider provider;
  @override
  void initState() {
    super.initState();
    provider = Provider.of<ExchangeRateProvider>(context, listen: false);
    provider.FetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("AppBar"),
        ),
        body: Container(child:
            Consumer<ExchangeRateProvider>(builder: (context, value, child) {
          return ListView.builder(
              itemCount: provider.result.length,
              itemBuilder: ((context, index) {
                ExchangeRateModel object = provider.result[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 5,
                    child: Container(
                      child: ListTile(
                        title: Text(
                          "${object.termsOfUse}",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                  ),
                );
              }));
        })));
  }
}
