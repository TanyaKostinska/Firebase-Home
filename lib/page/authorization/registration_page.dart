
import 'package:firebase_home/page/widget/simple_button.dart';
import 'package:firebase_home/page/widget/simple_text_field.dart';
import 'package:firebase_home/service/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RegistrationPage extends StatelessWidget {
  final void Function()? onTap;
  final AuthService _authService = AuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();

  RegistrationPage({super.key, required this.onTap});

  void signUp(context) async {
    if (passwordController.text != passwordConfirmController.text) {
      return showError('Password and Confirm Password does not match', context);
    } else {
      try{
        await _authService.signUpWithEmail(email: emailController.text, password: passwordController.text);
      } catch (error) {
        showError(error.toString(), context);
      }
    }
  }

  void showError(String error, context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          error ?? '',
          style: const TextStyle(
            color: Colors.grey,
            fontFamily: 'Rubik',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D1C00),
      body: ListView(
        children: [
          Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/animation/suprise_box.json'),
              const Text(
                'Registration',
                style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 30,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 10),
              SimpleTextField(
                icon: const Icon (Icons.email),
                controller: emailController,
                label: 'Email',
                hintText: 'Your email',
              ),
              const SizedBox(height: 10),
              SimpleTextField(
                icon: const Icon (Icons.password),
                controller: passwordController,
                label: 'Password',
                hintText: 'Create password',
              ),
              const SizedBox(height: 10),
              SimpleTextField(
                icon: const Icon (Icons.password),
                controller: passwordConfirmController,
                label: 'Repeat Password',
                hintText: 'Repeat your password',
              ),
              const SizedBox(height: 20),
              SimpleButton(
                onPressed: () => signUp(context),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Is your account ready?'),
                  TextButton(
                    onPressed: onTap,
                        /*() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },*/
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
        ],
      ),
    );
  }
}
