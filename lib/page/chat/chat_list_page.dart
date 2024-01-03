import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_home/page/chat/chat_room_page.dart';
import 'package:firebase_home/service/auth/auth_service.dart';
import 'package:flutter/material.dart';

class ChatListPage extends StatelessWidget {
  final AuthService _authService = AuthService();

  ChatListPage({super.key});

  get receivedUserId => null;

  void logout() {
    _authService.singOut();
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: const Text('Chat List',
          style: TextStyle(
              fontFamily: 'Rubik',
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: logout,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList(){
      return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError){
          return const Center(
              child: Text('ERROR'));
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator());
        } else {
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index){
              final user = snapshot.data!.docs[index];
                return ListTile(
                  onTap: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => const ChatRoomPage(receivedUserId: '', receivedUserEmail: '',))
                    );
                  },
                  leading: const CircleAvatar(
                      child: Icon(Icons.person)
                  ),
                  title: Text(user['email']),
                  trailing: const Icon(Icons.chat),
                );
              }
          );
        }
      }
    );
  }
}