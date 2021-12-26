import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class EditModel extends ChangeNotifier {
  EditModel(this.name, this.oftenUsePokemon, this.timeToPlay) {

  nameController.text = name!;
  oftenUsePokemonController.text = oftenUsePokemon!;
  timeToPlayController.text = timeToPlay!;
}

  final nameController = TextEditingController();
  final oftenUsePokemonController = TextEditingController();
  final timeToPlayController = TextEditingController();
  String? name;
  String? oftenUsePokemon;
  String? timeToPlay;

  void setName(String name) {
     this.name = name;
    notifyListeners();
  }

  void setOftenUsePokemon(String oftenUsePokemon) {
    this.oftenUsePokemon = oftenUsePokemon;
    notifyListeners();
  }

  void setTimeToPlay(String timeToPlay) {
    this.timeToPlay = timeToPlay;
    notifyListeners();
  }

  bool isUpdated() {
    return name != null || oftenUsePokemon != null || timeToPlay != null;
  }

  Future update() async {
    this.name = nameController.text;
    this.oftenUsePokemon = oftenUsePokemonController.text;
    this.timeToPlay = timeToPlayController.text;

    //firestoreに追加
    final uid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance.collection('users').doc(uid).update({
      'name' : name,
      'oftenUsePokemon' : oftenUsePokemon,
      'timeToPlay' : timeToPlay,
    });
  }
}
