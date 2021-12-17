import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarModel extends ChangeNotifier {

  String? name;
  String? email;
  String? description;

  int _currentIndex = 0;
  get currentIndex => _currentIndex;

  void onTabTapped(int index) async {
    _currentIndex = index;

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
