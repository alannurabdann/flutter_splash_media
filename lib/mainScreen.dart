import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Main Screen")),
      body: const Center(
          child: Text("Welcome!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
    );
  }
}
