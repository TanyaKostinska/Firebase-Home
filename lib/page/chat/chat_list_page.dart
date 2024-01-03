import 'package:firebase_home/service/auth/auth_service.dart';
import 'package:flutter/material.dart';

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
        title: const Text('Chat List'),
        actions: [
          IconButton(
            onPressed: logout,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}