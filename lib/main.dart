// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hometask_1_optional/widgets/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Splash(),
    );
  }
}



