import 'package:project/src/domain/entities/note.dart';

class NoteModel extends Note {
  NoteModel({
    required super.title,
    required super.data,
  });

  factory NoteModel.empty() {
    return NoteModel(
      title: '',
      data: '',
    );
  }

  Note copyWith({
    String? title,
    String? data,
  }) {
    return Note(
      title: title ?? this.title,
      data: data ?? this.data,
    );
  }
}
