import 'package:project/core/use_case/use_case.dart';
import 'package:project/src/domain/entities/note.dart';
import 'package:project/src/domain/repositories/note_respotiory.dart';

class UpdateNoteUseCase extends UseCase<void, Note> {
  final NoteRepository noteRepository;

  const UpdateNoteUseCase({
    required this.noteRepository,
  });

  @override
  Future<void> call(Note params) async {
    try {
      await noteRepository.update(
        title: params.title,
        data: params.data,
      );
    } catch (_) {
      rethrow;
    }
  }
}
