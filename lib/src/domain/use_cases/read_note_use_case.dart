import 'package:project/core/error/shared_pref_errors.dart';
import 'package:project/core/use_case/use_case.dart';
import 'package:project/src/domain/entities/note.dart';
import 'package:project/src/domain/repositories/note_respotiory.dart';

class ReadNoteUseCase extends UseCase<Note, NoParams> {
  final NoteRepository noteRepository;

  const ReadNoteUseCase({
    required this.noteRepository,
  });

  @override
  Future<Note> call(NoParams params) async {
    try {
      return await noteRepository.read();
    } on SharedPreferencesDoesNotHaveData {
      rethrow;
    } on SharedPreferencesNotInitializated {
      rethrow;
    }
  }
}
