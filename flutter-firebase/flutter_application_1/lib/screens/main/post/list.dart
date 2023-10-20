import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/post.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/services/posts.dart';
import 'package:flutter_application_1/services/user.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ListPosts extends StatefulWidget {
  const ListPosts({super.key});

  @override
  State<ListPosts> createState() => _ListPostsState();
}

class _ListPostsState extends State<ListPosts> {
  final UserService _userService = UserService();
  final PostService _postService = PostService();

  @override
  Widget build(BuildContext context) {
    final posts = Provider.of<List<PostModel?>?>(context);
    print(posts!.length);

    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return StreamBuilder(
          stream: _userService.getUserInfo(post!.creador),
          builder: (BuildContext context, AsyncSnapshot<UserModel?> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListTile(
              title: Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: Row(
                  children: [
                    snapshot.data!.profileImageUrl != ''
                        ? CircleAvatar(
                            radius: 20,
                            backgroundImage:
                                NetworkImage(snapshot.data!.profileImageUrl))
                        : const Icon(
                            Icons.person,
                            size: 30,
                          ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(snapshot.data!.name)
                  ],
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(post.texto),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(post.fecha.toDate().toString()),
                        RatingBar.builder(
                            initialRating: 0,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: false,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.black,
                                ),
                            onRatingUpdate: (rating) async {
                              await _postService.serCalificacionPost(post.id, rating);
                            })
                      ],
                    ),
                  ),
                  const Divider()
                ],
              ),
            );
          },
        );
      },
    );
  }
}
