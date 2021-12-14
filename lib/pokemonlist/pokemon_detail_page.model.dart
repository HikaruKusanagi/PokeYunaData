
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/domain/comments.dart';

class PokemonDetailModel extends ChangeNotifier {

  List<Comments>? comments;

  bool isLoading = false;

  //?はnullが入っていてもいいよ
  String? content;
  String? email;
  String? name;
  String? pokemonName;
  String? pokemonId;



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

  void fetchUser() async {
    final user = FirebaseAuth.instance.currentUser;
    this.email = user?.email;

    final uid = FirebaseAuth.instance.currentUser!.uid;
    final snapshot =
    await FirebaseFirestore.instance.collection('users').doc(uid).get();
    final data = snapshot.data();
    this.name = data?['name'];

    notifyListeners();
  }
}