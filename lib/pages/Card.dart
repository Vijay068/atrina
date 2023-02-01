import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:atrina/apicall/getHogwartsCharacterCall.dart';
import 'package:atrina/model/hogwartsCharactersModel.dart';
import 'package:atrina/provider/hogwartsCharactersProvider.dart';

class HogwartsCharacterCard extends StatefulWidget {
  final HogwartsCharactersModel hogwartsCharactersModel;
  const HogwartsCharacterCard({
    Key? key,
    required this.hogwartsCharactersModel,
  }) : super(key: key);

  @override
  State<HogwartsCharacterCard> createState() => _HogwartsCharacterCardState();
}

class _HogwartsCharacterCardState extends State<HogwartsCharacterCard> {
  @override
  Widget build(BuildContext context) {
    late HogwartsCharacterProvider provider;
    @override
    void initState() {
      provider = Provider.of<HogwartsCharacterProvider>(context, listen: false);
      provider.FetchData();

      super.initState();
    }

    return SafeArea(
      child: Scaffold(
        body: Card(
          elevation: 2,
          shape: OutlineInputBorder(),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.network(
                        "${widget.hogwartsCharactersModel.image}")),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                              "${widget.hogwartsCharactersModel.name}",
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              "Alternative Name:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            Text(
                              "${widget.hogwartsCharactersModel.alternateNames}",
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              "Species:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            Text(
                              "${widget.hogwartsCharactersModel.species}",
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              "House:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            Text(
                              "${widget.hogwartsCharactersModel.house}",
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              "Gender:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            Text(
                              "${widget.hogwartsCharactersModel.gender}",
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              "Date of Birth:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            Text(
                              "${widget.hogwartsCharactersModel.dateOfBirth}",
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              "Year of Birth:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            Text(
                              "${widget.hogwartsCharactersModel.yearOfBirth}",
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              "wizard:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            Text(
                              "${widget.hogwartsCharactersModel.wizard}",
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              "Ancestry:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            Text(
                              "${widget.hogwartsCharactersModel.ancestry}",
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              "Eye Color:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            Text(
                              "${widget.hogwartsCharactersModel.eyeColour}",
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              "Hair Color:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            Text(
                              "${widget.hogwartsCharactersModel.hairColour}",
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              "Wand:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            Text(
                              "${widget.hogwartsCharactersModel.wand}",
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              "Patronus:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            Text(
                              "${widget.hogwartsCharactersModel.patronus}",
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              "HogwartsStudent:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            Text(
                              "${widget.hogwartsCharactersModel.hogwartsStudent}",
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              "HogwartsStaff:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            Text(
                              "${widget.hogwartsCharactersModel.hogwartsStaff}",
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              "Actor:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            Text(
                              "${widget.hogwartsCharactersModel.actor}",
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              "Alive:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            Text(
                              "${widget.hogwartsCharactersModel.alive}",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
