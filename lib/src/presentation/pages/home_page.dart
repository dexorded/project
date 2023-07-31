import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/src/presentation/controllers/note_controller/note_bloc.dart';
import 'package:project/src/presentation/pages/forbidden_page.dart';
import 'package:project/src/presentation/pages/home_page/data_home_page.dart';
import 'package:project/src/presentation/pages/home_page/loading_home_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteBloc, NoteState>(
      bloc: BlocProvider.of<NoteBloc>(context),
      builder: (context, state) {
        if (state is LoadingNoteState) {
          return LoadingHomePage(state: state);
        }

        if (state is DataNoteState) {
          return DataHomePage(state: state);
        }

        return const ForbiddenPage();
      },
    );
  }
}
