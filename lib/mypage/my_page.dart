import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/bottomnavigationbar/bottom_navigation_bar.dart';
import 'package:pokemon_app/editpage/edit_page.dart';
import 'package:pokemon_app/mypage/my_model.dart';
import 'package:provider/provider.dart';


class MyPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyModel>(
      create:  (_) => MyModel()..fetchUser(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('マイページ',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color:Colors.white),
            ),
            actions: [
              Consumer<MyModel>(builder: (context, model, child) {
                  return IconButton(
                    onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                            //nullじゃないと確定させるために!を使う必要がある
                                EditPage(model.name!, model.oftenUsePokemon!,model.timeToPlay!),
                          ),
                        );
                        model.fetchUser();
                      },
                    icon: Icon(Icons.edit),
                  );
                }
              )],
            backgroundColor: Colors.orangeAccent,
          ),
          body: Container(
            color: Colors.deepPurple,
            child: Center(
              child: Consumer<MyModel>(builder: (context, model, child) {
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
                                child: Icon(EvaIcons.person,size: 100, color: Colors.orangeAccent),
                              ),
                              Column(
                                children: [
                                  Text('プレイヤーネーム',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28,color: Colors.white),),
                                  Text(model.name ??'ななし',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
                                ],
                              ),
                              SizedBox(width: 30),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(EvaIcons.emailOutline,color: Colors.red),Text('Emailアドレス',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                              SizedBox(width: 110),
                              Text(model.email ??'未入',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.catching_pokemon,color: Colors.deepOrangeAccent,),Text('よくつかうポケモン',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                              SizedBox(width: 80),
                              Text(model.oftenUsePokemon ??'未入',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.schedule,color: Colors.blue),
                              Text('プレイする時間帯',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                              SizedBox(width: 120),
                              Text(model.timeToPlay ??'未入',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                            ],
                          ),
                          TextButton(
                            child: Text('ログアウト',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20, color: Colors.red)),
                            onPressed: () async {
                              showDialog(
                                context: context,
                                builder: (_) {
                                  return AlertDialog(
                                    title: Text('確認'),
                                    content: Text('ログアウトしますか？'),
                                    actions: [
                                      TextButton(
                                          child: Text('キャンセル'),
                                          onPressed:(){
                                            Navigator.of(context).pop();
                                          }
                                      ),
                                      TextButton(
                                          child: Text('OK'),
                                          onPressed:() async {
                                            await model.logout();
                                            await Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => BottomNavigationBarPage(),
                                                ),
                                                    (_) => false);
                                          }
                                      ),
                                    ],
                                  );
                                }
                                );
                             },
                          ),
                        ]),
                    ),
                    if(model.isLoading)
                      Container(
                        color: Colors.black54,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
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

