import 'package:firebase_home/page/chat/chat_list_page.dart';
import 'package:flutter/material.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
            'Add Avatar',
          style: TextStyle(
            fontFamily: 'Rubik',
            fontSize: 12,
          ),
        ),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ChatListPage(),),);
              },
              icon: const Icon(Icons.label_important_sharp),
          )
        ],
      ),


     // body: CircleAvatar,


    );
  }
}
