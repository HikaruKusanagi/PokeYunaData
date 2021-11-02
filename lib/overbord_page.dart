import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';

class OverboardPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OverBoard(
        pages: pages,
        showBullets: true,
        skipCallback: () {

          Navigator.pop(context);
        },
        finishCallback: () {

          Navigator.pop(context);
        },
      ),
    );
  }

  final pages = [
    PageModel(
        color: Colors.deepPurple,
        imageAssetPath: 'images/アプリアイコン.png',
        title: 'ユーザー様へ',
        body: 'アプリのダウンロード\n誠にありがとうございます',
        doAnimateImage: true),
    PageModel(
        color: Colors.deepPurple,
        imageAssetPath: 'assets/ポケモンデータ詳細.png',
        title: 'コンセプト',
        body: 'ポケモンユナイトに登場する\n全てのポケモンの基礎データを\n即座に確認可能！',
        doAnimateImage: true),
    PageModel.withChild(
        child: const Padding(
          padding: EdgeInsets.only(bottom: 25.0),
          child: Text(
            ' さあ、対戦に備えて\n     基礎データを\n      確認しよう！',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
            ),
          ),
        ),
        color: Colors.deepPurple,
        doAnimateChild: true)
  ];
}
