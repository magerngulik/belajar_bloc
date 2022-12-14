import 'package:counter_apk_bloc/bloc/counter.dart';
import 'package:counter_apk_bloc/bloc/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    CounterBloc counter = context.read<CounterBloc>();
    ThemeBloc themeBloc = context.read<ThemeBloc>();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          themeBloc.changeTheme();
        }),
      ),
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: const [],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, int>(
            bloc: counter,
            builder: (context, state) {
              return Text(
                "$state",
                style: const TextStyle(
                  fontSize: 50.0,
                ),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    counter.remove();
                  },
                  icon: Icon(Icons.remove)),
              IconButton(
                  onPressed: () {
                    counter.add();
                  },
                  icon: Icon(Icons.add))
            ],
          ),
        ],
      ),
    );
  }
}
