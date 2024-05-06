import 'package:eshopbackend/models/product_model.dart';
import 'package:eshopbackend/services/database_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  //List<Product> products = Product.products.obs;
  final DatabaseService database = DatabaseService();
  var products = <Product>[].obs;
  @override
  void onInit() {
    products.bindStream(database.getProducts());
    super.onInit();
  }

  var newProduct = {}.obs;

  void updateProductPrice(
    int index,
    Product product,
    double value,
  ) {
    products[index] = product;
  }

  void saveNewProductPrice(
    Product product,
    String field,
    double value,
  ) {
    database.updateField(product, field, value);
  }

  void saveNewProductQuantity(
    Product product,
    String field,
    int value,
  ) {
    database.updateField(product, field, value);
  }
}
