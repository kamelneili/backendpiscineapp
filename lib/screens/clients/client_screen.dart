import 'package:eshopbackend/features/blocs/user/user_bloc.dart';
import 'package:eshopbackend/features/blocs/user/user_event.dart';
import 'package:eshopbackend/features/screens/signup/signup_screen.dart';
import 'package:eshopbackend/screens/clients/list_clients/screens/listeclients_screen.dart';
import 'package:eshopbackend/screens/products_screen.dart';
import 'package:eshopbackend/screens/reservation/orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
//import 'package:get/get_core/get_core.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<UserBloc>(context).add(
      LoadUsers(),
    );
    // TODO: implement initState
    super.initState();
  }

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
        body: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 150,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  height: 100,
                  child: Card(
                      margin: EdgeInsets.zero,
                      color: Colors.black,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.to(() => const SignupScreen());
                            },
                            icon: const Icon(Icons.add_circle,
                                color: Colors.white),
                          ),
                          const Text('Ajouter une nouvelle Actualité',
                              style: TextStyle(color: Colors.white)),
                        ],
                      )),
                ),
              ),
              Container(
                width: double.infinity,
                height: 150,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  onTap: () {
                    Get.to(() => const CartScreen());
                  },
                  child: const Card(
                    child: Center(
                        child: Text('Nos Clients',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ))),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 150,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  onTap: () {
                    Get.to(() => OrdersScreen());
                  },
                  child: const Card(
                    child: Center(
                        child: Text('Modifier Clients',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ))),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
