import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/models/skills.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class SkillList extends StatefulWidget {
  const SkillList(this.character, {super.key});
  final Character character;

  @override
  State<SkillList> createState() => _SkillListState();
}

class _SkillListState extends State<SkillList> {

  late List<Skill> availableSkills;
  late Skill selectedSkill;

  @override
  void initState() {
    availableSkills = allSkills.where((skill) => skill.vocation == widget.character.vocation).toList();
    selectedSkill = widget.character.skills.isEmpty ? availableSkills.first : widget.character.skills.first;
    super.initState();
  }

  void handleSelectSkill(Skill skill) {
    setState(() {
      selectedSkill = skill;
      widget.character.updateSkill(skill);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        color: AppColors.secondaryColor.withAlpha(128),
        child: Column(
          children: [
            const StyledHeading('Choose an active skill'),
            const StyledText('Skills are unique to your vocation.'),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: availableSkills
                    .map((skill) {
                      return GestureDetector(
                        onTap: () => handleSelectSkill(skill),
                        child: Container(
                          color: skill == selectedSkill ? Colors.yellow : Colors.transparent,
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.all(2),
                          child: Image.asset('assets/img/skills/${skill.image}', width: 70,),
                        ),
                      );
                    }).toList(),
              ),
            ),
            const SizedBox(height: 10,),
            StyledText(selectedSkill.name)
          ],
        ),
      ),
    );
  }
}