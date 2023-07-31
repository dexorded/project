import 'package:flutter/material.dart';

class TitlePage extends StatelessWidget {
  final String title;

  const TitlePage({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          title,
        ),
      ),
    );
  }
}
