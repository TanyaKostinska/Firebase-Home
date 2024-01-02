import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_home/page/authorization/login_&_reg.dart';
import 'package:firebase_home/page/chat/chat_list_page.dart';
import 'package:flutter/cupertino.dart';

class IntroPage extends StatelessWidget {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
   IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _firebaseAuth.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          return  ChatListPage();
        } else {
          return const LoginOrRegistration ();
        }
      },
    );
  }
}
