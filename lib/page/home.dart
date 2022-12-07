import 'package:counter_apk_bloc/bloc/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Counter myCounter = Counter();
    return Scaffold(
      appBar: AppBar(
        title: const Text("BLOC BUILDER"),
        actions: const [],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // BlocListener<Counter, int>(
          //   bloc: myCounter,
          //   listenWhen: (previous, current) {
          //     if (current > 10) {
          //       return true;
          //     } else {
          //       return false;
          //     }
          //   },
          //   listener: (ctx, state) {
          //     ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(
          //         duration: Duration(seconds: 1),
          //         content: Text('Data sudah melebihi kapasitas!')));
          //   },
          //   child: BlocBuilder<Counter, int>(
          //     bloc: myCounter,
          //     buildWhen: (previous, current) {
          //       return true;
          //     },
          //     builder: (context, state) {
          //       return Text(
          //         "$state",
          //         style: const TextStyle(
          //           fontSize: 30.0,
          //           color: Colors.red,
          //         ),
          //       );
          //     },
          //   ),
          // ),
          BlocConsumer<Counter, int>(
            bloc: myCounter,
            listenWhen: (previous, current) {
              return false;
            },
            listener: (context, state) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text(
                  "Kondisi terpenuhi",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ));
            },
            buildWhen: (previous, current) {
              if (current > 0) {
                return true;
              } else {
                return false;
              }
            },
            builder: (context, state) {
              return Text(
                "$state",
                style: const TextStyle(
                  fontSize: 30.0,
                  color: Colors.red,
                ),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  myCounter.kurangData();
                },
                icon: const Icon(
                  Icons.remove,
                  size: 24.0,
                ),
              ),
              IconButton(
                onPressed: () => myCounter.tambahData(),
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
