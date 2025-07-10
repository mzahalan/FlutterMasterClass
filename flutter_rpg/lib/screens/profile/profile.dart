import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class Profile extends StatelessWidget {
  const Profile({super.key, required this.character});
  final Character character;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledTitle(character.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // basic info - image, voc, desc
          Container(
            padding: const EdgeInsets.all(16),
            color: AppColors.secondaryColor.withAlpha(88),
            child: Row(
              children: [
                Image.asset('assets/img/vocations/${character.vocation.image}', width: 140, height: 140),
                const SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StyledHeading(character.vocation.title),
                    StyledText(character.vocation.description)
                  ]
                )
              ]
            ),
          ),
          // weapon and ability
          // stats & skills
          // save button
          Text('This is the Profile page')],
      ),
    );
  }
}