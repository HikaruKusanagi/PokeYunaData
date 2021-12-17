import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'post_model.dart';

class PostPage extends StatelessWidget {

  PostPage(this.pokemonName);

  final String pokemonName;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PostModel>(
      create:  (_) => PostModel()..fetchUser()..addContent(pokemonName),
      child: Scaffold(
        appBar: AppBar(
          title: Text(pokemonName,style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color:Colors.white),
          ),
          backgroundColor: Colors.orangeAccent,
        ),
        body: Center(
          child: Consumer<PostModel>(builder: (context, model, child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  children: [
                    Row(
                      children: [
                        Text('使い方など、意見を書こう'),
                      ],
                    ),
                  Container(
                  height: 200,
                  decoration: BoxDecoration(
                    // 枠線
                    border: Border.all(color: Colors.black, width: 2),
                    // 角丸
                    borderRadius: BorderRadius.circular(8),
                  ),
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLength: null,
                      maxLines: null,
                      decoration: InputDecoration(
                        labelText: '入力',
                      ),
                      onChanged: (text) {
                        model.content = text;
                        },
                    ),
              ),
                    TextButton(
                      onPressed: () async {
                        try {
                          await model.addContent(pokemonName);
                          Navigator.of(context).pop(true);
                        } catch (e) {
                          final snackBar = SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(e.toString()),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: const Text('投稿',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20, color: Colors.orangeAccent)),
                    ),
            ]),
            );
          }),
        ),
      ),
    );
  }
}

