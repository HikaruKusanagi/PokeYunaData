import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/chat/chat_page.dart';
import 'package:pokemon_app/contentuser/content_user_model.dart';
import 'package:pokemon_app/domain/comments.dart';
import 'package:provider/provider.dart';

class ContentUserPage extends StatelessWidget {
  ContentUserPage(this.comments,this.pokemonName);

  final Comments comments;
  final String pokemonName;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ContentUserModel>(
      create:  (_) => ContentUserModel()..fetchComments(comments),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ユーザーページ',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color:Colors.white),
          ),
          backgroundColor: Colors.orangeAccent,
        ),
        body: Center(
          child: Consumer<ContentUserModel>(builder: (context, model, child) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(EvaIcons.person,color: Colors.brown),Text('プレイヤーネーム'),
                            SizedBox(width: 135),
                            Text(model.name ??'未記入',style: TextStyle(fontWeight: FontWeight.bold,),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.catching_pokemon,color: Colors.deepOrangeAccent,),Text('よくつかうキャラクター'),
                            SizedBox(width: 80),
                            Text(model.oftenUsePokemon ??'未記入'),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.schedule,color: Colors.indigoAccent),
                            Text('プレイする時間帯'),
                            SizedBox(width: 150),
                            Text(model.timeToPlay ??'未記入'),
                          ],
                        ),
                        TextButton(
                          child: Text('チャット',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20, color: Colors.green)),
                          onPressed: () async {
                            await Navigator.push(context,
                              MaterialPageRoute(
                                builder: (context) => ChatListPage(comments,pokemonName),
                              ),
                            );
                            },
                        ),
                      ]),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}