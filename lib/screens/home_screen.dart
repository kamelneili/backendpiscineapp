import 'package:eshopbackend/blocs/profile/profile_bloc.dart';
import 'package:eshopbackend/features/blocs/user/user_bloc.dart';
import 'package:eshopbackend/features/blocs/user/user_event.dart';
import 'package:eshopbackend/features/screens/signup/signup_screen.dart';
import 'package:eshopbackend/screens/actualite/blocs/actualite_bloc.dart';
import 'package:eshopbackend/screens/actualite/blocs/actualite_event.dart';
import 'package:eshopbackend/screens/clients/list_clients/screens/listeclients_screen.dart';
import 'package:eshopbackend/screens/coachs/coach_screen.dart';
import 'package:eshopbackend/screens/products_screen.dart';
import 'package:eshopbackend/screens/reservation/orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
//import 'package:get/get_core/get_core.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Administration Piscine',
              style: TextStyle(color: Colors.blue)),
          backgroundColor: Colors.black,
        ),
        body: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 150,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  onTap: () {
                    BlocProvider.of<UserBloc>(context).add(LoadUsers());
                    Get.to(() => const CartScreen());
                  },
                  child: const Card(
                    color: Color.fromARGB(255, 33, 173, 243),
                    child: Center(
                        child: Text('Gérer  Clients',
                            style: TextStyle(
                              fontSize: 20,
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
                    Get.to(() => const CoachScreen());
                  },
                  child: const Card(
                    color: Color.fromARGB(255, 33, 173, 243),
                    child: Center(
                        child: Text('Gérer coachs',
                            style: TextStyle(
                              fontSize: 20,
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
                    color: Color.fromARGB(255, 33, 173, 243),
                    child: Center(
                        child: Text('Gérer réservations',
                            style: TextStyle(
                              fontSize: 20,
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
                    print("act");
                    BlocProvider.of<ActualiteBloc>(context)
                        .add(const LoadActualite());

                    Get.to(() => ActualitesScreen());
                  },
                  child: const Card(
                    color: Color.fromARGB(255, 33, 173, 243),
                    child: Center(
                        child: Text('Gérer actualités',
                            style: TextStyle(
                              fontSize: 20,
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
