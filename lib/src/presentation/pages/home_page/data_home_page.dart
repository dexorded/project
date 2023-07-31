import 'package:flutter/material.dart';
import 'package:project/src/presentation/controllers/note_controller/note_bloc.dart';

class DataHomePage extends StatelessWidget {
  final DataNoteState state;

  const DataHomePage({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.delete_outline_rounded,
          ),
        ),
        title: const Text(
          'Note',
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.done,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: state.titleTextController,
              decoration: const InputDecoration(
                hintText: 'title',
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Expanded(
              child: TextField(
                maxLines: 120,
                controller: state.dataTextController,
                decoration: const InputDecoration(
                  hintText: 'data',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
