import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/chatlist/chatlist_model.dart';
import 'package:pokemon_app/chatlist/chatlist_page.dart';

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
        body: Container(
          color: Colors.deepPurple,
          child: Center(
            child: Consumer<ContentUserModel>(builder: (context, model, child) {
              return Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(EvaIcons.person,size: 100,color: Colors.orangeAccent),
                              ),
                              Column(
                                children: [
                                  Text('プレイヤーネーム',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28,color: Colors.white),),
                                  Text(model.name ??'未記入',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
                                ],
                              ),
                              SizedBox(width: 30),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.catching_pokemon,color: Colors.deepOrangeAccent,),Text('よくつかうキャラクター',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                              SizedBox(width: 80),
                              Text(model.oftenUsePokemon ??'未記入',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.schedule,color: Colors.blue),
                              Text('プレイする時間帯',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                              SizedBox(width: 150),
                              Text(model.timeToPlay ??'未記入',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                            ],
                          ),
                          //アップデート予定
                          // TextButton(
                          //   child: Text('オープンチャット',style: TextStyle(
                          //       fontWeight: FontWeight.bold,
                          //       fontSize: 20, color: Colors.green)),
                          //   onPressed: () async {
                          //     await Navigator.push(context,
                          //       MaterialPageRoute(
                          //         builder: (context) => OpenChatPage(comments,pokemonName,),
                          //       ),
                          //     );
                          //     },
                          // ),
                        ]),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}