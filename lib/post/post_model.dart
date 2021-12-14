import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/domain/comments.dart';

class PostModel extends ChangeNotifier {
  List<Comments>? comments;
  //?はnullが入っていてもいいよ
  String? content;
  String? playerName;
  String? name;
  String? email;
  String? pokemonId;

  Future addContent() async {

    if (content == null || content == "") {
      throw '入力してください';
    }

    // firestoreに追加
    await FirebaseFirestore.instance.collection('comments').add({
      'content': content,
      'name' : name,
      'pokemonId' : pokemonId,
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

  void fetchComments(String pokemonName) async {
    final QuerySnapshot snapshot =
    await FirebaseFirestore.instance.collection('comments')
        .where('pokemonId', isEqualTo: pokemonName)
        .get();

    final List<Comments> comments = snapshot.docs.map((
        DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String content = data['content'];
      final String name = data['name'];
      final String pokemonId = data['pokemonId'];
      return Comments(content,name,pokemonId);
    }).toList();

    this.comments = comments;
    notifyListeners();
  }
}

