import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_home/service/chat/chat_service.dart';
import 'package:flutter/material.dart';

class ChatRoomPage extends StatefulWidget {
  final String receivedUserId;
  final String receivedUserEmail;
  const ChatRoomPage({
    super.key, required this.receivedUserId, required this.receivedUserEmail,
  });

  @override
  State<ChatRoomPage> createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {

  final TextEditingController messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void sendMessage() async {
    await _chatService.sendMessage(
        receivedId: widget.receivedUserId,
        message: messageController.text,
    );
    messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.receivedUserEmail,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.blueGrey,
      ),

      body: Column(
        children: [
          Expanded(child: _buildMessageList()),
          _buildInput(),
        ],
      ),
    );
  }

  Widget _buildMessageList(){
    return StreamBuilder(
        stream: _chatService.getMessage(userId: _firebaseAuth.currentUser!.uid, otherUserId: widget.receivedUserId),
        builder: (context, snapshot) {
          if (snapshot.hasError){
            return const Text('error');
          }else if (snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          else{
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  bool isCurrentUser = _firebaseAuth.currentUser!.uid == snapshot.data!.docs[index]['senderId'];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: isCurrentUser ?CrossAxisAlignment.end : CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(7),
                          padding: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            color: isCurrentUser ? Colors.blue : Colors.deepPurpleAccent,
                            borderRadius: BorderRadius.only(
                              bottomLeft: const Radius.circular(15),
                              bottomRight: const Radius.circular(15),
                              topLeft: Radius.circular(isCurrentUser ? 14 : 0),
                              topRight: Radius.circular(isCurrentUser ? 0 : 14),
                            )
                          ),
                          child: Text(snapshot.data!.docs[index]['message']),
                        ),
                      ],
                    ),
                  );
                }
            );
          }
        }
    );
  }

  Widget _buildInput(){
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: messageController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          IconButton(
            onPressed: sendMessage,
            icon: const Icon(Icons.send_outlined),
          )
        ],
      ),
    );
  }


}
