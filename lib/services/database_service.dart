import 'package:eshopbackend/models/order_model.dart';
import 'package:eshopbackend/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshopbackend/screens/actualite/models/actualite_model.dart';

class DatabaseService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Stream<List<Product>> getProducts() {
    return _firebaseFirestore
        .collection('products')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
    });
  }

  Stream<List<Actualite>> getActualites() {
    return _firebaseFirestore
        .collection('actualites')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Actualite.fromSnapshot(doc)).toList();
    });
  }

  Stream<List<Orders>> getOrders() {
    return _firebaseFirestore
        .collection('appointment')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Orders.fromSnapshot(doc)).toList();
    });
  }

  Stream<List<Orders>> getPendingOrders() {
    return _firebaseFirestore
        .collection('appointment')
        .where('isDelivered', isEqualTo: false)
        .where('isCancelled', isEqualTo: false)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Orders.fromSnapshot(doc)).toList();
    });
  }

  Future<void> addProduct(Product product) {
    print('adding');
    return _firebaseFirestore.collection('products').add(product.toMap());
  }

  Future<void> updateField(
    Product product,
    String field,
    dynamic newValue,
  ) {
    return _firebaseFirestore
        .collection('products')
        .where('id', isEqualTo: product.id)
        .get()
        .then((querySnapshot) =>
            querySnapshot.docs.first.reference.update({field: newValue}));
  }

  Future<void> updateOrder(
    Orders order,
    String field,
    dynamic newValue,
  ) {
    print(order.id);
    print(field);
    print(newValue);
    return _firebaseFirestore
        .collection('appointment')
        .doc(order.id)
        .update({'isAccepted': newValue});
  }
}
