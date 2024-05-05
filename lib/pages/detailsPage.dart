import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:test_app_1/model/character.dart';

class DetailsPage extends StatelessWidget {
  final Character character;

  const DetailsPage({super.key, required this.character});

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
            const Text(
              'Location',
              style: CustomTextStyle.BoldUnderline,
            ),
            Text('location: ${character.location}'),
            Text('dimension: ${character.dimension}'),
            Text('type: ${character.type}')
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
