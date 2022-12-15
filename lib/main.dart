import 'package:counter_apk_bloc/bloc/counter.dart';
import 'package:counter_apk_bloc/page/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CounterBloc(),
        child: MaterialApp(
          home: HomePage(),
        ));
  }
}
