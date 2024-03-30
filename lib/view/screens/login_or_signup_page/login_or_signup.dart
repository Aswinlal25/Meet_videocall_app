import 'package:flutter/material.dart';
import 'package:meet_up/view/screens/login_screen/login.dart';
import 'package:meet_up/view/screens/sign_up_screen.dart/signUp.dart';

class LoginOrSignUpPage extends StatefulWidget {
  const LoginOrSignUpPage({super.key});

  @override
  State<LoginOrSignUpPage> createState() => _LoginOrSignUpPageState();
}

class _LoginOrSignUpPageState extends State<LoginOrSignUpPage> {
  bool ShowLoginPage = true;

  void togglePage() {
    setState(() {
      ShowLoginPage = !ShowLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (ShowLoginPage) {
      return LoginScreen(onTap: togglePage);
    } else {
      return SignUpScreen(onTap: togglePage);
    }
  }
}
