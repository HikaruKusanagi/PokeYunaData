import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PostModel extends ChangeNotifier {

  //?はnullが入っていてもいいよ
  String? email;
  String? password;
  String pokemonId = '';
  String content = '';
  String oftenUsePokemon = '';
  String? name;
  String timeToPlay = '';
  String? uid;


  Future addContent(String pokemonName) async {
    if (content == null || content == "") {
      throw 'テキストを入力してください';
    }

    // firestoreに追加
      await FirebaseFirestore.instance.collection('comments').add({
        'content': content,
        'name': name,
        'pokemonId': pokemonId = pokemonName,
        'uid': uid,
      });
  }

  void fetchUser() async {
    final user = FirebaseAuth.instance.currentUser;
    this.email = user?.email;

    final uid = FirebaseAuth.instance.currentUser!.uid;
    final snapshot = await FirebaseFirestore.instance.collection('users').doc(uid).get();
    final data = snapshot.data();
    this.name = data?['name'];
    this.uid = data?['uid'];
    notifyListeners();
  }
}
