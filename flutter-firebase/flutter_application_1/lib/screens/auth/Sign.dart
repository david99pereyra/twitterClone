import 'package:flutter/material.dart'; 
import 'package:flutter_application_1/services/auth.dart';


// ignore: camel_case_types
class sign extends StatefulWidget {
  const sign({super.key});

  @override
  State<sign> createState() => _signState();
}

// ignore: camel_case_types
class _signState extends State<sign> {
  final AuthService _authService = AuthService();

  String email = "";
  String pass = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 8,
        title: const Text("signUp"),
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
                child: Text("SignIn"),
                onPressed: () async => {
                      _authService.SignIn(email, pass),
                    }),
            ElevatedButton(
                child: Text("SignUp"),
                onPressed: () async => {
                      _authService.SignUp(email, pass),
                    }),
          ],
        )),
      ),
    );
  }
}
