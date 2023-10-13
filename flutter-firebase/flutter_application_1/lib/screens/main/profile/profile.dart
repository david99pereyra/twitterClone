import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/main/post/list.dart';
import 'package:flutter_application_1/services/posts.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final PostService _postService = PostService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
        initialData: null, 
        value: 
          _postService.getPostsByUser(FirebaseAuth.instance.currentUser?.uid),
        child: Scaffold(
          body: Container(
            child: const ListPosts(),
          )
        ),
      );
  }
}
