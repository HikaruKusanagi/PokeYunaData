import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/domain/pkemon.dart';

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

      return Pokemon(name, range);
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
      return Pokemon(name, range);
    }).toList();

    this.pokemon = pokemon;
    notifyListeners();
  }
}