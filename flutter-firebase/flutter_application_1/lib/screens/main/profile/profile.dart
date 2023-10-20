// ignore_for_file: unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/screens/main/post/list.dart';
import 'package:flutter_application_1/services/posts.dart';
import 'package:flutter_application_1/services/user.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final PostService _postService = PostService();
  final UserService _userService = UserService();

  @override
  Widget build(BuildContext context) {
    final uid = ModalRoute.of(context)!.settings.arguments as String;

    return MultiProvider(
        providers: [
          StreamProvider.value(
              value: _userService.isFollowing(
                  FirebaseAuth.instance.currentUser?.uid, uid),
              initialData: null),
          StreamProvider.value(
            value: _postService.getPostsByUser(uid),
            initialData: null,
          ),
          StreamProvider.value(
              value: _userService.getUserInfo(uid), initialData: null),
        ],
        child: Scaffold(
            body: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (context, _) {
              return [
                SliverAppBar(
                  floating: false,
                  pinned: true,
                  expandedHeight: 130,
                  flexibleSpace: FlexibleSpaceBar(
                      background: Image.network(
                    Provider.of<UserModel?>(context)!.bannerImageUrl,
                    fit: BoxFit.cover,
                  )),
                ),
                SliverList(
                    delegate: SliverChildListDelegate([
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Provider.of<UserModel?>(context)!
                                          .profileImageUrl !=
                                      ''
                                  ? CircleAvatar(
                                      radius: 30,
                                      backgroundImage: NetworkImage(
                                          Provider.of<UserModel?>(context)!
                                              .profileImageUrl),
                                    )
                                  : const Icon(
                                      Icons.person,
                                      size: 50,
                                    ),
                              if (FirebaseAuth.instance.currentUser?.uid == uid)
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/edit');
                                    },
                                    child: const Text("Editar Perfil"))
                              else if (FirebaseAuth.instance.currentUser?.uid !=
                                      uid &&
                                  !Provider.of<bool>(context))
                                TextButton(
                                    onPressed: () {
                                      _userService.followUser(uid);
                                    },
                                    child: const Text("Follow"))
                              else if (FirebaseAuth.instance.currentUser?.uid !=
                                      uid &&
                                  Provider.of<bool>(context))
                                TextButton(
                                    onPressed: () {
                                      _userService.unFollowUser(uid);
                                    },
                                    child: const Text("Unfollow"))
                            ]),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              Provider.of<UserModel?>(context)!.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ]))
              ];
            },
            body: const ListPosts(),
          ),
        )));
  }
}
