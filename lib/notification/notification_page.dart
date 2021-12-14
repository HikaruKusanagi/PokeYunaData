import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);





  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          flexibleSpace: Container(
            decoration: const BoxDecoration(),
          ),
          title: const Text('お知らせ'),
          centerTitle: false,
        ),
        body: Column(
          children: [
            Row(
              children: const [
                Text(
                  '「ポケユナデータ」を\nダウンロードしていただき\nありがとうございます。',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: const [
                Text(
                  '今後の実装内容はユーザーの\nダウンロード数や意見など\n拝見し、アプリを成長させる\n方針です。',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: const [
                Text(
                  '製作者Twitter@hikarugp24。',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ],
        )
    );
  }
}