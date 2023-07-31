import 'package:flutter/material.dart';
import 'package:project/src/presentation/pages/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: <String, Widget Function(BuildContext)>{
        '/': (_) => const HomePage(),
      },
    );
  }
}
