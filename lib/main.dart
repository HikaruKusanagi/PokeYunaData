
import 'package:flutter/material.dart';
import 'package:pokemon_app/bar/bar_page.dart';


void main() async {

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

