import 'package:flutter/material.dart';
import 'package:project/src/presentation/controllers/note_controller/note_bloc.dart';

class LoadingHomePage extends StatelessWidget {
  final LoadingNoteState state;

  const LoadingHomePage({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          strokeWidth: 1.0,
        ),
      ),
    );
  }
}
