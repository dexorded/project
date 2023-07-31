import 'package:project/src/domain/entities/note.dart';

abstract class NoteRepository {
  Future<Note> read();

  Future<void> update({
    String? title,
    String? data,
  });

  Future<void> clear();
}
