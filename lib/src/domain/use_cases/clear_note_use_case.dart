import 'package:project/core/use_case.dart';
import 'package:project/src/domain/repositories/note_respotiory.dart';

class ClearNoteUseCase extends UseCase<void, NoParams> {
  final NoteRepository noteRepository;

  const ClearNoteUseCase({
    required this.noteRepository,
  });

  @override
  Future<void> call(NoParams params) async {
    try {
      await noteRepository.clear();
    } catch (_) {
      throw UnimplementedError();
    }
  }
}
