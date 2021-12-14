import 'package:flutter/material.dart';
import 'package:pokemon_app/pokemonlist/pokemon_list_model.dart';
import 'package:provider/provider.dart';


class ChatListPage extends StatelessWidget {


  const ChatListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PokemonListModel>(
      create:  (_) => PokemonListModel()..fechPokemonListModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('チャット',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color:Colors.white),
          ),
          backgroundColor: Colors.orangeAccent,
          centerTitle: false,
        ),
        body: const Center(
          child: Text(
            'ログインすると使用可能',
            style: TextStyle(fontSize: 20),
          ),
        ),
        ),
    );
  }
}

