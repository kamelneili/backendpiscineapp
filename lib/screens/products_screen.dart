import 'package:eshopbackend/controllers/actualite_controller.dart';
import 'package:eshopbackend/controllers/product_controller.dart';
import 'package:eshopbackend/models/product_model.dart';
import 'package:eshopbackend/screens/actualite/blocs/actualite_bloc.dart';
import 'package:eshopbackend/screens/actualite/blocs/actualite_event.dart';
import 'package:eshopbackend/screens/actualite/models/actualite_model.dart';
import 'package:eshopbackend/screens/new_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class ActualitesScreen extends StatelessWidget {
  ActualitesScreen({super.key});
  final ActualiteController productController = Get.put(ActualiteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  child: Card(
                      margin: EdgeInsets.zero,
                      color: Colors.black,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.to(() => NewProductScreen());
                            },
                            icon: const Icon(Icons.add_circle,
                                color: Colors.white),
                          ),
                          const Text('Ajouter une nouvelle Actualité',
                              style: TextStyle(color: Colors.white)),
                        ],
                      )),
                ),
                Expanded(
                    child: Obx(
                  () => ListView.builder(
                      itemCount: productController.products.length,
                      itemBuilder: (context, index) {
                        return ProductCard(
                            product: productController.products[index],
                            index: index);
                      }),
                ))
              ],
            )));
  }
}

class ProductCard extends StatelessWidget {
  final Actualite product;
  final int index;

  ProductCard({super.key, required this.product, required this.index});
  final ActualiteController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: 200,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(product.name),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(() => NewProductScreen());
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  child: const Text("Modifier")),
                            ),
                            InkWell(
                              onTap: () async {
                                //  Get.to(() => const SignupScreen());
                                context
                                    .read<ActualiteBloc>()
                                    .add(DeleteActualite(product));

                                const snackBar = SnackBar(
                                    content: Text('Actualité supprimée !!!',
                                        style: TextStyle(
                                            color: Colors.pinkAccent)));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  child: const Text("Supprimer")),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ReadMoreText(
                      product.description,
                      trimLines: 2,
                      trimCollapsedText: ' Read More...',
                      trimExpandedText: ' Show Less',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        height: 80,
                        width: 80,
                        child: Image.network(product.image, fit: BoxFit.cover)),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
