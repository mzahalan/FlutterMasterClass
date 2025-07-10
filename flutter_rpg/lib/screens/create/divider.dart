import 'package:flutter/material.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class SectionDivider extends StatelessWidget {
  const SectionDivider({super.key, required this.heading, required this.text});

  final String heading;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
        Center(child: StyledHeading(heading)),
        Center(child: StyledText(text)),
      ],
    );
  }
}
