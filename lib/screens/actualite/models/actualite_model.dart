import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Actualite extends Equatable {
  final String? id;
  final String name;
  //final String date;
  final String image;
  final String description;

  const Actualite({
    this.id,
    required this.description,
    required this.image,
    required this.name,
  });
  @override
  List<Object?> get props => [id, description, image, name];

  factory Actualite.fromSnapshot(DocumentSnapshot snap) {
    Actualite actualite = Actualite(
      id: snap.id,
      description: snap['description'],
      image: snap['image'],
      name: snap['name'],
    );
    print('actualités');
    print(actualite);
    return actualite;
  }

  //
  Map<String, dynamic> toMap() {
    return {
      // 'id': id,
      'name': name,
      'description': description,
      'image': image,
    };
  }
}
