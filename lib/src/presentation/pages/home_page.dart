import 'package:flutter/material.dart';

/// Initial page for project
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textController = TextEditingController();

    void openTitlePage() {
      Navigator.of(context).pushNamed(
        '/title',
        arguments: textController.text,
      );
    }

    return Scaffold(
      body: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: textController,
          decoration: const InputDecoration(
            hintText: 'Enter phrase',
          ),
        ),
      ),
      floatingActionButton: IconButton.filled(
        onPressed: openTitlePage,
        icon: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
