import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/screens/wrapper.dart';
import 'package:flutter_application_1/services/auth.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>.value(
      value: AuthService().user, 
      initialData: null,
      child: const MaterialApp(home: Wrapper()),);
  }
}
