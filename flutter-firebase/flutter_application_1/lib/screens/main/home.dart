import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/auth.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService _authService = AuthService();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Draw Header'),
            ),

            ListTile(
              title: const Text('Profile'),
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),

            ListTile(
              title: const Text('Edit'),
              onTap: () {
                Navigator.pushNamed(context, '/edit');
              },
            ),

            ListTile(
              title: const Text('Logout'),
              onTap: () async {
                _authService.SignOut();
              },
            ),

         

          ],
        ),
      ),
    );
  }
}