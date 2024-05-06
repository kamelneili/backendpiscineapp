import 'package:eshopbackend/features/blocs/user/user_bloc.dart';
import 'package:eshopbackend/features/blocs/user/user_event.dart';
import 'package:eshopbackend/features/blocs/user/user_state.dart';
import 'package:eshopbackend/features/screens/signup/signup_screen.dart';
import 'package:eshopbackend/screens/coachs/list_coachs/screens/liste_coachs_screen.dart';
import 'package:eshopbackend/screens/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
//import 'package:get/get_core/get_core.dart';

class CoachScreen extends StatefulWidget {
  const CoachScreen({super.key});

  @override
  State<CoachScreen> createState() => _CoachScreenState();
}

class _CoachScreenState extends State<CoachScreen> {
  @override
  void initState() {
    BlocProvider.of<UserBloc>(context).add(
      LoadCoachs(),
    );
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
                child: InkWell(
                  onTap: () {
                    context.read<UserBloc>().add(LoadCoachs());
                    // Navigator.pushNamed(context, '/coachs');
                    BlocProvider.of<UserBloc>(context).add(LoadCoachs());
                    Get.to(() => const CartCoachScreen());
                  },
                  child: const Card(
                    child: Center(
                        child: Text('Liste des coachs',
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
                    Get.to(() => const SignupScreen());
                  },
                ),
              ),
              Container(
                width: double.infinity,
                height: 150,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  onTap: () {
                    // Get.to(() => OrdersScreen());
                  },
                ),
              )
            ],
          ),
        ));
  }
}
