import 'package:eshopbackend/models/order_model.dart';
import 'package:eshopbackend/services/database_service.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  final DatabaseService database = DatabaseService();
  var orders = <Orders>[].obs;
  var pendingOrders = <Orders>[].obs;

  @override
  void onInit() {
    orders.bindStream(database.getOrders());
    pendingOrders.bindStream(database.getPendingOrders());
    print(database.getOrders());
    super.onInit();
  }

  void updateOrder(
    Orders order,
    String field,
    bool value,
  ) {
    database.updateOrder(order, field, value);
  }
}
