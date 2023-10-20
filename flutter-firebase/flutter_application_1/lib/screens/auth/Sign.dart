import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/auth.dart';


// ignore: camel_case_types
class Sign extends StatefulWidget {
  const Sign({super.key});

  @override
  State<Sign> createState() => _SignState();
}

// ignore: camel_case_types
class _SignState extends State<Sign> {
  final AuthService _authService = AuthService();

  String email = "";
  String pass = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 8,
        title: const Text("SignUp"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
            child: Column(
          children: [
            TextFormField(
              onChanged: (val) => setState(() {
                email = val;
              }),
            ),
            TextFormField(
              onChanged: (val) => setState(() {
                pass = val;
              }),
            ),
            ElevatedButton(
                child: const Text("SignIn"),
                onPressed: () async => {
                      _authService.SignIn(email, pass),
                    }),
            ElevatedButton(
                child: const Text("SignUp"),
                onPressed: () async => {
                      _authService.SignUp(email, pass),
                    }),
          ],
        )),
      ),
    );
  }
}
