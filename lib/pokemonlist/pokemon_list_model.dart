import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/domain/pokemon.dart';

class PokemonListModel extends ChangeNotifier {
  List<Pokemon>? pokemon;

  void fechPokemonListModel() async {
    final QuerySnapshot snapshot =
    await FirebaseFirestore.instance.collection('pokemon').orderBy('createdAt', descending: false).get();

    final List<Pokemon> pokemon = snapshot.docs.map((
        DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String name = data['name'];
      final String range = data['range'];
      final String battleStyle = data['battleStyle'];
      final String classificationOfTechniques = data['classificationOfTechniques'];
      final String characteristic = data['characteristic'];
      final String techniqueSet1 = data['techniqueSet1'];
      final String techniqueSet1no2 = data['techniqueSet1no2'];
      final String techniqueSet1no3 = data['techniqueSet1no3'];
      final String techniqueSet2 = data['techniqueSet2'];
      final String techniqueSet2no2 = data['techniqueSet2no2'];
      final String techniqueSet2no3 = data['techniqueSet2no3'];
      final String techniqueText1 = data['techniqueText1'];
      final String techniqueText2 = data['techniqueText2'];
      final String techniqueText3 = data['techniqueText3'];
      final String techniqueText4 = data['techniqueText4'];
      final String techniqueText5 = data['techniqueText5'];
      final String techniqueText6 = data['techniqueText6'];
      final String uniteTechnique = data['uniteTechnique'];
      final String uniteTechniqueText = data['uniteTechniqueText'];
      final String coolTime = data['coolTime'];
      final String features = data['features'];
      return Pokemon(
        name,
        range,
        battleStyle,
        classificationOfTechniques,
        characteristic,
        techniqueSet1,
        techniqueSet1no2,
        techniqueSet1no3,
        techniqueSet2,
        techniqueSet2no2,
        techniqueSet2no3,
        techniqueText1,
        techniqueText2,
        techniqueText3,
        techniqueText4,
        techniqueText5,
        techniqueText6,
        uniteTechnique,
        uniteTechniqueText,
        coolTime,
        features,
      );
    }).toList();

    this.pokemon = pokemon;
    notifyListeners();
  }

  Future<void> searchPokemon(String pokemonName) async {

    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('pokemon')
        .where('name', isEqualTo: pokemonName)
        .get();

    final List<Pokemon> pokemon = snapshot.docs.map((
        DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String name = data['name'];
      final String range = data['range'];
      final String battleStyle = data['battleStyle'];
      final String classificationOfTechniques = data['classificationOfTechniques'];
      final String characteristic = data['characteristic'];
      final String techniqueSet1 = data ['techniqueSet1'];
      final String techniqueSet1no2 = data['techniqueSet1no2'];
      final String techniqueSet1no3 = data['techniqueSet1no3'];
      final String techniqueSet2 = data['techniqueSet2'];
      final String techniqueSet2no2 = data['techniqueSet2no2'];
      final String techniqueSet2no3 = data['techniqueSet2no3'];
      final String techniqueText1 = data['techniqueText1'];
      final String techniqueText2 = data['techniqueText2'];
      final String techniqueText3 = data['techniqueText3'];
      final String techniqueText4 = data['techniqueText4'];
      final String techniqueText5 = data['techniqueText5'];
      final String techniqueText6 = data['techniqueText6'];
      final String uniteTechnique = data['uniteTechnique'];
      final String uniteTechniqueText = data['uniteTechniqueText'];
      final String coolTime = data['coolTime'];
      final String features = data['features'];
      return Pokemon(
        name,
        range,
        battleStyle,
        classificationOfTechniques,
        characteristic,
        techniqueSet1,
        techniqueSet1no2,
        techniqueSet1no3,
        techniqueSet2,
        techniqueSet2no2,
        techniqueSet2no3,
        techniqueText1,
        techniqueText2,
        techniqueText3,
        techniqueText4,
        techniqueText5,
        techniqueText6,
        uniteTechnique,
        uniteTechniqueText,
        coolTime,
        features,
      );
    }).toList();
    this.pokemon = pokemon;
    notifyListeners();
  }
}
