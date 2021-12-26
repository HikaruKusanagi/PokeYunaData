import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/bottomnavigationbar/bottom_navigation_bar.dart';
import 'package:pokemon_app/login/login_page.dart';
import 'package:pokemon_app/singup/singup_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ポケユナデータ',
      home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // スプラッシュ画面などに書き換えても良い
              return const SizedBox();
            }
            if (snapshot.hasData) {
              // User が null でなない、つまりサインイン済みのホーム画面へ
              return BottomNavigationBarPage();
            }
            // User が null である、つまり未サインインのサインイン画面へ
            return BottomNavigationBarPage();
          }
      ),
    );
  }
}

