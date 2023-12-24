import 'package:firebase_home/page/widget/simple_button.dart';
import 'package:firebase_home/page/widget/simple_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  signIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Registration',
              style: TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 30,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 10),
            SimpleTextField(
              controller: emailController,
              label: 'Email',
              hintText: 'Your email',
            ),
            const SizedBox(height: 10),
            SimpleTextField(
              controller: passwordController,
              label: 'Password',
              hintText: 'Your password',
            ),
            const SizedBox(height: 20),
            SimpleButton(onPressed: signIn),
          ],
        ),
      ),
    );
  }
}
