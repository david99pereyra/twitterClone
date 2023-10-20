import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/main/profile/list.dart';
import 'package:flutter_application_1/services/user.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final UserService _userService = UserService();
  String search = '';

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
        value: _userService.queryByName(search),
        initialData: null,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                onChanged: (text) {
                  setState(() {
                    search = text;
                  });
                },
                decoration: const InputDecoration(hintText: 'Search...'),
              ),
            ),
            const ListUsers(),
          ],
        ));
  }
}
