import 'package:counter_apk_bloc/bloc/theme.dart';
import 'package:counter_apk_bloc/page/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, bool>(
      bloc: context.read<ThemeBloc>(),
      builder: (context, state) {
        return MaterialApp(
          home: HomePage(),
          theme: (state) ? ThemeData.light() : ThemeData.dark(),
        );
      },
    );
  }
}
