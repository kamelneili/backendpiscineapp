import 'package:eshopbackend/controllers/product_controller.dart';
import 'package:eshopbackend/features/widgets/custom_buttom.dart';
import 'package:eshopbackend/models/product_model.dart';
import 'package:eshopbackend/screens/actualite/blocs/actualite_bloc.dart';
import 'package:eshopbackend/screens/actualite/blocs/actualite_event.dart';
import 'package:eshopbackend/screens/actualite/models/actualite_model.dart';
import 'package:eshopbackend/services/database_service.dart';
import 'package:eshopbackend/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:readmore/readmore.dart';

class NewProductScreen extends StatelessWidget {
  NewProductScreen({super.key});
  StorageService storage = StorageService();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: const Text('Ajouter une Actualité'),
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      TextFormField(
                        controller: descriptionController,
                        autofocus: true,
                        autocorrect: false,
                        keyboardType: TextInputType.multiline,
                        minLines: 1,
                        maxLines: 8,
                        decoration: const InputDecoration(
                          labelText: 'description',
                          //filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(width: 1),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          labelText: 'Title',
                        ),
                      ),
                      TextFormField(
                        controller: imageController,
                        decoration: const InputDecoration(
                          labelText: 'ImageUrl',
                        ),
                      ),
                    ])),

                //
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: CustomButton(
                    title: "Sauvgarder Actualité",
                    onTap: () {
                      context.read<ActualiteBloc>().add(AddActualite(Actualite(
                            name: nameController.text,
                            description: descriptionController.text,
                            image: imageController.text,
                          )));
                      const snackBar = SnackBar(
                          content: Text('Actualité ajoutée !!!',
                              style: TextStyle(color: Colors.green)));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);

                      //    Navigator.of(context).pushNamed(
                      //   '/loginScreen',
                      // );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
