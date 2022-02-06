import 'package:flutter/material.dart';
import 'package:pokemon_app/pokemondetail/pokemon_detail_page.model.dart';
import 'package:provider/provider.dart';

class PokemonDetailPage extends StatelessWidget {

  // イニシャライザ
  PokemonDetailPage(
      this.pokemonName,
      this.range,
      this.battleStyle,
      this.classificationOfTechniques,
      this.characteristic,
      );

  final String pokemonName;
  final String range;
  final String battleStyle;
  final String classificationOfTechniques;
  final String characteristic;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PokemonDetailModel>(
      create: (_) => PokemonDetailModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(pokemonName,style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color:Colors.white),
          ),
          backgroundColor: Colors.deepPurple,
        ),
        body: Column(
            children: [
            const SizedBox(height: 10),
            Row(
              children: [
                Row(
                  children: const [
                    Icon(Icons.catching_pokemon),
                    Text(
                      '基礎データ',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color:Colors.black),
                    ),
                    Icon(Icons.catching_pokemon),
                  ],
                ),
              ],
            ),
            const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '    攻撃の範囲',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color:Colors.black),
                  ),
                  Text(
                    range + '           ' ,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color:Colors.black),
                  ),
                ],
              ),
              const Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '  バトルスタイル',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color:Colors.black),
                  ),
                  Text(
                    battleStyle + '    ',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color:Colors.black),
                  ),
                ],
              ),
              const Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '    わざの分類',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color:Colors.black),
                  ),
                  Text(
                    classificationOfTechniques + '           ',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color:Colors.black),
                  ),
                ],
              ),
              const Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '      とくせい',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color:Colors.black),
                  ),

                  Text(
                    characteristic + '    ',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color:Colors.black),
                  ),
                ],
              ),
              const Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              Icon(Icons.catching_pokemon,color: Colors.orange,size: 330),
          ]),
    ),
    );
  }
}
