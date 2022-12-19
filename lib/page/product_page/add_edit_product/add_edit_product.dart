// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'dart:math';

import 'package:counter_apk_bloc/bloc/product/product_bloc.dart';
import 'package:counter_apk_bloc/model/product_model.dart';
import 'package:counter_apk_bloc/shared/widget/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddEditProduct extends StatefulWidget {
  const AddEditProduct({Key? key}) : super(key: key);

  @override
  State<AddEditProduct> createState() => _AddEditProductState();
}

class _AddEditProductState extends State<AddEditProduct> {
  String? urlImage;
  TextEditingController nameC = TextEditingController();
  TextEditingController priceC = TextEditingController();
  TextEditingController descC = TextEditingController();
  TextEditingController categoryC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ProductBloc productB = context.read<ProductBloc>();

    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Product"),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          children: [
            const SizedBox(
              height: 20.0,
            ),
            QimagePicker(
                onChanged: (value) {
                  urlImage = value;
                },
                label: "Image Product",
                id: "image"),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              child: TextFormField(
                controller: nameC,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                  labelText: 'Name',
                  hintText: "Nama Product",
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                onChanged: (value) {},
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              child: TextFormField(
                controller: priceC,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                  labelText: 'Price',
                  hintText: "Price Product",
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                onChanged: (value) {},
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              child: TextFormField(
                controller: descC,
                maxLines: 5,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                  labelText: 'Description',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                onChanged: (value) {},
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              child: TextFormField(
                controller: categoryC,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                  labelText: 'Category',
                  hintText: "Category Product",
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                onChanged: (value) {},
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              height: 50,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.save),
                label: const Text("Tambah data"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(32.0),
                      ),
                    )),
                onPressed: () async {
                  debugPrint("name: ${nameC.text}");
                  debugPrint("price: ${priceC.text}");
                  debugPrint("decription: ${priceC.text}");
                  debugPrint("category: ${priceC.text}");
                  debugPrint("image url: ${urlImage}");

                  productB.add(AddProductEvent(Product(
                      id: Random().nextInt(990),
                      nameProduct: nameC.text,
                      priceProduct: int.parse(priceC.text),
                      descriptionProduct: descC.text,
                      category: categoryC.text,
                      favoriteProduct: false,
                      imgProduct: urlImage)));

                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ));
  }
}
