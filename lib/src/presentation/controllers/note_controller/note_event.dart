part of 'note_bloc.dart';

abstract class NoteEvent {}

class LoadNoteEvent extends NoteEvent {}

class SaveNoteEvent extends NoteEvent {}

class ClearNoteEvent extends NoteEvent {}
