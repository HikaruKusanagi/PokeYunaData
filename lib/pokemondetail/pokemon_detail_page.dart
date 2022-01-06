import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/contentuser/content_user_page.dart';
import 'package:pokemon_app/domain/comments.dart';
import 'package:pokemon_app/pokemondetail/pokemon_detail_page.model.dart';
import 'package:pokemon_app/post/post_page.dart';
import 'package:provider/provider.dart';

class PokemonDetailPage extends StatelessWidget {

  // イニシャライザ
  PokemonDetailPage(
      this.pokemonName,
      this.range,
      this.battleStyle,
      this.classificationOfTechniques,
      this.characteristic,
      this.techniqueSet1,
      this.techniqueSet1no2,
      this.techniqueSet1no3,
      this.techniqueSet2,
      this.techniqueSet2no2,
      this.techniqueSet2no3,
      this.techniqueText1,
      this.techniqueText2,
      this.techniqueText3,
      this.techniqueText4,
      this.techniqueText5,
      this.techniqueText6,
      this.uniteTechnique,
      this.uniteTechniqueText,
      this.coolTime,
      this.features,
      );

  final String pokemonName;
  final String range;
  final String battleStyle;
  final String classificationOfTechniques;
  final String characteristic;
  final String techniqueSet1;
  final String techniqueSet1no2;
  final String techniqueSet1no3;
  final String techniqueSet2;
  final String techniqueSet2no2;
  final String techniqueSet2no3;
  final String techniqueText1;
  final String techniqueText2;
  final String techniqueText3;
  final String techniqueText4;
  final String techniqueText5;
  final String techniqueText6;
  final String uniteTechnique;
  final String uniteTechniqueText;
  final String coolTime;
  final String features;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PokemonDetailModel>(
      create: (_) => PokemonDetailModel()..fetchComments(pokemonName),
      child: Scaffold(
        appBar: AppBar(
          title: Text(pokemonName,style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color:Colors.white),
          ),
          actions: [
          Consumer<PokemonDetailModel>(builder: (context, model, child) {
            if (FirebaseAuth.instance.currentUser != null) {
              return IconButton(onPressed:
                  () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PostPage(pokemonName),
                  ),
                );
                model.fetchComments(pokemonName);
                }, icon: Icon(Icons.edit)
              );
            } else {
              return SizedBox();
            }
          }),
          ],
          backgroundColor: Colors.deepPurple,
        ),
        body: SingleChildScrollView(
            child:
            Column(
                children: [
                const SizedBox(height: 10),
                Row(
                  children: const [
                    Text(
                      '基礎データ',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 5,
                  color: Colors.orange,
                ),
                Row(
                  children: [
                    const SizedBox(width: 110),
                    Column(
                      children: [
                        Row(
                          children: const [
                            Text(
                              '攻撃の範囲',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.orangeAccent),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.orangeAccent,
                          ),
                          child: Text(
                            range,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color:Colors.black),
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          'バトルスタイル',
                          style: TextStyle(fontSize: 20),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.orangeAccent),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.orangeAccent,
                          ),
                          child: Text(battleStyle,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          'わざの分類',
                          style: TextStyle(fontSize: 20),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.orangeAccent),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.orangeAccent,
                          ),
                          child: Text(classificationOfTechniques,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20),),
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          'とくせい',
                          style: TextStyle(fontSize: 20),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.orangeAccent),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.orangeAccent,
                          ),
                          child: Text(characteristic,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                //アップデートで追加予定
                // Row(
                //   children: const [
                //     Text(
                //       'わざセット1',
                //       style: TextStyle(fontSize: 20),
                //     ),
                //   ],
                // ),
                // Container(
                //   color: Colors.orange,
                //   child: DefaultTabController(
                //     length: 3,
                //     child: Column(
                //       children: [
                //         //わざセット１のタブ
                //         TabBar(
                //           labelColor: Colors.black,
                //           indicatorColor: Colors.black,
                //           tabs: [
                //             Tab(text: techniqueSet1),
                //             Tab(text: techniqueSet1no2),
                //             Tab(text: techniqueSet1no3.replaceAll('\\n', '\n'),),
                //           ],
                //         ),
                //         SizedBox(
                //           height: 120,
                //           width: 500,
                //           //わざセット１技テキスト画面
                //           child: TabBarView(
                //             children: [
                //               WazaPage1(
                //                 damagelv1:techniqueText1.replaceAll('\\n', '\n'),
                //                 damagelv2:'',
                //                 damagelv3:'',
                //               ),
                //               WazaPage1A(
                //                 damage1lv4:techniqueText2.replaceAll('\\n', '\n'),
                //                 damage1lv5:'',
                //                 damage1lv6:'',
                //               ),
                //               WazaPage1B(
                //                 damage4:techniqueText3.replaceAll('\\n', '\n'),
                //                 damage3lv5:'',
                //                 damage3lv6:'',
                //               ),
                //             ],
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // Row(
                //   children: const [
                //     Text(
                //       'わざセット2',
                //       style: TextStyle(fontSize: 20),
                //     ),
                //   ],
                // ),
                // Container(
                //   color: Colors.orange,
                //   child: DefaultTabController(
                //     length: 3,
                //     child: Column(
                //       children: [
                //         TabBar(
                //           labelColor: Colors.black,
                //           indicatorColor: Colors.black,
                //           tabs: [
                //             Tab(text: techniqueSet2),
                //             Tab(text: techniqueSet2no2),
                //             Tab(text: techniqueSet2no3),
                //           ],
                //         ),
                //         SizedBox(
                //           height: 120,
                //           width: 500,
                //           child: TabBarView(
                //             children: [
                //               WazaPage2(
                //                 damage6lv1: techniqueText4.replaceAll('\\n', '\n'),
                //                 damage6lv2:'',
                //                 damage6lv3:'',
                //               ),
                //               WazaPage2A(
                //                 damage7lv4: techniqueText5.replaceAll('\\n', '\n'),
                //                 damage7lv5:'',
                //                 damage7lv6:'',
                //               ),
                //               WazaPage2B(
                //                 damage9lv6: techniqueText6.replaceAll('\\n', '\n'),
                //                 damage9lv7:'',
                //                 damage9lv8:'',
                //               ),
                //             ],
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // Row(
                //   children: const [
                //     Text(
                //       'ユナイトわざ',
                //       style: TextStyle(fontSize: 20),
                //     ),
                //   ],
                // ),
                // Container(
                //   color: Colors.orange,
                //   child: DefaultTabController(
                //     length: 1,
                //     child: Column(
                //       children: [
                //         TabBar(
                //           labelColor: Colors.black,
                //           indicatorColor: Colors.black,
                //           tabs: [
                //             Row(
                //               children: [
                //                 Tab(text: uniteTechnique,
                //                 ) ],
                //             ),
                //           ],
                //         ),
                //         SizedBox(
                //           height: 120,
                //           width: 500,
                //           child: TabBarView(
                //             children: [
                //               UniteWazaPage(
                //                 damage10lv9: uniteTechniqueText.replaceAll('\\n', '\n'),
                //                 damage10lv10:'',
                //                 damage10lv11:features,
                //               ),
                //             ],
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                Row(
                  children: const [
                    Text('みんなの投稿',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                  Container(
                    color: Colors.orange,
                    child: DefaultTabController(
                      length: 1,
                      child: Column(
                          children: [
                            TabBar(
                              labelColor: Colors.black,
                              indicatorColor: Colors.black,
                              tabs: [
                                Row(
                                  children: [
                                    Tab(text: '',
                                    ) ],
                                ),
                              ],
                            ),
                            Container(
                              height: 300,
                              color: Colors.grey,
                              child: Consumer<PokemonDetailModel>(builder: (context, model, child) {
                                final List<Comments>? comments = model.comments;
                                if (comments == null) {
                                  return const CircularProgressIndicator();
                                }
                                final List<Widget> widgets = comments
                                    .map(
                                      (comments) => Card(
                                        child: ListTile(
                                          onTap: () async {
                                            await Navigator.push(context,
                                            MaterialPageRoute(
                                              builder: (context) => ContentUserPage(comments,pokemonName),
                                            ),
                                          );
                                            },
                                          title: Row(
                                            children: [
                                              Icon(EvaIcons.person,color: Colors.brown),
                                              Text('プレイヤーネーム'),
                                              SizedBox(width: 100),
                                              Text(comments.name,style: TextStyle(
                                                  fontSize: 15,
                                                  color:Colors.black),
                                              ),
                                            ],
                                          ),
                                          subtitle: Row(
                                            children: [
                                              Icon(EvaIcons.edit,color: Colors.red),Text('コメント',style: TextStyle(
                                                  fontSize: 15,
                                                  color:Colors.black),),
                                              SizedBox(width: 100),
                                              //nullだった場合何を入れるかを??を使って書く必要がある
                                            Text(comments.content,style: TextStyle(
                                            fontSize: 15,
                                                color:Colors.black),),
                                            ],
                                          ),
                                        ),
                                      ),
                                )
                                    .toList();
                                return ListView(
                                  children: widgets,
                                );
                              }),
                            ),
                          ]),
                    ),
                ),
              ]),
          ),
    ),
    );
  }
}
