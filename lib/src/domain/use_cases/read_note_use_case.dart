import 'package:project/core/use_case.dart';
import 'package:project/src/domain/repositories/note_respotiory.dart';

class ReadNoteUseCase extends UseCase<void, NoParams> {
  final NoteRepository noteRepository;

  const ReadNoteUseCase({
    required this.noteRepository,
  });

  @override
  Future<void> call(NoParams params) async {
    try {
      await noteRepository.read();
    } catch (_) {
      throw UnimplementedError();
    }
  }
}
