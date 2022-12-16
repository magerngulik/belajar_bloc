import 'package:counter_apk_bloc/bloc/counter.dart';
import 'package:counter_apk_bloc/general_observer.dart';
import 'package:counter_apk_bloc/page/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  ThemeBloc myTheme = ThemeBloc();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        BlocProvider(
          create: (context) => myTheme,
        ),
      ],
      child: BlocBuilder<ThemeBloc, bool>(
        bloc: myTheme,
        builder: (context, state) {
          return MaterialApp(
            theme: (state) ? ThemeData.light() : ThemeData.dark(),
            home: HomePage(),
          );
        },
      ),
    );
  }
}
