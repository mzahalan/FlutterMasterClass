import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/models/vocation.dart';
import 'package:flutter_rpg/screens/create/divider.dart';
import 'package:flutter_rpg/services/character_store.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  final _nameController = TextEditingController();
  final _sloganController = TextEditingController();

  Vocation selectedVocation = Vocation.values.first;

  @override
  void dispose() {
    _nameController.dispose();
    _sloganController.dispose();
    super.dispose();
  }

  void handleVocationSelect(Vocation vocation) {
    setState(() {
      selectedVocation = vocation;
    });
  }

  // submit handler
  void handleSubmit() {
    if(_nameController.text.trim().isEmpty) {
      showDialog(context: context, builder: (ctx) {
        return AlertDialog(
          title: const StyledHeading('Missing Character Name'),
          content: const StyledText('Please enter a name for your character.'),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            StyledButton(
              child: const StyledHeading('ok'),
              onPressed: () => Navigator.pop(ctx),
            )
          ],
        );
      });
      return;
    }
    if(_sloganController.text.trim().isEmpty) {
      showDialog(context: context, builder: (ctx) {
        return AlertDialog(
          title: const StyledHeading('Missing Character Sloga'),
          content: const StyledText('Please enter a slogan for your character.'),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            StyledButton(
              child: const StyledHeading('ok'),
              onPressed: () => Navigator.pop(ctx),
            )
          ],
        );
      });
      return;
    }

    // Add character to the store
    Provider.of<CharacterStore>(context, listen: false).addCharacter(Character(
      id: uuid.v4(),
      name: _nameController.text.trim(),
      slogan: _sloganController.text.trim(),
      vocation: selectedVocation
    ));
    
    Navigator.pushNamed(context, '/characters');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle('Character Creation'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SectionDivider(heading: 'Welcome New Player', text: 'Create a name & slogan for your character.'),
              TextField(
                controller: _nameController,
                cursorColor: AppColors.textColor,
                style: GoogleFonts.kanit(textStyle:Theme.of(context).textTheme.bodyMedium),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_2),
                  label: StyledText('Character Name')
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _sloganController,
                cursorColor: AppColors.textColor,
                style: GoogleFonts.kanit(textStyle:Theme.of(context).textTheme.bodyMedium),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.chat),
                  label: StyledText('Character Slogan')
                ),
              ),
              const SizedBox(height: 15),
          
              // Select Vocation Title
              const SectionDivider(heading: 'Choose a vocation', text: 'This determines your available skills.'),
          
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for(var vocation in Vocation.values) 
                      GestureDetector(
                        onTap: () => handleVocationSelect(vocation),
                        child:  Padding( 
                          padding: const EdgeInsets.all(8),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: !(selectedVocation == vocation) ? Colors.black.withAlpha(200) : AppColors.primaryColor, width: 2),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Image.asset('assets/img/vocations/${vocation.image}', 
                              height: 180, 
                              color: !(selectedVocation == vocation) ? Colors.black.withAlpha(200) : Colors.transparent, 
                              colorBlendMode: BlendMode.color,
                            )
                          ) 
                        ),
                      )
                  ],
                ),
              ),

              // Good Luck Message
              const SectionDivider(heading: 'Good Luck', text: 'And enjoy the journey...'),
          
              // Submit!!!
              Consumer<CharacterStore>(
                builder: (context, characterStore, child) {
                  return Center(child: StyledButton(
                    onPressed: handleSubmit, 
                    child: const StyledHeading('Create Character')
                  ));
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}