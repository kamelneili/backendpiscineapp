// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:eshopbackend/features/blocs/user/user_state.dart';
import 'package:eshopbackend/features/screens/signup/signup_screen.dart';
import 'package:eshopbackend/features/widgets/custom_buttom.dart';
import 'package:eshopbackend/screens/clients/list_clients/widgets/cart_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../../../../features/blocs/user/user_bloc.dart';

class CartScreen extends StatefulWidget {
  //List<dynamic> cart;
  const CartScreen({
    super.key,
  });
  static const String routeName = '/clients';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
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
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Card(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        const Text("Add new Client",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                        IconButton(
                          onPressed: () {
                            Get.to(() => const SignupScreen());
                          },
                          icon: const Icon(
                            Icons.add,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                child:
                    BlocBuilder<UserBloc, UserState>(builder: (context, state) {
                  if (state is UserLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is UserLoaded) {
                    return ListView.builder(
                      itemCount: state.users.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return CartProduct(user: state.users[index]);
                      },
                    );
                  } else
                    return const Text("something went wrong");
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
