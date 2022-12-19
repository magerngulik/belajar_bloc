// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:counter_apk_bloc/bloc/product/product_bloc.dart';
import 'package:counter_apk_bloc/model/product_model.dart';
import 'package:counter_apk_bloc/page/product_page/add_edit_product/add_edit_product.dart';
import 'package:counter_apk_bloc/shared/widget/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeProduct extends StatefulWidget {
  const HomeProduct({Key? key}) : super(key: key);

  @override
  State<HomeProduct> createState() => _HomeProductState();
}

class _HomeProductState extends State<HomeProduct> {
  @override
  Widget build(BuildContext context) {
    ProductBloc producB = context.read<ProductBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Product"),
        actions: const [],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        children: [
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state.listProduct.isEmpty) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Center(
                      child: Text(
                        "Belum ada data",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                );
              }

              return Container(
                height: MediaQuery.of(context).size.height * 0.8,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 2 / 3),
                  itemCount: state.listProduct.length,
                  itemBuilder: (BuildContext context, int index) {
                    Product product = state.listProduct[index];

                    return Card(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                      elevation: 1,
                      child: Container(
                        height: 300.0,
                        width: 100.0,
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              16.0,
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              height: 100.0,
                              width: 200.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    "${product.imgProduct}",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(
                                    16.0,
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Icon(
                                      product.favoriteProduct == true
                                          ? Icons.favorite
                                          : Icons.favorite_outline,
                                      size: 24.0,
                                      color: Colors.red,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${product.nameProduct}",
                                  style: const TextStyle(
                                    fontSize: 15.0,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  "Rp. ${product.priceProduct}k",
                                  style: const TextStyle(
                                    fontSize: 15.0,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              height: 50.0,
                              child: Text(
                                "${product.descriptionProduct}",
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            ElevatedButton.icon(
                              icon: const Icon(Icons.shopping_cart),
                              label: const Text("Add to cart"),
                              style: ElevatedButton.styleFrom(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12.0),
                                  ),
                                ),
                                backgroundColor: Colors.orange,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddEditProduct()),
          );
        },
      ),
    );
  }
}
