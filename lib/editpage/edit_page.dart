import 'package:flutter/material.dart';
import 'package:pokemon_app/editpage/edit_model.dart';
import 'package:provider/provider.dart';

class EditPage extends StatelessWidget {
  EditPage(this.name, this.description);

  final String name;
  final String description;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EditModel>(
      create:  (_) => EditModel(name, description),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('プロフィール編集',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color:Colors.white),
          ),
          backgroundColor: Colors.orangeAccent,
        ),
        body: Center(
          child: Consumer<EditModel>(builder: (context, model, child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
                  child: Column(
                      children: [
                        TextField(
                          controller: model.nameController,
                          decoration: InputDecoration(
                            hintText: 'プレイヤーネーム'
                          ),
                        onChanged: (text) {
                            model.setName(text);
                        },
                        ),
                        TextField(
                            controller: model.descriptionController,
                            decoration: InputDecoration(
                                hintText: '自己紹介'
                            ),
                            onChanged: (text) {
                              model.setDescription(text);
                            },
                        ),
                        TextButton(
                          onPressed: model.isUpdated()
                            ? () async {
                            try {
                              await model.update();
                              Navigator.of(context).pop();
                            } catch (e) {
                              final snackBar = SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(e.toString()),
                              );
                              ScaffoldMessenger.of(context)
                              .showSnackBar(snackBar);
                            }
                         }
                        : null,
                          child: const Text('更新',style: TextStyle(
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
