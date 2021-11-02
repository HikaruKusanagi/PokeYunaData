import 'package:flutter/material.dart';
import 'package:pokemon_app/pokemonlist/pokemon_detail_page.model.dart';
import 'package:pokemon_app/pokemonlist/waza_detail_page.dart';
import 'package:provider/provider.dart';

class PokemonDetailPage extends StatelessWidget {
  final String pokemonname;
  final String img;

  //攻撃
  final String attack1;
  final String attack2;
  final String attack3;
  final String attack4;


  //序盤わざ
  final String waza1;
  final String damage;
  final String damagelv1;
  final String damagelv2;
  final String damagelv3;


//わざ1A
  final String waza1A;

//ダメージ(1発目)
  final String damage1;
  final String damage1lv4;
  final String damage1lv5;
  final String damage1lv6;




  //わざ1B
  final String waza1B;
  //ダメージ(おいうちなし)
  final String damage3;
  final String damage3lv4;
  final String damage3lv5;
  final String damage3lv6;
  //ダメージ(正面)
  final String damage4;

  //わざ2
  final String waza2;
  //ダメージ
  final String damage6;
  final String damage6lv1;
  final String damage6lv2;
  final String damage6lv3;

  //わざ2A
  final String waza2A;
  //ダメージ
  final String damage7;
  final String damage7lv4;
  final String damage7lv5;
  final String damage7lv6;
  //わざ2B
  final String waza2B;
  //ダメージ
  final String damage9;
  final String damage9lv6;
  final String damage9lv7;
  final String damage9lv8;
  //ユナイトわざ
  final String unitewaza;
  //ダメージ
  final String damage10;
  final String damage10lv9;
  final String damage10lv10;
  final String damage10lv11;


  const PokemonDetailPage({Key? key,
    required this.pokemonname,
    required this.img,

    //攻撃
    required this.attack1,
    required this.attack2,
    required this.attack3,
    required this.attack4,
    //序盤わざ
    required this.waza1,
    required this.damage,
    required this.damagelv1,
    required this.damagelv2,
    required this.damagelv3,
    //わざ1A
    required this.waza1A,
    // ダメージ1発目
    required this.damage1,
    required this.damage1lv4,
    required this.damage1lv5,
    required this.damage1lv6,
    //ダメージ2発目
    //わざ1B
    required this.waza1B,
    //ダメージ(おいうちなし)
    required this.damage3,
    required this.damage3lv4,
    required this.damage3lv5,
    required this.damage3lv6,
    //ダメージ(正面)
    required this.damage4,

    //わざ2
    required this.waza2,
    //ダメージ
    required this.damage6,
    required this.damage6lv1,
    required this.damage6lv2,
    required this.damage6lv3,

    //わざ2A
    required this.waza2A,
    //ダメージ
    required this.damage7,
    required this.damage7lv4,
    required this.damage7lv5,
    required this.damage7lv6,

    //わざ2B
    required this.waza2B,
    //ダメージ
    required this.damage9,
    required this.damage9lv6,
    required this.damage9lv7,
    required this.damage9lv8,
    //ユナイトわざ
    required this.unitewaza,
    //ダメージ
    required this.damage10,
    required this.damage10lv9,
    required this.damage10lv10,
    required this.damage10lv11,

  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PokemonDetailModel>(
      create: (_) => PokemonDetailModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(pokemonname),
          backgroundColor: Colors.deepPurple,
        ),
        body: Consumer<PokemonDetailModel>(builder: (context, model, child) {
          return SingleChildScrollView(
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
                  const SizedBox(width: 130),
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
                        attack1,
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        'バトルスタイル',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        attack2,
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        'わざの分類',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        attack3,
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        'とくせい',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        attack4,
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
                              Tab(text: waza1),
                              Tab(text: waza1A),
                              Tab(text: waza1B),
                            ],
                          ),
                          SizedBox(
                            height: 120,
                            width: 500,
                            child: TabBarView(
                              children: [
                                WazaPage1(

                                  damagelv1:damagelv1,
                                  damagelv2:damagelv2,
                                  damagelv3:damagelv3,
                                ),
                                WazaPage1A(

                                  damage1lv4:damage1lv4,
                                  damage1lv5:damage1lv5,
                                  damage1lv6:damage1lv6,
                                ),
                                WazaPage1B(

                                  damage4:damage4,
                                    damage3lv5:damage3lv5,
                                    damage3lv6:damage3lv6,
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
                              Tab(text: waza2),
                              Tab(text: waza2A),
                              Tab(text: waza2B),
                            ],
                          ),
                          SizedBox(
                            height: 120,
                            width: 500,
                            child: TabBarView(
                              children: [
                                WazaPage2(

                                  damage6lv1:damage6lv1,
                                  damage6lv2:damage6lv2,
                                  damage6lv3:damage6lv3,
                                ),
                                WazaPage2A(

                                  damage7lv4:damage7lv4,
                                  damage7lv5:damage7lv5,
                                  damage7lv6:damage7lv6,
                                ),
                                WazaPage2B(

                                  damage9lv6:damage9lv6,
                                  damage9lv7:damage9lv7,
                                  damage9lv8:damage9lv8,
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
                                  Tab(text: unitewaza),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 120,
                            width: 500,
                            child: TabBarView(
                              children: [
                                UniteWazaPage(

                                  damage10lv9:damage10lv9,
                                  damage10lv10:damage10lv10,
                                  damage10lv11:damage10lv11,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ]),
          );
        }),
      ),
    );
  }
}

