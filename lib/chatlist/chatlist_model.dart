import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/domain/chat.dart';

class OpenChatModel extends ChangeNotifier {
  List<Chat>? chat;

  String? name;
  String? oftenUsePokemon;
  String? timeToPlay;
  String? uid;
  String? email;
  String? talk;
  String? pokemonId;
  DateTime? createdAt;


  //Firestoreの値を画面に映す
  void fetchTalkUser() async {
    final QuerySnapshot snapshot =
    await FirebaseFirestore.instance.collection('chat')
        .orderBy('createdAt', descending: true)
        .get();

    final List<Chat> chat = snapshot.docs.map((
        DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String name = data['name'];
      final String pokemonId = data['pokemonId'];
      final String uid = data['uid'];
      final String talk = data['talk'];
      return Chat(talk,name,pokemonId,uid);
    }).toList();

    this.chat = chat;
    notifyListeners();
  }


  Future addContent(String pokemonName) async {
    if (talk == null || talk == "") {
      throw 'テキストを入力してください';
    }


    // firestoreに追加
    await FirebaseFirestore.instance.collection('chat').add({
      'talk': talk,
      'name': name,
      'pokemonId': pokemonId = pokemonName,
      'uid': uid,
      'createdAt': DateTime.now(),
    });
  }

  //currentUserで現在ログインしているユーザーを取得している
  void fetchCurrentUser() async {
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