import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SingUpPageModel extends ChangeNotifier {
  final titleController = TextEditingController();
  final authorController = TextEditingController();

  //emailにnullが入っていてもいいよ
  String? email;
  String? password;
  String description = '';
  String name = '';

  bool isLoading = false;

  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void endLoading() {
    isLoading = false;
    notifyListeners();
  }

  void setEmail(String email) {
    this.email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    this.password = password;
    notifyListeners();
  }

  Future signUp() async {
    this.email = titleController.text;
    this.password = authorController.text;

    if (email != null && password != null) {
      // firebase authでユーザー作成
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email!, password: password!);
      final user = userCredential.user;

      if (user != null) {
        final uid = user.uid;

        // firestoreに追加
        final doc = FirebaseFirestore.instance.collection('users').doc(uid);
        await doc.set({
          'uid': uid,
          'email': email,
          'name': name,
          'description': description,
        });
      }
    }
  }
}