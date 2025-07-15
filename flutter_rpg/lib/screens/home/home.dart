import 'package:flutter/material.dart';
import 'package:flutter_rpg/screens/home/character_card.dart';
import 'package:flutter_rpg/services/character_store.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    Provider.of<CharacterStore>(context, listen: false).fetchCharactersOnce();
    super.initState();
  }

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
              child: Consumer<CharacterStore>(
                builder: (context, value, child) {
                  return ListView.builder(
                    itemCount: value.characters.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: ValueKey(value.characters[index].id),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          Provider.of<CharacterStore>(context, listen: false).removeCharacter(value.characters[index]);
                        },
                        background: Container(
                          color: Colors.red,
                          child: const Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: 16),
                              child: Icon(Icons.delete, color: Colors.white),
                            ),
                          ),
                        ),
                        child: CharacterCard(value.characters[index])
                      );
                    },
                  );
                }
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