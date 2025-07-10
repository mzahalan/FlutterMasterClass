import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/shared/styled_text.dart';

class Profile extends StatelessWidget {
  const Profile({super.key, required this.character});
  final Character character;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledTitle(character.name),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // basic info - image, voc, desc
          // weapon and ability
          // stats & skills
          // save button
          Text('This is the Profile page')],
      ),
    );
  }
}