import 'package:flutter_auth_tut/screens/welcome/signin.dart';
import 'package:flutter_auth_tut/screens/welcome/signup.dart';
import 'package:flutter_auth_tut/shared/styled_text.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  bool _showSignUp = true;
  void toggleView() {
    setState(() => _showSignUp = !_showSignUp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledAppBarText('Flutter Auth'),
        backgroundColor: Colors.blue[500],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const StyledHeading('Welcome.'),
              if(_showSignUp) Column(
                children: [
                  const SignUpForm(),
                  SizedBox(height: 16,),
                  GestureDetector(
                    onTap: toggleView,
                    child: StyledBodyText('Have an account? Click here to sign in.'),
                  ),
                ],
              ),
              if(!_showSignUp)  Column(
                children: [
                  const SignInForm(),
                  SizedBox(height: 16,),
                  GestureDetector(
                    onTap: toggleView,
                    child: StyledBodyText('Need an account? Click here to sign up.'),
                  ),
                ],
              ),
            ]
          )
        ),
      ),
    );
  }
}