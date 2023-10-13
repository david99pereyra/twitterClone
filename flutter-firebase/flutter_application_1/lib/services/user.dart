import 'dart:collection';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/services/utils.dart';

class UserService {
  final UtilsService _utilsService = UtilsService();

  Future<void> updateProfile(
      File? bannerImage, File? profileImage, String name) async {
    String bannerImageUrl = '';
    String profileImageUrl = '';

    if(bannerImage !=null){
      bannerImageUrl = await _utilsService.uploadFile(bannerImage,
        'user/profile/${FirebaseAuth.instance.currentUser?.uid}/banner');
    }

    if (profileImage != null) {
      profileImageUrl = await _utilsService.uploadFile(profileImage,
          'user/profile/${FirebaseAuth.instance.currentUser?.uid}/profile');
    }

    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();

    if (snapshot.exists) {
      Map<String, Object> data = HashMap();
      if (name != '') data['name'] = name;
      if (bannerImageUrl != '') data['bannerImageUrl'] = bannerImageUrl;
      if (profileImageUrl != '') data['profileImageUrl'] = profileImageUrl;

      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .update(data);
    }
  }
}
