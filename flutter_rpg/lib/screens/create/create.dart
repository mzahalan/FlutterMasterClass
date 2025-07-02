import 'package:flutter/material.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class Create extends StatelessWidget {
  const Create({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle('Character Creation'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
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
              cursorColor: AppColors.textColor,
              style: GoogleFonts.kanit(textStyle:Theme.of(context).textTheme.bodyMedium),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_2),
                label: StyledText('Character Name')
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              cursorColor: AppColors.textColor,
              style: GoogleFonts.kanit(textStyle:Theme.of(context).textTheme.bodyMedium),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.chat),
                label: StyledText('Character Slogan')
              ),
            )
          ],
        ),
      ),
    );
  }
}