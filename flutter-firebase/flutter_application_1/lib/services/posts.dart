import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/models/post.dart';

class PostService {
  List<PostModel> _postListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return PostModel(
        id: doc.id,
        texto: (doc.data() as Map<String, dynamic>)['texto'],
        creador: (doc.data() as Map<String, dynamic>)['creador'],
        fecha: (doc.data() as Map<String, dynamic>)['fecha'],
      );
    }).toList();
  }

  Future savePost(text) async {
    await FirebaseFirestore.instance.collection("posts").add({
      'texto': text,
      'creador': FirebaseAuth.instance.currentUser?.uid,
      'fecha': FieldValue.serverTimestamp(),
    });
  }

  Stream<List<PostModel>> getPostsByUser(uid) {
    return FirebaseFirestore.instance
        .collection("posts")
        .where('creador', isEqualTo: uid)
        .snapshots()
        .map(_postListFromSnapshot);
  }
}
