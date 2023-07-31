import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/src/data/datasource/shared_pref_datasource.dart';
import 'package:project/src/data/repositories/note_repository_impl.dart';
import 'package:project/src/domain/repositories/note_respotiory.dart';
import 'package:project/src/presentation/controllers/note_controller/note_bloc.dart';
import 'package:project/src/presentation/pages/forbidden_page.dart';
import 'package:project/src/presentation/pages/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final SharedPrefDatasource datasource = SharedPrefDatasource();
    final NoteRepository noteRepository = NoteRepositoryImpl(
      datasource: datasource,
    );
    final NoteBloc noteBloc = NoteBloc(
      noteRepository: noteRepository,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.light(
          primary: Colors.orange,
        ),
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) {
            switch (settings.name) {
              case '/':
                return BlocProvider<NoteBloc>(
                  create: (_) => noteBloc,
                  child: const HomePage(),
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
