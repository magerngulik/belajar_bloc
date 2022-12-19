// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:counter_apk_bloc/shared/widget/image_picker.dart';
import 'package:flutter/material.dart';

class AddEditProduct extends StatefulWidget {
  const AddEditProduct({Key? key}) : super(key: key);

  @override
  State<AddEditProduct> createState() => _AddEditProductState();
}

class _AddEditProductState extends State<AddEditProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Dashboard"),
          actions: const [],
        ),
        body: ListView(
          children: [
            QimagePicker(
                onChanged: (value) {}, label: "Image Product", id: "image"),
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(),
              child: TextFormField(
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
          ],
        ));
  }
}
