import 'package:project/core/use_case/use_case.dart';
import 'package:project/src/domain/repositories/note_respotiory.dart';

class UpdateNoteUseCase extends UseCase<void, NoParams> {
  final NoteRepository noteRepository;

  const UpdateNoteUseCase({
    required this.noteRepository,
  });

  @override
  Future<void> call(NoParams params) async {
    try {
      await noteRepository.update();
    } catch (_) {
      throw UnimplementedError();
    }
  }
}
