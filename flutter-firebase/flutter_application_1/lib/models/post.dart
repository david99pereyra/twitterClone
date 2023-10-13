import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String id;
  final String creador;
  final String texto;
  final Timestamp fecha;

  PostModel(
      {required this.id,
      required this.creador,
      required this.fecha,
      required this.texto});

  PostModel.fromJson(Map<String, Object?> json)
    : this(
        id: json['id']! as String,
        creador: json['creador']! as String,
        fecha: json['fecha']! as Timestamp,
        texto: json['texto']! as String,
      );

  Map<String, Object> toJson() {
    return {
      'id': id,
      'creador': creador,
      'fecha': fecha,
      'texto': texto,
    };
  }
}
