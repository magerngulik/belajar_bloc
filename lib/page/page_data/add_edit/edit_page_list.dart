import 'dart:math';
import 'package:counter_apk_bloc/bloc/user/user_bloc.dart';
import 'package:counter_apk_bloc/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddEditPage extends StatefulWidget {
  User? item;
  AddEditPage({this.item, super.key});

  @override
  State<AddEditPage> createState() => _AddEditPageState();
}

class _AddEditPageState extends State<AddEditPage> {
  TextEditingController nameC = TextEditingController();
  TextEditingController ageC = TextEditingController();

  @override
  void initState() {
    if (widget.item != null) {
      nameC.text = widget.item!.name as String;
      ageC.text = "${widget.item!.age.toString()}";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserBloc userB = context.read<UserBloc>();
    return Scaffold(
        appBar: AppBar(
          title: Text("Add new data"),
          actions: [],
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          children: [
            SizedBox(
              height: 20.0,
            ),
            Container(
              margin: EdgeInsets.only(),
              child: TextFormField(
                controller: nameC,
                decoration: InputDecoration(
                  hintText: "Type your name",
                  labelText: 'Name',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                onChanged: (value) {},
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              margin: EdgeInsets.only(),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: ageC,
                decoration: InputDecoration(
                  hintText: "Type your phone number",
                  labelText: 'Phone Number',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
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
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                ),
                onPressed: () {
                  if (widget.item == null) {
                    userB.add(AddUserEvent(User(
                        id: Random().nextInt(999),
                        age: int.parse(ageC.text),
                        name: nameC.text)));
                  } else {
                    userB.add(
                      EditUserEvent(
                        User(
                          id: widget.item!.id,
                          name: nameC.text,
                          age: int.parse(ageC.text),
                        ),
                      ),
                    );
                  }

                  Navigator.pop(context);
                },
                child: Text("Simpan"),
              ),
            ),
          ],
        ));
  }
}
