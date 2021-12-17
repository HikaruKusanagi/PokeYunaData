import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class MyModel extends ChangeNotifier {

  bool isLoading = false;
  String? name;
  String? oftenUsePokemon;
  String? email;
  String? timeToPlay;

  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void endLoading() {

    isLoading = false;
    notifyListeners();
  }

  void fetchUser() async {
    final user = FirebaseAuth.instance.currentUser;
    this.email = user?.email;

    final uid = FirebaseAuth.instance.currentUser!.uid;
    final snapshot = await FirebaseFirestore.instance.collection('users').doc(uid).get();
    final data = snapshot.data();
    this.name = data?['name'];
    this.oftenUsePokemon = data?['oftenUsePokemon'];
    this.timeToPlay = data?['timeToPlay'];
    notifyListeners();
  }

  Future logout() async {
    await FirebaseAuth.instance.signOut();
    print('ログアウト');
  }
}