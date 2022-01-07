import 'package:flutter/material.dart';
import 'package:pokemon_app/signup/signup_model.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignUpPageModel>(
      create: (_) => SignUpPageModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          title: Text('新規登録',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color:Colors.white
            ),
          ),
        ),
        body: Center(
          child: Consumer<SignUpPageModel>(builder: (context, model, child) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: model.titleController,
                        decoration: InputDecoration(
                          hintText: 'Email',
                        ),
                        onChanged: (text) {
                          model.setEmail(text);
                        },
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextField(
                        controller: model.authorController,
                        decoration: InputDecoration(
                          hintText: 'パスワード',
                        ),
                        onChanged: (text) {
                          model.setPassword(text);
                        },
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          model.startLoading();
                          // 追加の処理
                          try {
                            await model.signUp();
                            Navigator.of(context).pop();
                          } catch (e) {
                            final snackBar = SnackBar(
                              backgroundColor: Colors.red,
                              content: Text('Emailまたはパスワードが正しく入力されていません'),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } finally {
                            model.endLoading();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurple, //ボタンの背景色
                        ),
                        child: Text('登録',style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color:Colors.white
                        ),
                      ),
                      ),
                    ],
                  ),
                ),
                if (model.isLoading)
                  Container(
                    color: Colors.black54,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
              ],
            );
          }),
        ),
      ),
    );
  }
}