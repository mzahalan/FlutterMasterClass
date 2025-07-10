import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Basic info - image, vocation, description
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/img/vocations/${character.vocation.image}'),
                  ),
                  const SizedBox(height: 16),
                  StyledHeading(character.vocation.title),
                  const SizedBox(height: 8),
                  StyledText('"${character.slogan}"'),
                  const SizedBox(height: 8),
                  StyledText(character.vocation.description),
                ],
              ),
            ),
            
            // Weapon and ability
            Card(
              margin: const EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        //Icon(Icons.weapon, color: AppColors.primaryColor),
                        const SizedBox(width: 8),
                        StyledHeading('Combat Info'),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        StyledText('Weapon:'),
                        StyledText(character.vocation.weapon),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        StyledText('Ability:'),
                        StyledText(character.vocation.ability),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            
            // Stats
            Card(
              margin: const EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.bar_chart, color: AppColors.primaryColor),
                        const SizedBox(width: 8),
                        StyledHeading('Stats'),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ...character.statsAsMap.entries.map((stat) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          StyledText('${stat.key.toUpperCase()}:'),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: StyledText(stat.value.toString()),
                          ),
                        ],
                      ),
                    )),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        StyledText('POINTS AVAILABLE:'),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.highlightColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: StyledText(character.points.toString()),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            
            // Skills
            Card(
              margin: const EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.auto_awesome, color: AppColors.primaryColor),
                        const SizedBox(width: 8),
                        StyledHeading('Skills'),
                      ],
                    ),
                    const SizedBox(height: 12),
                    if (character.skills.isEmpty)
                      const StyledText('No skills selected')
                    else
                      ...character.skills.map((skill) => Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.secondaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            StyledHeading(skill.name),
                            const SizedBox(height: 4),
                            StyledText(skill.description),
                          ],
                        ),
                      )),
                  ],
                ),
              ),
            ),
            
            // Save button
            Padding(
              padding: const EdgeInsets.all(16),
              child: StyledButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: StyledText('${character.name} saved successfully!'),
                      backgroundColor: AppColors.successColor,
                    ),
                  );
                },
                child: const StyledHeading('Save Character'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}