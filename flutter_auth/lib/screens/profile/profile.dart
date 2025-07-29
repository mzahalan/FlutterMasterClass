import 'package:flutter/material.dart';
import 'package:flutter_auth_tut/models/app_user.dart';
import 'package:flutter_auth_tut/services/auth_service.dart';
import 'package:flutter_auth_tut/shared/styled_button.dart';
import 'package:flutter_auth_tut/shared/styled_text.dart';

class ProfileScreen extends StatelessWidget {
  final AppUser user;

  const ProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledAppBarText('Your Profile'),
        backgroundColor: Colors.blue[500],
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const StyledHeading('Profile'),
            /*const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),*/
            const SizedBox(height: 16),
            // Output User Email
            StyledBodyText('Welcome to your profile, ${user.email}'),
            const SizedBox(height: 16),
            StyledButton(onPressed: (){
              AuthService.signOut();
            }, child: const StyledButtonText('Log Out')),

          ],
        ),
      ),
    );
  }
}