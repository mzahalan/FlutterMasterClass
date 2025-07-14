import 'package:flutter/material.dart';
import 'package:flutter_rpg/screens/create/create.dart' as create_character;
import 'package:flutter_rpg/screens/home/home.dart';
import 'package:flutter_rpg/services/character_store.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => CharacterStore(),
    child: MaterialApp(
      theme: primaryTheme,
      initialRoute: '/characters',
      routes: {
        '/characters': (context) => const Home(),
        '/create': (context) => const create_character.Create(),
      },
    ),
  ));
}


class Sandbox extends StatelessWidget {
  const Sandbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sandbox'),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: const Center(
        child: Text('Hello World'),
      ),
    );
  }
}