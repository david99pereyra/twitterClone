import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/user.dart';
import 'package:image_picker/image_picker.dart';

class Edit extends StatefulWidget {
  const Edit({super.key});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  final UserService _userService = UserService();
  File? _profileImage;
  File? _bannerImage;
  final picker = ImagePicker();
  String name = '';

  Future getImagen(int type) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null && type == 0) {
        _profileImage = File(pickedFile.path);
      }

      if (pickedFile != null && type == 1) {
        _bannerImage = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
            child: const Text('Guardar'),
            onPressed: () async {
              print(_bannerImage);
              print(_profileImage);
              await _userService.updateProfile(
                  _bannerImage, _profileImage, name);
              // ignore: use_build_context_synchronously
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: Form(
              child: Column(
            children: [
              TextButton(
                  onPressed: () => getImagen(0),
                  // ignore: unnecessary_null_comparison
                  child: _profileImage == null
                      ? const Icon(Icons.person)
                      : Image.network(
                          _profileImage!.path,
                          height: 100,
                        )),
              TextButton(
                  onPressed: () => getImagen(1),
                  // ignore: unnecessary_null_comparison
                  child: _bannerImage == null
                      ? const Icon(Icons.person)
                      : Image.network(
                          _bannerImage!.path,
                          height: 100,
                        )),
              TextFormField(
                onChanged: (val) => setState(() {
                  name = val;
                }),
              )
            ],
          ))),
    );
  }
}
