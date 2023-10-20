import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/screens/auth/Sign.dart';
import 'package:flutter_application_1/screens/main/home.dart';
import 'package:flutter_application_1/screens/main/post/add.dart';
import 'package:flutter_application_1/screens/main/profile/edit.dart';
import 'package:flutter_application_1/screens/main/profile/profile.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);
    if (user == null) {
      return const Sign();
    }

    return MaterialApp(
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => const Home(), 
        '/add': (context) => const Add(),
        '/profile': (context) => const Profile(),
        '/edit': (context) => const Edit(),
      },
      debugShowCheckedModeBanner: false
    );
  }
}
