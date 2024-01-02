import 'package:firebase_home/page/authorization/login_page.dart';
import 'package:firebase_home/page/authorization/registration_page.dart';
import 'package:flutter/material.dart';

class LoginOrRegistration extends StatefulWidget {
  const LoginOrRegistration({super.key});

  @override
  State<LoginOrRegistration> createState() => _LoginOrRegistrationState();
}

class _LoginOrRegistrationState extends State<LoginOrRegistration> {
  bool showLoginPage = true;

  void togglePages(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      showLoginPage
        ? LoginPage(onTap: togglePages)
        : RegistrationPage(onTap: togglePages);
     }
}
