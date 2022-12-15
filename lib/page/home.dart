import 'dart:developer';

import 'package:counter_apk_bloc/bloc/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    CounterBloc myCounter = context.read<CounterBloc>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Counter Page",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder<CounterBloc, int>(
              bloc: myCounter,
              builder: (context, state) {
                return Text(
                  "$state",
                  style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      myCounter.add(CounterEvent.decrement);
                    },
                    icon: Icon(Icons.remove)),
                IconButton(
                    onPressed: () {
                      myCounter.add(CounterEvent.increment);
                    },
                    icon: Icon(Icons.add))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
