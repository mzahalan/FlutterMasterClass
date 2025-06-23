import 'package:flutter/material.dart';
import 'package:flutter_rpg/screens/home/character_card.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/shared/styled_text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> characters = [
    'Mario', 'Luigi', 'Princess', 'Toad', 'Koopa', 'Bowser', 'Donkey Kong', 'Yoshi'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle('Your Characters'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: characters.length,
                itemBuilder: (context, index) {
                  return CharacterCard(characters[index]);
                },
              ),
            ),
            const SizedBox(height: 16
            ),
            StyledButton(
              onPressed: () {
                Navigator.pushNamed(context, '/create');
              },
              child: const StyledHeading('Create Character'),
            ),
          ],
        ),
      )
    );
  }
}