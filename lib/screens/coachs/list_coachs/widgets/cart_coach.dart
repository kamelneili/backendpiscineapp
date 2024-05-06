// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:eshopbackend/features/blocs/user/user_bloc.dart';
import 'package:eshopbackend/features/blocs/user/user_event.dart';
import 'package:eshopbackend/features/blocs/user/user_state.dart';
import 'package:eshopbackend/features/models/data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CartProduct extends StatefulWidget {
  final User user;

  const CartProduct({super.key, required this.user});
  @override
  State<CartProduct> createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  @override
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Container(
            child: Expanded(
              child: Row(
                children: [
                  Flexible(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 235,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                widget.user.fullName,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                                maxLines: 2,
                              ),
                            ),
                            //modifier supprimer
                            Flexible(
                              flex: 2,
                              child: Container(
                                width: 300,
                                margin: const EdgeInsets.all(20),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                          alignment: Alignment.center,
                                          child: const Text("Modifier")),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        context
                                            .read<UserBloc>()
                                            .add(DeleteUser(widget.user));
                                        Navigator.pushNamed(context, '/home');
                                      },
                                      child: Container(
                                          width: 70,
                                          height: 32,
                                          alignment: Alignment.center,
                                          child: const Text("Supprimer")),
                                    ),
                                  ],
                                ),
                              ),
                            )

                            //
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
