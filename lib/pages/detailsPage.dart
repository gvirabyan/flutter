import 'package:flutter/material.dart';
import 'package:test_app_1/model/character.dart';
import 'package:test_app_1/model/location.dart';

class DetailsPage extends StatelessWidget {
  final Character character;
  final Location? location;

  const DetailsPage(
      {super.key, required this.character,  this.location});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shelfy Test - Details"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                character.name,
                style: const TextStyle(
                    fontSize: 30,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold),
              ),
            )),
            Image.network(character.img),
            Text(
              'Status: ${character.status}',
              style: CustomTextStyle.BoldUnderline,
            ),
            const Text(
              'Origin',
              style: CustomTextStyle.BoldUnderline,
            ),
            Text(character.originLocation),
            const Text(
              'Location',
              style: CustomTextStyle.BoldUnderline,
            ),
            Text('location:${location?.locationName}'),
            Text('dimension: ${location?.dimension}'),
            Text('type:${location?.type}')
          ],
        ),
      ),
    );
  }
}

class CustomTextStyle {
  static const TextStyle BoldUnderline = TextStyle(
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.underline);
}
