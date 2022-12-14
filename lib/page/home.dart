import 'package:counter_apk_bloc/bloc/counter.dart';
import 'package:counter_apk_bloc/page/other.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Counter myCounter = BlocProvider.of<Counter>(context);
    Counter myCounter = context.read<Counter>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("BLOC PROVIDER"),
        actions: const [],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Material(
                color: Colors.blue,
                borderRadius: const BorderRadius.all(
                  Radius.circular(12.0),
                ),
                child: InkWell(
                  onTap: () => myCounter.kurangData(),
                  child: const SizedBox(
                    height: 100,
                    width: 70,
                    child: Center(
                      child: Icon(
                        Icons.remove,
                        size: 24.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Container(
                height: 100.0,
                width: 200,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      16.0,
                    ),
                  ),
                ),
                child: Center(
                  child: BlocBuilder<Counter, int>(
                    bloc: BlocProvider.of<Counter>(context),
                    builder: (context, state) {
                      return Text(
                        "$state",
                        style: const TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Material(
                color: Colors.blue,
                borderRadius: const BorderRadius.all(
                  Radius.circular(12.0),
                ),
                child: InkWell(
                  onTap: () => myCounter.tambahData(),
                  child: const SizedBox(
                    height: 100,
                    width: 70,
                    child: Center(
                      child: Icon(
                        Icons.add,
                        size: 24.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, "other");
        },
      ),
    );
  }
}
