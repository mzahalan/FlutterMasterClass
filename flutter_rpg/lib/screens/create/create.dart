import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/vocation.dart';
import 'package:flutter_rpg/screens/create/vocation_card.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:google_fonts/google_fonts.dart';

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
      print('Name must not be empty');
      return;
    }
    if(_sloganController.text.trim().isEmpty) {
      print('Slogan must not be empty');
      return;
    }

    print('Name: ${_nameController.text}');
    print('Slogan: ${_sloganController.text}');
    print('Vocation: ${selectedVocation.name}');
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
              Center(
                child: Icon(Icons.code, color: AppColors.primaryColor),
              ),
              const Center(
                child: StyledHeading('Welcome New Player'),
              ),
              const Center(
                child: StyledText('Create a name & slogan for your character.'),
              ),
              const SizedBox(height: 30,),
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
              const SizedBox(height: 30),
          
              // Select Vocation Title
              Center(
                child: Icon(Icons.code, color: AppColors.primaryColor),
              ),
              const Center(
                child: StyledHeading('Choose a vocation'),
              ),
              const Center(
                child: StyledText('This determines your available skills.'),
              ),
          
          /*
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for(var vocation in Vocation.values) 
                      Padding( 
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('assets/img/vocations/${vocation.image}', height: 180, colorBlendMode: BlendMode.color,)
                      ),
                  ],
                ),
              ),
              */
              for(var vocation in Vocation.values) 
                VocationCard(
                  vocation: vocation, 
                  onTap: handleVocationSelect,
                  selected: vocation == selectedVocation
                ),
              

          
              // Submit!!!
              Center(child: StyledButton(onPressed: handleSubmit, child: const StyledHeading('Create Character')),)
            ],
          ),
        ),
      ),
    );
  }
}