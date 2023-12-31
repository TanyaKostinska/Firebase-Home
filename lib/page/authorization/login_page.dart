import 'package:firebase_home/page/widget/simple_button.dart';
import 'package:firebase_home/page/widget/simple_text_field.dart';
import 'package:firebase_home/service/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../chat/chat_list_page.dart';

class LoginPage extends StatelessWidget {
  final void Function()? onTap;
  final AuthService _authService = AuthService();
  final TextEditingController emailController = TextEditingController(text:'');
  final TextEditingController passwordController = TextEditingController(text: '');

  LoginPage({super.key, required this.onTap});

  void signIn(context) async {
    try {
      await _authService.signInWithEmail(
        email: emailController.text,
        password: passwordController.text,
      );
       Navigator.push(context, MaterialPageRoute(builder: (context) => ChatListPage(),
        ),
      );
    } catch (error) {
      showError(error.toString(), context);
    }
  }

  void showError(String error, context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          error,
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
      body: SafeArea(
        child: ListView(
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
                  hintText: 'Your password',
                ),
                const SizedBox(height: 20),
                SimpleButton(
                  onPressed: () => signIn(context),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('No account?'),
                    TextButton(
                      onPressed: onTap,
                        /*() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegistrationPage()));
                      },*/
                      child: const Text(
                        'Register now',
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
     ),
    );
  }
}
