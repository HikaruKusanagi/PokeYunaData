import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:pokemon_app/domain/comments.dart';

class ContentUserModel extends ChangeNotifier {

  String? name;
  String? oftenUsePokemon;
  String? timeToPlay;
  String? uid;
  String? email;

  void fetchComments(Comments comments) async {
    final snapshot = await FirebaseFirestore.instance.collection('users').doc(comments.uid).get();
    final data = snapshot.data();
    this.uid = data?['uid'];
    this.name = data?['name'];
    this.oftenUsePokemon = data?['oftenUsePokemon'];
    this.email = data?['email'];
    this.timeToPlay = data?['timeToPlay'];
    notifyListeners();
  }
}