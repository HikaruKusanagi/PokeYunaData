import 'package:flutter/material.dart';
import 'package:pokemon_app/bar/bar_page.dart';

//ここからアプリが起動
//void とは　戻り値がないと分かっている場合に使うデータ型である。(日本語で)
void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ユナイトデータ',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: BarPage(),
    );
  }
}

