import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test_app_1/pages/detailsPage.dart';
import 'package:http/http.dart' as http;

import '../model/character.dart';
import 'package:test_app_1/model/location.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static List<Character> characters = [];
  static Location? location;

  Future getCharacters() async {
    var response =
        await http.get(Uri.parse('https://rickandmortyapi.com/api/character'));
    var jsonData = jsonDecode(response.body);

    for (var eachCharacter in jsonData['results']) {
      final location = eachCharacter['location']['url'];
      final originLocation = eachCharacter['origin']['name'];

      final character = Character(
          name: eachCharacter['name'],
          status: eachCharacter['status'],
          img: eachCharacter['image'],
          originLocation: originLocation,
          location: location);
      characters.add(character);

      //print(character.location);
    }
  }

  Future getCharacterDetails(int x) async {
    var response = await http.get(Uri.parse(characters[x].location));
    var jsonData = jsonDecode(response.body);

    HomePage.location = Location(
        locationName: jsonData['name'],
        type: jsonData['type'],
        dimension: jsonData['dimension']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shalfy Test - Main"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SafeArea(
        child: FutureBuilder(
            future: getCharacters(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                  itemCount: 25,
                  padding: const EdgeInsets.all(8),
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ListTile(
                            onTap: () {
                              //getCharacterDetails(index);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailsPage(
                                            character: characters[index],
                                            location: location ?? Location(locationName: 'Unknown', type: 'Unknown', dimension: 'Unknown'),
                                          )));
                            },
                            title: Text('Name: ${characters[index].name}'),
                            subtitle:
                                Text('status: ${characters[index].status}'),
                            trailing: Image.network(characters[index].img),
                          ),
                        ));
                  },
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
