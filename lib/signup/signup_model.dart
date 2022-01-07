import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPageModel extends ChangeNotifier {
  final titleController = TextEditingController();
  final authorController = TextEditingController();

  //emailにnullが入っていてもいいよ
  String? email;
  String? password;
  String pokemonId = '';
  String content = '';
  String oftenUsePokemon = '';
  String name = '';
  String timeToPlay = '';

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
          'timeToPlay' : timeToPlay,
          'oftenUsePokemon': oftenUsePokemon,
        });
      }
      // if (user != null) {
      //   final uid = user.uid;
      //
      //   // firestoreに追加
      //   FirebaseFirestore.instance.collection('comments').add
      //   ({
      //     'uid': uid,
      //     'name': name,
      //     'pokemonId': pokemonId,
      //     'content': content,
      //   });
      // }
    }
  }
}