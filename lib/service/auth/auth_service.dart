import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<UserCredential> signInWithEmail({required String email, required String password}) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      _firebaseFirestore.collection('users').doc(userCredential.user!.uid).set(
          {
            'uid' : userCredential.user!.uid,
            'email' : email,
          },
           SetOptions(
          merge: true,
       )
      );

      return userCredential;
     } on FirebaseAuthException catch (error) {
       throw Exception(error.message);
    }


//    _firebaseFirestore.collection('users').doc(userCredential.user!.uid).set({
//      'uid' : userCredential.user!.uid,
//      'email' : email,
//    });
  //TODO

  }
}
