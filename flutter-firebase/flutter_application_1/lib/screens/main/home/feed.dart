import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/main/post/list.dart';
import 'package:flutter_application_1/services/posts.dart';
import 'package:provider/provider.dart';

class Feed extends StatefulWidget {
  const Feed({super.key});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  final PostService _postService = PostService();
  @override
  Widget build(BuildContext context) {
    return FutureProvider.value(
        value: _postService.getFeed(),
        initialData: null,
        child: const Scaffold(
          body: ListPosts(),
        ));
  }
}
