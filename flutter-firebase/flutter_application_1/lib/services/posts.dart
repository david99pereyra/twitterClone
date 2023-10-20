import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/models/post.dart';
import 'package:flutter_application_1/services/user.dart';

class PostService {
  List<PostModel?> _postListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return PostModel(
        id: doc.id,
        texto: (doc.data() as Map<String, dynamic>)['texto'] ?? '',
        creador: (doc.data() as Map<String, dynamic>)['creador'] ?? '',
        fecha: (doc.data() as Map<String, dynamic>)['fecha'] ?? '',
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

  Stream<List<PostModel?>> getPostsByUser(uid) {
    return FirebaseFirestore.instance
        .collection("posts")
        .where('creador', isEqualTo: uid)
        .snapshots()
        .map(_postListFromSnapshot);
  }

  Future<int> getCalificacionPost(String postId) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection('posts')
        .doc(postId)
        .collection('calificaciones')
        .get();

    int calificacion = 0;
    for (DocumentSnapshot<Map<String, dynamic>> doc in querySnapshot.docs) {
      if (doc.data()!['calificacion'] > 0) {
        calificacion += doc.data()!['calificacion'] as int;
      }
    }

    return calificacion;
  }

  Future<void> serCalificacionPost(String id, double rating) async {
    await FirebaseFirestore.instance
        .collection('posts')
        .doc(id)
        .collection('calificacion')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .set({'calificacion': rating});
  }
/*
  Future<List<PostModel?>> getFeed() async {
    List<String> usersFollowing = await UserService()
        .getUserFollowing(FirebaseAuth.instance.currentUser?.uid);
    /*
    var splitUsersFollowing = partition<dynamic>(usersFollowing, 10);
    inspect(splitUsersFollowing);*/

    List<PostModel?> feedList = [];
    print("aca devuelve:");
    print(usersFollowing.length);

    //for (int i = 0; i < splitUsersFollowing.length; i++) {
    List<QuerySnapshot> snapshot = [];
    for (String user in usersFollowing) {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('posts')
          .where('creador', isEqualTo: user)
          .orderBy('fecha', descending: true)
          .get();
      snapshot.add(querySnapshot);
    }

    for (QuerySnapshot querySnapshots in snapshot) {
      feedList.addAll(_postListFromSnapshot(querySnapshots));
    }
    //}

    feedList.sort((a, b) {
      var aDate = a!.fecha;
      var bDate = b!.fecha;
      return bDate.compareTo(aDate);
    });
    print(feedList.length);
    return feedList;
  }*/

  Future<List<PostModel?>> getFeed() async {
    List<String> usersFollowing = await UserService()
        .getUserFollowing(FirebaseAuth.instance.currentUser?.uid);

    // Realiza una consulta a la base de datos Firestore para obtener todos los posteos
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('posts').get();

    // Filtra la lista de posteos para obtener solo los posteos de los usuarios que el usuario actual sigue
    List<PostModel?> feedList = [];
    for (DocumentSnapshot doc in querySnapshot.docs) {
      String creador = (doc.data() as Map<String, dynamic>)['creador'];
      if (creador == FirebaseAuth.instance.currentUser?.uid ||
          usersFollowing.contains(creador)) {
        feedList.add(PostModel(
          id: doc.id,
          texto: (doc.data() as Map<String, dynamic>)['texto'] ?? '',
          creador: (doc.data() as Map<String, dynamic>)['creador'] ?? '',
          fecha: (doc.data() as Map<String, dynamic>)['fecha'] ?? '',
        ));
      }
    }

    // Ordena la lista de posteos por fecha, de la más reciente a la más antigua
    feedList.sort((a, b) {
      var aDate = a!.fecha;
      var bDate = b!.fecha;
      return bDate.compareTo(aDate);
    });

    return feedList;
  }
}
