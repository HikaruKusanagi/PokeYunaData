
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/chat/chat_model.dart';
import 'package:pokemon_app/domain/chat.dart';
import 'package:pokemon_app/domain/comments.dart';
import 'package:provider/provider.dart';


class ChatListPage extends StatelessWidget {
  ChatListPage(this.comments,this.pokemonName);

  final Comments comments;
  final String pokemonName;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ChatListModel>(
        create:  (_) => ChatListModel()..addContent(pokemonName)..fetchCurrentUser()..fetchTalkUser(),
        child: Consumer<ChatListModel>(builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(comments.name, style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
              ),
              backgroundColor: Colors.orangeAccent,
              centerTitle: false,
            ),
            body: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    color: Colors.deepPurple,
                    child: Consumer<ChatListModel>(builder: (context, model, child) {
                      final List<Chat>? chat = model.chat;
                      if (chat == null) {
                        return const CircularProgressIndicator();
                      }
                        final List<Widget> widgets = chat
                            .map(
                              (chat) {

                                if (chat.uid == FirebaseAuth.instance.currentUser!.uid){
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        width: 200,
                                        child: Card(
                                          color: Colors.green,
                                          child: Text(chat.talk,
                                              style: TextStyle(fontSize: 15, color:Colors.black)),
                                        ),
                                      ),
                                    ],
                                  );
                                } else {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 200,
                                        child: Card(
                                          color: Colors.black,
                                          child: Text(chat.talk,
                                              style: TextStyle(fontSize: 15, color:Colors.white)),
                                        ),
                                      ),
                                    ],
                                  );
                                }


                              }
                        )
                            .toList();
                        model.fetchTalkUser();
                        return ListView(
                          children: widgets,
                        );
                    }),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 345,
                        color: Colors.white,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'メッセージを入力してください',
                          ),
                          onChanged: (text) {
                            model.talk = text;
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Material(
                        child: Ink(
                          decoration: const ShapeDecoration(
                            color: Colors.white,
                            shape: CircleBorder(),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.send),
                            color: Colors.orangeAccent,
                            onPressed: () async {
                              {
                                await model.addContent(pokemonName);
                              }
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ]),
              );
          },
        ),
    );
  }
}

