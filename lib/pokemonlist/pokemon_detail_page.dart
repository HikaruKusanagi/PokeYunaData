import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/contentuser/content_user_page.dart';
import 'package:pokemon_app/domain/comments.dart';
import 'package:pokemon_app/pokemonlist/pokemon_detail_page.model.dart';
import 'package:pokemon_app/pokemonlist/waza_detail_page.dart';
import 'package:pokemon_app/post/post_page.dart';
import 'package:provider/provider.dart';

class PokemonDetailPage extends StatelessWidget {

  // イニシャライザ
  PokemonDetailPage(this.pokemonName,this.range,);

  final String pokemonName;
  final String range;


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
            return IconButton(
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PostPage(pokemonName),
                  ),
                );
                model.fetchComments(pokemonName);
                },
              icon: Icon(Icons.edit),
            );
          })
          ],
          backgroundColor: Colors.deepPurple,
        ),
        body:
          SingleChildScrollView(
              child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                        Text(
                          range,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color:Colors.black),
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          'バトルスタイル',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text('',
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          'わざの分類',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text('',
                          style: const TextStyle(fontSize: 20),),
                        const SizedBox(height: 30),
                        const Text(
                          'とくせい',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text('',
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Text(
                      'わざセット1',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                Container(
                  color: Colors.orange,
                  child: DefaultTabController(
                    length: 3,
                    child: Column(
                      children: [
                        TabBar(
                          labelColor: Colors.black,
                          indicatorColor: Colors.black,
                          tabs: [
                            Tab(text: ''),
                            Tab(text: ''),
                            Tab(text: ''),
                          ],
                        ),
                        SizedBox(
                          height: 120,
                          width: 500,
                          child: TabBarView(
                            children: [
                              WazaPage1(
                                damagelv1:'',
                                damagelv2:'',
                                damagelv3:'',
                              ),
                              WazaPage1A(
                                damage1lv4:'',
                                damage1lv5:'',
                                damage1lv6:'',
                              ),
                              WazaPage1B(
                                damage4:'',
                                damage3lv5:'',
                                damage3lv6:'',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: const [
                    Text(
                      'わざセット2',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                Container(
                  color: Colors.orange,
                  child: DefaultTabController(
                    length: 3,
                    child: Column(
                      children: [
                        TabBar(
                          labelColor: Colors.black,
                          indicatorColor: Colors.black,
                          tabs: [
                            Tab(text: ''),
                            Tab(text: ''),
                            Tab(text: ''),
                          ],
                        ),
                        SizedBox(
                          height: 120,
                          width: 500,
                          child: TabBarView(
                            children: [
                              WazaPage2(
                                damage6lv1:'',
                                damage6lv2:'',
                                damage6lv3:'',
                              ),
                              WazaPage2A(
                                damage7lv4:'',
                                damage7lv5:'',
                                damage7lv6:'',
                              ),
                              WazaPage2B(
                                damage9lv6:'',
                                damage9lv7:'',
                                damage9lv8:'',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: const [
                    Text(
                      'ユナイトわざ',
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
                        SizedBox(
                          height: 120,
                          width: 500,
                          child: TabBarView(
                            children: [
                              UniteWazaPage(
                                damage10lv9:'',
                                damage10lv10:'',
                                damage10lv11:'',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: const [
                    Text('みんなの意見',
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
                                              builder: (context) => ContentUserPage(comments.name, comments.oftenUsePokemon),
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
              ])
          ),
    ),
    );
  }
}
