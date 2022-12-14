import 'package:counter_apk_bloc/page/routes/routes.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  //onGenerateRoute
  MyRoute route = MyRoute();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: route.onRoute,
    );
  }
}
