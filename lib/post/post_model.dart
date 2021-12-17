import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PostModel extends ChangeNotifier {

  //?はnullが入っていてもいいよ
  String? content;
  String? name;
  String? pokemonId;
  String? uid;
  String? oftenUsePokemon;

  Future addContent(String pokemonName) async {
    if (content == null || content == "") {
      throw 'テキストを入力してください';
    }

    // firestoreに追加
    await FirebaseFirestore.instance.collection('comments').add({
      'content': content,
      'name': name,
      'pokemonId': pokemonId = pokemonName,
      'uid': 'テスト',
      'oftenUsePokemon': 'テスト',
    });



  }

  void fetchUser() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final snapshot =
    await FirebaseFirestore.instance.collection('users').doc(uid).get();
    final data = snapshot.data();
    this.name = data?['name'];
    notifyListeners();
  }
}

