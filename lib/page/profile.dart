import 'package:counter_apk_bloc/bloc/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    UserBloc myUser = context.read<UserBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: const [],
      ),
      body: ListView(
        children: [
          BlocSelector<UserBloc, Map<String, dynamic>, String>(
            bloc: myUser,
            selector: (state) {
              return state["name"];
            },
            builder: (context, state) {
              return Text(
                "Nama : $state",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              );
            },
          ),
          BlocSelector<UserBloc, Map<String, dynamic>, int>(
            bloc: myUser,
            selector: (state) {
              return state["age"];
            },
            builder: (context, state) {
              return Text(
                "age : $state",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              );
            },
          ),
          Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(),
              child: TextFormField(
                  onChanged: (value) {
                    myUser.changeName(value);
                  },
                  decoration: InputDecoration(border: OutlineInputBorder()))),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () => myUser.changeAge(myUser.state['age'] - 1),
                icon: const Icon(
                  Icons.remove,
                  size: 24.0,
                ),
              ),
              IconButton(
                onPressed: () => myUser.changeAge(myUser.state['age'] + 1),
                icon: const Icon(
                  Icons.add,
                  size: 24.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
