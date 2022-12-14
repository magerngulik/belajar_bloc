import 'package:counter_apk_bloc/bloc/counter.dart';
import 'package:counter_apk_bloc/page/404/404.dart';
import 'package:counter_apk_bloc/page/home.dart';
import 'package:counter_apk_bloc/page/other.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyRoute {
  Counter myCounter = Counter();

  Route onRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (context) =>
              BlocProvider.value(value: myCounter, child: HomePage()),
        );
      case "/other":
        return MaterialPageRoute(
          builder: (context) =>
              BlocProvider.value(value: myCounter, child: Other()),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => NotFountPage(),
        );
    }
  }
}
