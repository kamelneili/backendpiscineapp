import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String? id;
  final String name;
  final String description;

  const Product({
    this.id,
    required this.description,
    required this.name,
  });
  @override
  List<Object?> get props => [
        id,
        name,
        description,
      ];
  Product copyWith({
    String? id,
    String? name,
    String? description,
  }) {
    return Product(
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    print(name);
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }

  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
      id: snap.id,
      name: snap['name'],
      description: snap['description'],
    );
    // print(product);
    return product;
  }

  // factory Product.fromMap(Map<String, dynamic> map) {
  //   return Product(
  //     id: map['id'],
  //     category: map['category'],
  //     name: map['name'],
  //     description: map['description'],
  //     isPopular: map['isPopular'],
  //     isRecommended: map['isRecommended'],
  //     imageUrl: map['imageUrl'],
  //     price: map['price'],
  //     quantity: map['quantity'],
  //   );
  // }
  String toJson() => json.encode(toMap());
  // factory Product.fromJson(String source) =>
  //     Product.fromMap(json.decode(source));
  @override
  bool get stringify => true;

  //
}
