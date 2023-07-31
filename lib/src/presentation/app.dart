import 'package:flutter/material.dart';
import 'package:project/src/presentation/pages/forbidden_page.dart';
import 'package:project/src/presentation/pages/home_page.dart';
import 'package:project/src/presentation/pages/title_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.light(
          primary: Colors.orange,
        ),
      ),
      initialRoute: '/',
      // routes: <String, Widget Function(BuildContext)>{
      //   '/': (_) => const HomePage(),
      // },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) {
            switch (settings.name) {
              case '/':
                return const HomePage();

              case '/title':
                return TitlePage(
                  title: settings.arguments as String,
                );

              default:
                return const ForbiddenPage();
            }
          },
        );
      },
    );
  }
}
