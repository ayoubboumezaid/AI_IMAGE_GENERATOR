// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:iaappp/pages/home.dart';
import 'package:iaappp/pages/welcome_page.dart';
import 'package:iaappp/prompt/bloc/bloc/prompt_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme:
              AppBarTheme(backgroundColor: Colors.grey.shade900, elevation: 0),
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.grey.shade900),
      home: WelcomePge(),
    );
  }
}
