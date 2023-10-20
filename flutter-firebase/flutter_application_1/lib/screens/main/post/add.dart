import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/posts.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  final PostService _postService = PostService();
  String text = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Twittear'),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () async {
              _postService.savePost(text);
              Navigator.pop(context);
            },
            child: Text('Tweet'),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Form(child: TextFormField(
          onChanged: (val) {
            setState(() {
              text = val;
            });
          },
        )),
      ),
    );
  }
}
