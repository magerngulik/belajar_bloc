import 'dart:developer';
import 'package:counter_apk_bloc/bloc/counter.dart';
import 'package:counter_apk_bloc/bloc/theme.dart';
import 'package:counter_apk_bloc/bloc/user.dart';
import 'package:counter_apk_bloc/page/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  //kenapa di pisah karna kondisi nya masih di satu kelas yang sama agar tidak di buat 2x,
  // untuk membuat menggunakan read maka harus di class yang berbeda
  // jangan lupa satu bloc jangan buat bloc baru karna jika tidak dalam satu sate maka data tidak akan terbaca

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => CounterBloc(),
      ),
      BlocProvider(
        create: (context) => ThemeBloc(),
      ),
      BlocProvider(
        create: (context) => UserBloc(),
      ),
    ], child: App());
  }
}
