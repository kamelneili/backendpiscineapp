import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshopbackend/screens/actualite/models/actualite_model.dart';

class ActualiteRepository {
  final FirebaseFirestore _firebaseFirestore;

  ActualiteRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  Stream<List<Actualite>> getAllActualites() {
    return _firebaseFirestore
        .collection('actualites')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Actualite.fromSnapshot(doc)).toList();
    });
  }

  //save actualité
  @override
  Future<void> addActualite(Actualite actualite) {
    return _firebaseFirestore.collection('actualites').add(actualite.toMap());
  }

  //Delete user
  Future<void> deleteUser(
    Actualite actualite,
  ) {
    return _firebaseFirestore
        .collection('actualites')
        .doc(actualite.id)
        .delete()
        .then(
          (value) => print('actualite document deleted.'),
        );
  }
}
