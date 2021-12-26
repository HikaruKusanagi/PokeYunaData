import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/domain/comments.dart';

class PokemonDetailModel extends ChangeNotifier {

  List<Comments>? comments;


  //?はnullが入っていてもいいよ
  String? content;
  String? email;
  String? name;
  String? uid;
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
      final String uid = data['uid'];
      return Comments(content,name,pokemonId,uid,);
    }).toList();

    this.comments = comments;
    notifyListeners();
  }
}