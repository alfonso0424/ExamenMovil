import 'package:flutter/material.dart';

class FinanzasScreen extends StatelessWidget {
  const FinanzasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Finanzas")),
      body: const Center(child: Text("Finanzas")),
    );
  }
}