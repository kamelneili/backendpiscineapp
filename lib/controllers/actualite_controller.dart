import 'package:eshopbackend/models/product_model.dart';
import 'package:eshopbackend/screens/actualite/models/actualite_model.dart';
import 'package:eshopbackend/services/database_service.dart';
import 'package:get/get.dart';

class ActualiteController extends GetxController {
  //List<Product> products = Product.products.obs;
  final DatabaseService database = DatabaseService();
  var products = <Actualite>[].obs;
  @override
  void onInit() {
    products.bindStream(database.getActualites());
    print("products are");
    print(products);
    super.onInit();
  }

  var newProduct = {}.obs;
}
