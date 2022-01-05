import 'package:flutter/material.dart';
import 'package:pokemon_app/domain/pokemon.dart';
import 'package:pokemon_app/pokemondetail/pokemon_detail_page.dart';
import 'package:pokemon_app/pokemonlist/pokemon_list_model.dart';
import 'package:provider/provider.dart';


class PokemonListPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PokemonListModel>(
      create: (_) => PokemonListModel()..fechPokemonListModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              const Text('キャラクター', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: Consumer<PokemonListModel>(builder: (context, model, child) {
                        return TextField(
                          onChanged: (text) {
                            model.searchPokemon(text);
                          },
                          cursorColor: Colors.brown,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Icon(Icons.search, color: Colors.brown),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Colors.brown),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Colors.brown),
                            ),
                            hintText: '例/アブソル',
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.orangeAccent,
          centerTitle: false,
        ),

        body: Center(
          child: Consumer<PokemonListModel>(builder: (context, model, child) {
            final List<Pokemon>? pokemon = model.pokemon;

            if (pokemon == null) {
              return const CircularProgressIndicator();
            }

            final List<Widget> widgets = pokemon
                .map(
                  (pokemon) =>
                  ListTile(
                      title: Text(pokemon.name, style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PokemonDetailPage(
                                    pokemon.name,
                                    pokemon.range,
                                    pokemon.battleStyle,
                                    pokemon.classificationOfTechniques,
                                    pokemon.characteristic,
                                    pokemon.techniqueSet1,
                                    pokemon.techniqueSet1no2,
                                    pokemon.techniqueSet1no3,
                                    pokemon.techniqueSet2,
                                    pokemon.techniqueSet2no2,
                                    pokemon.techniqueSet2no3,
                                    pokemon.techniqueText1,
                                    pokemon.techniqueText2,
                                    pokemon.techniqueText3,
                                    pokemon.techniqueText4,
                                    pokemon.techniqueText5,
                                    pokemon.techniqueText6,
                                    pokemon.uniteTechnique,
                                    pokemon.uniteTechniqueText,
                                    pokemon.coolTime,
                                    pokemon.features,
                                  ),
                            )
                        );
                      }
                  ),
            )
                .toList();
            return ListView(
              children: widgets,
            );
          }),
        ),
      ),
      );
  }
}

