import 'package:counter_apk_bloc/bloc/counter.dart';
import 'package:counter_apk_bloc/bloc/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    CounterBloc myCounter = context.read<CounterBloc>();
    ThemeBloc myTheme = context.read<ThemeBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home Page",
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MultiBlocListener(
            listeners: [
              BlocListener<ThemeBloc, bool>(
                listener: (context, state) {
                  const snackBar = SnackBar(
                    content: Text('Tema Gelap!'),
                    duration: Duration(seconds: 1),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                listenWhen: (previous, current) {
                  if (current == false) {
                    return true;
                  } else {
                    return false;
                  }
                },
              ),
              BlocListener<CounterBloc, int>(
                listener: (context, state) async {
                  await showDialog<void>(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Warning'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: const <Widget>[
                              Text(
                                'Sudah Melebihi 10',
                                style: const TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Ok"),
                          ),
                        ],
                      );
                    },
                  );
                },
                listenWhen: (previous, current) {
                  if (current > 10) {
                    return true;
                  } else {
                    return false;
                  }
                },
              ),
            ],
            child: BlocBuilder<CounterBloc, int>(
              bloc: myCounter,
              builder: (context, state) {
                return Text(
                  "$state",
                  style: const TextStyle(
                    fontSize: 50.0,
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () => myCounter.remove(),
                icon: const Icon(
                  Icons.remove,
                  size: 24.0,
                ),
              ),
              IconButton(
                onPressed: () => myCounter.add(),
                icon: const Icon(
                  Icons.add,
                  size: 24.0,
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () {
          myTheme.changeTheme();
        },
      ),
    );
  }
}
