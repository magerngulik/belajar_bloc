import 'package:counter_apk_bloc/bloc/counter.dart';
import 'package:counter_apk_bloc/page/other.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'page/home.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  //3. named route
  Counter myCounter = Counter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: BlocProvider(
      //   create: (context) => Counter(),
      //   child: HomePage(),
      // ),
      initialRoute: "/",
      routes: {
        "/": (context) => BlocProvider.value(
              value: myCounter,
              child: HomePage(),
            ),
        "other": (context) => BlocProvider.value(
              value: myCounter,
              child: Other(),
            )
      },
    );
  }
}
