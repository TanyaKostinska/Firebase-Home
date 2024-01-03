import 'package:firebase_home/service/auth/auth_service.dart';
import 'package:flutter/material.dart';
import '../profile/profil_page.dart';

class ChatListPage extends StatelessWidget {
  final AuthService _authService = AuthService();

  ChatListPage({super.key});

  void logout() {
    _authService.singOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
            'Chat List',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 12,
          ),
        ),
        actions: [
          IconButton(
            onPressed: logout,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilPage(),),);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}