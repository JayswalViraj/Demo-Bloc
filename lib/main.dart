import 'package:bloc_demo/login_page/login_bloc/login_bloc.dart';
import 'package:bloc_demo/login_page/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter/counter_bloc.dart';
import 'counter/counter_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BlocProvider(
      create: (context) => LoginBloc(),
      child: LoginView(),
    ));
  }
}
