import 'package:counter_apk_bloc/bloc/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Other extends StatelessWidget {
  const Other({super.key});

  @override
  Widget build(BuildContext context) {
    Counter myCounter = context.read<Counter>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Other Page"),
        actions: const [],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: BlocBuilder<Counter, int>(
              builder: (context, state) {
                return Text(
                  "$state",
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
