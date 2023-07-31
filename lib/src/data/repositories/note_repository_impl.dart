import 'package:project/src/data/datasource/shared_pref_datasource.dart';
import 'package:project/src/data/models/note_model.dart';
import 'package:project/src/domain/entities/note.dart';
import 'package:project/src/domain/repositories/note_respotiory.dart';

class NoteRepositoryImpl implements NoteRepository {
  static const String titleKey = 'title';
  static const String dataKey = 'data';

  final SharedPrefDatasource datasource;

  NoteRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<void> clear() async {
    await datasource.saveString(key: titleKey, value: '');
    await datasource.saveString(key: dataKey, value: '');
  }

  @override
  Future<Note> read() async {
    final String title = await datasource.getString(key: titleKey);
    final String data = await datasource.getString(key: dataKey);

    final NoteModel model = NoteModel(
      title: title,
      data: data,
    );

    return model;
  }

  @override
  Future<void> update({
    String? title,
    String? data,
  }) async {
    String title0 = await datasource.getString(key: titleKey);
    String data0 = await datasource.getString(key: dataKey);

    title0 = (title != null) ? title : title0;
    data0 = (data != null) ? data : data0;

    await datasource.saveString(key: titleKey, value: title0);
    await datasource.saveString(key: dataKey, value: data0);
  }
}
