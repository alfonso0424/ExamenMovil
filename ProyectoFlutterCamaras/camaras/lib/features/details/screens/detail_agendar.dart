import 'package:flutter/material.dart';

class AgendarScreen extends StatelessWidget {
  const AgendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Agendar nueva instalación")),
      body: const Center(child: Text("Agendar")),
    );
  }
}