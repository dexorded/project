part of 'note_bloc.dart';

abstract class NoteState {}

class LoadingNoteState extends NoteState {}

class DataNoteState extends NoteState {
  late TextEditingController titleTextController;
  late TextEditingController dataTextController;

  final Note note;

  DataNoteState({
    required this.note,
  }) {
    titleTextController = TextEditingController.fromValue(
      TextEditingValue(
        text: note.title,
      ),
    );

    dataTextController = TextEditingController.fromValue(
      TextEditingValue(
        text: note.data,
      ),
    );
  }
}
