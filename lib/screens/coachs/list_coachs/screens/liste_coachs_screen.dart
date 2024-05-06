// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:eshopbackend/features/blocs/user/user_state.dart';
import 'package:eshopbackend/features/screens/signup/signup_screen.dart';
import 'package:eshopbackend/features/widgets/custom_buttom.dart';
import 'package:eshopbackend/screens/clients/list_clients/widgets/cart_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../features/blocs/user/user_bloc.dart';

class CartCoachScreen extends StatefulWidget {
  //List<dynamic> cart;
  const CartCoachScreen({
    super.key,
  });
  static const String routeName = '/coachs';

  @override
  State<CartCoachScreen> createState() => _CartCoachScreenState();
}

class _CartCoachScreenState extends State<CartCoachScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          title: const Text('Liste des Coachs'),
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
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Center(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(
                        child: Row(
                          children: [
                            const Text("Add new Coach",
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
                ),
                const SizedBox(
                  height: 10,
                ),

                const SizedBox(height: 15),
                Container(
                  color: Colors.black12.withOpacity(0.08),
                  height: 1,
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: CustomButton(
                //     //text: 'Proceed to Buy user.cart.length items)',
                //     onTap: () {}
                //   ),
                // ),
                const SizedBox(height: 15),
                Container(
                  color: Colors.black12.withOpacity(0.08),
                  height: 1,
                ),

                const SizedBox(height: 5),
                SizedBox(
                  child: BlocBuilder<UserBloc, UserState>(
                      builder: (context, state) {
                    if (state is UserLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is CoachsLoaded) {
                      return ListView.builder(
                        itemCount: state.coachs.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return CartProduct(user: state.coachs[index]);
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
      ),
    );
  }
}
