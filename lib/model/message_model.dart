import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String senderId;
  final String senderEmail;
  final String receivedId;
  final String message;
  final Timestamp timestamp;

  MessageModel({
    required this.senderId,
    required this.senderEmail,
    required this.receivedId,
    required this.message,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return{
      'senderId' : senderId,
      'senderEmail' : senderEmail,
      'receiverId' : receivedId,
      'message' : message,
      'timestamp' : timestamp,
    };
  }

}
