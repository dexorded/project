import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:project/core/error/shared_pref_errors.dart';
import 'package:project/core/use_case/use_case.dart';
import 'package:project/src/domain/entities/note.dart';
import 'package:project/src/domain/repositories/note_respotiory.dart';
import 'package:project/src/domain/use_cases/clear_note_use_case.dart';
import 'package:project/src/domain/use_cases/read_note_use_case.dart';
import 'package:project/src/domain/use_cases/update_note_use_case.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final NoteRepository noteRepository;

  late final ReadNoteUseCase readNoteUseCase;
  late final UpdateNoteUseCase updateNoteUseCase;
  late final ClearNoteUseCase clearNoteUseCase;

  NoteBloc({
    required this.noteRepository,
  }) : super(LoadingNoteState()) {
    readNoteUseCase = ReadNoteUseCase(noteRepository: noteRepository);
    updateNoteUseCase = UpdateNoteUseCase(noteRepository: noteRepository);
    clearNoteUseCase = ClearNoteUseCase(noteRepository: noteRepository);

    on<LoadNoteEvent>(_onLoadNoteEvent);
    on<SaveNoteEvent>(_onSaveNoteEvent);
    on<ClearNoteEvent>(_onClearNoteEvent);

    add(LoadNoteEvent());
  }

  FutureOr<void> _onLoadNoteEvent(
    LoadNoteEvent event,
    Emitter<NoteState> emit,
  ) async {
    try {
      final Note note = await readNoteUseCase.call(const NoParams());

      emit(
        DataNoteState(
          note: Note(
            title: note.title,
            data: note.data,
          ),
        ),
      );
    } on SharedPreferencesDoesNotHaveData {
      emit(
        DataNoteState(
          note: Note(
            title: '',
            data: '',
          ),
        ),
      );
    } on SharedPreferencesNotInitializated {
      debugPrint('SharedPreferencesNotInitializated');
    }
  }

  FutureOr<void> _onClearNoteEvent(
    ClearNoteEvent event,
    Emitter<NoteState> emit,
  ) async {
    try {
      await clearNoteUseCase.call(const NoParams());
    } on SharedPreferencesNotInitializated {
      debugPrint('SharedPreferencesNotInitializated');
    }
  }

  FutureOr<void> _onSaveNoteEvent(
    SaveNoteEvent event,
    Emitter<NoteState> emit,
  ) async {
    if (state is! DataNoteState) {
      return;
    }

    final String title0 = (state as DataNoteState).titleTextController.text;
    final String data0 = (state as DataNoteState).dataTextController.text;

    try {
      await updateNoteUseCase.call(
        Note(
          title: title0,
          data: data0,
        ),
      );
    } on SharedPreferencesNotInitializated {
      debugPrint('SharedPreferencesNotInitializated');
    }
  }
}
