import 'package:flutter/material.dart';

/// Initial page for project
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      body: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'Enter phrase',
          ),
        ),
      ),
    );
  }
}
