import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/bottomnavigationbar/bottom_navigation_bar_model.dart';
import 'package:pokemon_app/login/login_page.dart';
import 'package:pokemon_app/mypage/my_page.dart';
import 'package:pokemon_app/notification/notification_page.dart';
import 'package:pokemon_app/overbord_page.dart';
import 'package:pokemon_app/pokemonlist/pokemon_list_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';




class BottomNavigationBarPage extends StatelessWidget {



  final currentTab = [
    PokemonListPage(),
    NotificationPage(),
  ];

  final List<String> _tabNames = ['キャラクター','チャット','お知らせ',];

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) => _showTutorial(context));
    return ChangeNotifierProvider<BottomNavigationBarModel>(
        create: (_) => BottomNavigationBarModel(),
    child: Consumer<BottomNavigationBarModel>(
    builder: (context, model, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Text('ポケユナデータ',style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color:Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: () async {
                if (FirebaseAuth.instance.currentUser != null) {
                  //ログインしている状態
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyPage(),
                      fullscreenDialog: true,
                    ),
                  );
                } else {
                  //ログインしていない状態
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                      fullscreenDialog: true,
                    ),
                  );
                }
                },
              icon: Icon(Icons.person),
            )],
          flexibleSpace: Container(
            decoration: const BoxDecoration(
            ),
          ),
          centerTitle: true,
        ),


        //currentIndex:現在、選択されているindex。このindexのアイコンが選択状態になる
        body: currentTab[model.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: model.currentIndex,
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.deepPurple,
          backgroundColor: Colors.orangeAccent,
          //アイコンをタップしたときの処理。
          onTap: (index) {
            model.onTabTapped(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.catching_pokemon),
              label: _tabNames[0],
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.chat),
              label: _tabNames[1],
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.info),
              label: _tabNames[2],
            ),
          ],
        ),
      );
    }),
    );
  }
}


void _showTutorial(BuildContext context) async {
  final pref = await SharedPreferences.getInstance();

  if (pref.getBool('isAlreadyFirstLaunch') != true) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OverboardPage(),
        fullscreenDialog: true,
      ),
    );
    pref.setBool('isAlreadyFirstLaunch', true);
  }
}
