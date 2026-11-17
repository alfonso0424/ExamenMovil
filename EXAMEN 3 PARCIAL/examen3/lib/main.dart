import 'package:examen3/features/workout/screens/weight_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi peso',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.black),),
      home: const WeightScreen(),
    );
  }
}