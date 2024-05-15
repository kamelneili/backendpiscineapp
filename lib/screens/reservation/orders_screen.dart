import 'package:eshopbackend/blocs/profile/profile_bloc.dart';
import 'package:eshopbackend/controllers/order_controller.dart';
import 'package:eshopbackend/models/product_model.dart';
import 'package:eshopbackend/screens/reservation/order_details.dart';
import 'package:flutter/material.dart';

import 'package:eshopbackend/models/order_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OrdersScreen extends StatelessWidget {
  OrdersScreen({super.key});
  final OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(' Liste des réservations'),
          backgroundColor: const Color(0xFFfed9cd),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            iconSize: 20.0,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          children: [
            Expanded(
                child: Obx(
              () => ListView.builder(
                  itemCount: orderController.pendingOrders.length,
                  itemBuilder: (BuildContext context, int index) {
                    return OrderCard(
                        order: orderController.pendingOrders[index]);
                  }),
            ))
          ],
        ));
  }
}

class OrderCard extends StatelessWidget {
  OrderCard({
    super.key,
    required this.order,
  });
  final Orders order;
  final OrderController orderController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Card(
        color: const Color.fromARGB(255, 33, 173, 243),
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Column(
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        DateFormat('dd-MM-yy').format(order.createdAt),
                        style:
                            const TextStyle(fontSize: 16, color: Colors.blue),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Num Order: ${order.id}"),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  order.isAccepted
                      ? ElevatedButton(
                          onPressed: () {
                            orderController.updateOrder(
                                order, 'isDelivered', !order.isDelivered);
                          },
                          child: const Text(
                            "Delivrer",
                            style: TextStyle(fontSize: 16, color: Colors.blue),
                          ))
                      : ElevatedButton(
                          onPressed: () {
                            orderController.updateOrder(
                                order, 'isAccepted', !order.isAccepted);
                          },
                          child: const Text(
                            "Accepter",
                            style: TextStyle(fontSize: 16, color: Colors.green),
                          )),
                  ElevatedButton(
                    onPressed: () {
                      orderController.updateOrder(
                          order, 'isCancelled', !order.isCancelled);
                    },
                    child: const Text(
                      "Cancel",
                      style: TextStyle(fontSize: 16, color: Colors.red),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
