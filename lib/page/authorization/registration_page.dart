import 'package:firebase_home/page/authorization/login_page.dart';
import 'package:firebase_home/page/widget/simple_button.dart';
import 'package:firebase_home/page/widget/simple_text_field.dart';
import 'package:firebase_home/service/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RegistrationPage extends StatelessWidget {
  final AuthService _authService = AuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();

  RegistrationPage({super.key});
  signUp() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/animation/suprise_box.json'),
            const Text(
              'Registration now',
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
              hintText: 'Create password',
            ),
            const SizedBox(height: 10),
            SimpleTextField(
              controller: passwordController,
              label: 'Repeat Password',
              hintText: 'Confirm your password',
            ),
            const SizedBox(height: 20),
            SimpleButton(
              onPressed: () => signUp(),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Is your account ready?'),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                  child: const Text(
                    'Login now',
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
